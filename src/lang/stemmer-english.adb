--  Generated by Snowball 2.2.0 - https://snowballstem.org/

package body Stemmer.English is

   pragma Style_Checks ("-mr");
   pragma Warnings (Off, "*variable*is never read and never assigned*");
   pragma Warnings (Off, "*mode could be*instead of*");
   pragma Warnings (Off, "*formal parameter.*is not modified*");
   pragma Warnings (Off, "*this line is too long*");
   pragma Warnings (Off, "*is not referenced*");

   procedure R_Exception2 (Z : in out Context_Type; Result : out Boolean);
   procedure R_Exception1 (Z : in out Context_Type; Result : out Boolean);
   procedure R_Step_5 (Z : in out Context_Type; Result : out Boolean);
   procedure R_Step_4 (Z : in out Context_Type; Result : out Boolean);
   procedure R_Step_3 (Z : in out Context_Type; Result : out Boolean);
   procedure R_Step_2 (Z : in out Context_Type; Result : out Boolean);
   procedure R_Step_1c (Z : in out Context_Type; Result : out Boolean);
   procedure R_Step_1b (Z : in out Context_Type; Result : out Boolean);
   procedure R_Step_1a (Z : in out Context_Type; Result : out Boolean);
   procedure R_R2 (Z : in out Context_Type; Result : out Boolean);
   procedure R_R1 (Z : in out Context_Type; Result : out Boolean);
   procedure R_Shortv (Z : in out Context_Type; Result : out Boolean);
   procedure R_Mark_regions (Z : in out Context_Type; Result : out Boolean);
   procedure R_Postlude (Z : in out Context_Type; Result : out Boolean);
   procedure R_Prelude (Z : in out Context_Type; Result : out Boolean);

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

   G_Valid_LI : constant Grouping_Array (0 .. 23) := (
      True, True, True, False, True, True, False, False,
      True, False, True, True, False, False, False, True,
      False, True, False, False, False, False, False, False
   );
   Among_String : constant String := "arsen" & "commun" & "gener" & "'" & "'s'" & "'s" & "ied" & "s" & "ies" & "sses"
      & "ss" & "us" & "" & "bb" & "dd" & "ff" & "gg" & "bl" & "mm" & "nn" & "pp" & "rr"
      & "at" & "tt" & "iz" & "ed" & "eed" & "ing" & "edly" & "eedly" & "ingly" & "anci"
      & "enci" & "ogi" & "li" & "bli" & "abli" & "alli" & "fulli" & "lessli" & "ousli"
      & "entli" & "aliti" & "biliti" & "iviti" & "tional" & "ational" & "alism"
      & "ation" & "ization" & "izer" & "ator" & "iveness" & "fulness" & "ousness"
      & "icate" & "ative" & "alize" & "iciti" & "ical" & "tional" & "ational" & "ful"
      & "ness" & "ic" & "ance" & "ence" & "able" & "ible" & "ate" & "ive" & "ize"
      & "iti" & "al" & "ism" & "ion" & "er" & "ous" & "ant" & "ent" & "ment" & "ement"
      & "e" & "l" & "succeed" & "proceed" & "exceed" & "canning" & "inning" & "earring"
      & "herring" & "outing" & "andes" & "atlas" & "bias" & "cosmos" & "dying"
      & "early" & "gently" & "howe" & "idly" & "lying" & "news" & "only" & "singly"
      & "skies" & "skis" & "sky" & "tying" & "ugly";

   A_0 : constant Among_Array_Type (0 .. 2) := (
      (1, 5, -1, -1, 0),
      (6, 11, -1, -1, 0),
      (12, 16, -1, -1, 0));

   A_1 : constant Among_Array_Type (0 .. 2) := (
      (17, 17, -1, 1, 0),
      (18, 20, 0, 1, 0),
      (21, 22, -1, 1, 0));

   A_2 : constant Among_Array_Type (0 .. 5) := (
      (23, 25, -1, 2, 0),
      (26, 26, -1, 3, 0),
      (27, 29, 1, 2, 0),
      (30, 33, 1, 1, 0),
      (34, 35, 1, -1, 0),
      (36, 37, 1, -1, 0));

   A_3 : constant Among_Array_Type (0 .. 12) := (
      (38, 37, -1, 3, 0),
      (38, 39, 0, 2, 0),
      (40, 41, 0, 2, 0),
      (42, 43, 0, 2, 0),
      (44, 45, 0, 2, 0),
      (46, 47, 0, 1, 0),
      (48, 49, 0, 2, 0),
      (50, 51, 0, 2, 0),
      (52, 53, 0, 2, 0),
      (54, 55, 0, 2, 0),
      (56, 57, 0, 1, 0),
      (58, 59, 0, 2, 0),
      (60, 61, 0, 1, 0));

   A_4 : constant Among_Array_Type (0 .. 5) := (
      (62, 63, -1, 2, 0),
      (64, 66, 0, 1, 0),
      (67, 69, -1, 2, 0),
      (70, 73, -1, 2, 0),
      (74, 78, 3, 1, 0),
      (79, 83, -1, 2, 0));

   A_5 : constant Among_Array_Type (0 .. 23) := (
      (84, 87, -1, 3, 0),
      (88, 91, -1, 2, 0),
      (92, 94, -1, 13, 0),
      (95, 96, -1, 15, 0),
      (97, 99, 3, 12, 0),
      (100, 103, 4, 4, 0),
      (104, 107, 3, 8, 0),
      (108, 112, 3, 9, 0),
      (113, 118, 3, 14, 0),
      (119, 123, 3, 10, 0),
      (124, 128, 3, 5, 0),
      (129, 133, -1, 8, 0),
      (134, 139, -1, 12, 0),
      (140, 144, -1, 11, 0),
      (145, 150, -1, 1, 0),
      (151, 157, 14, 7, 0),
      (158, 162, -1, 8, 0),
      (163, 167, -1, 7, 0),
      (168, 174, 17, 6, 0),
      (175, 178, -1, 6, 0),
      (179, 182, -1, 7, 0),
      (183, 189, -1, 11, 0),
      (190, 196, -1, 9, 0),
      (197, 203, -1, 10, 0));

   A_6 : constant Among_Array_Type (0 .. 8) := (
      (204, 208, -1, 4, 0),
      (209, 213, -1, 6, 0),
      (214, 218, -1, 3, 0),
      (219, 223, -1, 4, 0),
      (224, 227, -1, 4, 0),
      (228, 233, -1, 1, 0),
      (234, 240, 5, 2, 0),
      (241, 243, -1, 5, 0),
      (244, 247, -1, 5, 0));

   A_7 : constant Among_Array_Type (0 .. 17) := (
      (248, 249, -1, 1, 0),
      (250, 253, -1, 1, 0),
      (254, 257, -1, 1, 0),
      (258, 261, -1, 1, 0),
      (262, 265, -1, 1, 0),
      (266, 268, -1, 1, 0),
      (269, 271, -1, 1, 0),
      (272, 274, -1, 1, 0),
      (275, 277, -1, 1, 0),
      (278, 279, -1, 1, 0),
      (280, 282, -1, 1, 0),
      (283, 285, -1, 2, 0),
      (286, 287, -1, 1, 0),
      (288, 290, -1, 1, 0),
      (291, 293, -1, 1, 0),
      (294, 296, -1, 1, 0),
      (297, 300, 15, 1, 0),
      (301, 305, 16, 1, 0));

   A_8 : constant Among_Array_Type (0 .. 1) := (
      (306, 306, -1, 1, 0),
      (307, 307, -1, 2, 0));

   A_9 : constant Among_Array_Type (0 .. 7) := (
      (308, 314, -1, -1, 0),
      (315, 321, -1, -1, 0),
      (322, 327, -1, -1, 0),
      (328, 334, -1, -1, 0),
      (335, 340, -1, -1, 0),
      (341, 347, -1, -1, 0),
      (348, 354, -1, -1, 0),
      (355, 360, -1, -1, 0));

   A_10 : constant Among_Array_Type (0 .. 17) := (
      (361, 365, -1, -1, 0),
      (366, 370, -1, -1, 0),
      (371, 374, -1, -1, 0),
      (375, 380, -1, -1, 0),
      (381, 385, -1, 3, 0),
      (386, 390, -1, 9, 0),
      (391, 396, -1, 7, 0),
      (397, 400, -1, -1, 0),
      (401, 404, -1, 6, 0),
      (405, 409, -1, 4, 0),
      (410, 413, -1, -1, 0),
      (414, 417, -1, 10, 0),
      (418, 423, -1, 11, 0),
      (424, 428, -1, 2, 0),
      (429, 432, -1, 1, 0),
      (433, 435, -1, -1, 0),
      (436, 440, -1, 5, 0),
      (441, 444, -1, 8, 0));


   procedure R_Prelude (Z : in out Context_Type; Result : out Boolean) is
      C : Result_Index;
      A : Integer;
      v_1 : Char_Index;
      v_2 : Char_Index;
      v_3 : Char_Index;
      v_4 : Char_Index;
      v_5 : Char_Index;
   begin
      --  (, line 25
      --  unset Y_found, line 26
      Z.B_Y_found := False;
      --  do, line 27
      v_1 := Z.C;
      --  (, line 27
      Z.Bra := Z.C;      --  [, line 27

      --  literal, line 27
      C := Eq_S (Z, "'");
      if C = 0 then
         goto lab0;
      end if;
      Z.C := Z.C + C;
      Z.Ket := Z.C;      --  ], line 27

      --  delete, line 27
      Slice_Del (Z);

      <<lab0>>
      Z.C := v_1;
      --  do, line 28
      v_2 := Z.C;
      --  (, line 28
      Z.Bra := Z.C;      --  [, line 28

      --  literal, line 28
      C := Eq_S (Z, "y");
      if C = 0 then
         goto lab1;
      end if;
      Z.C := Z.C + C;
      Z.Ket := Z.C;      --  ], line 28

      --  <-, line 28
      Slice_From (Z, "Y");
      --  set Y_found, line 28
      Z.B_Y_found := True;

      <<lab1>>
      Z.C := v_2;
      --  do, line 29
      v_3 := Z.C;
      --  repeat, line 29

      <<lab3>>

      loop
         v_4 := Z.C;
         --  (, line 29
         --  goto, line 29
         loop
            v_5 := Z.C;
            --  (, line 29
            In_Grouping (Z, G_V, 97, 121, False, C);
            if C /= 0 then
               goto lab6;
            end if;
            Z.Bra := Z.C;            --  [, line 29

            --  literal, line 29
            C := Eq_S (Z, "y");
            if C = 0 then
               goto lab6;
            end if;
            Z.C := Z.C + C;
            Z.Ket := Z.C;            --  ], line 29

            Z.C := v_5;
            exit;

            <<lab6>>
            Z.C := v_5;
            if Z.C >= Z.L then
               goto lab4;
            end if;
            --  goto, line 29
            C := Skip_Utf8 (Z);
            if C < 0 then
               goto lab4;
            end if;
            Z.C := C;
         end loop;
         --  <-, line 29
         Slice_From (Z, "Y");
         --  set Y_found, line 29
         Z.B_Y_found := True;
         goto lab3;

         <<lab4>>
         Z.C := v_4;

         exit;
      end loop;

      <<lab2>>
      Z.C := v_3;

      Result := True;
   end R_Prelude;

   procedure R_Mark_regions (Z : in out Context_Type; Result : out Boolean) is
      C : Result_Index;
      A : Integer;
      v_1 : Char_Index;
      v_2 : Char_Index;
   begin
      --  (, line 32
      Z.I_P1 := Z.L;
      Z.I_P2 := Z.L;
      --  do, line 35
      v_1 := Z.C;
      --  (, line 35
      --  or, line 41
      v_2 := Z.C;
      --  among, line 36
      if Z.C + 4 >= Z.L or else Check_Among (Z, Z.C + 4, 3, 16#244000#) then
         goto lab2;
         --  among, line 36
      end if;
      Find_Among (Z, A_0, Among_String, null, A);
      if A = 0 then
         goto lab2;
      end if;
      goto lab1;

      <<lab2>>
      Z.C := v_2;
      --  (, line 41
            --  gopast, line 41
      --  grouping v, line 41
      Out_Grouping (Z, G_V, 97, 121, True, C);
      if C < 0 then
         goto lab0;
      end if;
      Z.C := Z.C + C;
            --  gopast, line 41
      --  non v, line 41
      In_Grouping (Z, G_V, 97, 121, True, C);
      if C < 0 then
         goto lab0;
      end if;
      Z.C := Z.C + C;

      <<lab1>>
      --  setmark p1, line 42
      Z.I_P1 := Z.C;
            --  gopast, line 43
      --  grouping v, line 43
      Out_Grouping (Z, G_V, 97, 121, True, C);
      if C < 0 then
         goto lab0;
      end if;
      Z.C := Z.C + C;
            --  gopast, line 43
      --  non v, line 43
      In_Grouping (Z, G_V, 97, 121, True, C);
      if C < 0 then
         goto lab0;
      end if;
      Z.C := Z.C + C;
      --  setmark p2, line 43
      Z.I_P2 := Z.C;

      <<lab0>>
      Z.C := v_1;

      Result := True;
   end R_Mark_regions;

   procedure R_Shortv (Z : in out Context_Type; Result : out Boolean) is
      C : Result_Index;
      A : Integer;
      v_1 : Char_Index;
   begin
      --  or, line 51
      v_1 := Z.L - Z.C;
      --  (, line 50
      Out_Grouping_Backward (Z, G_V_WXY, 89, 121, False, C);
      if C /= 0 then
         goto lab1;
      end if;
      In_Grouping_Backward (Z, G_V, 97, 121, False, C);
      if C /= 0 then
         goto lab1;
      end if;
      Out_Grouping_Backward (Z, G_V, 97, 121, False, C);
      if C /= 0 then
         goto lab1;
      end if;
      goto lab0;

      <<lab1>>
      Z.C := Z.L - v_1;
      --  (, line 52
      Out_Grouping_Backward (Z, G_V, 97, 121, False, C);
      if C /= 0 then
         Result := False;
         return;
      end if;
      In_Grouping_Backward (Z, G_V, 97, 121, False, C);
      if C /= 0 then
         Result := False;
         return;
      end if;
      --  atlimit, line 52
      if Z.C > Z.Lb then
         Result := False;
         return;
      end if;

      <<lab0>>

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
      v_1 : Char_Index;
      v_2 : Char_Index;
   begin
      --  (, line 58
      --  try, line 59
      v_1 := Z.L - Z.C;
      --  (, line 59
      Z.Ket := Z.C;      --  [, line 60

      --  substring, line 60
      if Z.C <= Z.Lb or else (Character'Pos (Z.P (Z.C)) /= 39 and then Character'Pos (Z.P (Z.C)) /= 115) then
         Z.C := Z.L - v_1;
         goto lab0;
         --  substring, line 60
      end if;
      Find_Among_Backward (Z, A_1, Among_String, null, A);
      if A = 0 then
         Z.C := Z.L - v_1;
         goto lab0;
      end if;
      Z.Bra := Z.C;      --  ], line 60

      --  (, line 62
      --  delete, line 62
      Slice_Del (Z);

      <<lab0>>
      Z.Ket := Z.C;      --  [, line 65

      --  substring, line 65
      if Z.C <= Z.Lb or else (Character'Pos (Z.P (Z.C)) /= 100 and then Character'Pos (Z.P (Z.C)) /= 115) then
         Result := False;
         return;
         --  substring, line 65
      end if;
      Find_Among_Backward (Z, A_2, Among_String, null, A);
      if A = 0 then
         Result := False;
         return;
      end if;
      Z.Bra := Z.C;      --  ], line 65

      --  among, line 65
      case A is
         when 1 =>
            --  (, line 66
            --  <-, line 66
            Slice_From (Z, "ss");
         when 2 =>
            --  (, line 68
            --  or, line 68
            v_2 := Z.L - Z.C;
            --  (, line 68
            C := Skip_Utf8_Backward (Z, 2);            --  hop, line 68

            if C < 0 then
               goto lab2;
            end if;
            Z.C := C;
            --  <-, line 68
            Slice_From (Z, "i");
            goto lab1;

            <<lab2>>
            Z.C := Z.L - v_2;
            --  <-, line 68
            Slice_From (Z, "ie");

            <<lab1>>
         when 3 =>
            --  (, line 69
            --  next, line 69
            C := Skip_Utf8_Backward (Z);
            if C < 0 then
               Result := False;
               return;
            end if;
            Z.C := C;
                        --  gopast, line 69
            --  grouping v, line 69
            Out_Grouping_Backward (Z, G_V, 97, 121, True, C);
            if C < 0 then
               Result := False;
               return;
            end if;
            Z.C := Z.C - C;
            --  delete, line 69
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
      --  (, line 74
      Z.Ket := Z.C;      --  [, line 75

      --  substring, line 75
      if Z.C - 1 <= Z.Lb or else Check_Among (Z, Z.C - 1, 3, 16#2000090#) then
         Result := False;
         return;
         --  substring, line 75
      end if;
      Find_Among_Backward (Z, A_4, Among_String, null, A);
      if A = 0 then
         Result := False;
         return;
      end if;
      Z.Bra := Z.C;      --  ], line 75

      --  among, line 75
      case A is
         when 1 =>
            --  (, line 77
            --  call R1, line 77
            R_R1 (Z, Result);
            if not Result then
               Result := False;
               return;
            end if;
            --  <-, line 77
            Slice_From (Z, "ee");
         when 2 =>
            --  (, line 79
            --  test, line 80
            v_1 := Z.L - Z.C;
                        --  gopast, line 80
            --  grouping v, line 80
            Out_Grouping_Backward (Z, G_V, 97, 121, True, C);
            if C < 0 then
               Result := False;
               return;
            end if;
            Z.C := Z.C - C;
            Z.C := Z.L - v_1;
            --  delete, line 80
            Slice_Del (Z);
            --  test, line 81
            v_2 := Z.L - Z.C;
            --  substring, line 81
            if Z.C - 1 <= Z.Lb or else Check_Among (Z, Z.C - 1, 3, 16#41570d4#) then
               A := 3;
            else               --  substring, line 81
               Find_Among_Backward (Z, A_3, Among_String, null, A);
               if A = 0 then
                  Result := False;
                  return;
               end if;
            end if;
            Z.C := Z.L - v_2;
            --  among, line 81
            case A is
               when 1 =>
                  --  (, line 83
                  --  <+, line 83
                  C := Z.C;
                  Insert (Z, Z.C, Z.C, "e");
                  Z.C := C;
               when 2 =>
                  --  (, line 86
                  Z.Ket := Z.C;                  --  [, line 86

                  --  next, line 86
                  C := Skip_Utf8_Backward (Z);
                  if C < 0 then
                     Result := False;
                     return;
                  end if;
                  Z.C := C;
                  Z.Bra := Z.C;                  --  ], line 86

                  --  delete, line 86
                  Slice_Del (Z);
               when 3 =>
                  --  (, line 87
                  --  atmark, line 87
                  if Z.C /= Z.I_P1 then
                     Result := False;
                     return;
                  end if;
                  --  test, line 87
                  v_3 := Z.L - Z.C;
                  --  call shortv, line 87
                  R_Shortv (Z, Result);
                  if not Result then
                     Result := False;
                     return;
                  end if;
                  Z.C := Z.L - v_3;
                  --  <+, line 87
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
      --  (, line 93
      Z.Ket := Z.C;      --  [, line 94

      --  or, line 94
      v_1 := Z.L - Z.C;
      --  literal, line 94
      C := Eq_S_Backward (Z, "y");
      if C = 0 then
         goto lab1;
      end if;
      Z.C := Z.C - C;
      goto lab0;

      <<lab1>>
      Z.C := Z.L - v_1;
      --  literal, line 94
      C := Eq_S_Backward (Z, "Y");
      if C = 0 then
         Result := False;
         return;
      end if;
      Z.C := Z.C - C;

      <<lab0>>
      Z.Bra := Z.C;      --  ], line 94

      Out_Grouping_Backward (Z, G_V, 97, 121, False, C);
      if C /= 0 then
         Result := False;
         return;
      end if;
      --  not, line 95
      --  atlimit, line 95
      if Z.C > Z.Lb then
         goto lab2;
      end if;
      Result := False;
      return;

      <<lab2>>
      --  <-, line 96
      Slice_From (Z, "i");

      Result := True;
   end R_Step_1c;

   procedure R_Step_2 (Z : in out Context_Type; Result : out Boolean) is
      C : Result_Index;
      A : Integer;
   begin
      --  (, line 99
      Z.Ket := Z.C;      --  [, line 100

      --  substring, line 100
      if Z.C - 1 <= Z.Lb or else Check_Among (Z, Z.C - 1, 3, 16#c7200#) then
         Result := False;
         return;
         --  substring, line 100
      end if;
      Find_Among_Backward (Z, A_5, Among_String, null, A);
      if A = 0 then
         Result := False;
         return;
      end if;
      Z.Bra := Z.C;      --  ], line 100

      --  call R1, line 100
      R_R1 (Z, Result);
      if not Result then
         Result := False;
         return;
      end if;
      --  among, line 100
      case A is
         when 1 =>
            --  (, line 101
            --  <-, line 101
            Slice_From (Z, "tion");
         when 2 =>
            --  (, line 102
            --  <-, line 102
            Slice_From (Z, "ence");
         when 3 =>
            --  (, line 103
            --  <-, line 103
            Slice_From (Z, "ance");
         when 4 =>
            --  (, line 104
            --  <-, line 104
            Slice_From (Z, "able");
         when 5 =>
            --  (, line 105
            --  <-, line 105
            Slice_From (Z, "ent");
         when 6 =>
            --  (, line 107
            --  <-, line 107
            Slice_From (Z, "ize");
         when 7 =>
            --  (, line 109
            --  <-, line 109
            Slice_From (Z, "ate");
         when 8 =>
            --  (, line 111
            --  <-, line 111
            Slice_From (Z, "al");
         when 9 =>
            --  (, line 112
            --  <-, line 112
            Slice_From (Z, "ful");
         when 10 =>
            --  (, line 114
            --  <-, line 114
            Slice_From (Z, "ous");
         when 11 =>
            --  (, line 116
            --  <-, line 116
            Slice_From (Z, "ive");
         when 12 =>
            --  (, line 118
            --  <-, line 118
            Slice_From (Z, "ble");
         when 13 =>
            --  (, line 119
            --  literal, line 119
            C := Eq_S_Backward (Z, "l");
            if C = 0 then
               Result := False;
               return;
            end if;
            Z.C := Z.C - C;
            --  <-, line 119
            Slice_From (Z, "og");
         when 14 =>
            --  (, line 121
            --  <-, line 121
            Slice_From (Z, "less");
         when 15 =>
            --  (, line 122
            In_Grouping_Backward (Z, G_Valid_LI, 99, 116, False, C);
            if C /= 0 then
               Result := False;
               return;
            end if;
            --  delete, line 122
            Slice_Del (Z);
         when others =>
            null;
      end case;

      Result := True;
   end R_Step_2;

   procedure R_Step_3 (Z : in out Context_Type; Result : out Boolean) is
      C : Result_Index;
      A : Integer;
   begin
      --  (, line 126
      Z.Ket := Z.C;      --  [, line 127

      --  substring, line 127
      if Z.C - 2 <= Z.Lb or else Check_Among (Z, Z.C - 1, 3, 16#81220#) then
         Result := False;
         return;
         --  substring, line 127
      end if;
      Find_Among_Backward (Z, A_6, Among_String, null, A);
      if A = 0 then
         Result := False;
         return;
      end if;
      Z.Bra := Z.C;      --  ], line 127

      --  call R1, line 127
      R_R1 (Z, Result);
      if not Result then
         Result := False;
         return;
      end if;
      --  among, line 127
      case A is
         when 1 =>
            --  (, line 128
            --  <-, line 128
            Slice_From (Z, "tion");
         when 2 =>
            --  (, line 129
            --  <-, line 129
            Slice_From (Z, "ate");
         when 3 =>
            --  (, line 130
            --  <-, line 130
            Slice_From (Z, "al");
         when 4 =>
            --  (, line 132
            --  <-, line 132
            Slice_From (Z, "ic");
         when 5 =>
            --  (, line 134
            --  delete, line 134
            Slice_Del (Z);
         when 6 =>
            --  (, line 136
            --  call R2, line 136
            R_R2 (Z, Result);
            if not Result then
               Result := False;
               return;
            end if;
            --  delete, line 136
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
      --  (, line 140
      Z.Ket := Z.C;      --  [, line 141

      --  substring, line 141
      if Z.C - 1 <= Z.Lb or else Check_Among (Z, Z.C - 1, 3, 16#1c7228#) then
         Result := False;
         return;
         --  substring, line 141
      end if;
      Find_Among_Backward (Z, A_7, Among_String, null, A);
      if A = 0 then
         Result := False;
         return;
      end if;
      Z.Bra := Z.C;      --  ], line 141

      --  call R2, line 141
      R_R2 (Z, Result);
      if not Result then
         Result := False;
         return;
      end if;
      --  among, line 141
      case A is
         when 1 =>
            --  (, line 144
            --  delete, line 144
            Slice_Del (Z);
         when 2 =>
            --  (, line 145
            --  or, line 145
            v_1 := Z.L - Z.C;
            --  literal, line 145
            C := Eq_S_Backward (Z, "s");
            if C = 0 then
               goto lab1;
            end if;
            Z.C := Z.C - C;
            goto lab0;

            <<lab1>>
            Z.C := Z.L - v_1;
            --  literal, line 145
            C := Eq_S_Backward (Z, "t");
            if C = 0 then
               Result := False;
               return;
            end if;
            Z.C := Z.C - C;

            <<lab0>>
            --  delete, line 145
            Slice_Del (Z);
         when others =>
            null;
      end case;

      Result := True;
   end R_Step_4;

   procedure R_Step_5 (Z : in out Context_Type; Result : out Boolean) is
      C : Result_Index;
      A : Integer;
      v_1 : Char_Index;
      v_2 : Char_Index;
   begin
      --  (, line 149
      Z.Ket := Z.C;      --  [, line 150

      --  substring, line 150
      if Z.C <= Z.Lb or else (Character'Pos (Z.P (Z.C)) /= 101 and then Character'Pos (Z.P (Z.C)) /= 108) then
         Result := False;
         return;
         --  substring, line 150
      end if;
      Find_Among_Backward (Z, A_8, Among_String, null, A);
      if A = 0 then
         Result := False;
         return;
      end if;
      Z.Bra := Z.C;      --  ], line 150

      --  among, line 150
      case A is
         when 1 =>
            --  (, line 151
            --  or, line 151
            v_1 := Z.L - Z.C;
            --  call R2, line 151
            R_R2 (Z, Result);
            if not Result then
               goto lab1;
            end if;
            goto lab0;

            <<lab1>>
            Z.C := Z.L - v_1;
            --  (, line 151
            --  call R1, line 151
            R_R1 (Z, Result);
            if not Result then
               Result := False;
               return;
            end if;
            --  not, line 151
            v_2 := Z.L - Z.C;
            --  call shortv, line 151
            R_Shortv (Z, Result);
            if not Result then
               goto lab2;
            end if;
            Result := False;
            return;

            <<lab2>>
            Z.C := Z.L - v_2;

            <<lab0>>
            --  delete, line 151
            Slice_Del (Z);
         when 2 =>
            --  (, line 152
            --  call R2, line 152
            R_R2 (Z, Result);
            if not Result then
               Result := False;
               return;
            end if;
            --  literal, line 152
            C := Eq_S_Backward (Z, "l");
            if C = 0 then
               Result := False;
               return;
            end if;
            Z.C := Z.C - C;
            --  delete, line 152
            Slice_Del (Z);
         when others =>
            null;
      end case;

      Result := True;
   end R_Step_5;

   procedure R_Exception2 (Z : in out Context_Type; Result : out Boolean) is
      C : Result_Index;
      A : Integer;
   begin
      --  (, line 156
      Z.Ket := Z.C;      --  [, line 158

      --  substring, line 158
      if Z.C - 5 <= Z.Lb or else (Character'Pos (Z.P (Z.C)) /= 100 and then Character'Pos (Z.P (Z.C)) /= 103) then
         Result := False;
         return;
         --  substring, line 158
      end if;
      Find_Among_Backward (Z, A_9, Among_String, null, A);
      if A = 0 then
         Result := False;
         return;
      end if;
      Z.Bra := Z.C;      --  ], line 158

      --  atlimit, line 158
      if Z.C > Z.Lb then
         Result := False;
         return;
      end if;

      Result := True;
   end R_Exception2;

   procedure R_Exception1 (Z : in out Context_Type; Result : out Boolean) is
      C : Result_Index;
      A : Integer;
   begin
      --  (, line 168
      Z.Bra := Z.C;      --  [, line 170

      --  substring, line 170
      if Z.C + 2 >= Z.L or else Check_Among (Z, Z.C + 2, 3, 16#28c5212#) then
         Result := False;
         return;
         --  substring, line 170
      end if;
      Find_Among (Z, A_10, Among_String, null, A);
      if A = 0 then
         Result := False;
         return;
      end if;
      Z.Ket := Z.C;      --  ], line 170

      --  atlimit, line 170
      if Z.C < Z.L then
         Result := False;
         return;
      end if;
      --  among, line 170
      case A is
         when 1 =>
            --  (, line 174
            --  <-, line 174
            Slice_From (Z, "ski");
         when 2 =>
            --  (, line 175
            --  <-, line 175
            Slice_From (Z, "sky");
         when 3 =>
            --  (, line 176
            --  <-, line 176
            Slice_From (Z, "die");
         when 4 =>
            --  (, line 177
            --  <-, line 177
            Slice_From (Z, "lie");
         when 5 =>
            --  (, line 178
            --  <-, line 178
            Slice_From (Z, "tie");
         when 6 =>
            --  (, line 182
            --  <-, line 182
            Slice_From (Z, "idl");
         when 7 =>
            --  (, line 183
            --  <-, line 183
            Slice_From (Z, "gentl");
         when 8 =>
            --  (, line 184
            --  <-, line 184
            Slice_From (Z, "ugli");
         when 9 =>
            --  (, line 185
            --  <-, line 185
            Slice_From (Z, "earli");
         when 10 =>
            --  (, line 186
            --  <-, line 186
            Slice_From (Z, "onli");
         when 11 =>
            --  (, line 187
            --  <-, line 187
            Slice_From (Z, "singl");
         when others =>
            null;
      end case;

      Result := True;
   end R_Exception1;

   procedure R_Postlude (Z : in out Context_Type; Result : out Boolean) is
      C : Result_Index;
      A : Integer;
      v_1 : Char_Index;
      v_2 : Char_Index;
   begin
      --  (, line 203
      --  Boolean test Y_found, line 203
      if not Z.B_Y_found then
         Result := False;
         return;
      end if;
      --  repeat, line 203

      <<lab0>>

      loop
         v_1 := Z.C;
         --  (, line 203
         --  goto, line 203
         loop
            v_2 := Z.C;
            --  (, line 203
            Z.Bra := Z.C;            --  [, line 203

            --  literal, line 203
            C := Eq_S (Z, "Y");
            if C = 0 then
               goto lab3;
            end if;
            Z.C := Z.C + C;
            Z.Ket := Z.C;            --  ], line 203

            Z.C := v_2;
            exit;

            <<lab3>>
            Z.C := v_2;
            if Z.C >= Z.L then
               goto lab1;
            end if;
            --  goto, line 203
            C := Skip_Utf8 (Z);
            if C < 0 then
               goto lab1;
            end if;
            Z.C := C;
         end loop;
         --  <-, line 203
         Slice_From (Z, "y");
         goto lab0;

         <<lab1>>
         Z.C := v_1;

         exit;
      end loop;

      Result := True;
   end R_Postlude;

   procedure Stem (Z : in out Context_Type; Result : out Boolean) is
      C : Result_Index;
      A : Integer;
      v_1 : Char_Index;
      v_2 : Char_Index;
      v_5 : Char_Index;
      v_6 : Char_Index;
      v_7 : Char_Index;
      v_8 : Char_Index;
      v_9 : Char_Index;
      v_10 : Char_Index;
      v_11 : Char_Index;
      v_12 : Char_Index;
      v_13 : Char_Index;
   begin
      --  or, line 207
      v_1 := Z.C;
      --  call exception1, line 207
      R_Exception1 (Z, Result);
      if not Result then
         goto lab1;
      end if;
      goto lab0;

      <<lab1>>
      Z.C := v_1;
      --  not, line 208
      v_2 := Z.C;
      C := Skip_Utf8 (Z, 3);      --  hop, line 208

      if C < 0 then
         goto lab3;
      end if;
      Z.C := C;
      goto lab2;

      <<lab3>>
      Z.C := v_2;
      goto lab0;

      <<lab2>>
      Z.C := v_1;
      --  (, line 208
      --  do, line 209
      --  call prelude, line 209
      R_Prelude (Z, Result);
      --  do, line 210
      --  call mark_regions, line 210
      R_Mark_regions (Z, Result);
      Z.Lb := Z.C; Z.C := Z.L;      --  backwards, line 211

      --  (, line 211
      --  do, line 213
      v_5 := Z.L - Z.C;
      --  call Step_1a, line 213
      R_Step_1a (Z, Result);
      Z.C := Z.L - v_5;
      --  or, line 215
      v_6 := Z.L - Z.C;
      --  call exception2, line 215
      R_Exception2 (Z, Result);
      if not Result then
         goto lab5;
      end if;
      goto lab4;

      <<lab5>>
      Z.C := Z.L - v_6;
      --  (, line 215
      --  do, line 217
      v_7 := Z.L - Z.C;
      --  call Step_1b, line 217
      R_Step_1b (Z, Result);
      Z.C := Z.L - v_7;
      --  do, line 218
      v_8 := Z.L - Z.C;
      --  call Step_1c, line 218
      R_Step_1c (Z, Result);
      Z.C := Z.L - v_8;
      --  do, line 220
      v_9 := Z.L - Z.C;
      --  call Step_2, line 220
      R_Step_2 (Z, Result);
      Z.C := Z.L - v_9;
      --  do, line 221
      v_10 := Z.L - Z.C;
      --  call Step_3, line 221
      R_Step_3 (Z, Result);
      Z.C := Z.L - v_10;
      --  do, line 222
      v_11 := Z.L - Z.C;
      --  call Step_4, line 222
      R_Step_4 (Z, Result);
      Z.C := Z.L - v_11;
      --  do, line 224
      v_12 := Z.L - Z.C;
      --  call Step_5, line 224
      R_Step_5 (Z, Result);
      Z.C := Z.L - v_12;

      <<lab4>>
      Z.C := Z.Lb;
      --  do, line 227
      v_13 := Z.C;
      --  call postlude, line 227
      R_Postlude (Z, Result);
      Z.C := v_13;

      <<lab0>>

      Result := True;
   end Stem;
end Stemmer.English;
