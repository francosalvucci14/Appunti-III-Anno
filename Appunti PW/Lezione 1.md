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

## Pagine Web

Cosa c'è dentro le pagine web?

- HyperText Markup Language (**HTML**): Linguaggio di Markup semantico per il contenuto delle pagine web
- Cascading Style Sheet (**CSS**) : Linguaggio di stile per le pagine web
- JavaScript (**JS**) : Linguaggio per aggiungere interattività alle pagine web

**Esempio di pagina web** : [Esempio](http://pw.netgroup.uniroma2.it/ex1/kitchen.html)

### File HTML (Sorgente della pagina)

Il file sorgente della pagina vista prima è il seguente

```HTML
<!DOCTYPE html> 
<html> 
<head> 
	<title>Jen's Kitchen</title> 
	<link rel="stylesheet" href="[kitchen.css](view-source:http://pw.netgroup.uniroma2.it/ex1/kitchen.css)">
	</head> 

<body> 
	<h1><img src="[foods.gif](view-source:http://pw.netgroup.uniroma2.it/ex1/foods.gif)" alt="food illustration"> Jen&rsquo;s Kitchen</h1>

		<p>If you love to read about <strong>cooking and eating</strong>, would like to find out about of some of the best restaurants in the world, or just want a few choice recipes to add to your collection, <em>this is the site for you!</em></p> 

	<p><img src="[spoon.gif](view-source:http://pw.netgroup.uniroma2.it/ex1/spoon.gif)" alt="spoon illustration"> Your pal, Jen at Jen's Kitchen</p>

	<hr> 

	<small>Copyright 2011, Jennifer Robbins</small> 
</body> 
</html>
```

### Cos'è il Markup?

Nel file HTML ci sono un sacco di tag, quali:
- `<!DOCTYPE html>`
- `<html>`
- `<head>`

I tag non vengono mostrati nel browser, e sono definiti dallo standard per il linguaggio HTML

Molti di questi tag sono a coppie, mentre alti no
- `<body></body>`
- `<hr>`
- `<img ...`

### Aggiungere lo stile

Lo stile della pagina web è definito in un file separato, chiamato `<nomefile>.css`

I file css contengono le direttive sull'aspetto della pagina

Per esempio, il file css di questa pagina è il seguente

```CSS
body {
  font: normal 1em Verdana; 
  width: 80%; 
  margin: 1em auto;
}
h1 {
  font: italic 3em Georgia; 
  color: rgb(23, 109, 109); 
  margin: 1em 0 1em;
}
img {
  margin: 0 20px 0 0;
}
h1 img {
  margin-bottom: -20px;
}
small {
  color: #666666;
}
```

--- 

# HTML

HTML sta per HyperText Markup Language, ed è il linguaggio che si usa per strutturare i documenti ipertestuali

Esempio
- Documento -> Curriculum
- Documento Ipertestuale -> Curriculum con link
- Documento Ipertestuale Strutturato -> Curriculum con link e titolo

Il linguaggio HTML fa parte dello standard W3C, ed è lo standard più utilizzato per la creazione di pagine web visualizzabili tramite browser

## Elementi e Tag

Il linguaggio HTML prevede l'uso di elementi e tag, come abbiamo visto prima

I tag possono essere annidati, come per esempio

![[Pasted image 20240308122806.png|center]]

Ma ci sono alcuni annidamenti scorretti, tipo

![[Pasted image 20240308122847.png|center]]

## Attributi

Alcuni elementi hanno degli attributi, che sono coppie chiave-valore

Gli atributi sono specificati dallo standard e servono a fornire informazioni aggiuntive sull'elemento

![[Pasted image 20240308123133.png|center]]
