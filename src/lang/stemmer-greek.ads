--  Generated by Snowball 2.2.0 - https://snowballstem.org/

package Stemmer.Greek with SPARK_Mode is
   type Context_Type is new Stemmer.Context_Type with private;
   procedure Stem (Z : in out Context_Type; Result : out Boolean);
private
   type Context_Type is new Stemmer.Context_Type with record
      B_Test1 : Boolean;
   end record;
end Stemmer.Greek;
