--  Generated by Snowball 2.2.0 - https://snowballstem.org/

package Stemmer.Serbian with SPARK_Mode is
   type Context_Type is new Stemmer.Context_Type with private;
   procedure Stem (Z : in out Context_Type; Result : out Boolean);
private
   type Context_Type is new Stemmer.Context_Type with record
      I_P1 : Integer;
      B_No_diacritics : Boolean;
   end record;
end Stemmer.Serbian;
