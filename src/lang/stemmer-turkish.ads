--  Generated by Snowball 2.0.0 - https://snowballstem.org/

package Stemmer.Turkish is
   type Context_Type is new Stemmer.Context_Type with private;
   procedure Stem (Z : in out Context_Type; Result : out Boolean);
private
   type Context_Type is new Stemmer.Context_Type with record
      B_Continue_stemming_noun_suffixes : Boolean;
   end record;
end Stemmer.Turkish;