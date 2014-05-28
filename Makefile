DOCS=content/docker/docker_basics.lab.adoc \
	content/geard/geard.lab.adoc \
	content/atomic_host/upgrade_rollback_pa.lab.adoc \
	content/docker/building_images_pa.lab.adoc \
	content/atomic_host/configure_compose_server.lab.adoc \
	content/atomic_host/building_project_atomic_images.lab.adoc

# SLIDES=agenda.slides.adoc \
    laptop_hypervisor_setup.slides.adoc \
    intro.slides.adoc \
    ceilometer.slides.adoc \
    ceph.slides.adoc \
    collaboration.slides.adoc \
    cinder.slides.adoc

# PREREQ=prerequisites.adoc

# all: $(DOCS) $(SLIDES) $(PREREQ) html pdf epub slides prereq

# Changed by scollier on 5-26-2014, see above line to include slides and prereq
all: $(DOCS)  html pdf epub 

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

