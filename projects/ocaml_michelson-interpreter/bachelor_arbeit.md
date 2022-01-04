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
Anstatt Stack also Speicherzellen/Register. Stackwerte -> Variablen.
Instruktionen geben neue Variablen zurück. Stack/Map hält Variablen und Konstanten.  


Variablen 
Compilierung simuliert Contract, Zweige (IF, ITER,...) müssen wieder zusammengeführt werden (gleiche Variablen...)

Scope der Variablen -> Alle in oberstem Scope / wird dies von OCaml wegoptimiert?

SSA (oder CPS @OCaml/ML?): Phi funktion, joint punkte im Kontrollfluss -> Phi belegt variablen befor der Kontrollfluss wieder zusammenläuft
-> Mit zeiger oder einen Funktionsauffruf (wird am ende jedes zweiges aufgerufen (welchem die Variable übergeben wird), erzeugt so automatisch das merge...
Diese wäre ein "Continuation".

Addition einfach, "CONT" (IF zweige?) -> für Bachelorarbeit wäre hier ein guter Vergleich SSA (CPA) möglich.
Bei Aufruf von Instructionsn -> hinbekommen, dass die richtigen Variablen eingesetzt werden und die neuen Variablen ausgegeben werden. Im einfachsten Fall wird im jeden Zweig vom Interpreter Code ausgegeben, wo die richtigen Variablennamen ausgegebn werden.
Cool wäre: Module welches beliebiges Backend (andere Programmiersprachen) nehmen kann, diese Backends geben für eine gewisse Instruktion mit übergebenen Variablennamen Code zurück.

BA: vgl Compiler Interpreter: interpreter führt es aus, compiler hat funktion welche code zurückgibt.
leichter Vergleich an Arithmetischen Operationen.
Genauere Argumentation nötig für komplexere Anweisungen mit Kontrollflus -> wie wird dieser realisiert.

- Lambda: Der Compiler muss den Interpreter aufrufen können, wenn Lamdas als Parameter/Storage übergeben werden (liegt dann nämlich zur Compilezeit nicht vor).
- Lambda die schon im Programmcode stehen könnten direkt nicht compiliert werden sondern an den interpreter weitergeleitet werden (wenn das Lambda aufgerufen wird) (nicht die schnellste/schönste Lösung, könnte auch anders gelöst werden).
- Von interpretierten Code compilierten aufzurufen? (mir noch nicht klar warum man das machen würde)

- Variablen umbenennung und zusammenführung: Automatische Methoden oder manuell

Schrittweise Entwicklung (Performancevergleich wäre möglich) -> 
- Version mit Variablen (auf dem Stack)
- Version mit zusätzlichen Konstanten anstatt Variablen (z.B. von PUSH int 10)

Implementierungsfragen:
- Scopes beachten -> Optimierungsfrage?
- Funktionale oder Imperative Lösung? In den meisten Fällen lassen sich Referenzen vll vermeiden. 
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
