# Cos'è Javascript
Javascript è un linguaggio di programmazione nato come linguaggio semplice per i non sviluppatori.
## Ruolo di js
*Client side*: praticamente monopolista;
*Server side*: NodeJs.
## Cosa fa JS
- *Cambiare elementi e stili in una pagina*
- *Comunicazione asincrona*
	- Invio dati senza ricaricare la pagina o senza interazione con l'utente
- *Altro*
	- Test browser capabilities ed adattamente
### Cosa fa e cosa non fa
>[!important]- Cosa fa
>- Modifica elementi della pagina
>- Interagisce con un server remoto
>- Reagisce ad azioni dell'utente
>- Imposta cookie e contenuti locali ( file storage )
>- Disegna sulla pagina

>[!warning]- Cosa non fa ( nei browser )
>- Accede ai file locali del computer
>- Interagisce con qualunque server remoto

### JS lato server: NodeJS
Si tratta di un *back-end* javascript runtime environment, permettendo di utilizzare uno stesso linguaggio sia client-side che server-side.
#### Framework famosi (client side)
- ExtJS
- Knockout
- Backbone
- Angular
- React
- Vue.js
# Hello World!
## Aggiungere Js ad una pagina web
```HTML
<script>
	//codice
</script>
```
$\Uparrow$ METODO BRUTTO $\Uparrow$
$\Downarrow$METODO GIUSTO $\Downarrow$
```HTML
<script src="myscript.js"></script>
```
# Lavorare con le variabili
```Javascript
// commento
let myName = "Giovanni"; //variabile con stringa
let myNumber = 5; //variabile con intero
let myVar; //variabile non inizializzata
myVar = myNumber; //assegnazione
console.log(myVar); //stampa del risultato
```
## Tipi di dato
Ogni dato appartiene ad un *tipo*:

| Codice               | Spiegazione                                        |
| -------------------- | -------------------------------------------------- |
| `let test = 5;`      | La variabile è un *numero*. Operazioni: + - * / %  |
| `let test = "ciao";` | La variabile è una *stringa*. Concatenazione con + |
| `let test = true;`   | La variabile è *Booleana*. Inverso con !           |
| `let test;`          | La variabile è *undefined*                         |
| `let test = null`    | La variabile è *null*                              |
### Conversioni - funzioni utili
>`parseInt()`
>- *Descrizione* : Analizza l'argomento di una stringa e restituisce un intero del raggio specifico.
>- *Sintassi*: `parseInt(string, radix)`

>`parseFloat()`
>- *Descrizione* : Analizza l'argomento di una stringa e restituisce un numero a virgola mobile.
>- *Sintassi*: `parseInt(string)`

- Conversione di un numero in una stringa: `num.toString();`
- Regolazione del numero di cifre decimali
	- `let pi = (3,141592).toFixed(2)`
	- `> 3.14`

> Costanti
> `const prefix = 06; //read only`

# Interazione base
- `alert`:
![[Pasted image 20240423151652.png|center|500]]
- `prompt`
![[Pasted image 20240423151723.png|center|500]]
- `confirm`
![[Pasted image 20240423151815.png|center|500]]
# Istruzioni di base
	branch and loop
## Operazioni di comparazione

| Operazione              | Significato                                              |
| ----------------------- | -------------------------------------------------------- |
| `==` e `!=`             | *Uguale* e *non uguale*                                  |
| `>` e `>=` e `<` e `<=` | *Maggiore*, *maggiore-uguale*, *minore*, *minore-uguale* |
| `===` e `!==`           | *Identico* o *non identico* (stesso dato e tipo)         |
## Operatori logici

| Operatore | Logico |
| --------- | ------ |
| `&&`      | AND    |
| \|\|      | OR     |
| !         | NOT    |
## Funzioni
Sono un modo pratico per *raggruppare* dei comandi e per *richiamare* più volte lo stesso codice.
```js
// Dichiarazione
function calcolatrice(){
	let n1, n2, somma;
	n1 = prompt("Primo numero");
	n2 = prompt("Secondo numero");
	alert("La somma è "+(Number(n1)+Number(n2)));
}
// Invocazione
calcolatrice();
```

Le funzioni possono accettare dei parametri di ingresso e ritornare un valore in uscita:
```js
function somma(a, b){
	let sum = a + b;
	return sum;
}
```

