--  Generated by Snowball 2.0.0 - https://snowballstem.org/

package Stemmer.Porter with SPARK_Mode is
   type Context_Type is new Stemmer.Context_Type with private;
   procedure Stem (Z : in out Context_Type; Result : out Boolean);
private
   type Context_Type is new Stemmer.Context_Type with record
      B_Y_found : Boolean;
      I_P2 : Integer;
      I_P1 : Integer;
   end record;
end Stemmer.Porter;
