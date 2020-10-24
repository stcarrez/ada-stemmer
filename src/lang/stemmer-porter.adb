--  Generated by Snowball 2.0.0 - https://snowballstem.org/

package body Stemmer.Porter is

   pragma Style_Checks ("-mr");
   pragma Warnings (Off, "*variable*is never read and never assigned*");
   pragma Warnings (Off, "*mode could be*instead of*");
   pragma Warnings (Off, "*formal parameter.*is not modified*");
   pragma Warnings (Off, "*this line is too long*");
   pragma Warnings (Off, "*is not referenced*");

   procedure R_Step_5b (Z : in out Context_Type; Result : out Boolean);
   procedure R_Step_5a (Z : in out Context_Type; Result : out Boolean);
   procedure R_Step_4 (Z : in out Context_Type; Result : out Boolean);
   procedure R_Step_3 (Z : in out Context_Type; Result : out Boolean);
   procedure R_Step_2 (Z : in out Context_Type; Result : out Boolean);
   procedure R_Step_1c (Z : in out Context_Type; Result : out Boolean);
   procedure R_Step_1b (Z : in out Context_Type; Result : out Boolean);
   procedure R_Step_1a (Z : in out Context_Type; Result : out Boolean);
   procedure R_R2 (Z : in out Context_Type; Result : out Boolean);
   procedure R_R1 (Z : in out Context_Type; Result : out Boolean);
   procedure R_Shortv (Z : in out Context_Type; Result : out Boolean);

   G_V : constant Grouping_Array (0 .. 31) := (
      True, False, False, False, True, False, False, False,
      True, False, False, False, False, False, True, False,
      False, False, False, False, True, False, False, False,
      True, False, False, False, False, False, False, False
   );

   G_V_WXY : constant Grouping_Array (0 .. 39) := (
      True, False, False, False, False, False, False, False,
      True, False, False, False, True, False, False, False,
      True, False, False, False, False, False, True, False,
      False, False, False, False, True, False, True, True,
      True, False, False, False, False, False, False, False
   );
   Among_String : constant String := "s" & "ies" & "sses" & "ss" & "" & "bb" & "dd" & "ff" & "gg" & "bl" & "mm" & "nn"
      & "pp" & "rr" & "at" & "tt" & "iz" & "ed" & "eed" & "ing" & "anci" & "enci"
      & "abli" & "eli" & "alli" & "ousli" & "entli" & "aliti" & "biliti" & "iviti"
      & "tional" & "ational" & "alism" & "ation" & "ization" & "izer" & "ator"
      & "iveness" & "fulness" & "ousness" & "icate" & "ative" & "alize" & "iciti"
      & "ical" & "ful" & "ness" & "ic" & "ance" & "ence" & "able" & "ible" & "ate"
      & "ive" & "ize" & "iti" & "al" & "ism" & "ion" & "er" & "ous" & "ant" & "ent"
      & "ment" & "ement" & "ou";

   A_0 : constant Among_Array_Type (0 .. 3) := (
      (1, 1, -1, 3, 0),
      (2, 4, 0, 2, 0),
      (5, 8, 0, 1, 0),
      (9, 10, 0, -1, 0));

   A_1 : constant Among_Array_Type (0 .. 12) := (
      (11, 10, -1, 3, 0),
      (11, 12, 0, 2, 0),
      (13, 14, 0, 2, 0),
      (15, 16, 0, 2, 0),
      (17, 18, 0, 2, 0),
      (19, 20, 0, 1, 0),
      (21, 22, 0, 2, 0),
      (23, 24, 0, 2, 0),
      (25, 26, 0, 2, 0),
      (27, 28, 0, 2, 0),
      (29, 30, 0, 1, 0),
      (31, 32, 0, 2, 0),
      (33, 34, 0, 1, 0));

   A_2 : constant Among_Array_Type (0 .. 2) := (
      (35, 36, -1, 2, 0),
      (37, 39, 0, 1, 0),
      (40, 42, -1, 2, 0));

   A_3 : constant Among_Array_Type (0 .. 19) := (
      (43, 46, -1, 3, 0),
      (47, 50, -1, 2, 0),
      (51, 54, -1, 4, 0),
      (55, 57, -1, 6, 0),
      (58, 61, -1, 9, 0),
      (62, 66, -1, 11, 0),
      (67, 71, -1, 5, 0),
      (72, 76, -1, 9, 0),
      (77, 82, -1, 13, 0),
      (83, 87, -1, 12, 0),
      (88, 93, -1, 1, 0),
      (94, 100, 10, 8, 0),
      (101, 105, -1, 9, 0),
      (106, 110, -1, 8, 0),
      (111, 117, 13, 7, 0),
      (118, 121, -1, 7, 0),
      (122, 125, -1, 8, 0),
      (126, 132, -1, 12, 0),
      (133, 139, -1, 10, 0),
      (140, 146, -1, 11, 0));

   A_4 : constant Among_Array_Type (0 .. 6) := (
      (147, 151, -1, 2, 0),
      (152, 156, -1, 3, 0),
      (157, 161, -1, 1, 0),
      (162, 166, -1, 2, 0),
      (167, 170, -1, 2, 0),
      (171, 173, -1, 3, 0),
      (174, 177, -1, 3, 0));

   A_5 : constant Among_Array_Type (0 .. 18) := (
      (178, 179, -1, 1, 0),
      (180, 183, -1, 1, 0),
      (184, 187, -1, 1, 0),
      (188, 191, -1, 1, 0),
      (192, 195, -1, 1, 0),
      (196, 198, -1, 1, 0),
      (199, 201, -1, 1, 0),
      (202, 204, -1, 1, 0),
      (205, 207, -1, 1, 0),
      (208, 209, -1, 1, 0),
      (210, 212, -1, 1, 0),
      (213, 215, -1, 2, 0),
      (216, 217, -1, 1, 0),
      (218, 220, -1, 1, 0),
      (221, 223, -1, 1, 0),
      (224, 226, -1, 1, 0),
      (227, 230, 15, 1, 0),
      (231, 235, 16, 1, 0),
      (236, 237, -1, 1, 0));


   procedure R_Shortv (Z : in out Context_Type; Result : out Boolean) is
      C : Result_Index;
      A : Integer;
   begin
      --  (, line 19
      Out_Grouping_Backward (Z, G_V_WXY, 89, 121, False, C);
      if C /= 0 then
         Result := False;
         return;
      end if;
      In_Grouping_Backward (Z, G_V, 97, 121, False, C);
      if C /= 0 then
         Result := False;
         return;
      end if;
      Out_Grouping_Backward (Z, G_V, 97, 121, False, C);
      if C /= 0 then
         Result := False;
         return;
      end if;

      Result := True;
   end R_Shortv;

   procedure R_R1 (Z : in out Context_Type; Result : out Boolean) is
   begin
      Result := (Z.I_P1 <= Z.C);
   end R_R1;

   procedure R_R2 (Z : in out Context_Type; Result : out Boolean) is
   begin
      Result := (Z.I_P2 <= Z.C);
   end R_R2;

   procedure R_Step_1a (Z : in out Context_Type; Result : out Boolean) is
      C : Result_Index;
      A : Integer;
   begin
      --  (, line 24
      Z.Ket := Z.C;      --  [, line 25

      --  substring, line 25
      if Z.C <= Z.Lb or else Character'Pos (Z.P (Z.C)) /= 115 then
         Result := False;
         return;
         --  substring, line 25
      end if;
      Find_Among_Backward (Z, A_0, Among_String, null, A);
      if A = 0 then
         Result := False;
         return;
      end if;
      Z.Bra := Z.C;      --  ], line 25

      --  among, line 25
      case A is
         when 1 =>
            --  (, line 26
            --  <-, line 26
            Slice_From (Z, "ss");
         when 2 =>
            --  (, line 27
            --  <-, line 27
            Slice_From (Z, "i");
         when 3 =>
            --  (, line 29
            --  delete, line 29
            Slice_Del (Z);
         when others =>
            null;
      end case;

      Result := True;
   end R_Step_1a;

   procedure R_Step_1b (Z : in out Context_Type; Result : out Boolean) is
      C : Result_Index;
      A : Integer;
      v_1 : Char_Index;
      v_2 : Char_Index;
      v_3 : Char_Index;
   begin
      --  (, line 33
      Z.Ket := Z.C;      --  [, line 34

      --  substring, line 34
      if Z.C - 1 <= Z.Lb or else (Character'Pos (Z.P (Z.C)) /= 100 and then Character'Pos (Z.P (Z.C)) /= 103) then
         Result := False;
         return;
         --  substring, line 34
      end if;
      Find_Among_Backward (Z, A_2, Among_String, null, A);
      if A = 0 then
         Result := False;
         return;
      end if;
      Z.Bra := Z.C;      --  ], line 34

      --  among, line 34
      case A is
         when 1 =>
            --  (, line 35
            --  call R1, line 35
            R_R1 (Z, Result);
            if not Result then
               Result := False;
               return;
            end if;
            --  <-, line 35
            Slice_From (Z, "ee");
         when 2 =>
            --  (, line 37
            --  test, line 38
            v_1 := Z.L - Z.C;
                        --  gopast, line 38
            --  grouping v, line 38
            Out_Grouping_Backward (Z, G_V, 97, 121, True, C);
            if C < 0 then
               Result := False;
               return;
            end if;
            Z.C := Z.C - C;
            Z.C := Z.L - v_1;
            --  delete, line 38
            Slice_Del (Z);
            --  test, line 39
            v_2 := Z.L - Z.C;
            --  substring, line 39
            if Z.C - 1 <= Z.Lb or else Check_Among (Z, Z.C - 1, 3, 16#41570d4#) then
               A := 3;
            else               --  substring, line 39
               Find_Among_Backward (Z, A_1, Among_String, null, A);
               if A = 0 then
                  Result := False;
                  return;
               end if;
            end if;
            Z.C := Z.L - v_2;
            --  among, line 39
            case A is
               when 1 =>
                  --  (, line 41
                  --  <+, line 41
                  C := Z.C;
                  Insert (Z, Z.C, Z.C, "e");
                  Z.C := C;
               when 2 =>
                  --  (, line 44
                  Z.Ket := Z.C;                  --  [, line 44

                  --  next, line 44
                  C := Skip_Utf8_Backward (Z);
                  if C < 0 then
                     Result := False;
                     return;
                  end if;
                  Z.C := C;
                  Z.Bra := Z.C;                  --  ], line 44

                  --  delete, line 44
                  Slice_Del (Z);
               when 3 =>
                  --  (, line 45
                  --  atmark, line 45
                  if Z.C /= Z.I_P1 then
                     Result := False;
                     return;
                  end if;
                  --  test, line 45
                  v_3 := Z.L - Z.C;
                  --  call shortv, line 45
                  R_Shortv (Z, Result);
                  if not Result then
                     Result := False;
                     return;
                  end if;
                  Z.C := Z.L - v_3;
                  --  <+, line 45
                  C := Z.C;
                  Insert (Z, Z.C, Z.C, "e");
                  Z.C := C;
               when others =>
                  null;
            end case;
         when others =>
            null;
      end case;

      Result := True;
   end R_Step_1b;

   procedure R_Step_1c (Z : in out Context_Type; Result : out Boolean) is
      C : Result_Index;
      A : Integer;
      v_1 : Char_Index;
   begin
      --  (, line 51
      Z.Ket := Z.C;      --  [, line 52

      --  or, line 52
      v_1 := Z.L - Z.C;
      --  literal, line 52
      C := Eq_S_Backward (Z, "y");
      if C = 0 then
         goto lab1;
      end if;
      Z.C := Z.C - C;
      goto lab0;

      <<lab1>>
      Z.C := Z.L - v_1;
      --  literal, line 52
      C := Eq_S_Backward (Z, "Y");
      if C = 0 then
         Result := False;
         return;
      end if;
      Z.C := Z.C - C;

      <<lab0>>
      Z.Bra := Z.C;      --  ], line 52

            --  gopast, line 53
      --  grouping v, line 53
      Out_Grouping_Backward (Z, G_V, 97, 121, True, C);
      if C < 0 then
         Result := False;
         return;
      end if;
      Z.C := Z.C - C;
      --  <-, line 54
      Slice_From (Z, "i");

      Result := True;
   end R_Step_1c;

   procedure R_Step_2 (Z : in out Context_Type; Result : out Boolean) is
      C : Result_Index;
      A : Integer;
   begin
      --  (, line 57
      Z.Ket := Z.C;      --  [, line 58

      --  substring, line 58
      if Z.C - 2 <= Z.Lb or else Check_Among (Z, Z.C - 1, 3, 16#c7200#) then
         Result := False;
         return;
         --  substring, line 58
      end if;
      Find_Among_Backward (Z, A_3, Among_String, null, A);
      if A = 0 then
         Result := False;
         return;
      end if;
      Z.Bra := Z.C;      --  ], line 58

      --  call R1, line 58
      R_R1 (Z, Result);
      if not Result then
         Result := False;
         return;
      end if;
      --  among, line 58
      case A is
         when 1 =>
            --  (, line 59
            --  <-, line 59
            Slice_From (Z, "tion");
         when 2 =>
            --  (, line 60
            --  <-, line 60
            Slice_From (Z, "ence");
         when 3 =>
            --  (, line 61
            --  <-, line 61
            Slice_From (Z, "ance");
         when 4 =>
            --  (, line 62
            --  <-, line 62
            Slice_From (Z, "able");
         when 5 =>
            --  (, line 63
            --  <-, line 63
            Slice_From (Z, "ent");
         when 6 =>
            --  (, line 64
            --  <-, line 64
            Slice_From (Z, "e");
         when 7 =>
            --  (, line 66
            --  <-, line 66
            Slice_From (Z, "ize");
         when 8 =>
            --  (, line 68
            --  <-, line 68
            Slice_From (Z, "ate");
         when 9 =>
            --  (, line 69
            --  <-, line 69
            Slice_From (Z, "al");
         when 10 =>
            --  (, line 72
            --  <-, line 72
            Slice_From (Z, "ful");
         when 11 =>
            --  (, line 74
            --  <-, line 74
            Slice_From (Z, "ous");
         when 12 =>
            --  (, line 76
            --  <-, line 76
            Slice_From (Z, "ive");
         when 13 =>
            --  (, line 77
            --  <-, line 77
            Slice_From (Z, "ble");
         when others =>
            null;
      end case;

      Result := True;
   end R_Step_2;

   procedure R_Step_3 (Z : in out Context_Type; Result : out Boolean) is
      C : Result_Index;
      A : Integer;
   begin
      --  (, line 81
      Z.Ket := Z.C;      --  [, line 82

      --  substring, line 82
      if Z.C - 2 <= Z.Lb or else Check_Among (Z, Z.C - 1, 3, 16#81220#) then
         Result := False;
         return;
         --  substring, line 82
      end if;
      Find_Among_Backward (Z, A_4, Among_String, null, A);
      if A = 0 then
         Result := False;
         return;
      end if;
      Z.Bra := Z.C;      --  ], line 82

      --  call R1, line 82
      R_R1 (Z, Result);
      if not Result then
         Result := False;
         return;
      end if;
      --  among, line 82
      case A is
         when 1 =>
            --  (, line 83
            --  <-, line 83
            Slice_From (Z, "al");
         when 2 =>
            --  (, line 85
            --  <-, line 85
            Slice_From (Z, "ic");
         when 3 =>
            --  (, line 87
            --  delete, line 87
            Slice_Del (Z);
         when others =>
            null;
      end case;

      Result := True;
   end R_Step_3;

   procedure R_Step_4 (Z : in out Context_Type; Result : out Boolean) is
      C : Result_Index;
      A : Integer;
      v_1 : Char_Index;
   begin
      --  (, line 91
      Z.Ket := Z.C;      --  [, line 92

      --  substring, line 92
      if Z.C - 1 <= Z.Lb or else Check_Among (Z, Z.C - 1, 3, 16#3c7228#) then
         Result := False;
         return;
         --  substring, line 92
      end if;
      Find_Among_Backward (Z, A_5, Among_String, null, A);
      if A = 0 then
         Result := False;
         return;
      end if;
      Z.Bra := Z.C;      --  ], line 92

      --  call R2, line 92
      R_R2 (Z, Result);
      if not Result then
         Result := False;
         return;
      end if;
      --  among, line 92
      case A is
         when 1 =>
            --  (, line 95
            --  delete, line 95
            Slice_Del (Z);
         when 2 =>
            --  (, line 96
            --  or, line 96
            v_1 := Z.L - Z.C;
            --  literal, line 96
            C := Eq_S_Backward (Z, "s");
            if C = 0 then
               goto lab1;
            end if;
            Z.C := Z.C - C;
            goto lab0;

            <<lab1>>
            Z.C := Z.L - v_1;
            --  literal, line 96
            C := Eq_S_Backward (Z, "t");
            if C = 0 then
               Result := False;
               return;
            end if;
            Z.C := Z.C - C;

            <<lab0>>
            --  delete, line 96
            Slice_Del (Z);
         when others =>
            null;
      end case;

      Result := True;
   end R_Step_4;

   procedure R_Step_5a (Z : in out Context_Type; Result : out Boolean) is
      C : Result_Index;
      A : Integer;
      v_1 : Char_Index;
      v_2 : Char_Index;
   begin
      --  (, line 100
      Z.Ket := Z.C;      --  [, line 101

      --  literal, line 101
      C := Eq_S_Backward (Z, "e");
      if C = 0 then
         Result := False;
         return;
      end if;
      Z.C := Z.C - C;
      Z.Bra := Z.C;      --  ], line 101

      --  or, line 102
      v_1 := Z.L - Z.C;
      --  call R2, line 102
      R_R2 (Z, Result);
      if not Result then
         goto lab1;
      end if;
      goto lab0;

      <<lab1>>
      Z.C := Z.L - v_1;
      --  (, line 102
      --  call R1, line 102
      R_R1 (Z, Result);
      if not Result then
         Result := False;
         return;
      end if;
      --  not, line 102
      v_2 := Z.L - Z.C;
      --  call shortv, line 102
      R_Shortv (Z, Result);
      if not Result then
         goto lab2;
      end if;
      Result := False;
      return;

      <<lab2>>
      Z.C := Z.L - v_2;

      <<lab0>>
      --  delete, line 103
      Slice_Del (Z);

      Result := True;
   end R_Step_5a;

   procedure R_Step_5b (Z : in out Context_Type; Result : out Boolean) is
      C : Result_Index;
      A : Integer;
   begin
      --  (, line 106
      Z.Ket := Z.C;      --  [, line 107

      --  literal, line 107
      C := Eq_S_Backward (Z, "l");
      if C = 0 then
         Result := False;
         return;
      end if;
      Z.C := Z.C - C;
      Z.Bra := Z.C;      --  ], line 107

      --  call R2, line 108
      R_R2 (Z, Result);
      if not Result then
         Result := False;
         return;
      end if;
      --  literal, line 108
      C := Eq_S_Backward (Z, "l");
      if C = 0 then
         Result := False;
         return;
      end if;
      Z.C := Z.C - C;
      --  delete, line 109
      Slice_Del (Z);

      Result := True;
   end R_Step_5b;

   procedure Stem (Z : in out Context_Type; Result : out Boolean) is
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
      v_11 : Char_Index;
      v_12 : Char_Index;
      v_13 : Char_Index;
      v_14 : Char_Index;
      v_15 : Char_Index;
      v_16 : Char_Index;
   begin
      --  (, line 113
      --  unset Y_found, line 115
      Z.B_Y_found := False;
      --  do, line 116
      v_1 := Z.C;
      --  (, line 116
      Z.Bra := Z.C;      --  [, line 116

      --  literal, line 116
      C := Eq_S (Z, "y");
      if C = 0 then
         goto lab0;
      end if;
      Z.C := Z.C + C;
      Z.Ket := Z.C;      --  ], line 116

      --  <-, line 116
      Slice_From (Z, "Y");
      --  set Y_found, line 116
      Z.B_Y_found := True;

      <<lab0>>
      Z.C := v_1;
      --  do, line 117
      v_2 := Z.C;
      --  repeat, line 117

      <<lab2>>

      loop
         v_3 := Z.C;
         --  (, line 117
         --  goto, line 117
         loop
            v_4 := Z.C;
            --  (, line 117
            In_Grouping (Z, G_V, 97, 121, False, C);
            if C /= 0 then
               goto lab5;
            end if;
            Z.Bra := Z.C;            --  [, line 117

            --  literal, line 117
            C := Eq_S (Z, "y");
            if C = 0 then
               goto lab5;
            end if;
            Z.C := Z.C + C;
            Z.Ket := Z.C;            --  ], line 117

            Z.C := v_4;
            exit;

            <<lab5>>
            Z.C := v_4;
            if Z.C >= Z.L then
               goto lab3;
            end if;
            --  goto, line 117
            C := Skip_Utf8 (Z);
            if C < 0 then
               goto lab3;
            end if;
            Z.C := C;
         end loop;
         --  <-, line 117
         Slice_From (Z, "Y");
         --  set Y_found, line 117
         Z.B_Y_found := True;
         goto lab2;

         <<lab3>>
         Z.C := v_3;

         exit;
      end loop;

      <<lab1>>
      Z.C := v_2;
      Z.I_P1 := Z.L;
      Z.I_P2 := Z.L;
      --  do, line 121
      v_5 := Z.C;
      --  (, line 121
            --  gopast, line 122
      --  grouping v, line 122
      Out_Grouping (Z, G_V, 97, 121, True, C);
      if C < 0 then
         goto lab6;
      end if;
      Z.C := Z.C + C;
            --  gopast, line 122
      --  non v, line 122
      In_Grouping (Z, G_V, 97, 121, True, C);
      if C < 0 then
         goto lab6;
      end if;
      Z.C := Z.C + C;
      --  setmark p1, line 122
      Z.I_P1 := Z.C;
            --  gopast, line 123
      --  grouping v, line 123
      Out_Grouping (Z, G_V, 97, 121, True, C);
      if C < 0 then
         goto lab6;
      end if;
      Z.C := Z.C + C;
            --  gopast, line 123
      --  non v, line 123
      In_Grouping (Z, G_V, 97, 121, True, C);
      if C < 0 then
         goto lab6;
      end if;
      Z.C := Z.C + C;
      --  setmark p2, line 123
      Z.I_P2 := Z.C;

      <<lab6>>
      Z.C := v_5;
      Z.Lb := Z.C; Z.C := Z.L;      --  backwards, line 126

      --  (, line 126
      --  do, line 127
      v_6 := Z.L - Z.C;
      --  call Step_1a, line 127
      R_Step_1a (Z, Result);
      Z.C := Z.L - v_6;
      --  do, line 128
      v_7 := Z.L - Z.C;
      --  call Step_1b, line 128
      R_Step_1b (Z, Result);
      Z.C := Z.L - v_7;
      --  do, line 129
      v_8 := Z.L - Z.C;
      --  call Step_1c, line 129
      R_Step_1c (Z, Result);
      Z.C := Z.L - v_8;
      --  do, line 130
      v_9 := Z.L - Z.C;
      --  call Step_2, line 130
      R_Step_2 (Z, Result);
      Z.C := Z.L - v_9;
      --  do, line 131
      v_10 := Z.L - Z.C;
      --  call Step_3, line 131
      R_Step_3 (Z, Result);
      Z.C := Z.L - v_10;
      --  do, line 132
      v_11 := Z.L - Z.C;
      --  call Step_4, line 132
      R_Step_4 (Z, Result);
      Z.C := Z.L - v_11;
      --  do, line 133
      v_12 := Z.L - Z.C;
      --  call Step_5a, line 133
      R_Step_5a (Z, Result);
      Z.C := Z.L - v_12;
      --  do, line 134
      v_13 := Z.L - Z.C;
      --  call Step_5b, line 134
      R_Step_5b (Z, Result);
      Z.C := Z.L - v_13;
      Z.C := Z.Lb;
      --  do, line 137
      v_14 := Z.C;
      --  (, line 137
      --  Boolean test Y_found, line 137
      if not Z.B_Y_found then
         goto lab11;
      end if;
      --  repeat, line 137

      <<lab12>>

      loop
         v_15 := Z.C;
         --  (, line 137
         --  goto, line 137
         loop
            v_16 := Z.C;
            --  (, line 137
            Z.Bra := Z.C;            --  [, line 137

            --  literal, line 137
            C := Eq_S (Z, "Y");
            if C = 0 then
               goto lab15;
            end if;
            Z.C := Z.C + C;
            Z.Ket := Z.C;            --  ], line 137

            Z.C := v_16;
            exit;

            <<lab15>>
            Z.C := v_16;
            if Z.C >= Z.L then
               goto lab13;
            end if;
            --  goto, line 137
            C := Skip_Utf8 (Z);
            if C < 0 then
               goto lab13;
            end if;
            Z.C := C;
         end loop;
         --  <-, line 137
         Slice_From (Z, "y");
         goto lab12;

         <<lab13>>
         Z.C := v_15;

         exit;
      end loop;

      <<lab11>>
      Z.C := v_14;

      Result := True;
   end Stem;
end Stemmer.Porter;
