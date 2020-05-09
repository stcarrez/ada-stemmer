# Ada Stemmer Library

[![Build Status](https://img.shields.io/jenkins/s/https/jenkins.vacs.fr/Bionic-Ada-Stemmer.svg)](https://jenkins.vacs.fr/job/Bionic-Ada-Stemmer/)
[![Test Status](https://img.shields.io/jenkins/t/https/jenkins.vacs.fr/Bionic-Ada-Stemmer.svg)](https://jenkins.vacs.fr/job/Bionic-Ada-Stemmer/)
[![codecov](https://codecov.io/gh/stcarrez/ada-stemmer/branch/master/graph/badge.svg)](https://codecov.io/gh/stcarrez/ada-stemmer)
[![License](https://img.shields.io/badge/license-APACHE2-blue.svg)](LICENSE)

The Ada Stemmer Library is a [stemming](https://en.wikipedia.org/wiki/Stemming) processor for several
natural languages.  It is based on top of the [Snowball compiler and stemming algorithms](https://snowballstem.org/)
which has been adapted to generate Ada code.  A stemming algorithm is used in natural language analysis to find
the base or root form of a word.  Such algorithm is specific to each natural language.
The [Porter Stemmer](https://tartarus.org/martin/PorterStemmer/) algorithm is specific to the English language
and will not work for French, Greek or Russian.

The Ada Stemmer Library integrates stemming algorithms for: English, French, Greek, Serbian, Spanish, Swedish, Russian.
Example of stemming:

|Language | Word          | Stem       |
|---------|---------------|------------|
|French   | chienne       | chien      |
|French   | affectionnait | affection  |
|English  | zealously     | zealous    |
|English  | transitional  | transit    |
|Greek    | ΠΟΣΟΤΗΤΑ      | ποσοτητ    |
|Greek    | ΜΝΗΜΕΙΩΔΕΣ    | μνημειωδ   |


## Version 0.1.0 - May 2020

* First implementation of the Ada Stemmer Library

# Build

Build with the following commands:
```
   make
```

The samples can be built using:
```
   gnatmake -Psamples
```
   
The unit tests are built using:
```
   gnatmake -Ptests
```

And unit tests are executed with:
```
   make test
```


