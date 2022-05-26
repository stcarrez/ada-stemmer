--  Generated by Snowball 2.2.0 - https://snowballstem.org/

package body Stemmer.Spanish is

   pragma Style_Checks ("-mr");
   pragma Warnings (Off, "*variable*is never read and never assigned*");
   pragma Warnings (Off, "*mode could be*instead of*");
   pragma Warnings (Off, "*formal parameter.*is not modified*");
   pragma Warnings (Off, "*this line is too long*");
   pragma Warnings (Off, "*is not referenced*");

   procedure R_Residual_suffix (Z : in out Context_Type; Result : out Boolean);
   procedure R_Verb_suffix (Z : in out Context_Type; Result : out Boolean);
   procedure R_Y_verb_suffix (Z : in out Context_Type; Result : out Boolean);
   procedure R_Standard_suffix (Z : in out Context_Type; Result : out Boolean);
   procedure R_Attached_pronoun (Z : in out Context_Type; Result : out Boolean);
   procedure R_R2 (Z : in out Context_Type; Result : out Boolean);
   procedure R_R1 (Z : in out Context_Type; Result : out Boolean);
   procedure R_RV (Z : in out Context_Type; Result : out Boolean);
   procedure R_Mark_regions (Z : in out Context_Type; Result : out Boolean);
   procedure R_Postlude (Z : in out Context_Type; Result : out Boolean);

   G_V : constant Grouping_Array (0 .. 159) := (
      True, False, False, False, True, False, False, False,
      True, False, False, False, False, False, True, False,
      False, False, False, False, True, False, False, False,
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
      False, False, False, False, False, False, False, False,
      True, False, False, False, False, False, False, False,
      True, False, False, False, True, False, False, False,
      False, False, True, False, False, False, False, False,
      False, True, False, True, False, False, False, False
   );
   Among_String : constant String := "" & "á" & "é" & "í" & "ó" & "ú" & "la" & "sela" & "le" & "me" & "se" & "lo"
      & "selo" & "las" & "selas" & "les" & "los" & "selos" & "nos" & "ando" & "iendo"
      & "yendo" & "ándo" & "iéndo" & "ar" & "er" & "ir" & "ár" & "ér" & "ír"
      & "ic" & "ad" & "os" & "iv" & "able" & "ible" & "ante" & "ic" & "abil" & "iv"
      & "ica" & "ancia" & "encia" & "adora" & "osa" & "ista" & "iva" & "anza"
      & "logía" & "idad" & "able" & "ible" & "ante" & "mente" & "amente" & "ación"
      & "ución" & "ico" & "ismo" & "oso" & "amiento" & "imiento" & "ivo" & "ador"
      & "icas" & "ancias" & "encias" & "adoras" & "osas" & "istas" & "ivas" & "anzas"
      & "logías" & "idades" & "ables" & "ibles" & "aciones" & "uciones" & "adores"
      & "antes" & "icos" & "ismos" & "osos" & "amientos" & "imientos" & "ivos" & "ya"
      & "ye" & "yan" & "yen" & "yeron" & "yendo" & "yo" & "yas" & "yes" & "yais"
      & "yamos" & "yó" & "aba" & "ada" & "ida" & "ara" & "iera" & "ía" & "aría"
      & "ería" & "iría" & "ad" & "ed" & "id" & "ase" & "iese" & "aste" & "iste"
      & "an" & "aban" & "aran" & "ieran" & "ían" & "arían" & "erían" & "irían"
      & "en" & "asen" & "iesen" & "aron" & "ieron" & "arán" & "erán" & "irán"
      & "ado" & "ido" & "ando" & "iendo" & "ar" & "er" & "ir" & "as" & "abas" & "adas"
      & "idas" & "aras" & "ieras" & "ías" & "arías" & "erías" & "irías" & "es"
      & "ases" & "ieses" & "abais" & "arais" & "ierais" & "íais" & "aríais"
      & "eríais" & "iríais" & "aseis" & "ieseis" & "asteis" & "isteis" & "áis"
      & "éis" & "aréis" & "eréis" & "iréis" & "ados" & "idos" & "amos" & "ábamos"
      & "áramos" & "iéramos" & "íamos" & "aríamos" & "eríamos" & "iríamos"
      & "emos" & "aremos" & "eremos" & "iremos" & "ásemos" & "iésemos" & "imos"
      & "arás" & "erás" & "irás" & "ís" & "ará" & "erá" & "irá" & "aré"
      & "eré" & "iré" & "ió" & "a" & "e" & "o" & "os" & "á" & "é" & "í" & "ó";

   A_0 : constant Among_Array_Type (0 .. 5) := (
      (1, 0, -1, 6, 0),
      (1, 2, 0, 1, 0),
      (3, 4, 0, 2, 0),
      (5, 6, 0, 3, 0),
      (7, 8, 0, 4, 0),
      (9, 10, 0, 5, 0));

   A_1 : constant Among_Array_Type (0 .. 12) := (
      (11, 12, -1, -1, 0),
      (13, 16, 0, -1, 0),
      (17, 18, -1, -1, 0),
      (19, 20, -1, -1, 0),
      (21, 22, -1, -1, 0),
      (23, 24, -1, -1, 0),
      (25, 28, 5, -1, 0),
      (29, 31, -1, -1, 0),
      (32, 36, 7, -1, 0),
      (37, 39, -1, -1, 0),
      (40, 42, -1, -1, 0),
      (43, 47, 10, -1, 0),
      (48, 50, -1, -1, 0));

   A_2 : constant Among_Array_Type (0 .. 10) := (
      (51, 54, -1, 6, 0),
      (55, 59, -1, 6, 0),
      (60, 64, -1, 7, 0),
      (65, 69, -1, 2, 0),
      (70, 75, -1, 1, 0),
      (76, 77, -1, 6, 0),
      (78, 79, -1, 6, 0),
      (80, 81, -1, 6, 0),
      (82, 84, -1, 3, 0),
      (85, 87, -1, 4, 0),
      (88, 90, -1, 5, 0));

   A_3 : constant Among_Array_Type (0 .. 3) := (
      (91, 92, -1, -1, 0),
      (93, 94, -1, -1, 0),
      (95, 96, -1, -1, 0),
      (97, 98, -1, 1, 0));

   A_4 : constant Among_Array_Type (0 .. 2) := (
      (99, 102, -1, 1, 0),
      (103, 106, -1, 1, 0),
      (107, 110, -1, 1, 0));

   A_5 : constant Among_Array_Type (0 .. 2) := (
      (111, 112, -1, 1, 0),
      (113, 116, -1, 1, 0),
      (117, 118, -1, 1, 0));

   A_6 : constant Among_Array_Type (0 .. 45) := (
      (119, 121, -1, 1, 0),
      (122, 126, -1, 2, 0),
      (127, 131, -1, 5, 0),
      (132, 136, -1, 2, 0),
      (137, 139, -1, 1, 0),
      (140, 143, -1, 1, 0),
      (144, 146, -1, 9, 0),
      (147, 150, -1, 1, 0),
      (151, 156, -1, 3, 0),
      (157, 160, -1, 8, 0),
      (161, 164, -1, 1, 0),
      (165, 168, -1, 1, 0),
      (169, 172, -1, 2, 0),
      (173, 177, -1, 7, 0),
      (178, 183, 13, 6, 0),
      (184, 189, -1, 2, 0),
      (190, 195, -1, 4, 0),
      (196, 198, -1, 1, 0),
      (199, 202, -1, 1, 0),
      (203, 205, -1, 1, 0),
      (206, 212, -1, 1, 0),
      (213, 219, -1, 1, 0),
      (220, 222, -1, 9, 0),
      (223, 226, -1, 2, 0),
      (227, 230, -1, 1, 0),
      (231, 236, -1, 2, 0),
      (237, 242, -1, 5, 0),
      (243, 248, -1, 2, 0),
      (249, 252, -1, 1, 0),
      (253, 257, -1, 1, 0),
      (258, 261, -1, 9, 0),
      (262, 266, -1, 1, 0),
      (267, 273, -1, 3, 0),
      (274, 279, -1, 8, 0),
      (280, 284, -1, 1, 0),
      (285, 289, -1, 1, 0),
      (290, 296, -1, 2, 0),
      (297, 303, -1, 4, 0),
      (304, 309, -1, 2, 0),
      (310, 314, -1, 2, 0),
      (315, 318, -1, 1, 0),
      (319, 323, -1, 1, 0),
      (324, 327, -1, 1, 0),
      (328, 335, -1, 1, 0),
      (336, 343, -1, 1, 0),
      (344, 347, -1, 9, 0));

   A_7 : constant Among_Array_Type (0 .. 11) := (
      (348, 349, -1, 1, 0),
      (350, 351, -1, 1, 0),
      (352, 354, -1, 1, 0),
      (355, 357, -1, 1, 0),
      (358, 362, -1, 1, 0),
      (363, 367, -1, 1, 0),
      (368, 369, -1, 1, 0),
      (370, 372, -1, 1, 0),
      (373, 375, -1, 1, 0),
      (376, 379, -1, 1, 0),
      (380, 384, -1, 1, 0),
      (385, 387, -1, 1, 0));

   A_8 : constant Among_Array_Type (0 .. 95) := (
      (388, 390, -1, 2, 0),
      (391, 393, -1, 2, 0),
      (394, 396, -1, 2, 0),
      (397, 399, -1, 2, 0),
      (400, 403, -1, 2, 0),
      (404, 406, -1, 2, 0),
      (407, 411, 5, 2, 0),
      (412, 416, 5, 2, 0),
      (417, 421, 5, 2, 0),
      (422, 423, -1, 2, 0),
      (424, 425, -1, 2, 0),
      (426, 427, -1, 2, 0),
      (428, 430, -1, 2, 0),
      (431, 434, -1, 2, 0),
      (435, 438, -1, 2, 0),
      (439, 442, -1, 2, 0),
      (443, 444, -1, 2, 0),
      (445, 448, 16, 2, 0),
      (449, 452, 16, 2, 0),
      (453, 457, 16, 2, 0),
      (458, 461, 16, 2, 0),
      (462, 467, 20, 2, 0),
      (468, 473, 20, 2, 0),
      (474, 479, 20, 2, 0),
      (480, 481, -1, 1, 0),
      (482, 485, 24, 2, 0),
      (486, 490, 24, 2, 0),
      (491, 494, -1, 2, 0),
      (495, 499, -1, 2, 0),
      (500, 504, -1, 2, 0),
      (505, 509, -1, 2, 0),
      (510, 514, -1, 2, 0),
      (515, 517, -1, 2, 0),
      (518, 520, -1, 2, 0),
      (521, 524, -1, 2, 0),
      (525, 529, -1, 2, 0),
      (530, 531, -1, 2, 0),
      (532, 533, -1, 2, 0),
      (534, 535, -1, 2, 0),
      (536, 537, -1, 2, 0),
      (538, 541, 39, 2, 0),
      (542, 545, 39, 2, 0),
      (546, 549, 39, 2, 0),
      (550, 553, 39, 2, 0),
      (554, 558, 39, 2, 0),
      (559, 562, 39, 2, 0),
      (563, 568, 45, 2, 0),
      (569, 574, 45, 2, 0),
      (575, 580, 45, 2, 0),
      (581, 582, -1, 1, 0),
      (583, 586, 49, 2, 0),
      (587, 591, 49, 2, 0),
      (592, 596, -1, 2, 0),
      (597, 601, -1, 2, 0),
      (602, 607, -1, 2, 0),
      (608, 612, -1, 2, 0),
      (613, 619, 55, 2, 0),
      (620, 626, 55, 2, 0),
      (627, 633, 55, 2, 0),
      (634, 638, -1, 2, 0),
      (639, 644, -1, 2, 0),
      (645, 650, -1, 2, 0),
      (651, 656, -1, 2, 0),
      (657, 660, -1, 2, 0),
      (661, 664, -1, 1, 0),
      (665, 670, 64, 2, 0),
      (671, 676, 64, 2, 0),
      (677, 682, 64, 2, 0),
      (683, 686, -1, 2, 0),
      (687, 690, -1, 2, 0),
      (691, 694, -1, 2, 0),
      (695, 701, 70, 2, 0),
      (702, 708, 70, 2, 0),
      (709, 716, 70, 2, 0),
      (717, 722, 70, 2, 0),
      (723, 730, 74, 2, 0),
      (731, 738, 74, 2, 0),
      (739, 746, 74, 2, 0),
      (747, 750, -1, 1, 0),
      (751, 756, 78, 2, 0),
      (757, 762, 78, 2, 0),
      (763, 768, 78, 2, 0),
      (769, 775, 78, 2, 0),
      (776, 783, 78, 2, 0),
      (784, 787, -1, 2, 0),
      (788, 792, -1, 2, 0),
      (793, 797, -1, 2, 0),
      (798, 802, -1, 2, 0),
      (803, 805, -1, 2, 0),
      (806, 809, -1, 2, 0),
      (810, 813, -1, 2, 0),
      (814, 817, -1, 2, 0),
      (818, 821, -1, 2, 0),
      (822, 825, -1, 2, 0),
      (826, 829, -1, 2, 0),
      (830, 832, -1, 2, 0));

   A_9 : constant Among_Array_Type (0 .. 7) := (
      (833, 833, -1, 1, 0),
      (834, 834, -1, 2, 0),
      (835, 835, -1, 1, 0),
      (836, 837, -1, 1, 0),
      (838, 839, -1, 1, 0),
      (840, 841, -1, 2, 0),
      (842, 843, -1, 1, 0),
      (844, 845, -1, 1, 0));


   procedure R_Mark_regions (Z : in out Context_Type; Result : out Boolean) is
      C : Result_Index;
      A : Integer;
      v_1 : Char_Index;
      v_2 : Char_Index;
      v_3 : Char_Index;
      v_4 : Char_Index;
      v_5 : Char_Index;
   begin
      --  (, line 31
      Z.I_PV := Z.L;
      Z.I_P1 := Z.L;
      Z.I_P2 := Z.L;
      --  do, line 37
      v_1 := Z.C;
      --  (, line 37
      --  or, line 39
      v_2 := Z.C;
      --  (, line 38
      In_Grouping (Z, G_V, 97, 252, False, C);
      if C /= 0 then
         goto lab2;
      end if;
      --  or, line 38
      v_3 := Z.C;
      --  (, line 38
      Out_Grouping (Z, G_V, 97, 252, False, C);
      if C /= 0 then
         goto lab4;
      end if;
            --  gopast, line 38
      --  grouping v, line 38
      Out_Grouping (Z, G_V, 97, 252, True, C);
      if C < 0 then
         goto lab4;
      end if;
      Z.C := Z.C + C;
      goto lab3;

      <<lab4>>
      Z.C := v_3;
      --  (, line 38
      In_Grouping (Z, G_V, 97, 252, False, C);
      if C /= 0 then
         goto lab2;
      end if;
            --  gopast, line 38
      --  non v, line 38
      In_Grouping (Z, G_V, 97, 252, True, C);
      if C < 0 then
         goto lab2;
      end if;
      Z.C := Z.C + C;

      <<lab3>>
      goto lab1;

      <<lab2>>
      Z.C := v_2;
      --  (, line 40
      Out_Grouping (Z, G_V, 97, 252, False, C);
      if C /= 0 then
         goto lab0;
      end if;
      --  or, line 40
      v_4 := Z.C;
      --  (, line 40
      Out_Grouping (Z, G_V, 97, 252, False, C);
      if C /= 0 then
         goto lab8;
      end if;
            --  gopast, line 40
      --  grouping v, line 40
      Out_Grouping (Z, G_V, 97, 252, True, C);
      if C < 0 then
         goto lab8;
      end if;
      Z.C := Z.C + C;
      goto lab7;

      <<lab8>>
      Z.C := v_4;
      --  (, line 40
      In_Grouping (Z, G_V, 97, 252, False, C);
      if C /= 0 then
         goto lab0;
      end if;
      --  next, line 40
      C := Skip_Utf8 (Z);
      if C < 0 then
         goto lab0;
      end if;
      Z.C := C;

      <<lab7>>

      <<lab1>>
      --  setmark pV, line 41
      Z.I_PV := Z.C;

      <<lab0>>
      Z.C := v_1;
      --  do, line 43
      v_5 := Z.C;
      --  (, line 43
            --  gopast, line 44
      --  grouping v, line 44
      Out_Grouping (Z, G_V, 97, 252, True, C);
      if C < 0 then
         goto lab10;
      end if;
      Z.C := Z.C + C;
            --  gopast, line 44
      --  non v, line 44
      In_Grouping (Z, G_V, 97, 252, True, C);
      if C < 0 then
         goto lab10;
      end if;
      Z.C := Z.C + C;
      --  setmark p1, line 44
      Z.I_P1 := Z.C;
            --  gopast, line 45
      --  grouping v, line 45
      Out_Grouping (Z, G_V, 97, 252, True, C);
      if C < 0 then
         goto lab10;
      end if;
      Z.C := Z.C + C;
            --  gopast, line 45
      --  non v, line 45
      In_Grouping (Z, G_V, 97, 252, True, C);
      if C < 0 then
         goto lab10;
      end if;
      Z.C := Z.C + C;
      --  setmark p2, line 45
      Z.I_P2 := Z.C;

      <<lab10>>
      Z.C := v_5;

      Result := True;
   end R_Mark_regions;

   procedure R_Postlude (Z : in out Context_Type; Result : out Boolean) is
      C : Result_Index;
      A : Integer;
      v_1 : Char_Index;
   begin
      --  repeat, line 49

      <<lab0>>

      loop
         v_1 := Z.C;
         --  (, line 49
         Z.Bra := Z.C;         --  [, line 50

         --  substring, line 50
         if Z.C + 1 >= Z.L or else Check_Among (Z, Z.C + 1, 5, 16#4082202#) then
            A := 6;
         else            --  substring, line 50
            Find_Among (Z, A_0, Among_String, null, A);
            if A = 0 then
               goto lab1;
            end if;
         end if;
         Z.Ket := Z.C;         --  ], line 50

         --  among, line 50
         case A is
            when 1 =>
               --  (, line 51
               --  <-, line 51
               Slice_From (Z, "a");
            when 2 =>
               --  (, line 52
               --  <-, line 52
               Slice_From (Z, "e");
            when 3 =>
               --  (, line 53
               --  <-, line 53
               Slice_From (Z, "i");
            when 4 =>
               --  (, line 54
               --  <-, line 54
               Slice_From (Z, "o");
            when 5 =>
               --  (, line 55
               --  <-, line 55
               Slice_From (Z, "u");
            when 6 =>
               --  (, line 57
               --  next, line 57
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

   procedure R_RV (Z : in out Context_Type; Result : out Boolean) is
   begin
      Result := (Z.I_PV <= Z.C);
   end R_RV;

   procedure R_R1 (Z : in out Context_Type; Result : out Boolean) is
   begin
      Result := (Z.I_P1 <= Z.C);
   end R_R1;

   procedure R_R2 (Z : in out Context_Type; Result : out Boolean) is
   begin
      Result := (Z.I_P2 <= Z.C);
   end R_R2;

   procedure R_Attached_pronoun (Z : in out Context_Type; Result : out Boolean) is
      C : Result_Index;
      A : Integer;
   begin
      --  (, line 67
      Z.Ket := Z.C;      --  [, line 68

      --  substring, line 68
      if Z.C - 1 <= Z.Lb or else Check_Among (Z, Z.C - 1, 3, 16#88022#) then
         Result := False;
         return;
         --  substring, line 68
      end if;
      Find_Among_Backward (Z, A_1, Among_String, null, A);
      if A = 0 then
         Result := False;
         return;
      end if;
      Z.Bra := Z.C;      --  ], line 68

      --  substring, line 72
      if Z.C - 1 <= Z.Lb or else (Character'Pos (Z.P (Z.C)) /= 111 and then Character'Pos (Z.P (Z.C)) /= 114) then
         Result := False;
         return;
         --  substring, line 72
      end if;
      Find_Among_Backward (Z, A_2, Among_String, null, A);
      if A = 0 then
         Result := False;
         return;
      end if;
      --  call RV, line 72
      R_RV (Z, Result);
      if not Result then
         Result := False;
         return;
      end if;
      --  among, line 72
      case A is
         when 1 =>
            --  (, line 73
            Z.Bra := Z.C;            --  ], line 73

            --  <-, line 73
            Slice_From (Z, "iendo");
         when 2 =>
            --  (, line 74
            Z.Bra := Z.C;            --  ], line 74

            --  <-, line 74
            Slice_From (Z, "ando");
         when 3 =>
            --  (, line 75
            Z.Bra := Z.C;            --  ], line 75

            --  <-, line 75
            Slice_From (Z, "ar");
         when 4 =>
            --  (, line 76
            Z.Bra := Z.C;            --  ], line 76

            --  <-, line 76
            Slice_From (Z, "er");
         when 5 =>
            --  (, line 77
            Z.Bra := Z.C;            --  ], line 77

            --  <-, line 77
            Slice_From (Z, "ir");
         when 6 =>
            --  (, line 81
            --  delete, line 81
            Slice_Del (Z);
         when 7 =>
            --  (, line 82
            --  literal, line 82
            C := Eq_S_Backward (Z, "u");
            if C = 0 then
               Result := False;
               return;
            end if;
            Z.C := Z.C - C;
            --  delete, line 82
            Slice_Del (Z);
         when others =>
            null;
      end case;

      Result := True;
   end R_Attached_pronoun;

   procedure R_Standard_suffix (Z : in out Context_Type; Result : out Boolean) is
      C : Result_Index;
      A : Integer;
      v_1 : Char_Index;
      v_2 : Char_Index;
      v_3 : Char_Index;
      v_4 : Char_Index;
      v_5 : Char_Index;
   begin
      --  (, line 86
      Z.Ket := Z.C;      --  [, line 87

      --  substring, line 87
      if Z.C - 2 <= Z.Lb or else Check_Among (Z, Z.C - 1, 3, 16#cc032#) then
         Result := False;
         return;
         --  substring, line 87
      end if;
      Find_Among_Backward (Z, A_6, Among_String, null, A);
      if A = 0 then
         Result := False;
         return;
      end if;
      Z.Bra := Z.C;      --  ], line 87

      --  among, line 87
      case A is
         when 1 =>
            --  (, line 98
            --  call R2, line 99
            R_R2 (Z, Result);
            if not Result then
               Result := False;
               return;
            end if;
            --  delete, line 99
            Slice_Del (Z);
         when 2 =>
            --  (, line 104
            --  call R2, line 105
            R_R2 (Z, Result);
            if not Result then
               Result := False;
               return;
            end if;
            --  delete, line 105
            Slice_Del (Z);
            --  try, line 106
            v_1 := Z.L - Z.C;
            --  (, line 106
            Z.Ket := Z.C;            --  [, line 106

            --  literal, line 106
            C := Eq_S_Backward (Z, "ic");
            if C = 0 then
               Z.C := Z.L - v_1;
               goto lab0;
            end if;
            Z.C := Z.C - C;
            Z.Bra := Z.C;            --  ], line 106

            --  call R2, line 106
            R_R2 (Z, Result);
            if not Result then
               Z.C := Z.L - v_1;
               goto lab0;
            end if;
            --  delete, line 106
            Slice_Del (Z);

            <<lab0>>
         when 3 =>
            --  (, line 110
            --  call R2, line 111
            R_R2 (Z, Result);
            if not Result then
               Result := False;
               return;
            end if;
            --  <-, line 111
            Slice_From (Z, "log");
         when 4 =>
            --  (, line 114
            --  call R2, line 115
            R_R2 (Z, Result);
            if not Result then
               Result := False;
               return;
            end if;
            --  <-, line 115
            Slice_From (Z, "u");
         when 5 =>
            --  (, line 118
            --  call R2, line 119
            R_R2 (Z, Result);
            if not Result then
               Result := False;
               return;
            end if;
            --  <-, line 119
            Slice_From (Z, "ente");
         when 6 =>
            --  (, line 122
            --  call R1, line 123
            R_R1 (Z, Result);
            if not Result then
               Result := False;
               return;
            end if;
            --  delete, line 123
            Slice_Del (Z);
            --  try, line 124
            v_2 := Z.L - Z.C;
            --  (, line 124
            Z.Ket := Z.C;            --  [, line 125

            --  substring, line 125
            if Z.C - 1 <= Z.Lb or else Check_Among (Z, Z.C - 1, 3, 16#480018#) then
               Z.C := Z.L - v_2;
               goto lab1;
               --  substring, line 125
            end if;
            Find_Among_Backward (Z, A_3, Among_String, null, A);
            if A = 0 then
               Z.C := Z.L - v_2;
               goto lab1;
            end if;
            Z.Bra := Z.C;            --  ], line 125

            --  call R2, line 125
            R_R2 (Z, Result);
            if not Result then
               Z.C := Z.L - v_2;
               goto lab1;
            end if;
            --  delete, line 125
            Slice_Del (Z);
            --  among, line 125
            case A is
               when 1 =>
                  --  (, line 126
                  Z.Ket := Z.C;                  --  [, line 126

                  --  literal, line 126
                  C := Eq_S_Backward (Z, "at");
                  if C = 0 then
                     Z.C := Z.L - v_2;
                     goto lab1;
                  end if;
                  Z.C := Z.C - C;
                  Z.Bra := Z.C;                  --  ], line 126

                  --  call R2, line 126
                  R_R2 (Z, Result);
                  if not Result then
                     Z.C := Z.L - v_2;
                     goto lab1;
                  end if;
                  --  delete, line 126
                  Slice_Del (Z);
               when others =>
                  null;
            end case;

            <<lab1>>
         when 7 =>
            --  (, line 134
            --  call R2, line 135
            R_R2 (Z, Result);
            if not Result then
               Result := False;
               return;
            end if;
            --  delete, line 135
            Slice_Del (Z);
            --  try, line 136
            v_3 := Z.L - Z.C;
            --  (, line 136
            Z.Ket := Z.C;            --  [, line 137

            --  substring, line 137
            if Z.C - 3 <= Z.Lb or else Character'Pos (Z.P (Z.C)) /= 101 then
               Z.C := Z.L - v_3;
               goto lab2;
               --  substring, line 137
            end if;
            Find_Among_Backward (Z, A_4, Among_String, null, A);
            if A = 0 then
               Z.C := Z.L - v_3;
               goto lab2;
            end if;
            Z.Bra := Z.C;            --  ], line 137

            --  (, line 140
            --  call R2, line 140
            R_R2 (Z, Result);
            if not Result then
               Z.C := Z.L - v_3;
               goto lab2;
            end if;
            --  delete, line 140
            Slice_Del (Z);

            <<lab2>>
         when 8 =>
            --  (, line 146
            --  call R2, line 147
            R_R2 (Z, Result);
            if not Result then
               Result := False;
               return;
            end if;
            --  delete, line 147
            Slice_Del (Z);
            --  try, line 148
            v_4 := Z.L - Z.C;
            --  (, line 148
            Z.Ket := Z.C;            --  [, line 149

            --  substring, line 149
            if Z.C - 1 <= Z.Lb or else Check_Among (Z, Z.C - 1, 3, 16#401008#) then
               Z.C := Z.L - v_4;
               goto lab3;
               --  substring, line 149
            end if;
            Find_Among_Backward (Z, A_5, Among_String, null, A);
            if A = 0 then
               Z.C := Z.L - v_4;
               goto lab3;
            end if;
            Z.Bra := Z.C;            --  ], line 149

            --  (, line 152
            --  call R2, line 152
            R_R2 (Z, Result);
            if not Result then
               Z.C := Z.L - v_4;
               goto lab3;
            end if;
            --  delete, line 152
            Slice_Del (Z);

            <<lab3>>
         when 9 =>
            --  (, line 158
            --  call R2, line 159
            R_R2 (Z, Result);
            if not Result then
               Result := False;
               return;
            end if;
            --  delete, line 159
            Slice_Del (Z);
            --  try, line 160
            v_5 := Z.L - Z.C;
            --  (, line 160
            Z.Ket := Z.C;            --  [, line 161

            --  literal, line 161
            C := Eq_S_Backward (Z, "at");
            if C = 0 then
               Z.C := Z.L - v_5;
               goto lab4;
            end if;
            Z.C := Z.C - C;
            Z.Bra := Z.C;            --  ], line 161

            --  call R2, line 161
            R_R2 (Z, Result);
            if not Result then
               Z.C := Z.L - v_5;
               goto lab4;
            end if;
            --  delete, line 161
            Slice_Del (Z);

            <<lab4>>
         when others =>
            null;
      end case;

      Result := True;
   end R_Standard_suffix;

   procedure R_Y_verb_suffix (Z : in out Context_Type; Result : out Boolean) is
      C : Result_Index;
      A : Integer;
      v_2 : Integer;
   begin
      --  (, line 167
      if Z.C < Z.I_PV then
         Result := False;
         return;
      end if;
      v_2 := Z.Lb; Z.Lb := Z.I_PV;
      --  (, line 168
      Z.Ket := Z.C;      --  [, line 168

      --  substring, line 168
      Find_Among_Backward (Z, A_7, Among_String, null, A);
      if A = 0 then
         Z.Lb := v_2;
         Result := False;
         return;
      end if;
      Z.Bra := Z.C;      --  ], line 168

      Z.Lb := v_2;
      --  (, line 171
      --  literal, line 171
      C := Eq_S_Backward (Z, "u");
      if C = 0 then
         Result := False;
         return;
      end if;
      Z.C := Z.C - C;
      --  delete, line 171
      Slice_Del (Z);

      Result := True;
   end R_Y_verb_suffix;

   procedure R_Verb_suffix (Z : in out Context_Type; Result : out Boolean) is
      C : Result_Index;
      A : Integer;
      v_2 : Integer;
      v_3 : Char_Index;
      v_4 : Char_Index;
   begin
      --  (, line 175
      if Z.C < Z.I_PV then
         Result := False;
         return;
      end if;
      v_2 := Z.Lb; Z.Lb := Z.I_PV;
      --  (, line 176
      Z.Ket := Z.C;      --  [, line 176

      --  substring, line 176
      Find_Among_Backward (Z, A_8, Among_String, null, A);
      if A = 0 then
         Z.Lb := v_2;
         Result := False;
         return;
      end if;
      Z.Bra := Z.C;      --  ], line 176

      Z.Lb := v_2;
      --  among, line 176
      case A is
         when 1 =>
            --  (, line 179
            --  try, line 179
            v_3 := Z.L - Z.C;
            --  (, line 179
            --  literal, line 179
            C := Eq_S_Backward (Z, "u");
            if C = 0 then
               Z.C := Z.L - v_3;
               goto lab0;
            end if;
            Z.C := Z.C - C;
            --  test, line 179
            v_4 := Z.L - Z.C;
            --  literal, line 179
            C := Eq_S_Backward (Z, "g");
            if C = 0 then
               Z.C := Z.L - v_3;
               goto lab0;
            end if;
            Z.C := Z.C - C;
            Z.C := Z.L - v_4;

            <<lab0>>
            Z.Bra := Z.C;            --  ], line 179

            --  delete, line 179
            Slice_Del (Z);
         when 2 =>
            --  (, line 200
            --  delete, line 200
            Slice_Del (Z);
         when others =>
            null;
      end case;

      Result := True;
   end R_Verb_suffix;

   procedure R_Residual_suffix (Z : in out Context_Type; Result : out Boolean) is
      C : Result_Index;
      A : Integer;
      v_1 : Char_Index;
      v_2 : Char_Index;
   begin
      --  (, line 204
      Z.Ket := Z.C;      --  [, line 205

      --  substring, line 205
      Find_Among_Backward (Z, A_9, Among_String, null, A);
      if A = 0 then
         Result := False;
         return;
      end if;
      Z.Bra := Z.C;      --  ], line 205

      --  among, line 205
      case A is
         when 1 =>
            --  (, line 208
            --  call RV, line 208
            R_RV (Z, Result);
            if not Result then
               Result := False;
               return;
            end if;
            --  delete, line 208
            Slice_Del (Z);
         when 2 =>
            --  (, line 210
            --  call RV, line 210
            R_RV (Z, Result);
            if not Result then
               Result := False;
               return;
            end if;
            --  delete, line 210
            Slice_Del (Z);
            --  try, line 210
            v_1 := Z.L - Z.C;
            --  (, line 210
            Z.Ket := Z.C;            --  [, line 210

            --  literal, line 210
            C := Eq_S_Backward (Z, "u");
            if C = 0 then
               Z.C := Z.L - v_1;
               goto lab0;
            end if;
            Z.C := Z.C - C;
            Z.Bra := Z.C;            --  ], line 210

            --  test, line 210
            v_2 := Z.L - Z.C;
            --  literal, line 210
            C := Eq_S_Backward (Z, "g");
            if C = 0 then
               Z.C := Z.L - v_1;
               goto lab0;
            end if;
            Z.C := Z.C - C;
            Z.C := Z.L - v_2;
            --  call RV, line 210
            R_RV (Z, Result);
            if not Result then
               Z.C := Z.L - v_1;
               goto lab0;
            end if;
            --  delete, line 210
            Slice_Del (Z);

            <<lab0>>
         when others =>
            null;
      end case;

      Result := True;
   end R_Residual_suffix;

   procedure Stem (Z : in out Context_Type; Result : out Boolean) is
      C : Result_Index;
      A : Integer;
      v_2 : Char_Index;
      v_3 : Char_Index;
      v_4 : Char_Index;
      v_5 : Char_Index;
      v_6 : Char_Index;
   begin
      --  (, line 215
      --  do, line 216
      --  call mark_regions, line 216
      R_Mark_regions (Z, Result);
      Z.Lb := Z.C; Z.C := Z.L;      --  backwards, line 217

      --  (, line 217
      --  do, line 218
      v_2 := Z.L - Z.C;
      --  call attached_pronoun, line 218
      R_Attached_pronoun (Z, Result);
      Z.C := Z.L - v_2;
      --  do, line 219
      v_3 := Z.L - Z.C;
      --  or, line 219
      v_4 := Z.L - Z.C;
      --  call standard_suffix, line 219
      R_Standard_suffix (Z, Result);
      if not Result then
         goto lab2;
      end if;
      goto lab1;

      <<lab2>>
      Z.C := Z.L - v_4;
      --  call y_verb_suffix, line 220
      R_Y_verb_suffix (Z, Result);
      if not Result then
         goto lab3;
      end if;
      goto lab1;

      <<lab3>>
      Z.C := Z.L - v_4;
      --  call verb_suffix, line 221
      R_Verb_suffix (Z, Result);
      if not Result then
         goto lab0;
      end if;

      <<lab1>>

      <<lab0>>
      Z.C := Z.L - v_3;
      --  do, line 223
      v_5 := Z.L - Z.C;
      --  call residual_suffix, line 223
      R_Residual_suffix (Z, Result);
      Z.C := Z.L - v_5;
      Z.C := Z.Lb;
      --  do, line 225
      v_6 := Z.C;
      --  call postlude, line 225
      R_Postlude (Z, Result);
      Z.C := v_6;

      Result := True;
   end Stem;
end Stemmer.Spanish;
