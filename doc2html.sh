#/bin/bash

#usage
#find .  -name "*.docx"|xargs doc2html.sh

if [ $# -lt 1 ]
then
	echo "Usage doc2html.sh <files...>"
	exit 1
fi

while [ $# -gt 0 ]
do
	f="$1"
	ofbase=$( basename -s .docx "$f" )
	ofdir=$( dirname "$f" )
	of="${ofdir}/${ofbase}.html"
	
	echo "Converting ${f} to ${of}"
	soffice --headless --convert-to html:HTML --outdir "${ofdir}" "$f"
	sed -i "s/<a href=[^>]*>//g" "${of}"
	sed -i "s/<\/a>//g" "${of}"
	sed -i "s/<img [^>]*>//g" "${of}"
	sed -i "/<div title=\"footer\">/,/<\/div>/d" "${of}"
	sed -i "/<meta name=[^>]*>/d" "${of}"
	shift
done
