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

