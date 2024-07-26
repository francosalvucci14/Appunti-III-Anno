```table-of-contents
title: 
style: nestedList # TOC style (nestedList|nestedOrderedList|inlineFirstLevel)
minLevel: 0 # Include headings from the specified level
maxLevel: 0 # Include headings up to the specified level
includeLinks: true # Make headings clickable
debugInConsole: false # Print debug info in Obsidian console
```

# Scan

Per prima cosa dobbiamo scoprire l'indirizzo IP della macchina, e lo facciamo con il comando

```
nmap -sP <ip>/24
```

Una volta trovato l'IP del terget, andiamo ad eseguire uno scan per vedere quali sono le porte aperte

Lo scan è il seguente

![[Pasted image 20240726101034.png]]

# Enumerazione

## Gobuster

Lanciamo uno scan con gobuster per vedere quali sottodirectory sono presenti sul server

Gobuster
![[Pasted image 20240726102337.png]]

hydra
![[Pasted image 20240726110957.png]]

dig
![[Pasted image 20240726132224.png]]

ce lfi, da bursuite 
![[Pasted image 20240726165941.png]]