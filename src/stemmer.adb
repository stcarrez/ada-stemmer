-----------------------------------------------------------------------
--  stemmer -- Multi-language stemmer with Snowball generator
--  Copyright (C) 2020 Stephane Carrez
--  Written by Stephane Carrez (Stephane.Carrez@gmail.com)
--
--  Licensed under the Apache License, Version 2.0 (the "License");
--  you may not use this file except in compliance with the License.
--  You may obtain a copy of the License at
--
--      http://www.apache.org/licenses/LICENSE-2.0
--
--  Unless required by applicable law or agreed to in writing, software
--  distributed under the License is distributed on an "AS IS" BASIS,
--  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
--  See the License for the specific language governing permissions and
--  limitations under the License.
-----------------------------------------------------------------------
--  with Ada.Text_IO;
package body Stemmer with SPARK_Mode is
   
--   use Ada.Text_IO;
   
   Debug : Boolean := False;
   
   procedure Put_Line (S : in String) is
   begin
      null;
   end Put_Line;

   procedure Stem_Word (Context  : in out Context_Type'Class;
                        Word     : in String;
                        Result   : out Boolean) is
   begin
      Context.P (1 .. Word'Length) := Word;
      Context.C := 1;
      Context.L := Word'Length + 1;
      Context.Lb := 0;
      Stemmer.Stem (Context, Result);
   end Stem_Word;

   function Get_Result (Context : in Context_Type'Class) return String is
   begin
      return Context.P (1 .. Context.L - 1);
   end Get_Result;
   
   function Eq_S (Context : in Context_Type'Class;
                  S       : in String) return Natural is
   begin
      if Context.L - Context.C < S'Length then
         return 0;
      end if;
      if Context.P (Context.C .. Context.C + S'Length - 1) /= S then
         return 0;
      end if;
      return S'Length;
   end Eq_S;

   function Eq_S_Backward (Context : in Context_Type'Class;
                           S       : in String) return Natural is
   begin
      if Context.C - Context.Lb < S'Length then
         return 0;
      end if;
      if Context.P (Context.C - S'Length .. Context.C - 1) /= S then
         return 0;
      end if;
      return S'Length;
   end Eq_S_Backward;

   function Length (Context : in Context_Type'Class) return Natural is
   begin
      return Context.L - Context.Lb;
   end Length;

   procedure Find_Among (Context : in out Context_Type'Class;
                         Amongs  : in Among_Array_Type;
                         Pattern : in String;
                         Result  : out Integer) is
      I   : Natural := Amongs'First;
      J   : Natural := Amongs'Last + 1;
      Common_I : Natural := 0;
      Common_J : Natural := 0;
      First_Key_Inspected : Boolean := False;
      C   : Integer := Context.C;
      L   : Integer := Context.L;
   begin
      if Debug then
         Put_Line ("Find_Among: " & Context.P (Context.C .. Context.L - 1));
      end if;
      loop
         declare
            K      : constant Natural := I + (J - I) / 2;
            W      : constant Among_Type := Amongs (K);
            Len    : constant Natural := W.Last - W.First + 1;
            Common : Natural := (if Common_I < Common_J then Common_I else Common_J);
            Diff   : Integer := 0;
         begin
            if Debug then                   
               Put_Line ("  k = " & Natural'Image (K));
            end if;
            for I2 in Common + 1 .. Len loop
               if C + Common = L then
                  Diff := -1;
                  exit;
               end if;
               Diff := Character'Pos (Context.P (Context.C + Common))
                 - Character'Pos (Pattern (W.First + I2 - 1));
               exit when Diff /= 0;
               Common := Common + 1;
            end loop;
            if Diff < 0 then
               J := K;
               Common_J := Common;
            else
               I := K;
               Common_I := Common;
            end if;
         end;
         if J - I <= 1 then
            exit when I > 0;
            exit when J = I;
            exit when First_Key_Inspected;
            First_Key_Inspected := True;
         end if;
      end loop;
      
      loop
         declare
            W : Among_Type := Amongs (I);
            Len : constant Natural := W.Last - W.First + 1;
         begin
            if Common_I >= Len then
               Context.C := Context.C + Len;
               --if W.Method = null then
               Result := W.Result;
               return;
               --end if;
               --  SCz: call method
            end if;
            exit when W.Substring_I <= 0;
            I := W.Substring_I;
         end;
      end loop;
      Result := 0;
   end Find_Among;

   procedure Find_Among_Backward (Context : in out Context_Type'Class;
                                  Amongs  : in Among_Array_Type;
                                  Pattern : in String;
                                  Result  : out Integer) is
      I   : Natural := Amongs'First;
      J   : Natural := Amongs'Last + 1;
      Common_I : Natural := 0;
      Common_J : Natural := 0;
      First_Key_Inspected : Boolean := False;
      C   : Integer := Context.C;
      Lb  : Integer := Context.Lb;
   begin
      if Debug then
         Put_Line ("Find_Among_Backward: " & Context.P (Context.C .. Context.L - 1));
      end if;
      loop
         declare
            K      : constant Natural := I + (J - I) / 2;
            W      : constant Among_Type := Amongs (K);
            Common : Natural := (if Common_I < Common_J then Common_I else Common_J);
            Diff   : Integer := 0;
         begin
            if Debug then
               Put_Line ("  k = " & Natural'Image (K) & " " & Pattern (W.First .. W.Last));
            end if;
            for I2 in reverse W.First .. W.Last - Common loop
               if C - Common = Lb then
                  Diff := -1;
                  exit;
               end if;
               if Debug then
                  Put_Line ("  find_among_b c1=" & Context.P (C - Common - 1)
                              & " c2=" & Pattern (I2));
               end if;
               Diff := Character'Pos (Context.P (C - Common - 1))
                 - Character'Pos (Pattern (I2));
               exit when Diff /= 0;
               Common := Common + 1;
            end loop;
            if Diff < 0 then
               J := K;
               Common_J := Common;
            else
               I := K;
               Common_I := Common;
            end if;
         end;
         if J - I <= 1 then
            exit when I > 0;
            exit when J = I;
            exit when First_Key_Inspected;
            First_Key_Inspected := True;
         end if;
      end loop;

      if Debug then      
         Put_Line ("  ==> i = " & Natural'Image (I));
      end if;
      loop
         declare
            W : Among_Type := Amongs (I);
            Len : constant Natural := W.Last - W.First + 1;
         begin
            if Common_I >= Len then
               Context.C := Context.C - Len;
               --if W.Method = null then
               Result := W.Result;
               return;
               --end if;
               --  SCz: call method
            end if;
            exit when W.Substring_I <= 0;
            I := W.Substring_I;
         end;
      end loop;
      Result := 0;
   end Find_Among_Backward;
   
   type Byte is mod 256;

   function Skip_Utf8 (Context : in Context_Type'Class;
                       N       : in Positive) return Integer is
      Pos : Integer := Context.C;
      Val : Byte;
   begin
      for I in 1 .. N loop
         if Pos >= Context.L then
            return -1;
         end if;
         Val := Character'Pos (Context.P (Pos));
         Pos := Pos + 1;
      end loop;
      return Pos;
   end Skip_Utf8;

   function Skip_Utf8_Backward (Context : in Context_Type'Class;
                                N       : in Positive) return Integer is
      Pos : Integer := Context.C;
      Val : Byte;
   begin
      for I in 1 .. N loop
         if Pos <= Context.Lb then
            return -1;
         end if;
         Pos := Pos - 1;
      end loop;
      return Pos;
   end Skip_Utf8_Backward;

   procedure Out_Grouping (Context : in out Context_Type'Class;
                           S       : in Grouping_Array;
                           Min     : in Integer;
                           Max     : in Integer;
                           Repeat  : in Boolean;
                           Result  : out Integer) is
      Ch : Character;
      P  : Natural;
   begin
      if Context.C >= Context.L then
         Result := -1;
         return;
      end if;
      if Debug then
         Put_Line ("Out_Grouping: " & Context.P (Context.C .. Context.L - 1));
      end if;
      loop
         if Context.C >= Context.L then
            Result := -1;
            return;
         end if;
         Ch := Context.P (Context.C);
         if Character'Pos (Ch) <= Max and Character'Pos (Ch) >= Min then
            P := Character'Pos (Ch) - Min;
            if S (P) then
               Result := 1;
               return;
            end if;
         end if;
         Context.C := Context.C + 1;
         exit when not Repeat;
      end loop;
      Result := 0;
   end Out_Grouping;

   procedure Out_Grouping_Backward (Context : in out Context_Type'Class;
                                    S       : in Grouping_Array;
                                    Min     : in Integer;
                                    Max     : in Integer;
                                    Repeat  : in Boolean;
                                    Result  : out Integer) is
      Ch : Character;
      P  : Natural;
   begin
      if Context.C <= 0 then
         Result := -1;
         return;
      end if;
      if Debug then
         Put_Line ("Out_Grouping_Backward: " & Context.P (1 .. Context.C - 1));
      end if;
      loop
         if Context.C <= Context.Lb then
            Result := -1;
            return;
         end if;
         Ch := Context.P (Context.C - 1);
         if Character'Pos (Ch) <= Max and Character'Pos (Ch) >= Min then
            P := Character'Pos (Ch) - Min;
            if S (P) then
               Result := 1;
               return;
            end if;
         end if;
         Context.C := Context.C - 1;
         exit when not Repeat;
      end loop;
      Result := 0;
   end Out_Grouping_Backward;

   procedure In_Grouping (Context : in out Context_Type'Class;
                          S       : in Grouping_Array;
                          Min     : in Integer;
                          Max     : in Integer;
                          Repeat  : in Boolean;
                          Result  : out Integer) is
      Ch : Character;
      P  : Natural;
   begin
      if Context.C >= Context.L then
         Result := -1;
         return;
      end if;
      if Debug then
         Put_Line ("In_Grouping: " & Context.P (Context.C .. Context.L - 1));
      end if;
      loop
         if Context.C >= Context.L then
            Result := -1;
            return;
         end if;
         Ch := Context.P (Context.C);
         if Character'Pos (Ch) > Max or Character'Pos (Ch) < Min then
            Result := 1;
            return;
         end if;
         P := Character'Pos (Ch) - Min;
         if not S (P) then
            Result := 1;
            return;
         end if;
         Context.C := Context.C + 1;
         exit when not Repeat;
      end loop;
      Result := 0;
   end In_Grouping;
   
   procedure In_Grouping_Backward (Context : in out Context_Type'Class;
                                   S       : in Grouping_Array;
                                   Min     : in Integer;
                                   Max     : in Integer;
                                   Repeat  : in Boolean;
                                   Result  : out Integer) is
      Ch : Character;
      P  : Natural;
   begin
      if Context.C <= 0 then
         Result := -1;
         return;
      end if;
      if Debug then
         Put_Line ("In_Grouping_Backward: " & Context.P (1 .. Context.C - 1));
      end if;
      loop
         if Context.C <= Context.Lb then
            Result := -1;
            return;
         end if;
         Ch := Context.P (Context.C - 1);
         if Character'Pos (Ch) > Max or Character'Pos (Ch) < Min then
            Result := 1;
            return;
         end if;
         P := Character'Pos (Ch) - Min;
         if not S (P) then
            Result := 1;
         end if;
         Context.C := Context.C - 1;
         exit when not Repeat;
      end loop;
      Result := 0;
   end In_Grouping_Backward;

   procedure Replace (Context    : in out Context_Type'Class;
                      C_Bra      : in Integer;
                      C_Ket      : in Integer;
                      S          : in String;
                      Adjustment : out Integer) is
   begin
      Adjustment := S'Length - (C_Ket - C_Bra);
      if Adjustment > 0 then
         Context.P (C_Bra + S'Length .. Context.Lb + Adjustment)
           := Context.P (C_Ket .. Context.Lb);
      end if;
      if S'Length > 0 then
         Context.P (C_Bra .. C_Bra + S'Length - 1) := S;
      end if;
      if Adjustment < 0 then
         Context.P (C_Bra + S'Length .. Context.L + Adjustment)
           := Context.P (C_Ket .. Context.L);
      end if;
      --  Replace_Slice (Context.P, C_Bra, C_Ket - 1, S);
      Context.L := Context.L + Adjustment;
      if Context.C >= C_Ket then
         Context.C := Context.C + Adjustment;
      elsif Context.C > C_Bra then
         Context.C := C_Bra;
      end if;
   end Replace;
   
   procedure Slice_Del (Context : in out Context_Type'Class) is
      Result : Integer;
   begin
      Replace (Context, Context.Bra, Context.Ket, "", Result);
   end Slice_Del;
   
   procedure Slice_From (Context : in out Context_Type'Class;
                         Text    : in String) is
      Result : Integer;
   begin
      Replace (Context, Context.Bra, Context.Ket, Text, Result);
   end Slice_From;

   procedure Insert (Context : in out Context_Type'Class;
                     C_Bra   : in Natural;
                     C_Ket   : in Natural;
                     S       : in String) is
      Result : Integer;
   begin
      Replace (Context, C_Bra, C_Ket, S, Result);
      if C_Bra <= Context.Bra then
         Context.Bra := Context.Bra + Result;
      end if;
      if C_Bra <= Context.Ket then
         Context.Ket := Context.Ket + Result;
      end if;
   end Insert;

end Stemmer;