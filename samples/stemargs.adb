with Ada.Text_IO;
with Ada.Command_Line;
with Stemmer;
with Stemmer.Factory;
procedure Stemargs is

   use Stemmer.Factory;

   function Get_Language (Name : in String) return Language_Type;

   function Get_Language (Name : in String) return Language_Type is
   begin
      return Language_Type'Value ("L_" & Name);

   exception
      when Constraint_Error =>
         Ada.Text_IO.Put_Line ("Unsupported language: " & Ada.Command_Line.Argument (1));
         return L_ENGLISH;

   end Get_Language;

   Count  : constant Natural := Ada.Command_Line.Argument_Count;
begin
   if Count <= 1 then
      Ada.Text_IO.Put_Line ("Usage: stemargs language words...");
      return;
   end if;
   declare
      Lang : constant Language_Type := Get_Language (Ada.Command_Line.Argument (1));
   begin
      for I in 2 .. Count loop
         Ada.Text_IO.Put_Line (Stem (Lang, Ada.Command_Line.Argument (I)));
      end loop;
   end;
end Stemargs;