Una funzione deve avere un nome descrittivo ( es. getName, runCalculator, fillResults, checkIsOnline ecc..), ma soprattutto una funzione deve fare *esattamente una* cosa, cioè l'operazione descritta nel suo nome. Se fa più cose, probabilmente è utile suddividere il codice in due funzioni.
### Passare funzioni a funzioni
```js
function ask(question, yes, no){
	if(confirm(question)) yes()
	else no();
}
// Funzione di callback
ask(
	"Do you agree?",
	function() { alert("You agreed.");},
	function() { alert("You canceled the operation".);}
);
```
### Arrow functions
Si tratta di un sistema più sintetico di specificare una funzione
```js
let somma = (a, b) => a + b;
```
## Oggetti
Un **oggetto** è una *lista di coppie proprietà-valore* racchiuse in parentesi angolati. Le proprietà possono essere solo stringhe o simboli. Un valore può essere un tipo primitivo, un altro oggetto o una funzione.
Da qui *JSON* (JavaScript Object Notation)
```js
let studente = {
	name: "Pierpaolo",
	age: 80,
	scores: [1,2,3],
	classes: {pw: 30, fi: 18}
};
```
Non esistono valori privati.
```js
let studente = {}; //oggetto vuoto
studente = new Object(); // stessa cosa

studente.voto = 30; //aggiungo proprietà e valore

console.log(studente.voto); //30

delete studente.voto;//elimino proprietà con annesso valore
console.log(studente.voto) //undefined
```
### Copiare un oggetto
```js
let a = {nome; "pippo"};
let b = a;
```
![[Pasted image 20240424153942.png|center|500]]

`a` e `b` sono dei riferimenti allo stesso oggetto:
- Copiando `a` in `b`, copiamo solo il riferimento;
- Se facciamo `a.nome = "pluto"`, otterremo anche che `b.nome` è "pluto".
### Garbage collection
Tutte le variabili che creiamo occupano memoria, che viene allocata dinamicamente. Un algoritmo ( *garbage collector* ) capisce gli oggetti non più raggiungibili dallo script e rilascia la memoria.
### Metodi
Un oggetto può avere tra le sue proprietà anche delle funzioni che chiameremo *metodi*.
```js
let a = {"name": "pippo"};
a.saluta = function(){
	alert("Ciao sono pippo");
}
a.saluta()
```
#### This
può essere utile nei metodi riferirci ad altre proprietà nell'oggetto:
```js
let a = {"name": "pippo"};
a.saluta = function(){
	alert("Ciao sono "+this.name);
}
```
### Costruttori
Per creare oggetti uguali o simili possiamo usare delle funzioni:
```js
// Costruttore
function User(name){
	this.name = name;
	this.isAdmin = false;
	//ritorna implicitamente this
}
let user = new User("Pippo");
alert(user.name);// Pippo
alert(user.isAdmin); //false
```

Quando viene chiamato un costruttore con `new`:
- Viene creato un oggetto vuoto e assignato a `this`.
- Viene eseguita la funzione.
- Viene ritornato `this`.
### Altri metodi
![[Pasted image 20240424155051.png|center|600]]
## Array
Si tratta di contenitori di variabili, anche con tipi diversi. Sono oggetti con proprietà numeriche e metodi/attributi per "maneggiarli".
Ogni *elemento* di un array ha un *indice* che parte da 0.
![[Pasted image 20240424155229.png|center|500]]

```js
let arr = [el0, el1, el2]; // Creazione
myFirstArr[0] = "nuovo valore" // Modifica
myFirstArr.push("ciao") // Aggiunge alla fine
myFirstArr.unshift("ueue") // Aggiunge all'inizio
myFirstArr[10] = "ciao" //aggiunge al decimo posto
myFirstArr.pop() // Rimuove l'ultimo elemento
myFirstArr.shift() // Rimuove il primo elemento
delete myFirstArr[10] // Rimuove l'elemento ma non sposta gli indici dell'array
myFirstArr.length // Lunghezza dell'array
// Svuotare l'array:
myFirstArr = []
myFirstArr.length = 0
```
### Slicing
```js
let myArr = ["a", "b", "c", "d", "e"];
myArr = myArr.slice(1, 4); // ["b", "c", "d"]
myArr.splice(3,2); //ritorna ["d","e"]
// Ora l'array è ["a", "b", "c"]
```
### Loop, join e search
```js
let colori =["rosso","verde","blu"];

//loop
colori.forEach(function(colore){
	console.log(colore);
});

//join
let list = colori.join(" - "); // "rosso - verde - blu"

//search
let a = ["a", "b", "a", "b", "a"];
console.log(a.indexOf("b")); //1
```
### Map
Metodo che serve a "convertire" (mappare) un array in un altro. Esempio: dato un array di stringhe, generiamo un array che contiene la lunghezza delle stringhe
```js
let a = ["pippo", "pluto", "paperino"];
a.map((item, index, array) => item.lenght);
// Ritorna [5, 5, 8]
```
### Reduce
Metodo che serve a calcolare un singolo valore dell'array.
```js
[1,2,3].reduce((ac, item) => ac + item); //6
```
(Slide 95)