NAME=stemmer

-include Makefile.conf

STATIC_MAKE_ARGS = $(MAKE_ARGS) -XSTEMMER_LIBRARY_TYPE=static
SHARED_MAKE_ARGS = $(MAKE_ARGS) -XSTEMMER_LIBRARY_TYPE=relocatable
SHARED_MAKE_ARGS += -XLIBRARY_TYPE=relocatable

SNOWBALL_ALGORITHMS=./snowball/algorithms
SNOWBALL=./snowball/snowball

include Makefile.defaults

# Build executables for all mains defined by the project.
test:	build regtests/files
	test -d ada-util || git clone https://github.com/stcarrez/ada-util.git
	test -d ada-util && cd ada-util && git pull
	$(MAKE) build run-test HAVE_ADA_UTIL=yes ADA_PROJECT_PATH=./ada-util/.alire:./ada-util:./ada-util/.alire/unit

build-test::
ifeq ($(HAVE_ADA_UTIL),yes)
	$(GNATMAKE) $(GPRFLAGS) -p -P$(NAME)_tests $(MAKE_ARGS)
endif

# Build and run the unit tests
run-test:	build regtests/files
ifeq ($(HAVE_ADA_UTIL),yes)
	bin/stemmer_harness -xml stemmer-aunit.xml
else
	@echo "You must build with Ada Utility Library to run the unit tests."
	@exit 1
endif

regtests/files:
	cd regtests && tar xf files.tar.gz

clean::
	rm -rf regtests/files

build::
	$(GNATMAKE) $(GPRFLAGS) -p -Psamples $(MAKE_ARGS)

install-samples:
	$(MKDIR) -p $(samplesdir)/samples
	cp -rp $(srcdir)/samples/*.ad[sb] $(samplesdir)/samples/
	cp -p $(srcdir)/samples.gpr $(samplesdir)
	cp -p $(srcdir)/stemmer_config.gpr $(samplesdir)

$(eval $(call ada_library,$(NAME)))

# To build the Snowball stemmer, make sure to build snowball before
generate: ./snowball/snowball
	$(SNOWBALL) $(SNOWBALL_ALGORITHMS)/arabic.sbl -ada -P Arabic -comments -o src/lang/stemmer-arabic
	$(SNOWBALL) $(SNOWBALL_ALGORITHMS)/basque.sbl -ada -P Basque -comments -o src/lang/stemmer-basque
	$(SNOWBALL) $(SNOWBALL_ALGORITHMS)/catalan.sbl -ada -P Catalan -comments -o src/lang/stemmer-catalan
	$(SNOWBALL) $(SNOWBALL_ALGORITHMS)/danish.sbl -ada -P Danish -comments -o src/lang/stemmer-danish
	$(SNOWBALL) $(SNOWBALL_ALGORITHMS)/dutch.sbl -ada -P Dutch -comments -o src/lang/stemmer-dutch
	$(SNOWBALL) $(SNOWBALL_ALGORITHMS)/english.sbl -ada -P English -comments -o src/lang/stemmer-english
	$(SNOWBALL) $(SNOWBALL_ALGORITHMS)/finnish.sbl -ada -P Finnish -comments -o src/lang/stemmer-finnish
	$(SNOWBALL) $(SNOWBALL_ALGORITHMS)/french.sbl -ada -P French -comments -o src/lang/stemmer-french
	$(SNOWBALL) $(SNOWBALL_ALGORITHMS)/german.sbl -ada -P German -comments -o src/lang/stemmer-german
	$(SNOWBALL) $(SNOWBALL_ALGORITHMS)/greek.sbl -ada -P Greek -comments -o src/lang/stemmer-greek
	$(SNOWBALL) $(SNOWBALL_ALGORITHMS)/hindi.sbl -ada -P Hindi -comments -o src/lang/stemmer-hindi
	$(SNOWBALL) $(SNOWBALL_ALGORITHMS)/hungarian.sbl -ada -P Hungarian -comments -o src/lang/stemmer-hungarian
	$(SNOWBALL) $(SNOWBALL_ALGORITHMS)/indonesian.sbl -ada -P Indonesian -comments -o src/lang/stemmer-indonesian
	$(SNOWBALL) $(SNOWBALL_ALGORITHMS)/irish.sbl -ada -P Irish -comments -o src/lang/stemmer-irish
	$(SNOWBALL) $(SNOWBALL_ALGORITHMS)/italian.sbl -ada -P Italian -comments -o src/lang/stemmer-italian
	$(SNOWBALL) $(SNOWBALL_ALGORITHMS)/lithuanian.sbl -ada -P Lithuanian -comments -o src/lang/stemmer-lithuanian
	$(SNOWBALL) $(SNOWBALL_ALGORITHMS)/nepali.sbl -ada -P Nepali -comments -o src/lang/stemmer-nepali
	$(SNOWBALL) $(SNOWBALL_ALGORITHMS)/norwegian.sbl -ada -P Norwegian -comments -o src/lang/stemmer-norwegian
	$(SNOWBALL) $(SNOWBALL_ALGORITHMS)/porter.sbl -ada -P Porter -comments -o src/lang/stemmer-porter
	$(SNOWBALL) $(SNOWBALL_ALGORITHMS)/portuguese.sbl -ada -P Portuguese -comments -o src/lang/stemmer-portuguese
	$(SNOWBALL) $(SNOWBALL_ALGORITHMS)/romanian.sbl -ada -P Romanian -comments -o src/lang/stemmer-romanian
	$(SNOWBALL) $(SNOWBALL_ALGORITHMS)/russian.sbl -ada -P Russian -comments -o src/lang/stemmer-russian
	$(SNOWBALL) $(SNOWBALL_ALGORITHMS)/serbian.sbl -ada -P Serbian -comments -o src/lang/stemmer-serbian
	$(SNOWBALL) $(SNOWBALL_ALGORITHMS)/spanish.sbl -ada -P Spanish -comments -o src/lang/stemmer-spanish
	$(SNOWBALL) $(SNOWBALL_ALGORITHMS)/swedish.sbl -ada -P Swedish -comments  -o src/lang/stemmer-swedish
	$(SNOWBALL) $(SNOWBALL_ALGORITHMS)/tamil.sbl -ada -P Tamil -comments  -o src/lang/stemmer-tamil
	$(SNOWBALL) $(SNOWBALL_ALGORITHMS)/turkish.sbl -ada -P Turkish -comments  -o src/lang/stemmer-turkish

snowball/snowball:
	cd ./snowball && $(MAKE)



