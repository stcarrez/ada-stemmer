--  Generated by Snowball 2.0.0 - https://snowballstem.org/

package Stemmer.Russian with SPARK_Mode is
   type Context_Type is new Stemmer.Context_Type with private;
   procedure Stem (Z : in out Context_Type; Result : out Boolean);
private
   type Context_Type is new Stemmer.Context_Type with record
      I_P2 : Integer;
      I_PV : Integer;
   end record;
end Stemmer.Russian;
