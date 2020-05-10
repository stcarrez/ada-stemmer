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
|Russian  | ячменный      | ячмен      |
|Russian  | адом          | ад         |


## Version 0.1.0 - May 2020

* First implementation of the Ada Stemmer Library

# Build

Build with the following commands:
```
   make
```

The unit tests are built using:
```
   gnatmake -Ptests
```

And unit tests are executed with:
```
   make test
```

The unit tests contains several reference files in `regtests/files` that come from the
[Lucene](https://lucene.apache.org) search engine unit tests.

# Examples

The samples can be built using:
```
   gnatmake -Psamples
```

You will get two programs:

* `bin/stemargs` will give the stem of words given as program argument,
* `bin/stemwords` will read a file and stem the words to print the result.

The first argument is the language.  For example:

```
bin/stemargs french chienne
```

or:

```
bin/stemwords english LICENSE.txt
```


# Simple example

The Ada Stemmer library does not split words.  You have to give them one word at a time
to stem and it returns either the word itself or its stem.  The `Stemmer.Factory` is
the multi-language entry point.  The stemmer algorithm is created for each call.

```
with Stemmer.Factory;

  Ada.Text_IO.Put_Line (Stem (L_FRENCH, "chienne"));
```

It is possible to instantiate a specific stemmer algorithm and then use it to stem
words.

```
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
* [Snowball Manual](http://snowball.tartarus.org/compiler/snowman.html)
* [Lucene text analysis](https://lucene.apache.org/core/8_5_1/core/org/apache/lucene/analysis/package-summary.html#package.description)
