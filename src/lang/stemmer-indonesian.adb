--  Generated by Snowball 2.0.0 - https://snowballstem.org/

package body Stemmer.Indonesian is

   pragma Style_Checks ("-mr");
   pragma Warnings (Off, "*variable*is never read and never assigned*");
   pragma Warnings (Off, "*mode could be*instead of*");
   pragma Warnings (Off, "*formal parameter.*is not modified*");
   pragma Warnings (Off, "*this line is too long*");
   pragma Warnings (Off, "*is not referenced*");

   procedure R_VOWEL (Z : in out Context_Type; Result : out Boolean);
   procedure R_SUFFIX_I_OK (Z : in out Context_Type; Result : out Boolean);
   procedure R_SUFFIX_AN_OK (Z : in out Context_Type; Result : out Boolean);
   procedure R_SUFFIX_KAN_OK (Z : in out Context_Type; Result : out Boolean);
   procedure R_KER (Z : in out Context_Type; Result : out Boolean);
   procedure R_Remove_suffix (Z : in out Context_Type; Result : out Boolean);
   procedure R_Remove_second_order_prefix (Z : in out Context_Type; Result : out Boolean);
   procedure R_Remove_first_order_prefix (Z : in out Context_Type; Result : out Boolean);
   procedure R_Remove_possessive_pronoun (Z : in out Context_Type; Result : out Boolean);
   procedure R_Remove_particle (Z : in out Context_Type; Result : out Boolean);

   procedure Among_Handler (Context : in out Stemmer.Context_Type'Class; Operation : in Operation_Index; Result : out Boolean);

   G_Vowel : constant Grouping_Array (0 .. 23) := (
      True, False, False, False, True, False, False, False,
      True, False, False, False, False, False, True, False,
      False, False, False, False, True, False, False, False
   );
   Among_String : constant String := "kah" & "lah" & "pun" & "nya" & "ku" & "mu" & "i" & "an" & "kan" & "di" & "ke"
      & "me" & "mem" & "men" & "meng" & "meny" & "pem" & "pen" & "peng" & "peny"
      & "ter" & "be" & "belajar" & "ber" & "pe" & "pelajar" & "per";

   A_0 : constant Among_Array_Type (0 .. 2) := (
      (1, 3, -1, 1, 0),
      (4, 6, -1, 1, 0),
      (7, 9, -1, 1, 0));

   A_1 : constant Among_Array_Type (0 .. 2) := (
      (10, 12, -1, 1, 0),
      (13, 14, -1, 1, 0),
      (15, 16, -1, 1, 0));

   A_2 : constant Among_Array_Type (0 .. 2) := (
      (17, 17, -1, 1, 1),
      (18, 19, -1, 1, 2),
      (20, 22, 1, 1, 3));

   A_3 : constant Among_Array_Type (0 .. 11) := (
      (23, 24, -1, 1, 0),
      (25, 26, -1, 2, 0),
      (27, 28, -1, 1, 0),
      (29, 31, 2, 5, 0),
      (32, 34, 2, 1, 0),
      (35, 38, 4, 1, 0),
      (39, 42, 4, 3, 4),
      (43, 45, -1, 6, 0),
      (46, 48, -1, 2, 0),
      (49, 52, 8, 2, 0),
      (53, 56, 8, 4, 5),
      (57, 59, -1, 1, 0));

   A_4 : constant Among_Array_Type (0 .. 5) := (
      (60, 61, -1, 3, 6),
      (62, 68, 0, 4, 0),
      (69, 71, 0, 3, 0),
      (72, 73, -1, 1, 0),
      (74, 80, 3, 2, 0),
      (81, 83, 3, 1, 0));


   procedure R_Remove_particle (Z : in out Context_Type; Result : out Boolean) is
      C : Integer;
      A : Integer;
   begin
      --  (, line 50
      Z.Ket := Z.C;      --  [, line 51

      --  substring, line 51
      if Z.C - 2 <= Z.Lb or else (Character'Pos (Z.P (Z.C)) /= 104 and then Character'Pos (Z.P (Z.C)) /= 110) then
         Result := False;
         return;
         --  substring, line 51
      end if;
      Find_Among_Backward (Z, A_0, Among_String, null, A);
      if A = 0 then
         Result := False;
         return;
      end if;
      Z.Bra := Z.C;      --  ], line 51

      --  (, line 52
      --  delete, line 52
      Slice_Del (Z);
      Z.I_Measure := Z.I_Measure - 1;

      Result := True;
   end R_Remove_particle;

   procedure R_Remove_possessive_pronoun (Z : in out Context_Type; Result : out Boolean) is
      C : Integer;
      A : Integer;
   begin
      --  (, line 56
      Z.Ket := Z.C;      --  [, line 57

      --  substring, line 57
      if Z.C - 1 <= Z.Lb or else (Character'Pos (Z.P (Z.C)) /= 97 and then Character'Pos (Z.P (Z.C)) /= 117) then
         Result := False;
         return;
         --  substring, line 57
      end if;
      Find_Among_Backward (Z, A_1, Among_String, null, A);
      if A = 0 then
         Result := False;
         return;
      end if;
      Z.Bra := Z.C;      --  ], line 57

      --  (, line 58
      --  delete, line 58
      Slice_Del (Z);
      Z.I_Measure := Z.I_Measure - 1;

      Result := True;
   end R_Remove_possessive_pronoun;

   procedure R_SUFFIX_KAN_OK (Z : in out Context_Type; Result : out Boolean) is
      C : Integer;
      A : Integer;
   begin
      --  (, line 63
      --  and, line 85
      if not (Z.I_Prefix /= 3) then
         Result := False;
         return;
      end if;
      if not (Z.I_Prefix /= 2) then
         Result := False;
         return;
      end if;

      Result := True;
   end R_SUFFIX_KAN_OK;

   procedure R_SUFFIX_AN_OK (Z : in out Context_Type; Result : out Boolean) is
      C : Integer;
      A : Integer;
   begin
      --  (, line 89
      if not (Z.I_Prefix /= 1) then
         Result := False;
         return;
      end if;

      Result := True;
   end R_SUFFIX_AN_OK;

   procedure R_SUFFIX_I_OK (Z : in out Context_Type; Result : out Boolean) is
      C : Integer;
      A : Integer;
      v_1 : Integer;
   begin
      --  (, line 91
      if not (Z.I_Prefix <= 2) then
         Result := False;
         return;
      end if;
      --  not, line 128
      v_1 := Z.L - Z.C;
      --  literal, line 128
      C := Eq_S_Backward (Z, "s");
      if C = 0 then
         goto lab0;
      end if;
      Z.C := Z.C - C;
      Result := False;
      return;

      <<lab0>>
      Z.C := Z.L - v_1;

      Result := True;
   end R_SUFFIX_I_OK;

   procedure R_Remove_suffix (Z : in out Context_Type; Result : out Boolean) is
      C : Integer;
      A : Integer;
   begin
      --  (, line 131
      Z.Ket := Z.C;      --  [, line 132

      --  substring, line 132
      if Z.C <= Z.Lb or else (Character'Pos (Z.P (Z.C)) /= 105 and then Character'Pos (Z.P (Z.C)) /= 110) then
         Result := False;
         return;
         --  substring, line 132
      end if;
      Find_Among_Backward (Z, A_2, Among_String, Among_Handler'Access, A);
      if A = 0 then
         Result := False;
         return;
      end if;
      Z.Bra := Z.C;      --  ], line 132

      --  (, line 134
      --  delete, line 134
      Slice_Del (Z);
      Z.I_Measure := Z.I_Measure - 1;

      Result := True;
   end R_Remove_suffix;

   procedure R_VOWEL (Z : in out Context_Type; Result : out Boolean) is
      C : Integer;
      A : Integer;
   begin
      --  (, line 141
      In_Grouping (Z, G_Vowel, 97, 117, False, C);
      if C /= 0 then
         Result := False;
         return;
      end if;

      Result := True;
   end R_VOWEL;

   procedure R_KER (Z : in out Context_Type; Result : out Boolean) is
      C : Integer;
      A : Integer;
   begin
      --  (, line 143
      Out_Grouping (Z, G_Vowel, 97, 117, False, C);
      if C /= 0 then
         Result := False;
         return;
      end if;
      --  literal, line 143
      C := Eq_S (Z, "er");
      if C = 0 then
         Result := False;
         return;
      end if;
      Z.C := Z.C + C;

      Result := True;
   end R_KER;

   procedure R_Remove_first_order_prefix (Z : in out Context_Type; Result : out Boolean) is
      C : Integer;
      A : Integer;
      v_1 : Integer;
      v_2 : Integer;
      v_3 : Integer;
      v_4 : Integer;
   begin
      --  (, line 145
      Z.Bra := Z.C;      --  [, line 146

      --  substring, line 146
      if Z.C + 1 >= Z.L or else (Character'Pos (Z.P (Z.C + 1 + 1)) /= 105 and then Character'Pos (Z.P (Z.C + 1 + 1)) /= 101) then
         Result := False;
         return;
         --  substring, line 146
      end if;
      Find_Among (Z, A_3, Among_String, Among_Handler'Access, A);
      if A = 0 then
         Result := False;
         return;
      end if;
      Z.Ket := Z.C;      --  ], line 146

      --  among, line 146
      case A is
         when 1 =>
            --  (, line 147
            --  delete, line 147
            Slice_Del (Z);
            Z.I_Prefix := 1;
            Z.I_Measure := Z.I_Measure - 1;
         when 2 =>
            --  (, line 148
            --  delete, line 148
            Slice_Del (Z);
            Z.I_Prefix := 3;
            Z.I_Measure := Z.I_Measure - 1;
         when 3 =>
            --  (, line 149
            Z.I_Prefix := 1;
            --  <-, line 149
            Slice_From (Z, "s");
            Z.I_Measure := Z.I_Measure - 1;
         when 4 =>
            --  (, line 150
            Z.I_Prefix := 3;
            --  <-, line 150
            Slice_From (Z, "s");
            Z.I_Measure := Z.I_Measure - 1;
         when 5 =>
            --  (, line 151
            Z.I_Prefix := 1;
            Z.I_Measure := Z.I_Measure - 1;
            --  or, line 151
            v_1 := Z.C;
            --  and, line 151
            v_2 := Z.C;
            In_Grouping (Z, G_Vowel, 97, 117, False, C);
            if C /= 0 then
               goto lab1;
            end if;
            Z.C := v_2;
            --  <-, line 151
            Slice_From (Z, "p");
            goto lab0;

            <<lab1>>
            Z.C := v_1;
            --  delete, line 151
            Slice_Del (Z);

            <<lab0>>
         when 6 =>
            --  (, line 152
            Z.I_Prefix := 3;
            Z.I_Measure := Z.I_Measure - 1;
            --  or, line 152
            v_3 := Z.C;
            --  and, line 152
            v_4 := Z.C;
            In_Grouping (Z, G_Vowel, 97, 117, False, C);
            if C /= 0 then
               goto lab3;
            end if;
            Z.C := v_4;
            --  <-, line 152
            Slice_From (Z, "p");
            goto lab2;

            <<lab3>>
            Z.C := v_3;
            --  delete, line 152
            Slice_Del (Z);

            <<lab2>>
         when others =>
            null;
      end case;

      Result := True;
   end R_Remove_first_order_prefix;

   procedure R_Remove_second_order_prefix (Z : in out Context_Type; Result : out Boolean) is
      C : Integer;
      A : Integer;
   begin
      --  (, line 156
      Z.Bra := Z.C;      --  [, line 162

      --  substring, line 162
      if Z.C + 1 >= Z.L or else Character'Pos (Z.P (Z.C + 1 + 1)) /= 101 then
         Result := False;
         return;
         --  substring, line 162
      end if;
      Find_Among (Z, A_4, Among_String, Among_Handler'Access, A);
      if A = 0 then
         Result := False;
         return;
      end if;
      Z.Ket := Z.C;      --  ], line 162

      --  among, line 162
      case A is
         when 1 =>
            --  (, line 163
            --  delete, line 163
            Slice_Del (Z);
            Z.I_Prefix := 2;
            Z.I_Measure := Z.I_Measure - 1;
         when 2 =>
            --  (, line 164
            --  <-, line 164
            Slice_From (Z, "ajar");
            Z.I_Measure := Z.I_Measure - 1;
         when 3 =>
            --  (, line 165
            --  delete, line 165
            Slice_Del (Z);
            Z.I_Prefix := 4;
            Z.I_Measure := Z.I_Measure - 1;
         when 4 =>
            --  (, line 166
            --  <-, line 166
            Slice_From (Z, "ajar");
            Z.I_Prefix := 4;
            Z.I_Measure := Z.I_Measure - 1;
         when others =>
            null;
      end case;

      Result := True;
   end R_Remove_second_order_prefix;

   procedure Stem (Z : in out Context_Type; Result : out Boolean) is
      C : Integer;
      A : Integer;
      v_1 : Integer;
      v_2 : Integer;
      v_3 : Integer;
      v_4 : Integer;
      v_5 : Integer;
      v_6 : Integer;
      v_7 : Integer;
      v_8 : Integer;
      v_9 : Integer;
      v_10 : Integer;
   begin
      --  (, line 171
      Z.I_Measure := 0;
      --  do, line 173
      v_1 := Z.C;
      --  (, line 173
      --  repeat, line 173

      <<lab1>>

      loop
         v_2 := Z.C;
         --  (, line 173
                  --  gopast, line 173
         --  grouping vowel, line 173
         Out_Grouping (Z, G_Vowel, 97, 117, True, C);
         if C < 0 then
            goto lab2;
         end if;
         Z.C := Z.C + C;
         Z.I_Measure := Z.I_Measure + 1;
         goto lab1;

         <<lab2>>
         Z.C := v_2;

         exit;
      end loop;

      <<lab0>>
      Z.C := v_1;
      if not (Z.I_Measure > 2) then
         Result := False;
         return;
      end if;
      Z.I_Prefix := 0;
      Z.Lb := Z.C; Z.C := Z.L;      --  backwards, line 176

      --  (, line 176
      --  do, line 177
      v_3 := Z.L - Z.C;
      --  call remove_particle, line 177
      R_Remove_particle (Z, Result);
      Z.C := Z.L - v_3;
      if not (Z.I_Measure > 2) then
         Result := False;
         return;
      end if;
      --  do, line 179
      v_4 := Z.L - Z.C;
      --  call remove_possessive_pronoun, line 179
      R_Remove_possessive_pronoun (Z, Result);
      Z.C := Z.L - v_4;
      Z.C := Z.Lb;
      if not (Z.I_Measure > 2) then
         Result := False;
         return;
      end if;
      --  or, line 188
      v_5 := Z.C;
      --  test, line 182
      v_6 := Z.C;
      --  (, line 182
      --  call remove_first_order_prefix, line 183
      R_Remove_first_order_prefix (Z, Result);
      if not Result then
         goto lab5;
      end if;
      --  do, line 184
      v_7 := Z.C;
      --  (, line 184
      --  test, line 185
      v_8 := Z.C;
      --  (, line 185
      if not (Z.I_Measure > 2) then
         goto lab6;
      end if;
      Z.Lb := Z.C; Z.C := Z.L;      --  backwards, line 185

      --  call remove_suffix, line 185
      R_Remove_suffix (Z, Result);
      if not Result then
         goto lab6;
      end if;
      Z.C := Z.Lb;
      Z.C := v_8;
      if not (Z.I_Measure > 2) then
         goto lab6;
      end if;
      --  call remove_second_order_prefix, line 186
      R_Remove_second_order_prefix (Z, Result);
      if not Result then
         goto lab6;
      end if;

      <<lab6>>
      Z.C := v_7;
      Z.C := v_6;
      goto lab4;

      <<lab5>>
      Z.C := v_5;
      --  (, line 188
      --  do, line 189
      v_9 := Z.C;
      --  call remove_second_order_prefix, line 189
      R_Remove_second_order_prefix (Z, Result);
      Z.C := v_9;
      --  do, line 190
      v_10 := Z.C;
      --  (, line 190
      if not (Z.I_Measure > 2) then
         goto lab7;
      end if;
      Z.Lb := Z.C; Z.C := Z.L;      --  backwards, line 190

      --  call remove_suffix, line 190
      R_Remove_suffix (Z, Result);
      if not Result then
         goto lab7;
      end if;
      Z.C := Z.Lb;

      <<lab7>>
      Z.C := v_10;

      <<lab4>>

      Result := True;
   end Stem;

   procedure Among_Handler (Context : in out Stemmer.Context_Type'Class; Operation : in Operation_Index; Result : out Boolean) is
   begin
      case Operation is
         when 1 =>
            R_SUFFIX_I_OK (Context_Type (Context), Result);
         when 2 =>
            R_SUFFIX_AN_OK (Context_Type (Context), Result);
         when 3 =>
            R_SUFFIX_KAN_OK (Context_Type (Context), Result);
         when 4 =>
            R_VOWEL (Context_Type (Context), Result);
         when 5 =>
            R_VOWEL (Context_Type (Context), Result);
         when 6 =>
            R_KER (Context_Type (Context), Result);
         when others =>
            Result := False;
      end case;
   end Among_Handler;
end Stemmer.Indonesian;
