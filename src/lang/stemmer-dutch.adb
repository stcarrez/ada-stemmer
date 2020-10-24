--  Generated by Snowball 2.0.0 - https://snowballstem.org/

package body Stemmer.Dutch is

   pragma Style_Checks ("-mr");
   pragma Warnings (Off, "*variable*is never read and never assigned*");
   pragma Warnings (Off, "*mode could be*instead of*");
   pragma Warnings (Off, "*formal parameter.*is not modified*");
   pragma Warnings (Off, "*this line is too long*");
   pragma Warnings (Off, "*is not referenced*");

   procedure R_Standard_suffix (Z : in out Context_Type; Result : out Boolean);
   procedure R_Undouble (Z : in out Context_Type; Result : out Boolean);
   procedure R_R2 (Z : in out Context_Type; Result : out Boolean);
   procedure R_R1 (Z : in out Context_Type; Result : out Boolean);
   procedure R_Mark_regions (Z : in out Context_Type; Result : out Boolean);
   procedure R_En_ending (Z : in out Context_Type; Result : out Boolean);
   procedure R_E_ending (Z : in out Context_Type; Result : out Boolean);
   procedure R_Postlude (Z : in out Context_Type; Result : out Boolean);
   procedure R_Prelude (Z : in out Context_Type; Result : out Boolean);

   G_V : constant Grouping_Array (0 .. 135) := (
      True, False, False, False, True, False, False, False,
      True, False, False, False, False, False, True, False,
      False, False, False, False, True, False, False, False,
      True, False, False, False, False, False, False, False,
      False, False, False, False, False, False, False, False,
      False, False, False, False, False, False, False, False,
      False, False, False, False, False, False, False, False,
      False, False, False, False, False, False, False, False,
      False, False, False, False, False, False, False, False,
      False, False, False, False, False, False, False, False,
      False, False, False, False, False, False, False, False,
      False, False, False, False, False, False, False, False,
      False, False, False, False, False, False, False, False,
      False, False, False, False, False, False, False, False,
      False, False, False, False, False, False, False, False,
      False, False, False, False, False, False, False, False,
      False, False, False, False, False, False, False, True
   );

   G_V_I : constant Grouping_Array (0 .. 159) := (
      True, False, False, False, False, False, False, False,
      False, False, False, False, False, False, False, False,
      False, False, False, False, False, False, False, False,
      True, False, False, False, True, False, False, False,
      True, False, False, False, False, False, True, False,
      False, False, False, False, True, False, False, False,
      True, False, False, False, False, False, False, False,
      False, False, False, False, False, False, False, False,
      False, False, False, False, False, False, False, False,
      False, False, False, False, False, False, False, False,
      False, False, False, False, False, False, False, False,
      False, False, False, False, False, False, False, False,
      False, False, False, False, False, False, False, False,
      False, False, False, False, False, False, False, False,
      False, False, False, False, False, False, False, False,
      False, False, False, False, False, False, False, False,
      False, False, False, False, False, False, False, False,
      False, False, False, False, False, False, False, False,
      False, False, False, False, False, False, False, False,
      False, False, False, False, False, False, False, True
   );

   G_V_j : constant Grouping_Array (0 .. 135) := (
      True, False, False, False, True, False, False, False,
      True, True, False, False, False, False, True, False,
      False, False, False, False, True, False, False, False,
      True, False, False, False, False, False, False, False,
      False, False, False, False, False, False, False, False,
      False, False, False, False, False, False, False, False,
      False, False, False, False, False, False, False, False,
      False, False, False, False, False, False, False, False,
      False, False, False, False, False, False, False, False,
      False, False, False, False, False, False, False, False,
      False, False, False, False, False, False, False, False,
      False, False, False, False, False, False, False, False,
      False, False, False, False, False, False, False, False,
      False, False, False, False, False, False, False, False,
      False, False, False, False, False, False, False, False,
      False, False, False, False, False, False, False, False,
      False, False, False, False, False, False, False, True
   );
   Among_String : constant String := "" & "á" & "ä" & "é" & "ë" & "í"
      & "ï" & "ó" & "ö" & "ú" & "ü" & "" & "I" & "Y" & "dd" & "kk" & "tt" & "ene"
      & "se" & "en" & "heden" & "s" & "end" & "ig" & "ing" & "lijk" & "baar" & "bar"
      & "aa" & "ee" & "oo" & "uu";

   A_0 : constant Among_Array_Type (0 .. 10) := (
      (1, 0, -1, 6, 0),
      (1, 2, 0, 1, 0),
      (3, 4, 0, 1, 0),
      (5, 6, 0, 2, 0),
      (7, 8, 0, 2, 0),
      (9, 10, 0, 3, 0),
      (11, 12, 0, 3, 0),
      (13, 14, 0, 4, 0),
      (15, 16, 0, 4, 0),
      (17, 18, 0, 5, 0),
      (19, 20, 0, 5, 0));

   A_1 : constant Among_Array_Type (0 .. 2) := (
      (21, 20, -1, 3, 0),
      (21, 21, 0, 2, 0),
      (22, 22, 0, 1, 0));

   A_2 : constant Among_Array_Type (0 .. 2) := (
      (23, 24, -1, -1, 0),
      (25, 26, -1, -1, 0),
      (27, 28, -1, -1, 0));

   A_3 : constant Among_Array_Type (0 .. 4) := (
      (29, 31, -1, 2, 0),
      (32, 33, -1, 3, 0),
      (34, 35, -1, 2, 0),
      (36, 40, 2, 1, 0),
      (41, 41, -1, 3, 0));

   A_4 : constant Among_Array_Type (0 .. 5) := (
      (42, 44, -1, 1, 0),
      (45, 46, -1, 2, 0),
      (47, 49, -1, 1, 0),
      (50, 53, -1, 3, 0),
      (54, 57, -1, 4, 0),
      (58, 60, -1, 5, 0));

   A_5 : constant Among_Array_Type (0 .. 3) := (
      (61, 62, -1, -1, 0),
      (63, 64, -1, -1, 0),
      (65, 66, -1, -1, 0),
      (67, 68, -1, -1, 0));


   procedure R_Prelude (Z : in out Context_Type; Result : out Boolean) is
      C : Result_Index;
      A : Integer;
      v_1 : Char_Index;
      v_2 : Char_Index;
      v_3 : Char_Index;
      v_4 : Char_Index;
      v_5 : Char_Index;
      v_6 : Char_Index;
   begin
      --  (, line 41
      --  test, line 42
      v_1 := Z.C;
      --  repeat, line 42

      <<lab0>>

      loop
         v_2 := Z.C;
         --  (, line 42
         Z.Bra := Z.C;         --  [, line 43

         --  substring, line 43
         if Z.C + 1 >= Z.L or else Check_Among (Z, Z.C + 1, 5, 16#1448aa12#) then
            A := 6;
         else            --  substring, line 43
            Find_Among (Z, A_0, Among_String, null, A);
            if A = 0 then
               goto lab1;
            end if;
         end if;
         Z.Ket := Z.C;         --  ], line 43

         --  among, line 43
         case A is
            when 1 =>
               --  (, line 45
               --  <-, line 45
               Slice_From (Z, "a");
            when 2 =>
               --  (, line 47
               --  <-, line 47
               Slice_From (Z, "e");
            when 3 =>
               --  (, line 49
               --  <-, line 49
               Slice_From (Z, "i");
            when 4 =>
               --  (, line 51
               --  <-, line 51
               Slice_From (Z, "o");
            when 5 =>
               --  (, line 53
               --  <-, line 53
               Slice_From (Z, "u");
            when 6 =>
               --  (, line 54
               --  next, line 54
               C := Skip_Utf8 (Z);
               if C < 0 then
                  goto lab1;
               end if;
               Z.C := C;
            when others =>
               null;
         end case;
         goto lab0;

         <<lab1>>
         Z.C := v_2;

         exit;
      end loop;
      Z.C := v_1;
      --  try, line 57
      v_3 := Z.C;
      --  (, line 57
      Z.Bra := Z.C;      --  [, line 57

      --  literal, line 57
      C := Eq_S (Z, "y");
      if C = 0 then
         Z.C := v_3;
         goto lab2;
      end if;
      Z.C := Z.C + C;
      Z.Ket := Z.C;      --  ], line 57

      --  <-, line 57
      Slice_From (Z, "Y");

      <<lab2>>
      --  repeat, line 58

      <<lab3>>

      loop
         v_4 := Z.C;
         --  goto, line 58
         loop
            v_5 := Z.C;
            --  (, line 58
            In_Grouping (Z, G_V, 97, 232, False, C);
            if C /= 0 then
               goto lab6;
            end if;
            Z.Bra := Z.C;            --  [, line 59

            --  or, line 59
            v_6 := Z.C;
            --  (, line 59
            --  literal, line 59
            C := Eq_S (Z, "i");
            if C = 0 then
               goto lab8;
            end if;
            Z.C := Z.C + C;
            Z.Ket := Z.C;            --  ], line 59

            In_Grouping (Z, G_V, 97, 232, False, C);
            if C /= 0 then
               goto lab8;
            end if;
            --  <-, line 59
            Slice_From (Z, "I");
            goto lab7;

            <<lab8>>
            Z.C := v_6;
            --  (, line 60
            --  literal, line 60
            C := Eq_S (Z, "y");
            if C = 0 then
               goto lab6;
            end if;
            Z.C := Z.C + C;
            Z.Ket := Z.C;            --  ], line 60

            --  <-, line 60
            Slice_From (Z, "Y");

            <<lab7>>
            Z.C := v_5;
            exit;

            <<lab6>>
            Z.C := v_5;
            if Z.C >= Z.L then
               goto lab4;
            end if;
            --  goto, line 58
            C := Skip_Utf8 (Z);
            if C < 0 then
               goto lab4;
            end if;
            Z.C := C;
         end loop;
         goto lab3;

         <<lab4>>
         Z.C := v_4;

         exit;
      end loop;

      Result := True;
   end R_Prelude;

   procedure R_Mark_regions (Z : in out Context_Type; Result : out Boolean) is
      C : Result_Index;
      A : Integer;
   begin
      --  (, line 64
      Z.I_P1 := Z.L;
      Z.I_P2 := Z.L;
            --  gopast, line 69
      --  grouping v, line 69
      Out_Grouping (Z, G_V, 97, 232, True, C);
      if C < 0 then
         Result := False;
         return;
      end if;
      Z.C := Z.C + C;
            --  gopast, line 69
      --  non v, line 69
      In_Grouping (Z, G_V, 97, 232, True, C);
      if C < 0 then
         Result := False;
         return;
      end if;
      Z.C := Z.C + C;
      --  setmark p1, line 69
      Z.I_P1 := Z.C;
      --  try, line 70
      --  (, line 70
      if not (Z.I_P1 < 3) then
         goto lab2;
      end if;
      Z.I_P1 := 3;

      <<lab2>>
            --  gopast, line 71
      --  grouping v, line 71
      Out_Grouping (Z, G_V, 97, 232, True, C);
      if C < 0 then
         Result := False;
         return;
      end if;
      Z.C := Z.C + C;
            --  gopast, line 71
      --  non v, line 71
      In_Grouping (Z, G_V, 97, 232, True, C);
      if C < 0 then
         Result := False;
         return;
      end if;
      Z.C := Z.C + C;
      --  setmark p2, line 71
      Z.I_P2 := Z.C;

      Result := True;
   end R_Mark_regions;

   procedure R_Postlude (Z : in out Context_Type; Result : out Boolean) is
      C : Result_Index;
      A : Integer;
      v_1 : Char_Index;
   begin
      --  repeat, line 75

      <<lab0>>

      loop
         v_1 := Z.C;
         --  (, line 75
         Z.Bra := Z.C;         --  [, line 77

         --  substring, line 77
         if Z.C >= Z.L or else (Character'Pos (Z.P (Z.C + 1)) /= 73 and then Character'Pos (Z.P (Z.C + 1)) /= 89) then
            A := 3;
         else            --  substring, line 77
            Find_Among (Z, A_1, Among_String, null, A);
            if A = 0 then
               goto lab1;
            end if;
         end if;
         Z.Ket := Z.C;         --  ], line 77

         --  among, line 77
         case A is
            when 1 =>
               --  (, line 78
               --  <-, line 78
               Slice_From (Z, "y");
            when 2 =>
               --  (, line 79
               --  <-, line 79
               Slice_From (Z, "i");
            when 3 =>
               --  (, line 80
               --  next, line 80
               C := Skip_Utf8 (Z);
               if C < 0 then
                  goto lab1;
               end if;
               Z.C := C;
            when others =>
               null;
         end case;
         goto lab0;

         <<lab1>>
         Z.C := v_1;

         exit;
      end loop;

      Result := True;
   end R_Postlude;

   procedure R_R1 (Z : in out Context_Type; Result : out Boolean) is
   begin
      Result := (Z.I_P1 <= Z.C);
   end R_R1;

   procedure R_R2 (Z : in out Context_Type; Result : out Boolean) is
   begin
      Result := (Z.I_P2 <= Z.C);
   end R_R2;

   procedure R_Undouble (Z : in out Context_Type; Result : out Boolean) is
      C : Result_Index;
      A : Integer;
      v_1 : Char_Index;
   begin
      --  (, line 90
      --  test, line 91
      v_1 := Z.L - Z.C;
      --  among, line 91
      if Z.C - 1 <= Z.Lb or else Check_Among (Z, Z.C - 1, 3, 16#100810#) then
         Result := False;
         return;
         --  among, line 91
      end if;
      Find_Among_Backward (Z, A_2, Among_String, null, A);
      if A = 0 then
         Result := False;
         return;
      end if;
      Z.C := Z.L - v_1;
      Z.Ket := Z.C;      --  [, line 91

      --  next, line 91
      C := Skip_Utf8_Backward (Z);
      if C < 0 then
         Result := False;
         return;
      end if;
      Z.C := C;
      Z.Bra := Z.C;      --  ], line 91

      --  delete, line 91
      Slice_Del (Z);

      Result := True;
   end R_Undouble;

   procedure R_E_ending (Z : in out Context_Type; Result : out Boolean) is
      C : Result_Index;
      A : Integer;
      v_1 : Char_Index;
   begin
      --  (, line 94
      --  unset e_found, line 95
      Z.B_E_found := False;
      Z.Ket := Z.C;      --  [, line 96

      --  literal, line 96
      C := Eq_S_Backward (Z, "e");
      if C = 0 then
         Result := False;
         return;
      end if;
      Z.C := Z.C - C;
      Z.Bra := Z.C;      --  ], line 96

      --  call R1, line 96
      R_R1 (Z, Result);
      if not Result then
         Result := False;
         return;
      end if;
      --  test, line 96
      v_1 := Z.L - Z.C;
      Out_Grouping_Backward (Z, G_V, 97, 232, False, C);
      if C /= 0 then
         Result := False;
         return;
      end if;
      Z.C := Z.L - v_1;
      --  delete, line 96
      Slice_Del (Z);
      --  set e_found, line 97
      Z.B_E_found := True;
      --  call undouble, line 98
      R_Undouble (Z, Result);
      if not Result then
         Result := False;
         return;
      end if;

      Result := True;
   end R_E_ending;

   procedure R_En_ending (Z : in out Context_Type; Result : out Boolean) is
      C : Result_Index;
      A : Integer;
      v_1 : Char_Index;
      v_2 : Char_Index;
   begin
      --  (, line 101
      --  call R1, line 102
      R_R1 (Z, Result);
      if not Result then
         Result := False;
         return;
      end if;
      --  and, line 102
      v_1 := Z.L - Z.C;
      Out_Grouping_Backward (Z, G_V, 97, 232, False, C);
      if C /= 0 then
         Result := False;
         return;
      end if;
      Z.C := Z.L - v_1;
      --  not, line 102
      v_2 := Z.L - Z.C;
      --  literal, line 102
      C := Eq_S_Backward (Z, "gem");
      if C = 0 then
         goto lab0;
      end if;
      Z.C := Z.C - C;
      Result := False;
      return;

      <<lab0>>
      Z.C := Z.L - v_2;
      --  delete, line 102
      Slice_Del (Z);
      --  call undouble, line 103
      R_Undouble (Z, Result);
      if not Result then
         Result := False;
         return;
      end if;

      Result := True;
   end R_En_ending;

   procedure R_Standard_suffix (Z : in out Context_Type; Result : out Boolean) is
      C : Result_Index;
      A : Integer;
      v_1 : Char_Index;
      v_2 : Char_Index;
      v_3 : Char_Index;
      v_4 : Char_Index;
      v_5 : Char_Index;
      v_6 : Char_Index;
      v_7 : Char_Index;
      v_8 : Char_Index;
      v_9 : Char_Index;
      v_10 : Char_Index;
   begin
      --  (, line 106
      --  do, line 107
      v_1 := Z.L - Z.C;
      --  (, line 107
      Z.Ket := Z.C;      --  [, line 108

      --  substring, line 108
      if Z.C <= Z.Lb or else Check_Among (Z, Z.C - 1, 3, 16#84020#) then
         goto lab0;
         --  substring, line 108
      end if;
      Find_Among_Backward (Z, A_3, Among_String, null, A);
      if A = 0 then
         goto lab0;
      end if;
      Z.Bra := Z.C;      --  ], line 108

      --  among, line 108
      case A is
         when 1 =>
            --  (, line 110
            --  call R1, line 110
            R_R1 (Z, Result);
            if not Result then
               goto lab0;
            end if;
            --  <-, line 110
            Slice_From (Z, "heid");
         when 2 =>
            --  (, line 113
            --  call en_ending, line 113
            R_En_ending (Z, Result);
            if not Result then
               goto lab0;
            end if;
         when 3 =>
            --  (, line 116
            --  call R1, line 116
            R_R1 (Z, Result);
            if not Result then
               goto lab0;
            end if;
            Out_Grouping_Backward (Z, G_V_j, 97, 232, False, C);
            if C /= 0 then
               goto lab0;
            end if;
            --  delete, line 116
            Slice_Del (Z);
         when others =>
            null;
      end case;

      <<lab0>>
      Z.C := Z.L - v_1;
      --  do, line 120
      v_2 := Z.L - Z.C;
      --  call e_ending, line 120
      R_E_ending (Z, Result);
      Z.C := Z.L - v_2;
      --  do, line 122
      v_3 := Z.L - Z.C;
      --  (, line 122
      Z.Ket := Z.C;      --  [, line 122

      --  literal, line 122
      C := Eq_S_Backward (Z, "heid");
      if C = 0 then
         goto lab1;
      end if;
      Z.C := Z.C - C;
      Z.Bra := Z.C;      --  ], line 122

      --  call R2, line 122
      R_R2 (Z, Result);
      if not Result then
         goto lab1;
      end if;
      --  not, line 122
      v_4 := Z.L - Z.C;
      --  literal, line 122
      C := Eq_S_Backward (Z, "c");
      if C = 0 then
         goto lab2;
      end if;
      Z.C := Z.C - C;
      goto lab1;

      <<lab2>>
      Z.C := Z.L - v_4;
      --  delete, line 122
      Slice_Del (Z);
      Z.Ket := Z.C;      --  [, line 123

      --  literal, line 123
      C := Eq_S_Backward (Z, "en");
      if C = 0 then
         goto lab1;
      end if;
      Z.C := Z.C - C;
      Z.Bra := Z.C;      --  ], line 123

      --  call en_ending, line 123
      R_En_ending (Z, Result);
      if not Result then
         goto lab1;
      end if;

      <<lab1>>
      Z.C := Z.L - v_3;
      --  do, line 126
      v_5 := Z.L - Z.C;
      --  (, line 126
      Z.Ket := Z.C;      --  [, line 127

      --  substring, line 127
      if Z.C - 1 <= Z.Lb or else Check_Among (Z, Z.C - 1, 3, 16#40890#) then
         goto lab3;
         --  substring, line 127
      end if;
      Find_Among_Backward (Z, A_4, Among_String, null, A);
      if A = 0 then
         goto lab3;
      end if;
      Z.Bra := Z.C;      --  ], line 127

      --  among, line 127
      case A is
         when 1 =>
            --  (, line 129
            --  call R2, line 129
            R_R2 (Z, Result);
            if not Result then
               goto lab3;
            end if;
            --  delete, line 129
            Slice_Del (Z);
            --  or, line 130
            v_6 := Z.L - Z.C;
            --  (, line 130
            Z.Ket := Z.C;            --  [, line 130

            --  literal, line 130
            C := Eq_S_Backward (Z, "ig");
            if C = 0 then
               goto lab5;
            end if;
            Z.C := Z.C - C;
            Z.Bra := Z.C;            --  ], line 130

            --  call R2, line 130
            R_R2 (Z, Result);
            if not Result then
               goto lab5;
            end if;
            --  not, line 130
            v_7 := Z.L - Z.C;
            --  literal, line 130
            C := Eq_S_Backward (Z, "e");
            if C = 0 then
               goto lab6;
            end if;
            Z.C := Z.C - C;
            goto lab5;

            <<lab6>>
            Z.C := Z.L - v_7;
            --  delete, line 130
            Slice_Del (Z);
            goto lab4;

            <<lab5>>
            Z.C := Z.L - v_6;
            --  call undouble, line 130
            R_Undouble (Z, Result);
            if not Result then
               goto lab3;
            end if;

            <<lab4>>
         when 2 =>
            --  (, line 133
            --  call R2, line 133
            R_R2 (Z, Result);
            if not Result then
               goto lab3;
            end if;
            --  not, line 133
            v_8 := Z.L - Z.C;
            --  literal, line 133
            C := Eq_S_Backward (Z, "e");
            if C = 0 then
               goto lab7;
            end if;
            Z.C := Z.C - C;
            goto lab3;

            <<lab7>>
            Z.C := Z.L - v_8;
            --  delete, line 133
            Slice_Del (Z);
         when 3 =>
            --  (, line 136
            --  call R2, line 136
            R_R2 (Z, Result);
            if not Result then
               goto lab3;
            end if;
            --  delete, line 136
            Slice_Del (Z);
            --  call e_ending, line 136
            R_E_ending (Z, Result);
            if not Result then
               goto lab3;
            end if;
         when 4 =>
            --  (, line 139
            --  call R2, line 139
            R_R2 (Z, Result);
            if not Result then
               goto lab3;
            end if;
            --  delete, line 139
            Slice_Del (Z);
         when 5 =>
            --  (, line 142
            --  call R2, line 142
            R_R2 (Z, Result);
            if not Result then
               goto lab3;
            end if;
            --  Boolean test e_found, line 142
            if not Z.B_E_found then
               goto lab3;
            end if;
            --  delete, line 142
            Slice_Del (Z);
         when others =>
            null;
      end case;

      <<lab3>>
      Z.C := Z.L - v_5;
      --  do, line 146
      v_9 := Z.L - Z.C;
      --  (, line 146
      Out_Grouping_Backward (Z, G_V_I, 73, 232, False, C);
      if C /= 0 then
         goto lab8;
      end if;
      --  test, line 148
      v_10 := Z.L - Z.C;
      --  (, line 148
      --  among, line 149
      if Z.C - 1 <= Z.Lb or else Check_Among (Z, Z.C - 1, 3, 16#208022#) then
         goto lab8;
         --  among, line 149
      end if;
      Find_Among_Backward (Z, A_5, Among_String, null, A);
      if A = 0 then
         goto lab8;
      end if;
      Out_Grouping_Backward (Z, G_V, 97, 232, False, C);
      if C /= 0 then
         goto lab8;
      end if;
      Z.C := Z.L - v_10;
      Z.Ket := Z.C;      --  [, line 152

      --  next, line 152
      C := Skip_Utf8_Backward (Z);
      if C < 0 then
         goto lab8;
      end if;
      Z.C := C;
      Z.Bra := Z.C;      --  ], line 152

      --  delete, line 152
      Slice_Del (Z);

      <<lab8>>
      Z.C := Z.L - v_9;

      Result := True;
   end R_Standard_suffix;

   procedure Stem (Z : in out Context_Type; Result : out Boolean) is
      C : Result_Index;
      A : Integer;
      v_1 : Char_Index;
      v_2 : Char_Index;
      v_4 : Char_Index;
   begin
      --  (, line 157
      --  do, line 159
      v_1 := Z.C;
      --  call prelude, line 159
      R_Prelude (Z, Result);
      Z.C := v_1;
      --  do, line 160
      v_2 := Z.C;
      --  call mark_regions, line 160
      R_Mark_regions (Z, Result);
      Z.C := v_2;
      Z.Lb := Z.C; Z.C := Z.L;      --  backwards, line 161

      --  do, line 162
      --  call standard_suffix, line 162
      R_Standard_suffix (Z, Result);
      Z.C := Z.Lb;
      --  do, line 163
      v_4 := Z.C;
      --  call postlude, line 163
      R_Postlude (Z, Result);
      Z.C := v_4;

      Result := True;
   end Stem;
end Stemmer.Dutch;
