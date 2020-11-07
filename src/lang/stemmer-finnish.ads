--  Generated by Snowball 2.0.0 - https://snowballstem.org/

private with Ada.Strings.Unbounded;
package Stemmer.Finnish with SPARK_Mode is
   type Context_Type is new Stemmer.Context_Type with private;
   procedure Stem (Z : in out Context_Type; Result : out Boolean);
private
   type Context_Type is new Stemmer.Context_Type with record
      B_Ending_removed : Boolean;
      S_X : Ada.Strings.Unbounded.Unbounded_String;
      I_P2 : Integer;
      I_P1 : Integer;
   end record;
end Stemmer.Finnish;
