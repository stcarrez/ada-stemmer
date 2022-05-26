--  Generated by Snowball 2.2.0 - https://snowballstem.org/

package body Stemmer.Lithuanian is

   pragma Style_Checks ("-mr");
   pragma Warnings (Off, "*variable*is never read and never assigned*");
   pragma Warnings (Off, "*mode could be*instead of*");
   pragma Warnings (Off, "*formal parameter.*is not modified*");
   pragma Warnings (Off, "*this line is too long*");
   pragma Warnings (Off, "*is not referenced*");

   procedure R_Fix_conflicts (Z : in out Context_Type; Result : out Boolean);
   procedure R_Fix_gd (Z : in out Context_Type; Result : out Boolean);
   procedure R_Fix_chdz (Z : in out Context_Type; Result : out Boolean);
   procedure R_Step1 (Z : in out Context_Type; Result : out Boolean);
   procedure R_R1 (Z : in out Context_Type; Result : out Boolean);
   procedure R_Step2 (Z : in out Context_Type; Result : out Boolean);

   G_V : constant Grouping_Array (0 .. 279) := (
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
      False, False, False, False, False, False, False, False,
      False, False, False, False, False, False, False, False,
      False, False, False, False, False, False, False, False,
      False, False, False, False, False, False, False, False,
      False, False, False, False, True, False, False, False,
      False, False, False, False, False, False, False, False,
      False, False, False, False, False, False, True, False,
      True, False, False, False, False, False, False, False,
      False, False, False, False, False, False, False, False,
      False, False, False, False, False, False, True, False,
      False, False, False, False, False, False, False, False,
      False, False, False, False, False, False, False, False,
      False, False, False, False, False, False, False, False,
      False, False, False, False, False, False, False, False,
      False, False, False, False, False, False, False, False,
      False, False, False, False, False, False, False, False,
      False, False, False, False, False, False, False, False,
      False, False, True, False, False, False, False, False,
      False, False, True, False, False, False, False, False
   );
   Among_String : constant String := "a" & "ia" & "eria" & "osna" & "iosna"
      & "uosna" & "iuosna" & "ysna" & "ėsna" & "e" & "ie" & "enie" & "erie" & "oje"
      & "ioje" & "uje" & "iuje" & "yje" & "enyje" & "eryje" & "ėje" & "ame" & "iame"
      & "sime" & "ome" & "ėme" & "tumėme" & "ose" & "iose" & "uose" & "iuose" & "yse"
      & "enyse" & "eryse" & "ėse" & "ate" & "iate" & "ite" & "kite" & "site" & "ote"
      & "tute" & "ėte" & "tumėte" & "i" & "ai" & "iai" & "eriai" & "ei" & "tumei"
      & "ki" & "imi" & "erimi" & "umi" & "iumi" & "si" & "asi" & "iasi" & "esi"
      & "iesi" & "siesi" & "isi" & "aisi" & "eisi" & "tumeisi" & "uisi" & "osi"
      & "ėjosi" & "uosi" & "iuosi" & "siuosi" & "usi" & "ausi" & "čiausi" & "ąsi"
      & "ėsi" & "ųsi" & "tųsi" & "ti" & "enti" & "inti" & "oti" & "ioti" & "uoti"
      & "iuoti" & "auti" & "iauti" & "yti" & "ėti" & "telėti" & "inėti" & "terėti"
      & "ui" & "iui" & "eniui" & "oj" & "ėj" & "k" & "am" & "iam" & "iem" & "im"
      & "sim" & "om" & "tum" & "ėm" & "tumėm" & "an" & "on" & "ion" & "un" & "iun"
      & "ėn" & "o" & "io" & "enio" & "ėjo" & "uo" & "s" & "as" & "ias" & "es" & "ies"
      & "is" & "ais" & "iais" & "tumeis" & "imis" & "enimis" & "omis" & "iomis"
      & "umis" & "ėmis" & "enis" & "asis" & "ysis" & "ams" & "iams" & "iems" & "ims"
      & "enims" & "erims" & "oms" & "ioms" & "ums" & "ėms" & "ens" & "os" & "ios"
      & "uos" & "iuos" & "ers" & "us" & "aus" & "iaus" & "ius" & "ys" & "enys" & "erys"
      & "ąs" & "iąs" & "ės" & "amės" & "iamės" & "imės" & "kimės" & "simės"
      & "omės" & "ėmės" & "tumėmės" & "atės" & "iatės" & "sitės" & "otės"
      & "ėtės" & "tumėtės" & "ūs" & "įs" & "tųs" & "at" & "iat" & "it" & "sit"
      & "ot" & "ėt" & "tumėt" & "u" & "au" & "iau" & "čiau" & "iu" & "eniu" & "siu"
      & "y" & "ą" & "ią" & "ė" & "ę" & "į" & "enį" & "erį" & "ų" & "ių"
      & "erų" & "ing" & "aj" & "iaj" & "iej" & "oj" & "ioj" & "uoj" & "iuoj" & "auj"
      & "ąj" & "iąj" & "ėj" & "ųj" & "iųj" & "ok" & "iok" & "iuk" & "uliuk"
      & "učiuk" & "išk" & "iul" & "yl" & "ėl" & "am" & "dam" & "jam" & "zgan"
      & "ain" & "esn" & "op" & "iop" & "ias" & "ies" & "ais" & "iais" & "os" & "ios"
      & "uos" & "iuos" & "aus" & "iaus" & "ąs" & "iąs" & "ęs" & "utėait" & "ant"
      & "iant" & "siant" & "int" & "ot" & "uot" & "iuot" & "yt" & "ėt" & "ykšt"
      & "iau" & "dav" & "sv" & "šv" & "ykšč" & "ę" & "ėję" & "ojime" & "ėjime"
      & "avime" & "okate" & "aite" & "uote" & "asius" & "okatės" & "aitės" & "uotės"
      & "esiu" & "č" & "dž" & "gd";

   A_0 : constant Among_Array_Type (0 .. 203) := (
      (1, 1, -1, -1, 0),
      (2, 3, 0, -1, 0),
      (4, 7, 1, -1, 0),
      (8, 11, 0, -1, 0),
      (12, 16, 3, -1, 0),
      (17, 21, 3, -1, 0),
      (22, 27, 5, -1, 0),
      (28, 31, 0, -1, 0),
      (32, 36, 0, -1, 0),
      (37, 37, -1, -1, 0),
      (38, 39, 9, -1, 0),
      (40, 43, 10, -1, 0),
      (44, 47, 10, -1, 0),
      (48, 50, 9, -1, 0),
      (51, 54, 13, -1, 0),
      (55, 57, 9, -1, 0),
      (58, 61, 15, -1, 0),
      (62, 64, 9, -1, 0),
      (65, 69, 17, -1, 0),
      (70, 74, 17, -1, 0),
      (75, 78, 9, -1, 0),
      (79, 81, 9, -1, 0),
      (82, 85, 21, -1, 0),
      (86, 89, 9, -1, 0),
      (90, 92, 9, -1, 0),
      (93, 96, 9, -1, 0),
      (97, 103, 25, -1, 0),
      (104, 106, 9, -1, 0),
      (107, 110, 27, -1, 0),
      (111, 114, 27, -1, 0),
      (115, 119, 29, -1, 0),
      (120, 122, 9, -1, 0),
      (123, 127, 31, -1, 0),
      (128, 132, 31, -1, 0),
      (133, 136, 9, -1, 0),
      (137, 139, 9, -1, 0),
      (140, 143, 35, -1, 0),
      (144, 146, 9, -1, 0),
      (147, 150, 37, -1, 0),
      (151, 154, 37, -1, 0),
      (155, 157, 9, -1, 0),
      (158, 161, 9, -1, 0),
      (162, 165, 9, -1, 0),
      (166, 172, 42, -1, 0),
      (173, 173, -1, -1, 0),
      (174, 175, 44, -1, 0),
      (176, 178, 45, -1, 0),
      (179, 183, 46, -1, 0),
      (184, 185, 44, -1, 0),
      (186, 190, 48, -1, 0),
      (191, 192, 44, -1, 0),
      (193, 195, 44, -1, 0),
      (196, 200, 51, -1, 0),
      (201, 203, 44, -1, 0),
      (204, 207, 53, -1, 0),
      (208, 209, 44, -1, 0),
      (210, 212, 55, -1, 0),
      (213, 216, 56, -1, 0),
      (217, 219, 55, -1, 0),
      (220, 223, 58, -1, 0),
      (224, 228, 59, -1, 0),
      (229, 231, 55, -1, 0),
      (232, 235, 61, -1, 0),
      (236, 239, 61, -1, 0),
      (240, 246, 63, -1, 0),
      (247, 250, 61, -1, 0),
      (251, 253, 55, -1, 0),
      (254, 259, 66, -1, 0),
      (260, 263, 66, -1, 0),
      (264, 268, 68, -1, 0),
      (269, 274, 69, -1, 0),
      (275, 277, 55, -1, 0),
      (278, 281, 71, -1, 0),
      (282, 288, 72, -1, 0),
      (289, 292, 55, -1, 0),
      (293, 296, 55, -1, 0),
      (297, 300, 55, -1, 0),
      (301, 305, 76, -1, 0),
      (306, 307, 44, -1, 0),
      (308, 311, 78, -1, 0),
      (312, 315, 78, -1, 0),
      (316, 318, 78, -1, 0),
      (319, 322, 81, -1, 0),
      (323, 326, 81, -1, 0),
      (327, 331, 83, -1, 0),
      (332, 335, 78, -1, 0),
      (336, 340, 85, -1, 0),
      (341, 343, 78, -1, 0),
      (344, 347, 78, -1, 0),
      (348, 354, 88, -1, 0),
      (355, 360, 88, -1, 0),
      (361, 367, 88, -1, 0),
      (368, 369, 44, -1, 0),
      (370, 372, 92, -1, 0),
      (373, 377, 93, -1, 0),
      (378, 379, -1, -1, 0),
      (380, 382, -1, -1, 0),
      (383, 383, -1, -1, 0),
      (384, 385, -1, -1, 0),
      (386, 388, 98, -1, 0),
      (389, 391, -1, -1, 0),
      (392, 393, -1, -1, 0),
      (394, 396, 101, -1, 0),
      (397, 398, -1, -1, 0),
      (399, 401, -1, -1, 0),
      (402, 404, -1, -1, 0),
      (405, 410, 105, -1, 0),
      (411, 412, -1, -1, 0),
      (413, 414, -1, -1, 0),
      (415, 417, 108, -1, 0),
      (418, 419, -1, -1, 0),
      (420, 422, 110, -1, 0),
      (423, 425, -1, -1, 0),
      (426, 426, -1, -1, 0),
      (427, 428, 113, -1, 0),
      (429, 432, 114, -1, 0),
      (433, 436, 113, -1, 0),
      (437, 438, 113, -1, 0),
      (439, 439, -1, -1, 0),
      (440, 441, 118, -1, 0),
      (442, 444, 119, -1, 0),
      (445, 446, 118, -1, 0),
      (447, 449, 121, -1, 0),
      (450, 451, 118, -1, 0),
      (452, 454, 123, -1, 0),
      (455, 458, 124, -1, 0),
      (459, 464, 123, -1, 0),
      (465, 468, 123, -1, 0),
      (469, 474, 127, -1, 0),
      (475, 478, 123, -1, 0),
      (479, 483, 129, -1, 0),
      (484, 487, 123, -1, 0),
      (488, 492, 123, -1, 0),
      (493, 496, 123, -1, 0),
      (497, 500, 123, -1, 0),
      (501, 504, 123, -1, 0),
      (505, 507, 118, -1, 0),
      (508, 511, 136, -1, 0),
      (512, 515, 118, -1, 0),
      (516, 518, 118, -1, 0),
      (519, 523, 139, -1, 0),
      (524, 528, 139, -1, 0),
      (529, 531, 118, -1, 0),
      (532, 535, 142, -1, 0),
      (536, 538, 118, -1, 0),
      (539, 542, 118, -1, 0),
      (543, 545, 118, -1, 0),
      (546, 547, 118, -1, 0),
      (548, 550, 147, -1, 0),
      (551, 553, 147, -1, 0),
      (554, 557, 149, -1, 0),
      (558, 560, 118, -1, 0),
      (561, 562, 118, -1, 0),
      (563, 565, 152, -1, 0),
      (566, 569, 153, -1, 0),
      (570, 572, 152, -1, 0),
      (573, 574, 118, -1, 0),
      (575, 578, 156, -1, 0),
      (579, 582, 156, -1, 0),
      (583, 585, 118, -1, 0),
      (586, 589, 159, -1, 0),
      (590, 592, 118, -1, 0),
      (593, 597, 161, -1, 0),
      (598, 603, 162, -1, 0),
      (604, 608, 161, -1, 0),
      (609, 614, 164, -1, 0),
      (615, 620, 164, -1, 0),
      (621, 625, 161, -1, 0),
      (626, 631, 161, -1, 0),
      (632, 640, 168, -1, 0),
      (641, 645, 161, -1, 0),
      (646, 651, 170, -1, 0),
      (652, 657, 161, -1, 0),
      (658, 662, 161, -1, 0),
      (663, 668, 161, -1, 0),
      (669, 677, 174, -1, 0),
      (678, 680, 118, -1, 0),
      (681, 683, 118, -1, 0),
      (684, 687, 118, -1, 0),
      (688, 689, -1, -1, 0),
      (690, 692, 179, -1, 0),
      (693, 694, -1, -1, 0),
      (695, 697, 181, -1, 0),
      (698, 699, -1, -1, 0),
      (700, 702, -1, -1, 0),
      (703, 708, 184, -1, 0),
      (709, 709, -1, -1, 0),
      (710, 711, 186, -1, 0),
      (712, 714, 187, -1, 0),
      (715, 719, 188, -1, 0),
      (720, 721, 186, -1, 0),
      (722, 725, 190, -1, 0),
      (726, 728, 190, -1, 0),
      (729, 729, -1, -1, 0),
      (730, 731, -1, -1, 0),
      (732, 734, 194, -1, 0),
      (735, 736, -1, -1, 0),
      (737, 738, -1, -1, 0),
      (739, 740, -1, -1, 0),
      (741, 744, 198, -1, 0),
      (745, 748, 198, -1, 0),
      (749, 750, -1, -1, 0),
      (751, 753, 201, -1, 0),
      (754, 757, 201, -1, 0));

   A_1 : constant Among_Array_Type (0 .. 61) := (
      (758, 760, -1, -1, 0),
      (761, 762, -1, -1, 0),
      (763, 765, 1, -1, 0),
      (766, 768, -1, -1, 0),
      (769, 770, -1, -1, 0),
      (771, 773, 4, -1, 0),
      (774, 776, 4, -1, 0),
      (777, 780, 6, -1, 0),
      (781, 783, -1, -1, 0),
      (784, 786, -1, -1, 0),
      (787, 790, 9, -1, 0),
      (791, 793, -1, -1, 0),
      (794, 796, -1, -1, 0),
      (797, 800, 12, -1, 0),
      (801, 802, -1, -1, 0),
      (803, 805, 14, -1, 0),
      (806, 808, -1, -1, 0),
      (809, 813, 16, -1, 0),
      (814, 819, 16, -1, 0),
      (820, 823, -1, -1, 0),
      (824, 826, -1, -1, 0),
      (827, 828, -1, -1, 0),
      (829, 831, -1, -1, 0),
      (832, 833, -1, -1, 0),
      (834, 836, 23, -1, 0),
      (837, 839, 23, -1, 0),
      (840, 843, -1, -1, 0),
      (844, 846, -1, -1, 0),
      (847, 849, -1, -1, 0),
      (850, 851, -1, -1, 0),
      (852, 854, 29, -1, 0),
      (855, 857, -1, -1, 0),
      (858, 860, -1, -1, 0),
      (861, 863, -1, -1, 0),
      (864, 867, 33, -1, 0),
      (868, 869, -1, -1, 0),
      (870, 872, 35, -1, 0),
      (873, 875, 35, -1, 0),
      (876, 879, 37, -1, 0),
      (880, 882, -1, -1, 0),
      (883, 886, 39, -1, 0),
      (887, 889, -1, -1, 0),
      (890, 893, 41, -1, 0),
      (894, 896, -1, -1, 0),
      (897, 903, -1, -1, 0),
      (904, 906, -1, -1, 0),
      (907, 910, 45, -1, 0),
      (911, 915, 46, -1, 0),
      (916, 918, -1, -1, 0),
      (919, 920, -1, -1, 0),
      (921, 923, 49, -1, 0),
      (924, 927, 50, -1, 0),
      (928, 929, -1, -1, 0),
      (930, 932, -1, -1, 0),
      (933, 937, -1, -1, 0),
      (938, 940, -1, -1, 0),
      (941, 943, -1, -1, 0),
      (944, 945, -1, -1, 0),
      (946, 948, -1, -1, 0),
      (949, 954, -1, -1, 0),
      (955, 956, -1, -1, 0),
      (957, 961, 60, -1, 0));

   A_2 : constant Among_Array_Type (0 .. 10) := (
      (962, 966, -1, 7, 0),
      (967, 972, -1, 3, 0),
      (973, 977, -1, 6, 0),
      (978, 982, -1, 8, 0),
      (983, 986, -1, 1, 0),
      (987, 990, -1, 2, 0),
      (991, 995, -1, 5, 0),
      (996, 1002, -1, 8, 0),
      (1003, 1008, -1, 1, 0),
      (1009, 1014, -1, 2, 0),
      (1015, 1018, -1, 4, 0));

   A_3 : constant Among_Array_Type (0 .. 1) := (
      (1019, 1020, -1, 1, 0),
      (1021, 1023, -1, 2, 0));

   A_4 : constant Among_Array_Type (0 .. 0) := (
      others => (1024, 1025, -1, 1, 0));


   procedure R_R1 (Z : in out Context_Type; Result : out Boolean) is
   begin
      Result := (Z.I_P1 <= Z.C);
   end R_R1;

   procedure R_Step1 (Z : in out Context_Type; Result : out Boolean) is
      C : Result_Index;
      A : Integer;
      v_2 : Integer;
   begin
      --  (, line 44
      if Z.C < Z.I_P1 then
         Result := False;
         return;
      end if;
      v_2 := Z.Lb; Z.Lb := Z.I_P1;
      --  (, line 45
      Z.Ket := Z.C;      --  [, line 45

      --  substring, line 45
      Find_Among_Backward (Z, A_0, Among_String, null, A);
      if A = 0 then
         Z.Lb := v_2;
         Result := False;
         return;
      end if;
      Z.Bra := Z.C;      --  ], line 45

      Z.Lb := v_2;
      --  call R1, line 45
      R_R1 (Z, Result);
      if not Result then
         Result := False;
         return;
      end if;
      --  delete, line 229
      Slice_Del (Z);

      Result := True;
   end R_Step1;

   procedure R_Step2 (Z : in out Context_Type; Result : out Boolean) is
      C : Result_Index;
      A : Integer;
      v_1 : Char_Index;
      v_3 : Integer;
   begin
      --  repeat, line 232

      <<lab0>>

      loop
         v_1 := Z.L - Z.C;
         --  (, line 232
         if Z.C < Z.I_P1 then
            Result := False;
            return;
         end if;
         v_3 := Z.Lb; Z.Lb := Z.I_P1;
         --  (, line 233
         Z.Ket := Z.C;         --  [, line 233

         --  substring, line 233
         Find_Among_Backward (Z, A_1, Among_String, null, A);
         if A = 0 then
            Z.Lb := v_3;
            goto lab1;
         end if;
         Z.Bra := Z.C;         --  ], line 233

         Z.Lb := v_3;
         --  delete, line 303
         Slice_Del (Z);
         goto lab0;

         <<lab1>>
         Z.C := Z.L - v_1;

         exit;
      end loop;

      Result := True;
   end R_Step2;

   procedure R_Fix_conflicts (Z : in out Context_Type; Result : out Boolean) is
      C : Result_Index;
      A : Integer;
   begin
      --  (, line 306
      Z.Ket := Z.C;      --  [, line 307

      --  substring, line 307
      if Z.C - 3 <= Z.Lb or else Check_Among (Z, Z.C - 1, 3, 16#280020#) then
         Result := False;
         return;
         --  substring, line 307
      end if;
      Find_Among_Backward (Z, A_2, Among_String, null, A);
      if A = 0 then
         Result := False;
         return;
      end if;
      Z.Bra := Z.C;      --  ], line 307

      --  among, line 307
      case A is
         when 1 =>
            --  (, line 309
            --  <-, line 309
            Slice_From (Z, "aitė");
         when 2 =>
            --  (, line 314
            --  <-, line 314
            Slice_From (Z, "uotė");
         when 3 =>
            --  (, line 319
            --  <-, line 319
            Slice_From (Z, "ėjimas");
         when 4 =>
            --  (, line 322
            --  <-, line 322
            Slice_From (Z, "esys");
         when 5 =>
            --  (, line 324
            --  <-, line 324
            Slice_From (Z, "asys");
         when 6 =>
            --  (, line 327
            --  <-, line 327
            Slice_From (Z, "avimas");
         when 7 =>
            --  (, line 328
            --  <-, line 328
            Slice_From (Z, "ojimas");
         when 8 =>
            --  (, line 331
            --  <-, line 331
            Slice_From (Z, "okatė");
         when others =>
            null;
      end case;

      Result := True;
   end R_Fix_conflicts;

   procedure R_Fix_chdz (Z : in out Context_Type; Result : out Boolean) is
      C : Result_Index;
      A : Integer;
   begin
      --  (, line 337
      Z.Ket := Z.C;      --  [, line 338

      --  substring, line 338
      if Z.C - 1 <= Z.Lb or else (Character'Pos (Z.P (Z.C)) /= 141 and then Character'Pos (Z.P (Z.C)) /= 190) then
         Result := False;
         return;
         --  substring, line 338
      end if;
      Find_Among_Backward (Z, A_3, Among_String, null, A);
      if A = 0 then
         Result := False;
         return;
      end if;
      Z.Bra := Z.C;      --  ], line 338

      --  among, line 338
      case A is
         when 1 =>
            --  (, line 339
            --  <-, line 339
            Slice_From (Z, "t");
         when 2 =>
            --  (, line 340
            --  <-, line 340
            Slice_From (Z, "d");
         when others =>
            null;
      end case;

      Result := True;
   end R_Fix_chdz;

   procedure R_Fix_gd (Z : in out Context_Type; Result : out Boolean) is
      C : Result_Index;
      A : Integer;
   begin
      --  (, line 344
      Z.Ket := Z.C;      --  [, line 345

      --  substring, line 345
      if Z.C - 1 <= Z.Lb or else Character'Pos (Z.P (Z.C)) /= 100 then
         Result := False;
         return;
         --  substring, line 345
      end if;
      Find_Among_Backward (Z, A_4, Among_String, null, A);
      if A = 0 then
         Result := False;
         return;
      end if;
      Z.Bra := Z.C;      --  ], line 345

      --  (, line 346
      --  <-, line 346
      Slice_From (Z, "g");

      Result := True;
   end R_Fix_gd;

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
   begin
      --  (, line 353
      Z.I_P1 := Z.L;
      --  do, line 357
      v_1 := Z.C;
      --  (, line 357
      --  try, line 359
      v_2 := Z.C;
      --  (, line 359
      --  test, line 359
      v_3 := Z.C;
      --  literal, line 359
      C := Eq_S (Z, "a");
      if C = 0 then
         Z.C := v_2;
         goto lab1;
      end if;
      Z.C := Z.C + C;
      Z.C := v_3;
      if not (Length_Utf8 (Z) > 6) then
         Z.C := v_2;
         goto lab1;
      end if;
      C := Skip_Utf8 (Z, 1);      --  hop, line 359

      if C < 0 then
         Z.C := v_2;
         goto lab1;
      end if;
      Z.C := C;

      <<lab1>>
            --  gopast, line 361
      --  grouping v, line 361
      Out_Grouping (Z, G_V, 97, 371, True, C);
      if C < 0 then
         goto lab0;
      end if;
      Z.C := Z.C + C;
            --  gopast, line 361
      --  non v, line 361
      In_Grouping (Z, G_V, 97, 371, True, C);
      if C < 0 then
         goto lab0;
      end if;
      Z.C := Z.C + C;
      --  setmark p1, line 361
      Z.I_P1 := Z.C;

      <<lab0>>
      Z.C := v_1;
      Z.Lb := Z.C; Z.C := Z.L;      --  backwards, line 364

      --  (, line 364
      --  do, line 365
      v_4 := Z.L - Z.C;
      --  call fix_conflicts, line 365
      R_Fix_conflicts (Z, Result);
      Z.C := Z.L - v_4;
      --  do, line 366
      v_5 := Z.L - Z.C;
      --  call step1, line 366
      R_Step1 (Z, Result);
      Z.C := Z.L - v_5;
      --  do, line 367
      v_6 := Z.L - Z.C;
      --  call fix_chdz, line 367
      R_Fix_chdz (Z, Result);
      Z.C := Z.L - v_6;
      --  do, line 368
      v_7 := Z.L - Z.C;
      --  call step2, line 368
      R_Step2 (Z, Result);
      Z.C := Z.L - v_7;
      --  do, line 369
      v_8 := Z.L - Z.C;
      --  call fix_chdz, line 369
      R_Fix_chdz (Z, Result);
      Z.C := Z.L - v_8;
      --  do, line 370
      v_9 := Z.L - Z.C;
      --  call fix_gd, line 370
      R_Fix_gd (Z, Result);
      Z.C := Z.L - v_9;
      Z.C := Z.Lb;

      Result := True;
   end Stem;
end Stemmer.Lithuanian;
