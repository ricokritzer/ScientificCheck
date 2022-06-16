#!/bin/bash

#
# Copyright: Rico Kritzer
#

regex=" (ich|man|sehr|extrem|hervorragend|massenhaft|unglaublich|ziemlich|(ein bisschen)|dinge|sachen|wunderschön|hässlich|wunderbar|allgemein|also|bekanntlich|bloß|doch|durchaus|eher|einfach|einigermaßen|etwa|freilich|gar|halt|immerhin|jedenfalls|lediglich|letztlich|nämlich|natürlich|offenbar|schließlich|selbstverständlich|sicherlich|schon|sozusagen|tatsächlich|überhaupt|unbedingt|völlig|wohl|wichtig|natürlich|logischerweise|selbstverständlich|schön|fantastisch|super|verrückt|wirklich|voll|wir|viel|wenig)[^[:alpha:]]"

echo ""
echo "##################################################"
echo "######## ScientificCheck Version 0.1 beta ########"
echo "##################################################"
echo ""
echo "Check file: $1"
echo ""

echo "#"
echo "# 1. Create text file (if neccessary)"
echo "#"
echo ""

file_to_check=$1
if [ $(file --mime-type $1 | grep -c "application/pdf") -eq 1 ]
then
	pdftotext $1 $1.txt
	file_to_check=$1.txt
	echo "Converted into: $file_to_check"
fi
echo "... done"
echo ""

echo "#"
echo "# 2. Prüfe auf 'verbotene Wörter'"
echo "#"
echo ""
cat $file_to_check | grep --color -E -i "$regex"
count=$(cat $file_to_check | grep -c -E "$regex")
echo "... done ($count gefunden)"
echo ""

echo "#"
echo "# 3. Prüfe auf doppelte Leerzeichen"
echo "#"
echo ""
cat $file_to_check | grep --color ".  ."
count=$(cat $file_to_check | grep -c -E ".  .")
echo "... done ($count gefunden)"
echo ""
