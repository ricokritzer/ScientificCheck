# ScientificCheck
Skript zum automatisierten Prüfen wissenschaftlicher Arbeiten

Es gibt eine Reihe von Wörtern, deren Verwendung eher weniger wissenschaftlich ist. Dieses Bash-Skript ist in der Lage, Textdateien (z. B. LaTeX oder txt) oder PDFs mithilfe einfacher Linux-Befehle auf typische Fehler beim wissenschaftlichen Arbeiten zu prüfen. Dies umfasst eine Prüfung auf Übertreilungen, vage oder subjektive Formulierungen und Füllwörter sowie auf doppelte Leerzeichen.

# Verwendung
Das Skript ist unter Linux lauffähig. Für die Verwendung des Skriptes für PDF-Dateien bedarf es der Anwendung `pdftotext`.

Direkt im Terminal: `bash scientificCheck.sh <file>` bzw. nach Anpassung der Ausführbarkeit mittels `chmod` auch `./scientificCheck.sh <file>`
