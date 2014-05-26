DOCS=building_images_pa.lab.adoc \
	configure_pa_compose_server.lab.adoc \
	configure_pa_vms.lab.adoc \
	docker_pa_basics.lab.adoc \
	geard_pa.lab.adoc \
	master_pa.labs.adoc \
	more_information_pa.lab.adoc \
	upgrade_rollback_pa.lab.adoc \

# SLIDES=agenda.slides.adoc \
    laptop_hypervisor_setup.slides.adoc \
    intro.slides.adoc \
    ceilometer.slides.adoc \
    ceph.slides.adoc \
    collaboration.slides.adoc \
    cinder.slides.adoc

PREREQ=prerequisites.adoc

all: $(DOCS) $(SLIDES) $(PREREQ) html pdf epub slides prereq

html: $(DOCS)
	asciidoc -v master_pa.labs.adoc

pdf: $(DOCS)
	a2x -fpdf -dbook --fop --no-xmllint -v master_pa.labs.adoc

epub: $(DOCS)
	a2x -fepub -dbook --no-xmllint -v master_pa.labs.adoc

slides: $(SLIDES)
	$(foreach slide,$(SLIDES), asciidoc --backend slidy -v $(slide);)

prereq: $(PREREQ)
	a2x -fpdf --fop --no-xmllint -v prerequisites.adoc

clean:
	rm -f *.html *.pdf *.epub

