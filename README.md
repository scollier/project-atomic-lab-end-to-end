= README
This repository holds various labs used for the Project Atomic lab.

Please refer to the asciidoc user's guide: http://asciidoctor.org/docs/asciidoc-writers-guide/

This cheat sheet is also very helpful: http://powerman.name/doc/asciidoc

== ASCIIDOC Quick Start Guide

=== Linux: 
1. yum install git asciidoc docbook-xsl fop
2. Edit /etc/asciidoc/asciidoc.conf and change the following
    * iconsdir=./images/icons
    To:
    * iconsdir=/etc/asciidoc/images/icons

=== Mac OS X:
Prerequisites Java JRE is required for fop. If not prompted for installation you can try this JRE: 
http://support.apple.com/kb/DL1572?viewlocale=en_US

1. Install Homebrew for Mac OS X: http://brew.sh/
ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"

2. Install asciidoc: brew install asciidoc

3. Install dblatex: https://gist.github.com/dustinschultz/6554087#comments
    a. Install MacTex - http://tug.org/mactex/
    b. curl https://gist.github.com/dustinschultz/6544364/raw/5bbe233fbe953b8070c5453fdf09cd65eb515e9e/dblatex.rb -o /usr/local/Library/Formula/dblatex.rb
    c. brew install git
    d. brew install dblatex
    e. brew install fop
    f. brew install docbook-xsl

4. Add environment variable XML_CATALOG_FILES to point to /usr/local/etc/xml/catalog
    echo export XML_CATALOG_FILES="/usr/local/etc/xml/catalog" >> ~/.bashrc

=== Windows
1. Run "setup.exe" from http://www.cygwin.com/
2. Select the following packages: asciidoc, dblatex, openssh, git, git-completion, git-gui, git-review, gitk, bash-completion, vim, vim-common, gvim 
3. Follow instructions from http://cygwinports.org/ which are summarized here:
	* Run "cmd" and run the previously downloaded "setup-*.exe" with the following parameter: "setup-x86.exe -K http://cygwinports.org/ports.gpg"
	* Install "fop"
4. Run "Xwin Server"
	* An icon should show up in the task bar. If it does not then run the following:
		** "Cygwin Terminal" 
		** In the Cygwin bash prompt run: "/usr/bin/bash.exe -l -c /usr/bin/startxwin.exe" 
5. Add ssh-agent on startup to ~/.bash_profile
SSHAGENT=/usr/bin/ssh-agent
SSHAGENTARGS="-s"
if [ -z "$SSH_AUTH_SOCK" -a -x "$SSHAGENT" ]; then
	eval `$SSHAGENT $SSHAGENTARGS`
	trap "kill $SSH_AGENT_PID" 0
fi
ssh-add 

== Compiling ASCIIDOC documents:
NOTE: The following are now done with the "make" command and various targets but left here for reference.

* To create a single HTML document: asciidoc <text file>

* To create HTML Slides: asciidoc --backend slidy <text file>

* To create a PDF:  a2x -fpdf -dbook --fop --no-xmllint -v <asciidoc file>

* To create an EPUB: a2x -fepub -dbook --no-xmllint -v <asciidoc file>
