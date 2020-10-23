--  Generated by Snowball 2.0.0 - https://snowballstem.org/

package body Stemmer.Russian is

   pragma Style_Checks ("-mr");
   pragma Warnings (Off, "*variable*is never read and never assigned*");
   pragma Warnings (Off, "*mode could be*instead of*");
   pragma Warnings (Off, "*formal parameter.*is not modified*");
   pragma Warnings (Off, "*this line is too long*");
   pragma Warnings (Off, "*is not referenced*");

   procedure R_Tidy_up (Z : in out Context_Type; Result : out Boolean);
   procedure R_Derivational (Z : in out Context_Type; Result : out Boolean);
   procedure R_Noun (Z : in out Context_Type; Result : out Boolean);
   procedure R_Verb (Z : in out Context_Type; Result : out Boolean);
   procedure R_Reflexive (Z : in out Context_Type; Result : out Boolean);
   procedure R_Adjectival (Z : in out Context_Type; Result : out Boolean);
   procedure R_Adjective (Z : in out Context_Type; Result : out Boolean);
   procedure R_Perfective_gerund (Z : in out Context_Type; Result : out Boolean);
   procedure R_R2 (Z : in out Context_Type; Result : out Boolean);
   procedure R_Mark_regions (Z : in out Context_Type; Result : out Boolean);

   G_V : constant Grouping_Array (0 .. 31) := (
      True, False, False, False, False, True, False, False,
      True, False, False, False, False, False, True, False,
      False, False, False, True, False, False, False, False,
      False, False, False, True, False, True, True, True
   );
   Among_String : constant String := "вшись" & "ывшись"
      & "ившись" & "в" & "ыв" & "ив" & "вши" & "ывши" & "ивши"
      & "ему" & "ому" & "ых" & "их" & "ую" & "юю" & "ею" & "ою"
      & "яя" & "ая" & "ые" & "ее" & "ие" & "ое" & "ыми" & "ими"
      & "ый" & "ей" & "ий" & "ой" & "ым" & "ем" & "им" & "ом"
      & "его" & "ого" & "вш" & "ывш" & "ивш" & "щ" & "ющ" & "ующ"
      & "ем" & "нн" & "сь" & "ся" & "ыт" & "ют" & "уют" & "ят"
      & "ет" & "ует" & "ит" & "ны" & "ены" & "ть" & "ыть" & "ить"
      & "ешь" & "ишь" & "ю" & "ую" & "ла" & "ыла" & "ила" & "на"
      & "ена" & "ете" & "ите" & "йте" & "уйте" & "ейте" & "ли"
      & "ыли" & "или" & "й" & "уй" & "ей" & "л" & "ыл" & "ил" & "ым"
      & "ем" & "им" & "н" & "ен" & "ло" & "ыло" & "ило" & "но"
      & "ено" & "нно" & "у" & "ях" & "иях" & "ах" & "ы" & "ь" & "ю"
      & "ью" & "ию" & "я" & "ья" & "ия" & "а" & "ев" & "ов" & "е"
      & "ье" & "ие" & "и" & "еи" & "ии" & "ями" & "иями" & "ами"
      & "й" & "ей" & "ией" & "ий" & "ой" & "ям" & "иям" & "ам"
      & "ем" & "ием" & "ом" & "о" & "ост" & "ость" & "ейш" & "ь"
      & "ейше" & "н";

   A_0 : constant Among_Array_Type (0 .. 8) := (
      (1, 10, -1, 1, 0),
      (11, 22, 0, 2, 0),
      (23, 34, 0, 2, 0),
      (35, 36, -1, 1, 0),
      (37, 40, 3, 2, 0),
      (41, 44, 3, 2, 0),
      (45, 50, -1, 1, 0),
      (51, 58, 6, 2, 0),
      (59, 66, 6, 2, 0));

   A_1 : constant Among_Array_Type (0 .. 25) := (
      (67, 72, -1, 1, 0),
      (73, 78, -1, 1, 0),
      (79, 82, -1, 1, 0),
      (83, 86, -1, 1, 0),
      (87, 90, -1, 1, 0),
      (91, 94, -1, 1, 0),
      (95, 98, -1, 1, 0),
      (99, 102, -1, 1, 0),
      (103, 106, -1, 1, 0),
      (107, 110, -1, 1, 0),
      (111, 114, -1, 1, 0),
      (115, 118, -1, 1, 0),
      (119, 122, -1, 1, 0),
      (123, 126, -1, 1, 0),
      (127, 132, -1, 1, 0),
      (133, 138, -1, 1, 0),
      (139, 142, -1, 1, 0),
      (143, 146, -1, 1, 0),
      (147, 150, -1, 1, 0),
      (151, 154, -1, 1, 0),
      (155, 158, -1, 1, 0),
      (159, 162, -1, 1, 0),
      (163, 166, -1, 1, 0),
      (167, 170, -1, 1, 0),
      (171, 176, -1, 1, 0),
      (177, 182, -1, 1, 0));

   A_2 : constant Among_Array_Type (0 .. 7) := (
      (183, 186, -1, 1, 0),
      (187, 192, 0, 2, 0),
      (193, 198, 0, 2, 0),
      (199, 200, -1, 1, 0),
      (201, 204, 3, 1, 0),
      (205, 210, 4, 2, 0),
      (211, 214, -1, 1, 0),
      (215, 218, -1, 1, 0));

   A_3 : constant Among_Array_Type (0 .. 1) := (
      (219, 222, -1, 1, 0),
      (223, 226, -1, 1, 0));

   A_4 : constant Among_Array_Type (0 .. 45) := (
      (227, 230, -1, 2, 0),
      (231, 234, -1, 1, 0),
      (235, 240, 1, 2, 0),
      (241, 244, -1, 2, 0),
      (245, 248, -1, 1, 0),
      (249, 254, 4, 2, 0),
      (255, 258, -1, 2, 0),
      (259, 262, -1, 1, 0),
      (263, 268, 7, 2, 0),
      (269, 272, -1, 1, 0),
      (273, 278, 9, 2, 0),
      (279, 284, 9, 2, 0),
      (285, 290, -1, 1, 0),
      (291, 296, -1, 2, 0),
      (297, 298, -1, 2, 0),
      (299, 302, 14, 2, 0),
      (303, 306, -1, 1, 0),
      (307, 312, 16, 2, 0),
      (313, 318, 16, 2, 0),
      (319, 322, -1, 1, 0),
      (323, 328, 19, 2, 0),
      (329, 334, -1, 1, 0),
      (335, 340, -1, 2, 0),
      (341, 346, -1, 1, 0),
      (347, 354, 23, 2, 0),
      (355, 362, 23, 2, 0),
      (363, 366, -1, 1, 0),
      (367, 372, 26, 2, 0),
      (373, 378, 26, 2, 0),
      (379, 380, -1, 1, 0),
      (381, 384, 29, 2, 0),
      (385, 388, 29, 2, 0),
      (389, 390, -1, 1, 0),
      (391, 394, 32, 2, 0),
      (395, 398, 32, 2, 0),
      (399, 402, -1, 2, 0),
      (403, 406, -1, 1, 0),
      (407, 410, -1, 2, 0),
      (411, 412, -1, 1, 0),
      (413, 416, 38, 2, 0),
      (417, 420, -1, 1, 0),
      (421, 426, 40, 2, 0),
      (427, 432, 40, 2, 0),
      (433, 436, -1, 1, 0),
      (437, 442, 43, 2, 0),
      (443, 448, 43, 1, 0));

   A_5 : constant Among_Array_Type (0 .. 35) := (
      (449, 450, -1, 1, 0),
      (451, 454, -1, 1, 0),
      (455, 460, 1, 1, 0),
      (461, 464, -1, 1, 0),
      (465, 466, -1, 1, 0),
      (467, 468, -1, 1, 0),
      (469, 470, -1, 1, 0),
      (471, 474, 6, 1, 0),
      (475, 478, 6, 1, 0),
      (479, 480, -1, 1, 0),
      (481, 484, 9, 1, 0),
      (485, 488, 9, 1, 0),
      (489, 490, -1, 1, 0),
      (491, 494, -1, 1, 0),
      (495, 498, -1, 1, 0),
      (499, 500, -1, 1, 0),
      (501, 504, 15, 1, 0),
      (505, 508, 15, 1, 0),
      (509, 510, -1, 1, 0),
      (511, 514, 18, 1, 0),
      (515, 518, 18, 1, 0),
      (519, 524, 18, 1, 0),
      (525, 532, 21, 1, 0),
      (533, 538, 18, 1, 0),
      (539, 540, -1, 1, 0),
      (541, 544, 24, 1, 0),
      (545, 550, 25, 1, 0),
      (551, 554, 24, 1, 0),
      (555, 558, 24, 1, 0),
      (559, 562, -1, 1, 0),
      (563, 568, 29, 1, 0),
      (569, 572, -1, 1, 0),
      (573, 576, -1, 1, 0),
      (577, 582, 32, 1, 0),
      (583, 586, -1, 1, 0),
      (587, 588, -1, 1, 0));

   A_6 : constant Among_Array_Type (0 .. 1) := (
      (589, 594, -1, 1, 0),
      (595, 602, -1, 1, 0));

   A_7 : constant Among_Array_Type (0 .. 3) := (
      (603, 608, -1, 1, 0),
      (609, 610, -1, 3, 0),
      (611, 618, -1, 1, 0),
      (619, 620, -1, 2, 0));


   procedure R_Mark_regions (Z : in out Context_Type; Result : out Boolean) is
      C : Integer;
      A : Integer;
      v_1 : Integer;
   begin
      --  (, line 59
      Z.I_PV := Z.L;
      Z.I_P2 := Z.L;
      --  do, line 63
      v_1 := Z.C;
      --  (, line 63
            --  gopast, line 64
      --  grouping v, line 64
      Out_Grouping (Z, G_V, 1072, 1103, True, C);
      if C < 0 then
         goto lab0;
      end if;
      Z.C := Z.C + C;
      --  setmark pV, line 64
      Z.I_PV := Z.C;
            --  gopast, line 64
      --  non v, line 64
      In_Grouping (Z, G_V, 1072, 1103, True, C);
      if C < 0 then
         goto lab0;
      end if;
      Z.C := Z.C + C;
            --  gopast, line 65
      --  grouping v, line 65
      Out_Grouping (Z, G_V, 1072, 1103, True, C);
      if C < 0 then
         goto lab0;
      end if;
      Z.C := Z.C + C;
            --  gopast, line 65
      --  non v, line 65
      In_Grouping (Z, G_V, 1072, 1103, True, C);
      if C < 0 then
         goto lab0;
      end if;
      Z.C := Z.C + C;
      --  setmark p2, line 65
      Z.I_P2 := Z.C;

      <<lab0>>
      Z.C := v_1;

      Result := True;
   end R_Mark_regions;

   procedure R_R2 (Z : in out Context_Type; Result : out Boolean) is
   begin
      Result := (Z.I_P2 <= Z.C);
   end R_R2;

   procedure R_Perfective_gerund (Z : in out Context_Type; Result : out Boolean) is
      C : Integer;
      A : Integer;
      v_1 : Integer;
   begin
      --  (, line 73
      Z.Ket := Z.C;      --  [, line 74

      --  substring, line 74
      Find_Among_Backward (Z, A_0, Among_String, null, A);
      if A = 0 then
         Result := False;
         return;
      end if;
      Z.Bra := Z.C;      --  ], line 74

      --  among, line 74
      case A is
         when 1 =>
            --  (, line 78
            --  or, line 78
            v_1 := Z.L - Z.C;
            --  literal, line 78
            C := Eq_S_Backward (Z, "а");
            if C = 0 then
               goto lab1;
            end if;
            Z.C := Z.C - C;
            goto lab0;

            <<lab1>>
            Z.C := Z.L - v_1;
            --  literal, line 78
            C := Eq_S_Backward (Z, "я");
            if C = 0 then
               Result := False;
               return;
            end if;
            Z.C := Z.C - C;

            <<lab0>>
            --  delete, line 78
            Slice_Del (Z);
         when 2 =>
            --  (, line 85
            --  delete, line 85
            Slice_Del (Z);
         when others =>
            null;
      end case;

      Result := True;
   end R_Perfective_gerund;

   procedure R_Adjective (Z : in out Context_Type; Result : out Boolean) is
      C : Integer;
      A : Integer;
   begin
      --  (, line 89
      Z.Ket := Z.C;      --  [, line 90

      --  substring, line 90
      Find_Among_Backward (Z, A_1, Among_String, null, A);
      if A = 0 then
         Result := False;
         return;
      end if;
      Z.Bra := Z.C;      --  ], line 90

      --  (, line 99
      --  delete, line 99
      Slice_Del (Z);

      Result := True;
   end R_Adjective;

   procedure R_Adjectival (Z : in out Context_Type; Result : out Boolean) is
      C : Integer;
      A : Integer;
      v_1 : Integer;
      v_2 : Integer;
   begin
      --  (, line 103
      --  call adjective, line 104
      R_Adjective (Z, Result);
      if not Result then
         Result := False;
         return;
      end if;
      --  try, line 111
      v_1 := Z.L - Z.C;
      --  (, line 111
      Z.Ket := Z.C;      --  [, line 112

      --  substring, line 112
      Find_Among_Backward (Z, A_2, Among_String, null, A);
      if A = 0 then
         Z.C := Z.L - v_1;
         goto lab0;
      end if;
      Z.Bra := Z.C;      --  ], line 112

      --  among, line 112
      case A is
         when 1 =>
            --  (, line 117
            --  or, line 117
            v_2 := Z.L - Z.C;
            --  literal, line 117
            C := Eq_S_Backward (Z, "а");
            if C = 0 then
               goto lab2;
            end if;
            Z.C := Z.C - C;
            goto lab1;

            <<lab2>>
            Z.C := Z.L - v_2;
            --  literal, line 117
            C := Eq_S_Backward (Z, "я");
            if C = 0 then
               Z.C := Z.L - v_1;
               goto lab0;
            end if;
            Z.C := Z.C - C;

            <<lab1>>
            --  delete, line 117
            Slice_Del (Z);
         when 2 =>
            --  (, line 124
            --  delete, line 124
            Slice_Del (Z);
         when others =>
            null;
      end case;

      <<lab0>>

      Result := True;
   end R_Adjectival;

   procedure R_Reflexive (Z : in out Context_Type; Result : out Boolean) is
      C : Integer;
      A : Integer;
   begin
      --  (, line 130
      Z.Ket := Z.C;      --  [, line 131

      --  substring, line 131
      if Z.C - 3 <= Z.Lb or else (Character'Pos (Z.P (Z.C)) /= 140 and then Character'Pos (Z.P (Z.C)) /= 143) then
         Result := False;
         return;
         --  substring, line 131
      end if;
      Find_Among_Backward (Z, A_3, Among_String, null, A);
      if A = 0 then
         Result := False;
         return;
      end if;
      Z.Bra := Z.C;      --  ], line 131

      --  (, line 134
      --  delete, line 134
      Slice_Del (Z);

      Result := True;
   end R_Reflexive;

   procedure R_Verb (Z : in out Context_Type; Result : out Boolean) is
      C : Integer;
      A : Integer;
      v_1 : Integer;
   begin
      --  (, line 138
      Z.Ket := Z.C;      --  [, line 139

      --  substring, line 139
      Find_Among_Backward (Z, A_4, Among_String, null, A);
      if A = 0 then
         Result := False;
         return;
      end if;
      Z.Bra := Z.C;      --  ], line 139

      --  among, line 139
      case A is
         when 1 =>
            --  (, line 145
            --  or, line 145
            v_1 := Z.L - Z.C;
            --  literal, line 145
            C := Eq_S_Backward (Z, "а");
            if C = 0 then
               goto lab1;
            end if;
            Z.C := Z.C - C;
            goto lab0;

            <<lab1>>
            Z.C := Z.L - v_1;
            --  literal, line 145
            C := Eq_S_Backward (Z, "я");
            if C = 0 then
               Result := False;
               return;
            end if;
            Z.C := Z.C - C;

            <<lab0>>
            --  delete, line 145
            Slice_Del (Z);
         when 2 =>
            --  (, line 153
            --  delete, line 153
            Slice_Del (Z);
         when others =>
            null;
      end case;

      Result := True;
   end R_Verb;

   procedure R_Noun (Z : in out Context_Type; Result : out Boolean) is
      C : Integer;
      A : Integer;
   begin
      --  (, line 161
      Z.Ket := Z.C;      --  [, line 162

      --  substring, line 162
      Find_Among_Backward (Z, A_5, Among_String, null, A);
      if A = 0 then
         Result := False;
         return;
      end if;
      Z.Bra := Z.C;      --  ], line 162

      --  (, line 169
      --  delete, line 169
      Slice_Del (Z);

      Result := True;
   end R_Noun;

   procedure R_Derivational (Z : in out Context_Type; Result : out Boolean) is
      C : Integer;
      A : Integer;
   begin
      --  (, line 177
      Z.Ket := Z.C;      --  [, line 178

      --  substring, line 178
      if Z.C - 5 <= Z.Lb or else (Character'Pos (Z.P (Z.C)) /= 130 and then Character'Pos (Z.P (Z.C)) /= 140) then
         Result := False;
         return;
         --  substring, line 178
      end if;
      Find_Among_Backward (Z, A_6, Among_String, null, A);
      if A = 0 then
         Result := False;
         return;
      end if;
      Z.Bra := Z.C;      --  ], line 178

      --  call R2, line 178
      R_R2 (Z, Result);
      if not Result then
         Result := False;
         return;
      end if;
      --  (, line 181
      --  delete, line 181
      Slice_Del (Z);

      Result := True;
   end R_Derivational;

   procedure R_Tidy_up (Z : in out Context_Type; Result : out Boolean) is
      C : Integer;
      A : Integer;
   begin
      --  (, line 185
      Z.Ket := Z.C;      --  [, line 186

      --  substring, line 186
      Find_Among_Backward (Z, A_7, Among_String, null, A);
      if A = 0 then
         Result := False;
         return;
      end if;
      Z.Bra := Z.C;      --  ], line 186

      --  among, line 186
      case A is
         when 1 =>
            --  (, line 190
            --  delete, line 190
            Slice_Del (Z);
            Z.Ket := Z.C;            --  [, line 191

            --  literal, line 191
            C := Eq_S_Backward (Z, "н");
            if C = 0 then
               Result := False;
               return;
            end if;
            Z.C := Z.C - C;
            Z.Bra := Z.C;            --  ], line 191

            --  literal, line 191
            C := Eq_S_Backward (Z, "н");
            if C = 0 then
               Result := False;
               return;
            end if;
            Z.C := Z.C - C;
            --  delete, line 191
            Slice_Del (Z);
         when 2 =>
            --  (, line 194
            --  literal, line 194
            C := Eq_S_Backward (Z, "н");
            if C = 0 then
               Result := False;
               return;
            end if;
            Z.C := Z.C - C;
            --  delete, line 194
            Slice_Del (Z);
         when 3 =>
            --  (, line 196
            --  delete, line 196
            Slice_Del (Z);
         when others =>
            null;
      end case;

      Result := True;
   end R_Tidy_up;

   procedure Stem (Z : in out Context_Type; Result : out Boolean) is
      C : Integer;
      A : Integer;
      v_1 : Integer;
      v_2 : Integer;
      v_3 : Integer;
      v_6 : Integer;
      v_7 : Integer;
      v_8 : Integer;
      v_9 : Integer;
      v_10 : Integer;
      v_11 : Integer;
      v_12 : Integer;
      v_13 : Integer;
   begin
      --  (, line 201
      --  do, line 205
      v_1 := Z.C;
      --  repeat, line 205

      <<lab1>>

      loop
         v_2 := Z.C;
         --  (, line 205
         --  goto, line 205
         loop
            v_3 := Z.C;
            --  (, line 205
            Z.Bra := Z.C;            --  [, line 205

            --  literal, line 205
            C := Eq_S (Z, "ё");
            if C = 0 then
               goto lab4;
            end if;
            Z.C := Z.C + C;
            Z.Ket := Z.C;            --  ], line 205

            Z.C := v_3;
            exit;

            <<lab4>>
            Z.C := v_3;
            if Z.C >= Z.L then
               goto lab2;
            end if;
            --  goto, line 205
            C := Skip_Utf8 (Z, 1);
            if C < 0 then
               goto lab2;
            end if;
            Z.C := C;
         end loop;
         --  <-, line 205
         Slice_From (Z, "е");
         goto lab1;

         <<lab2>>
         Z.C := v_2;

         exit;
      end loop;

      <<lab0>>
      Z.C := v_1;
      --  do, line 207
      --  call mark_regions, line 207
      R_Mark_regions (Z, Result);
      Z.Lb := Z.C; Z.C := Z.L;      --  backwards, line 208

      if Z.C < Z.I_PV then
         Result := False;
         return;
      end if;
      v_6 := Z.Lb; Z.Lb := Z.I_PV;
      --  (, line 208
      --  do, line 209
      v_7 := Z.L - Z.C;
      --  (, line 209
      --  or, line 210
      v_8 := Z.L - Z.C;
      --  call perfective_gerund, line 210
      R_Perfective_gerund (Z, Result);
      if not Result then
         goto lab7;
      end if;
      goto lab6;

      <<lab7>>
      Z.C := Z.L - v_8;
      --  (, line 211
      --  try, line 211
      v_9 := Z.L - Z.C;
      --  call reflexive, line 211
      R_Reflexive (Z, Result);
      if not Result then
         Z.C := Z.L - v_9;
         goto lab8;
      end if;

      <<lab8>>
      --  or, line 212
      v_10 := Z.L - Z.C;
      --  call adjectival, line 212
      R_Adjectival (Z, Result);
      if not Result then
         goto lab10;
      end if;
      goto lab9;

      <<lab10>>
      Z.C := Z.L - v_10;
      --  call verb, line 212
      R_Verb (Z, Result);
      if not Result then
         goto lab11;
      end if;
      goto lab9;

      <<lab11>>
      Z.C := Z.L - v_10;
      --  call noun, line 212
      R_Noun (Z, Result);
      if not Result then
         goto lab5;
      end if;

      <<lab9>>

      <<lab6>>

      <<lab5>>
      Z.C := Z.L - v_7;
      --  try, line 215
      v_11 := Z.L - Z.C;
      --  (, line 215
      Z.Ket := Z.C;      --  [, line 215

      --  literal, line 215
      C := Eq_S_Backward (Z, "и");
      if C = 0 then
         Z.C := Z.L - v_11;
         goto lab12;
      end if;
      Z.C := Z.C - C;
      Z.Bra := Z.C;      --  ], line 215

      --  delete, line 215
      Slice_Del (Z);

      <<lab12>>
      --  do, line 218
      v_12 := Z.L - Z.C;
      --  call derivational, line 218
      R_Derivational (Z, Result);
      Z.C := Z.L - v_12;
      --  do, line 219
      v_13 := Z.L - Z.C;
      --  call tidy_up, line 219
      R_Tidy_up (Z, Result);
      Z.C := Z.L - v_13;
      Z.Lb := v_6;
      Z.C := Z.Lb;

      Result := True;
   end Stem;
end Stemmer.Russian;
