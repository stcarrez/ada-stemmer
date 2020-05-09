--  Generated by Snowball 2.0.0 - https://snowballstem.org/

package Stemmer.French is
   type Context_Type is new Stemmer.Context_Type with private;
   procedure Stem (Z : in out Context_Type; Result : out Boolean);
private
   type Context_Type is new Stemmer.Context_Type with record
      I_p2 : Integer;
      I_p1 : Integer;
      IlU_pV : Integer;
   end record;
end Stemmer.French;
