with Ada.Text_IO;
with Ada.Command_Line;
with Stemmer.Factory;
procedure Stemwords is

   use Stemmer.Factory;

   function Get_Language (Name : in String) return Language_Type;
   function Is_Space (C : in Character) return Boolean;

   function Is_Space (C : in Character) return Boolean is
   begin
      return C = ' ' or C = ASCII.HT;
   end Is_Space;

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
      Ada.Text_IO.Put_Line ("Usage: stemwords language file");
      return;
   end if;
   declare
      Lang : constant Language_Type := Get_Language (Ada.Command_Line.Argument (1));
      Path : constant String := Ada.Command_Line.Argument (2);
      File : Ada.Text_IO.File_Type;
   begin
      Ada.Text_IO.Open (File, Ada.Text_IO.In_File, Path);
      while not Ada.Text_IO.End_Of_File (File) loop
         declare
            Line : constant String := Ada.Text_IO.Get_Line (File);
            Pos  : Positive := Line'First;
            Last_Pos  : Positive;
            Start_Pos : Positive;
         begin
            while Pos <= Line'Last loop
               Last_Pos := Pos;
               while Pos <= Line'Last and then Is_Space (Line (Pos)) loop
                  Pos := Pos + 1;
               end loop;
               if Last_Pos < Pos then
                  Ada.Text_IO.Put (Line (Last_Pos .. Pos - 1));
               end if;
               exit when Pos > Line'Last;
               Start_Pos := Pos;
               while Pos <= Line'Last and then not Is_Space (Line (Pos)) loop
                  Pos := Pos + 1;
               end loop;
               Ada.Text_IO.Put (Stemmer.Factory.Stem (Lang, Line (Start_Pos .. Pos - 1)));
            end loop;
            Ada.Text_IO.New_Line;
         end;
      end loop;
      Ada.Text_IO.Close (File);
   end;
end Stemwords;
