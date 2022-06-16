#!/bin/bash

#
# Copyright: Rico Kritzer
#

regex=" (ich|man|sehr|extrem|hervorragend|massenhaft|unglaublich|ziemlich|(ein bisschen)|dinge|sachen|wunderschön|hässlich|wunderbar|allgemein|also|bekanntlich|bloß|doch|durchaus|eher|einfach|einigermaßen|etwa|freilich|gar|halt|immerhin|jedenfalls|lediglich|letztlich|nämlich|natürlich|offenbar|schließlich|selbstverständlich|sicherlich|schon|sozusagen|tatsächlich|überhaupt|unbedingt|völlig|wohl|wichtig|natürlich|logischerweise|selbstverständlich|schön|fantastisch|super|verrückt|wirklich|voll|wir|viel|wenig|irgendwie|(im großen und ganzen)|(unter umständen)|eventuell|manchman|gelegentlich|gewissermaßen|aber|abermals|ähnlich|allein|(allem Anschein nach)|allemal|allenfalls|allerdings|allesamt|allzu|(an sich)|anscheinend|auch|(aufs Neue)|augenscheinlich|ausdrücklich|ausnahmslos(bei weitem)|beinahe|bereits|besonders|bestenfalls|bestimmt|beträchtlich|bloß|charakteristisch|dabei|dann|derart|(des öfteren)|direkt|doch|durchaus|eben|ebenfalls|echt|eigentlich|eindeutig|einige|einmal|endlich|entsprechend|etliche|etwas|folgendermaßen|fortwährend|fraglos|freilich|ganz|gänzlich|gelegentlich|genau|gerade|geradezu|gewisse|gewissermaßen|gewöhnlich|gezielt|gleichsam|gleichwohl|grundsätzlich|gut|halt|hingegen|hinlänglich|höchst|(im Allgemeinen)|(im Detail)|(im Endeffekt)|(im Grunde)|(im Prinzip)|(im Rahmen)|(im Wesentlichen)|immer|immerzu|(in der Regel)|(in der Tat)|(in diesem Zusammenhang)|(in etwa)|(in gewisser Weise)|insgesamt|insofern|irgendwann|irgendwie|irgendwo|ja|jedenfalls|jedoch|kaum|konkret|längstens|letztendlich|mal|manchmal|(mehr oder weniger)|mehrfach|meist|meistens|mithin|mitunter|möglicherweise|nachhaltig|nahezu|nämlich|naturgemäß|natürlich|neuerdings|nichtsdestotrotz|nichtsdestoweniger|normalerweise|nun|nur|offenbar|offenkundig|(ohne Weiteres)|(ohne Zweifel)|partout|plötzlich|praktisch|prinzipiell|quasi|recht|regelrecht|reichlich|relativ|ruhig|schlichtweg|schon|sehr|selbstverständlich|seltsamerweise|sicher|sicherlich|so|sogar|sogleich|sonst|sozusagen|stets|strenggenommen|tatsächlich|theoretisch|total|überaus|überhaupt|übrigens|unbedingt|ungefähr|ungemein|ungleich|vergleichsweise|vielleicht|voll|völlig|wahrscheinlich|wenigstens|wieder|wirklich|wohl|wohlgemerkt|wohlweislich|womöglich|ziemlich|zudem|zugegebenermaßen|zumeist|zusehends|zuvor|zuweilen|zwar|zweifellos|zweifelsohne)[^[:alpha:]]"

echo ""
echo "##################################################"
echo "######## ScientificCheck Version 0.2 beta ########"
echo "##################################################"
echo ""
echo "Check file: $1"
echo ""

echo "#"
echo "# 1. Textdatei erzeugen (falls erforderlich)"
echo "#"
echo ""

file_to_check=$1
if [ $(file --mime-type $1 | grep -c "application/pdf") -eq 1 ]
then
	pdftotext $1 $1.txt
	file_to_check=$1.txt
	echo "Converted into: $file_to_check"
fi
echo "... erledigt"
echo ""

echo "#"
echo "# 2. Prüfe auf 'verbotene Wörter'"
echo "#"
echo ""
cat $file_to_check | grep --color -E -i "$regex"
count=$(cat $file_to_check | grep -c -E "$regex")
echo "... erledigt ($count gefunden)"
echo ""

echo "#"
echo "# 3. Prüfe auf doppelte Leerzeichen"
echo "#"
echo ""
cat $file_to_check | grep --color ".  ."
count=$(cat $file_to_check | grep -c -E ".  .")
echo "... erledigt ($count gefunden)"
echo ""
