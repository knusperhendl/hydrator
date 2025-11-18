# build as gui app for win and change .exe icon with rcedit
#nim c --app:gui -d:release --out:hydrator.exe --opt:speed -d:strip gui.nim && rcedit.exe hydrator.exe --set-icon flour.ico

# removed icon for now
nim c --app:gui -d:release --out:hydrator.exe --opt:speed -d:strip gui.nim