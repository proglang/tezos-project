## Bachelor Arbeit Joshua

### Thema 1

"Den Interpreter zu einem einfachen Compiler von Michelson nach OCaml zu erweitern.
Das würde ganz grob so funktionieren, dass der Code zur Ausführung einer Instruktion einfach 
ausgegeben wird. Die Schnittstellen zu dem generierte Code sollten dann die gleichen wie beim 
Interpreter sein. Das Grundgerüst dazu ist relativ einfach, wenn der Interpreter einmal steht. 
In einem späteren Schritt kann man dann noch Dinge optimieren"

#### Mögliche Lösungswege:

1. Für gegebenen Contract den ausgeführten Code des Interpreters einfach aneinanderkleben anstatt 
ihn auszuführen und dann compilieren (einfachste Lösung). Im Hintergrund wird dann weiterhin der Stack simuliert.


2. Während der Compilezeit Variablen festlegen für die Werte während der Laufzeit. 
Anstatt Stack also Speicherzellen/Register.

Implementierungsfragen:
- Scopes beachten?
- Funktionale oder Imperative Lösung?

#### Optimierung:
- Schlüssellochoptimierung.
- Andere Optimierungstechniken.
- OCaml Compiler Optimierung ausnutzen, nicht redundant arbeiten.
- Testen der Optimierungen auf ihre Effizienz / Erfolg.




### Thema 2
"Den Interpreter so zu vervollständigen, dass er auch die nachfolgenden Operationen unterstützt
(also die operation list interpretiert) und dass man ihn auch direkt an die Blockchain
anschließen kann)."
