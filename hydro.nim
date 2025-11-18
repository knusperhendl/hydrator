# import std/math
# import std/strutils

proc aufrundenDiv(a, b: int): int = 
  ## Kaufmännische Rundung: a/b mit Rundung bei ≥0.5
  (a + b div 2) div b

proc hydration*(wasser:int, mehl:int):int =
    if mehl > 0:
        (wasser * 100).aufrundenDiv(mehl)
    else:
        0

proc mehlrechnung*(wasser:int, hydrat:int):int =
    if hydrat > 0: (wasser * 100).aufrundenDiv(hydrat)
    else: 
        0

proc wasserRechnung*(mehl:int, hydrat:int):int =
    (mehl * hydrat).aufrundenDiv(100)



when isMainModule:
    echo hydration(200,200)
    echo hydration(100,200)
    echo "Mehlrechnung:"
    echo "200ml Wasser bei 45% hydration braucht " & $mehlrechnung(200,45) & " Gramm Mehl"