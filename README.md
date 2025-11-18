# Der Hydrator

Einfaches kleines Programm zur Berechnung von Mehl, Wasser und Hydrationsgehalt bei Mehlteigen.
Fertige ausführbare Datei für Windows gibt es hier: [hydrator.exe (v1.0.0)](https://github.com/knusperhendl/hydrator/releases/download/v1.0.0/hydrator.exe)

![image](img/hydrator.png)

Zwei Werte eingeben und per Klick den Dritten berechnen. Das lässt sich auch wie im folgenden Beispiel kombinieren.

## Anwendungsbeispiel

> Ich habe ein Rezept und möchte die Hydration leicht erhöhen/verringern

Zuerst Hydration ausrechnen:
1. Eingabe Mehl und Wasser
2. Klick *Hydration berechnen*
3. Berechneter Wert erscheint in der Hydrations Textbox
  - z.B. 400g Mehl, 200g Wasser ➡️ 50% Hydration
4. gewünschte Hydration im Hydrationfeld ersetzen,
  - z.B. 50 mit 60.
5. Klick auf *Wasser berechnen* (Natürlich auch *Mehl berechnen* möglich)

Ersetzt den alten durch den zur veränderten Hydration passenden Wert.

Konkret: 400g Mehl, 200g Wasser, **60% Hydration** ➡️ *Wasser berechnen* ➡️ 400g Mehl, **240g Wasser**, 60% Hydration.

## Build instruction

```bash
nimble install nigui # nigui dependency
nim compile --app:gui -d:release -o:hydrator gui.nim
``` 
