# Internet ed il Web

## Pagine Web

La pagina web è **documento digitale** indentificato da un **URL** (indirizzo) e normalmente visualizzato mediante un browser

Il browser deve : 
- Scoprire dove si trova
- Chiedere che ci venga inviato
- Controllare e verificare ciò che riceviamo
- Mostrarlo

### Indirizzi

Dove si trovano le pagine web?

Per rispondere a questa domanda diamo la definizione di URL

>[!definition]- URL
>URL = Uniform Resource Locator
>Ovvero l'identificatore per la posizione del documento

L'URL ci dice dove il documento web si trova

**Esempi di URL**

![[Pasted image 20240307100517.png|center|600]]

L'URL si divide in tre parti : 
- **Procotollo** : Ci dice che protocollo web stiamo utilizzando (http,https,etc...)
- **Host** : Il sito web che contiene la pagina web richiesta
- **Path** : Il percorso che ci indica la posizione esatta della pagina richiesta

Ogni pagina web è sparsa per il mondo

## Internet

Internet è un sistema di dispositivi elettronici interconnessi

Ogni computer che naviga in Internet ha un proprio indirizzo IP, ovvero l'indirizzo che identifica in rete il computer

Ogni indirizzo IP è unico e identifica una e una sola macchina

Tutte le macchine connesse ad Internet possono inviare/ricevere messaggi, scambiare informazioni con altre macchine,etc...

Come si condivino queste informazioni?

### WWW

Il **WWW (World Wide Web)** è uno dei modi con cui le macchine condividono queste informazioni

Il WWW è un insieme di pagine web e altri documenti collegati fra loro, tramite collegamenti ipertestuali (**Hyperlink**)

Il protocollo principale utilizzato per lo scambio di documenti è il protocollo HTTP 
(**Hyper Text Transfer Protocol**)

## Numeri o Nomi?

Ad ogni indirizzo IP è associato il nome di un server, ad ogni server è associato un indirizzo IP

Come si può ricavare il nome di un server tramite l'indirizzo IP?

Usiamo un server particolare, chiamato DNS, che traduce gli indirizzi IP in nomi e viceversa

### DNS

>[!definition]- DNS
>DNS = Domain Name Server
>Server che si occupa di tradurre gli indirizzi IP in nomi e viceversa

![[Pasted image 20240307101405.png|center|500]]

### Server Web

I server web sono computer che rispondono a delle richieste da parte dei client
- In realtà chi offre il servizio è un programma :  **il server web**
- Aspetta una richiesta, cerca il documento e lo invia al richiedente
- Il server web "parla" HTTP, e spesso è chiamato **Server HTTP**
- Ogni computer può diventare server, dato che basta scaricare il programma detto prima

### Client Web

I software che fanno richieste al server sono detti **Client**
- I client web più comuni sono i Browser

La richiesta di un documento da parte del client funziona così :
- L'utente inserisce un indirizzo
- Il browser chiede il documento al server
- Il server glielo rispedisce
- Il browser lo mostra all'utente

![[Pasted image 20240307103103.png|center|600]]


### Browser

I browser parlano HTTP come i server

Richiedono qualunque documento, di ogni tipo : Immagini, PDF, Video,Audio,etc...

I browser visualizzano i documenti richiesti al server in una finestra, e spesso gli stessi documenti sono mostrati in modo diverso dai diversi browser


