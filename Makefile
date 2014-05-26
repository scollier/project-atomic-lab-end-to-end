DOCS=content/docker/docker_basics.lab.adoc \
	content/geard/geard.lab.adoc

# SLIDES=agenda.slides.adoc \
    laptop_hypervisor_setup.slides.adoc \
    intro.slides.adoc \
    ceilometer.slides.adoc \
    ceph.slides.adoc \
    collaboration.slides.adoc \
    cinder.slides.adoc

# PREREQ=prerequisites.adoc

all: $(DOCS) $(SLIDES) $(PREREQ) html pdf epub slides prereq

html: $(DOCS)
	asciidoc -v labs.adoc

pdf: $(DOCS)
	a2x -fpdf -dbook --fop --no-xmllint -v labs.adoc

epub: $(DOCS)
	a2x -fepub -dbook --no-xmllint -v labs.adoc

# slides: $(SLIDES)
# 	$(foreach slide,$(SLIDES), asciidoc --backend slidy -v $(slide);)

# prereq: $(PREREQ)
# 	a2x -fpdf --fop --no-xmllint -v prerequisites.adoc

clean:
	rm -f *.html *.pdf *.epub

