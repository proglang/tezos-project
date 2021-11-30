## Bachelor Arbeit Joshua

### Thema 1

```
Den Interpreter zu einem einfachen Compiler von Michelson nach OCaml zu erweitern.
Das würde ganz grob so funktionieren, dass der Code zur Ausführung einer Instruktion einfach 
ausgegeben wird. Die Schnittstellen zu dem generierte Code sollten dann die gleichen wie beim 
Interpreter sein. Das Grundgerüst dazu ist relativ einfach, wenn der Interpreter einmal steht. 
In einem späteren Schritt kann man dann noch Dinge optimieren 
```

#### Mögliche Lösungswege:

1. Für gegebenen Contract den ausgeführten Code des Interpreters einfach aneinanderkleben anstatt 
ihn auszuführen und dann compilieren (einfachste Lösung). Im Hintergrund wird dann weiterhin der Stack simuliert.

2. Während der Compilezeit Variablen festlegen für die Werte während der Laufzeit. 
Anstatt Stack also Speicherzellen/Register. 
Instruktionen geben neue Variablen zurück. Stack/Map hält Variablen und Konstanten.  


Variablen 
Compilierung simuliert Contract, Zweige (IF, ITER,...) müssen wieder zusammengeführt werden (gleiche Variablen...)


Schrittweise Entwicklung -> 
- Version mit Variablen (auf dem Stack)
- Version mit zusätzlichen Konstanten anstatt Variablen (z.B. von PUSH int 10)

Implementierungsfragen:
- Scopes beachten -> Optimierungsfrage?
- Funktionale oder Imperative Lösung?
- Stack entfernen

#### Optimierung:
- Schlüssellochoptimierung.
- Andere Optimierungstechniken.
- OCaml Compiler Optimierung ausnutzen, nicht redundant arbeiten.
- Testen der Optimierungen auf ihre Effizienz / Erfolg.


#### Schriftlicher Teil:
- wissenschaftliche Fragenstellung: Anwendung von Compilertechniken auf eine konkrete Problemstellung.
- Warum will man das?



### Thema 2
```
Den Interpreter so zu vervollständigen, dass er auch die nachfolgenden Operationen unterstützt
(also die operation list interpretiert) und dass man ihn auch direkt an die Blockchain
anschließen kann).
```


Literatur:
- SSA compiler
- zwei Abstracts Gough
