#!/bin/bash

## Check input.
if [[ ! -d "$1" ]]; then
	echo "First argument must be the directory to search for .md files"
	exit 1
fi

## Set up the source and destination directories.
THISDIR=$(cd $(dirname $0); pwd)
INDIR=$(cd $(dirname $1); pwd)
cd "$INDIR"
OUTDIR=$INDIR"/public"
if [ -e "$OUTDIR" ]; then rm -r "$OUTDIR"; fi
mkdir "$OUTDIR"
echo "Building site in $OUTDIR"

## Figure out template files.
HTMLTPL=$THISDIR"/html.tpl"
if [ -f $INDIR"/html.tpl" ]; then
	HTMLTPL=$INDIR"/html.tpl"
fi
echo "HTML template is $HTMLTPL"
PDFTPL=$THISDIR"/pdf.tpl"
if [ -f $INDIR"/pdf.tpl" ]; then
	PDFTPL=$INDIR"/pdf.tpl"
fi
echo "PDF template is $PDFTPL"

## Build all single-page files (HTML and PDF).
for F in $(find $INDIR -name '*.md' -type f); do

	## Ignore the readme file.
	if [ $(basename $F) = "README.md" ]; then continue; fi

	## Extract just the 'local' part of the path.
	BASE_LEN=${#INDIR}+1
	FILE=${F:$BASE_LEN:-3}
	echo "Processing $FILE";
	SLASHS=${FILE//[^\/]/}
	SLASHCOUNT=${#SLASHS}
	RELPATH=$(for X in $(seq $SLASHCOUNT); do echo -n "../"; done)

	## Create required directories.
	mkdir -p "$OUTDIR/"$(dirname "$FILE")

	## Generate HTML version.
	pandoc --standalone \
		--css=/style.css \
		--section-divs \
		--template=$HTMLTPL \
		--variable="filename:$FILE" \
		--variable="relpath:$RELPATH" \
		-f markdown \
		-t html5 \
		-o "$OUTDIR/$FILE.html" \
		"$FILE.md"

	## Generate PDF version.
	pandoc --standalone \
		--template=$PDFTPL \
		--variable="filename:$FILE" \
		-f markdown \
		-o "$OUTDIR/$FILE.pdf" \
		"$FILE.md"

done

## Copy stylesheet and 404 page.
for F in "style.css" "404.html"; do
	if [ -f $INDIR"/"$F ]; then
		cp $INDIR"/"$F $OUTDIR/.
	else
		cp $THISDIR"/"$F $OUTDIR/.
	fi
done

