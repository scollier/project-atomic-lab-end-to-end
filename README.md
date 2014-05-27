### README

This repository holds various labs used for the Project Atomic lab.

Pull the repo and build the documents by running the *make* command in the base of the repo directory.

	make

### ASCIIDOC Quick Start Guide on Linux

1. yum install git asciidoc docbook-xsl fop
2. Edit /etc/asciidoc/asciidoc.conf and change the following
    * iconsdir=./images/icons
    To:
    * iconsdir=/etc/asciidoc/images/icons

NOTE: The following are now done with the "make" command and various targets but left here for reference.

* To create a single HTML document: asciidoc <text file>

* To create HTML Slides: asciidoc --backend slidy <text file>

* To create a PDF:  a2x -fpdf -dbook --fop --no-xmllint -v <asciidoc file>

* To create an EPUB: a2x -fepub -dbook --no-xmllint -v <asciidoc file>

Please refer to the asciidoc user's guide: http://asciidoctor.org/docs/asciidoc-writers-guide/

This cheat sheet is also very helpful: http://powerman.name/doc/asciidoc
