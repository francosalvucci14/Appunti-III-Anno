# Data Mining: Models and Algorithms

**Goal Strategico**:

Trovare:
- il miglior hardware
- il miglior Modello
- il miglior Algoritmo
- il miglior software

per risolvere problemi su **larghi** e/o **complessi Input Data Set** in scienza, networking, sanità, e-commerce,etc...

## Modelli per larghi e/o complessi Input Data Set

- **Stage(i)** : Trasformare il reale Input Data Set in un **modello/struttura** formale $I$ tale che l'originale problema reale si _riduce_ efficientemente in un _task computazionale ben definito_ $T$ su input $I$
- **Stage(ii)** : Trovare il miglior algoritmo per risolvere $T_p$ su input $I$

**Scenario tipico nel Data Mining** : 
- Stage(i) è spesso il problema più difficile da risolvere
- Una volta che lo Stage(i) è risolto, lo Stage(ii) richiede solamente metodi standard

## Problema reale di Data-Mining: il Phishing di Email

**Soluzione algoritmica** : 

1) Classificare le emailo ricevute in due sottoinsiemi : Phishing/Non-Phishing
2) Estrarre le "**phishing words**" che appaiono spesso, in modo _inusuale_, nel'insieme Phishing
3) Assegna _pesi positivi_ alle "phishing words" e _pesi negativi_ alle altre
4) _Algoritmo_ : per ogni email in entrata, calcola la **somma** dei pesi delle parole. Se la somma è maggiore uguale di un dato _limite_, allora imposta l'email come Phishing, altrimenti la imposti come Non-Phishing

## Task Chiave impegnativi nel Data Mining

- **Step(ii)**: Definisci un _Modello Statistico_ $M$ (per esempio una **Distribuzione di Probabilità**) su un reale input data (per esempio le email) in modo che le _informazioni nascoste_ che cerchiamo emergano come possibili eventi in $M$. Poi estrai queste informazioni _in modo efficiente_ e/o in modo _dinamico/streaming_
- **Step(iii)** : Assegna i _giusti pesi_ alle parole in modo che la **somma totale di una email** in arrivo sia _proporzionale_ alla probabilità che sia phishing

## Modelli Statistici : Definizione Informale

Costruire una _distribuzione di probabilità sottostante_ da cui vengono _campionati_ i dati grezzi visibili

**Esempio**:

Il raw data set è un insieme $D$ di numeri. Un _**Modello Statistico/Ipotetico**_ per $D$ è assumere che i numeri siano campionati in accordo con la [Distribuzione Gaussiana](https://it.wikipedia.org/wiki/Distribuzione_normale)

Quindi, Media e [Varianza Standard](https://it.wikipedia.org/wiki/Varianza) caratterizzano completamente questa distribuzione e diventerebbero il Modello per l'Input Data

## Modelli di dati Avversariali: Definizione Informale

Altri scenari tipici nel Data Mining offrono adottano la **worst-case hypothesis** :

- L'input Data Set, da cui dovrebbero essere estratte le _informazioni target_, è gestito da una **fonte avversariale** che genera i dati con il goal di minimizare l'efficeinza della soluzione algoritmica, o peggio ancora, la sua validità
- **Esempio**: Calcolare (e aggiornare) il **numero di uni** nell'ultima finestra di lunghezza N su uno _**Stream infinito di bits**_ governato da un'avversario che sceglie il prossimo bit in funzione delle scelte dell'algoritmo precedente

## Limiti Statistici del Data Mining

Un _goal tipico dei problemi_ di Data Mining è quello di trovare eventi _**inusuali**_ nascosti all'interno di enormi Data Sets

>[!attention]- Attenzione
>L'uso eccessivo del Data Mining è detto **Principio di Bonferroni**

>[!cite]- Cit.
>Se il Data Set (o il Data Process) collezione un enorme numero di elementi provenienti da diverse fonti in modo abbastanza casuale, allora eventi inusuali potrebbero non avere significati particolari : sono solo artefatti statistici che potrebbero verificarsi

### Principio di Bonferroni : Definizione informale

Supponi di cercare un evento speficio all'interno dell'input Data Set DS

Allora

Puoi aspettarti che l'evento si verifichi, _anche se_ S è completamente casuale, e il numero di occorrenze dell'evento _aumenterà all'aumentare della dimensione di DS_

Queste occorrenze sono "**false**" (bogus): non hanno altra causa se non il fatto che i dati casuali avranno sempre un certo numero di caratteristiche insolite che sembrano significative ma non lo sono

#### Esempio di "Bogus" : Gangs nei Social Networks

**Estrarre informazioni da un Social Network**

- **Il modello del Grafo** : G(V,E), con un (enorme) insieme V di **n** (potenziali criminali) agenti che usano visitare un (enorme) insieme H di **h** pubbliche posizioni (hotel, bar, ristoranti, aereporti, etc...) in una grande regione/città:
	- Un arco (u,v) esiste se e solo se 'u' e 'v' visitano la _stessa posizione_ in H _nello stesso giorno_ su una sequenza di $T>>0$ giorni 
- **Modello Ipotetico** : il **processo di visita degli agenti** nei luoghi pubblici è sufficientemente casuale e uniforme
- **Problema (informale)** : Trovare le possibili "Gangs", denominate _Clicque_ in G

