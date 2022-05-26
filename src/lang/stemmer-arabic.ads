--  Generated by Snowball 2.2.0 - https://snowballstem.org/

package Stemmer.Arabic with SPARK_Mode is
   type Context_Type is new Stemmer.Context_Type with private;
   procedure Stem (Z : in out Context_Type; Result : out Boolean);
private
   type Context_Type is new Stemmer.Context_Type with record
      B_Is_defined : Boolean;
      B_Is_verb : Boolean;
      B_Is_noun : Boolean;
   end record;
end Stemmer.Arabic;
