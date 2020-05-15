NAME=stemmer

-include Makefile.conf

STATIC_MAKE_ARGS = $(MAKE_ARGS) -XSTEMMER_LIBRARY_TYPE=static
SHARED_MAKE_ARGS = $(MAKE_ARGS) -XSTEMMER_LIBRARY_TYPE=relocatable
SHARED_MAKE_ARGS += -XLIBRARY_TYPE=relocatable

SNOWBALL_ALGORITHMS=./snowball/algorithms
SNOWBALL=./snowball/snowball

include Makefile.defaults

# Build executables for all mains defined by the project.
build-test::	setup
ifeq ($(HAVE_ADA_UTIL),yes)
	$(GNATMAKE) $(GPRFLAGS) -p -P$(NAME)_tests $(MAKE_ARGS)
endif

# Build and run the unit tests
test:	build
ifeq ($(HAVE_ADA_UTIL),yes)
	bin/stemmer_harness -xml stemmer-aunit.xml
else
	@echo "You must build with Ada Utility Library to run the unit tests."
	@exit 1
endif

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
	$(SNOWBALL) $(SNOWBALL_ALGORITHMS)/swedish.sbl -ada -P Swedish -comments  -o src/lang/stemmer-swedish
	$(SNOWBALL) $(SNOWBALL_ALGORITHMS)/french.sbl -ada -P French -comments -o src/lang/stemmer-french
	$(SNOWBALL) $(SNOWBALL_ALGORITHMS)/serbian.sbl -ada -P Serbian -comments -o src/lang/stemmer-serbian
	$(SNOWBALL) $(SNOWBALL_ALGORITHMS)/russian.sbl -ada -P Russian -comments -o src/lang/stemmer-russian
	$(SNOWBALL) $(SNOWBALL_ALGORITHMS)/english.sbl -ada -P English -comments -o src/lang/stemmer-english
	$(SNOWBALL) $(SNOWBALL_ALGORITHMS)/greek.sbl -ada -P Greek -comments -o src/lang/stemmer-greek
	$(SNOWBALL) $(SNOWBALL_ALGORITHMS)/spanish.sbl -ada -P Spanish -comments -o src/lang/stemmer-spanish
	$(SNOWBALL) $(SNOWBALL_ALGORITHMS)/german.sbl -ada -P German -comments -o src/lang/stemmer-german
	$(SNOWBALL) $(SNOWBALL_ALGORITHMS)/italian.sbl -ada -P Italian -comments -o src/lang/stemmer-italian
	$(SNOWBALL) $(SNOWBALL_ALGORITHMS)/danish.sbl -ada -P Danish -comments -o src/lang/stemmer-danish
	$(SNOWBALL) $(SNOWBALL_ALGORITHMS)/dutch.sbl -ada -P Dutch -comments -o src/lang/stemmer-dutch

snowball/snowball:
	cd ./snowball && $(MAKE)



