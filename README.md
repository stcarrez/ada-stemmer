# Ada Stemmer Library

[![Build Status](https://img.shields.io/jenkins/s/https/jenkins.vacs.fr/Bionic-Ada-Stemmer.svg)](https://jenkins.vacs.fr/job/Bionic-Ada-Stemmer/)
[![Test Status](https://img.shields.io/jenkins/t/https/jenkins.vacs.fr/Bionic-Ada-Stemmer.svg)](https://jenkins.vacs.fr/job/Bionic-Ada-Stemmer/)
[![codecov](https://codecov.io/gh/stcarrez/ada-stemmer/branch/master/graph/badge.svg)](https://codecov.io/gh/stcarrez/ada-stemmer)
[![License](https://img.shields.io/badge/license-APACHE2-blue.svg)](LICENSE)

The Ada Stemmer Library is a [stemming](https://en.wikipedia.org/wiki/Stemming) processor for several
natural languages.  It is based on the [Snowball compiler and stemming algorithms](https://snowballstem.org/)
which has been adapted to generate Ada code ([Snowball Ada](https://github.com/stcarrez/snowball/tree/ada-support)).
A stemming algorithm is used in natural language analysis to find
the base or root form of a word.  Such algorithm is specific to each natural language.
The [Porter Stemmer](https://tartarus.org/martin/PorterStemmer/) algorithm is specific to the English language
and will not work for French, Greek or Russian.

The Ada Stemmer Library integrates stemming algorithms for:
Arabic, Basque, Catalan, Danish, Dutch, English, Finnish, French, German, Greek,
Hindi, Hungarian, Indonesian, Irish, Italian, Lithuanian, Serbian, Nepali, Norwegian,
Portuguese, Romanian, Russian, Serbian, Spanish, Swedish, Tamil, Turkish.

Example of stemming:

|Language | Word          | Stem       |
|---------|---------------|------------|
|French   | chienne       | chien      |
|French   | affectionnait | affection  |
|English  | zealously     | zealous    |
|English  | transitional  | transit    |
|Greek    | ποσοτητα      | ποσοτητ    |
|Greek    | μνημειωδεσ    | μνημειωδ   |
|Russian  | ячменный      | ячмен      |
|Russian  | адом          | ад         |


## Version 1.2.0 - May 2022

* Update to use Snowball 2.2 (the Ada code generator has been integrated in Snowball 2.2!)
* Improvement to help in running the tests

## Version 1.1.0 - Oct 2020

* Add support Arabic, Basque, Catalan, Finnish, Hindi, Hungarian, Indonesian,
  Irish, Lithuanian, Nepali, Norwegian, Porter, Portuguese, Romanian,
  Tamil, Turkish

## Version 1.0.0 - May 2020

* First implementation of the Ada Stemmer Library

# Build

Build with the following commands:

```sh
make
```

## Unit test

To build the unit test, you will need the [Ada Utility Library](https://github.com/stcarrez/ada-util).
The `make test` target will clone the git repository locally and it will configure the GNAT project
accordingly to use and build the unit tests.

```sh
make build test HAVE_ADA_UTIL=yes ADA_PROJECT_PATH=./ada-util/.alire:./ada-util:./ada-util/.alire/unit
```

And unit tests are executed with:

```sh
make test
```

The unit tests contains several reference files in `regtests/files` that come from the
[Lucene](https://lucene.apache.org) search engine unit tests.

# Examples

The samples can be built using:

```sh
gnatmake -Psamples
```

You will get two programs:

* `bin/stemargs` will give the stem of words given as program argument,
* `bin/stemwords` will read a file and stem the words to print the result.

The first argument is the language.  For example:

```sh
bin/stemargs french chienne
```

or:

```sh
bin/stemwords english LICENSE.txt
```


# Simple example

The Ada Stemmer library does not split words.  You have to give them one word at a time
to stem and it returns either the word itself or its stem.  The `Stemmer.Factory` is
the multi-language entry point.  The stemmer algorithm is created for each call.

```ada
with Stemmer.Factory;

  Ada.Text_IO.Put_Line (Stem (L_FRENCH, "chienne"));
```

It is possible to instantiate a specific stemmer algorithm and then use it to stem
words.

```ada
with Stemmer.English;

  Ctx : Stemmer.English.Context_Type;
  Result : Boolean;

  Ctx.Stem_Word ("zealously", Result);
  if Result then
     Ada.Text_IO.Put_Line (Ctx.Get_Result);
  end if;
```

# References

* [The Porter Stemming Algorithm](https://tartarus.org/martin/PorterStemmer/)
* [Snowball Manual](https://snowballstem.org/compiler/snowman.html)
* [Lucene text analysis](https://lucene.apache.org/core/8_5_1/core/org/apache/lucene/analysis/package-summary.html#package.description)
