--  Generated by Snowball 2.0.0 - https://snowballstem.org/

package body Stemmer.Irish is

   pragma Style_Checks ("-mr");
   pragma Warnings (Off, "*variable*is never read and never assigned*");
   pragma Warnings (Off, "*mode could be*instead of*");
   pragma Warnings (Off, "*formal parameter.*is not modified*");
   pragma Warnings (Off, "*this line is too long*");
   pragma Warnings (Off, "*is not referenced*");

   procedure R_Verb_sfx (Z : in out Context_Type; Result : out Boolean);
   procedure R_Deriv (Z : in out Context_Type; Result : out Boolean);
   procedure R_Noun_sfx (Z : in out Context_Type; Result : out Boolean);
   procedure R_Mark_regions (Z : in out Context_Type; Result : out Boolean);
   procedure R_Initial_morph (Z : in out Context_Type; Result : out Boolean);
   procedure R_RV (Z : in out Context_Type; Result : out Boolean);
   procedure R_R2 (Z : in out Context_Type; Result : out Boolean);
   procedure R_R1 (Z : in out Context_Type; Result : out Boolean);

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
      False, True, False, False, False, False, False, False
   );
   Among_String : constant String := "b'" & "bh" & "bhf" & "bp" & "ch" & "d'"
      & "d'fh" & "dh" & "dt" & "fh" & "gc" & "gh" & "h-" & "m'" & "mb" & "mh" & "n-"
      & "nd" & "ng" & "ph" & "sh" & "t-" & "th" & "ts" & "íochta" & "aíochta" & "ire"
      & "aire" & "abh" & "eabh" & "ibh" & "aibh" & "amh" & "eamh" & "imh" & "aimh"
      & "íocht" & "aíocht" & "irí" & "airí" & "óideacha" & "patacha" & "achta"
      & "arcachta" & "eachta" & "grafaíochta" & "paite" & "ach" & "each" & "óideach"
      & "gineach" & "patach" & "grafaíoch" & "pataigh" & "óidigh" & "achtúil"
      & "eachtúil" & "gineas" & "ginis" & "acht" & "arcacht" & "eacht" & "grafaíocht"
      & "arcachtaí" & "grafaíochtaí" & "imid" & "aimid" & "ímid" & "aímid" & "adh"
      & "eadh" & "faidh" & "fidh" & "áil" & "ain" & "tear" & "tar";

   A_0 : constant Among_Array_Type (0 .. 23) := (
      (1, 2, -1, 1, 0),
      (3, 4, -1, 4, 0),
      (5, 7, 1, 2, 0),
      (8, 9, -1, 8, 0),
      (10, 11, -1, 5, 0),
      (12, 13, -1, 1, 0),
      (14, 17, 5, 2, 0),
      (18, 19, -1, 6, 0),
      (20, 21, -1, 9, 0),
      (22, 23, -1, 2, 0),
      (24, 25, -1, 5, 0),
      (26, 27, -1, 7, 0),
      (28, 29, -1, 1, 0),
      (30, 31, -1, 1, 0),
      (32, 33, -1, 4, 0),
      (34, 35, -1, 10, 0),
      (36, 37, -1, 1, 0),
      (38, 39, -1, 6, 0),
      (40, 41, -1, 7, 0),
      (42, 43, -1, 8, 0),
      (44, 45, -1, 3, 0),
      (46, 47, -1, 1, 0),
      (48, 49, -1, 9, 0),
      (50, 51, -1, 3, 0));

   A_1 : constant Among_Array_Type (0 .. 15) := (
      (52, 58, -1, 1, 0),
      (59, 66, 0, 1, 0),
      (67, 69, -1, 2, 0),
      (70, 73, 2, 2, 0),
      (74, 76, -1, 1, 0),
      (77, 80, 4, 1, 0),
      (81, 83, -1, 1, 0),
      (84, 87, 6, 1, 0),
      (88, 90, -1, 1, 0),
      (91, 94, 8, 1, 0),
      (95, 97, -1, 1, 0),
      (98, 101, 10, 1, 0),
      (102, 107, -1, 1, 0),
      (108, 114, 12, 1, 0),
      (115, 118, -1, 2, 0),
      (119, 123, 14, 2, 0));

   A_2 : constant Among_Array_Type (0 .. 24) := (
      (124, 132, -1, 6, 0),
      (133, 139, -1, 5, 0),
      (140, 144, -1, 1, 0),
      (145, 152, 2, 2, 0),
      (153, 158, 2, 1, 0),
      (159, 170, -1, 4, 0),
      (171, 175, -1, 5, 0),
      (176, 178, -1, 1, 0),
      (179, 182, 7, 1, 0),
      (183, 190, 8, 6, 0),
      (191, 197, 8, 3, 0),
      (198, 203, 7, 5, 0),
      (204, 213, -1, 4, 0),
      (214, 220, -1, 5, 0),
      (221, 227, -1, 6, 0),
      (228, 235, -1, 1, 0),
      (236, 244, 15, 1, 0),
      (245, 250, -1, 3, 0),
      (251, 255, -1, 3, 0),
      (256, 259, -1, 1, 0),
      (260, 266, 19, 2, 0),
      (267, 271, 19, 1, 0),
      (272, 282, -1, 4, 0),
      (283, 292, -1, 2, 0),
      (293, 306, -1, 4, 0));

   A_3 : constant Among_Array_Type (0 .. 11) := (
      (307, 310, -1, 1, 0),
      (311, 315, 0, 1, 0),
      (316, 320, -1, 1, 0),
      (321, 326, 2, 1, 0),
      (327, 329, -1, 2, 0),
      (330, 333, 4, 2, 0),
      (334, 338, -1, 1, 0),
      (339, 342, -1, 1, 0),
      (343, 346, -1, 2, 0),
      (347, 349, -1, 2, 0),
      (350, 353, -1, 2, 0),
      (354, 356, -1, 2, 0));


   procedure R_Mark_regions (Z : in out Context_Type; Result : out Boolean) is
      C : Integer;
      A : Integer;
      v_1 : Integer;
      v_2 : Integer;
   begin
      --  (, line 28
      Z.I_PV := Z.L;
      Z.I_P1 := Z.L;
      Z.I_P2 := Z.L;
      --  do, line 34
      v_1 := Z.C;
      --  (, line 34
            --  gopast, line 35
      --  grouping v, line 35
      Out_Grouping (Z, G_V, 97, 250, True, C);
      if C < 0 then
         goto lab0;
      end if;
      Z.C := Z.C + C;
      --  setmark pV, line 35
      Z.I_PV := Z.C;

      <<lab0>>
      Z.C := v_1;
      --  do, line 37
      v_2 := Z.C;
      --  (, line 37
            --  gopast, line 38
      --  grouping v, line 38
      Out_Grouping (Z, G_V, 97, 250, True, C);
      if C < 0 then
         goto lab2;
      end if;
      Z.C := Z.C + C;
            --  gopast, line 38
      --  non v, line 38
      In_Grouping (Z, G_V, 97, 250, True, C);
      if C < 0 then
         goto lab2;
      end if;
      Z.C := Z.C + C;
      --  setmark p1, line 38
      Z.I_P1 := Z.C;
            --  gopast, line 39
      --  grouping v, line 39
      Out_Grouping (Z, G_V, 97, 250, True, C);
      if C < 0 then
         goto lab2;
      end if;
      Z.C := Z.C + C;
            --  gopast, line 39
      --  non v, line 39
      In_Grouping (Z, G_V, 97, 250, True, C);
      if C < 0 then
         goto lab2;
      end if;
      Z.C := Z.C + C;
      --  setmark p2, line 39
      Z.I_P2 := Z.C;

      <<lab2>>
      Z.C := v_2;

      Result := True;
   end R_Mark_regions;

   procedure R_Initial_morph (Z : in out Context_Type; Result : out Boolean) is
      C : Integer;
      A : Integer;
   begin
      --  (, line 43
      Z.Bra := Z.C;      --  [, line 44

      --  substring, line 44
      Find_Among (Z, A_0, Among_String, null, A);
      if A = 0 then
         Result := False;
         return;
      end if;
      Z.Ket := Z.C;      --  ], line 44

      --  among, line 44
      case A is
         when 1 =>
            --  (, line 46
            --  delete, line 46
            Slice_Del (Z);
         when 2 =>
            --  (, line 52
            --  <-, line 52
            Slice_From (Z, "f");
         when 3 =>
            --  (, line 58
            --  <-, line 58
            Slice_From (Z, "s");
         when 4 =>
            --  (, line 61
            --  <-, line 61
            Slice_From (Z, "b");
         when 5 =>
            --  (, line 63
            --  <-, line 63
            Slice_From (Z, "c");
         when 6 =>
            --  (, line 65
            --  <-, line 65
            Slice_From (Z, "d");
         when 7 =>
            --  (, line 69
            --  <-, line 69
            Slice_From (Z, "g");
         when 8 =>
            --  (, line 71
            --  <-, line 71
            Slice_From (Z, "p");
         when 9 =>
            --  (, line 75
            --  <-, line 75
            Slice_From (Z, "t");
         when 10 =>
            --  (, line 89
            --  <-, line 89
            Slice_From (Z, "m");
         when others =>
            null;
      end case;

      Result := True;
   end R_Initial_morph;

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

   procedure R_Noun_sfx (Z : in out Context_Type; Result : out Boolean) is
      C : Integer;
      A : Integer;
   begin
      --  (, line 103
      Z.Ket := Z.C;      --  [, line 104

      --  substring, line 104
      Find_Among_Backward (Z, A_1, Among_String, null, A);
      if A = 0 then
         Result := False;
         return;
      end if;
      Z.Bra := Z.C;      --  ], line 104

      --  among, line 104
      case A is
         when 1 =>
            --  (, line 108
            --  call R1, line 108
            R_R1 (Z, Result);
            if not Result then
               Result := False;
               return;
            end if;
            --  delete, line 108
            Slice_Del (Z);
         when 2 =>
            --  (, line 110
            --  call R2, line 110
            R_R2 (Z, Result);
            if not Result then
               Result := False;
               return;
            end if;
            --  delete, line 110
            Slice_Del (Z);
         when others =>
            null;
      end case;

      Result := True;
   end R_Noun_sfx;

   procedure R_Deriv (Z : in out Context_Type; Result : out Boolean) is
      C : Integer;
      A : Integer;
   begin
      --  (, line 113
      Z.Ket := Z.C;      --  [, line 114

      --  substring, line 114
      Find_Among_Backward (Z, A_2, Among_String, null, A);
      if A = 0 then
         Result := False;
         return;
      end if;
      Z.Bra := Z.C;      --  ], line 114

      --  among, line 114
      case A is
         when 1 =>
            --  (, line 116
            --  call R2, line 116
            R_R2 (Z, Result);
            if not Result then
               Result := False;
               return;
            end if;
            --  delete, line 116
            Slice_Del (Z);
         when 2 =>
            --  (, line 118
            --  <-, line 118
            Slice_From (Z, "arc");
         when 3 =>
            --  (, line 120
            --  <-, line 120
            Slice_From (Z, "gin");
         when 4 =>
            --  (, line 122
            --  <-, line 122
            Slice_From (Z, "graf");
         when 5 =>
            --  (, line 124
            --  <-, line 124
            Slice_From (Z, "paite");
         when 6 =>
            --  (, line 126
            --  <-, line 126
            Slice_From (Z, "óid");
         when others =>
            null;
      end case;

      Result := True;
   end R_Deriv;

   procedure R_Verb_sfx (Z : in out Context_Type; Result : out Boolean) is
      C : Integer;
      A : Integer;
   begin
      --  (, line 129
      Z.Ket := Z.C;      --  [, line 130

      --  substring, line 130
      if Z.C - 2 <= Z.Lb or else Check_Among (Z, Z.C - 1, 3, 16#45110#) then
         Result := False;
         return;
         --  substring, line 130
      end if;
      Find_Among_Backward (Z, A_3, Among_String, null, A);
      if A = 0 then
         Result := False;
         return;
      end if;
      Z.Bra := Z.C;      --  ], line 130

      --  among, line 130
      case A is
         when 1 =>
            --  (, line 133
            --  call RV, line 133
            R_RV (Z, Result);
            if not Result then
               Result := False;
               return;
            end if;
            --  delete, line 133
            Slice_Del (Z);
         when 2 =>
            --  (, line 138
            --  call R1, line 138
            R_R1 (Z, Result);
            if not Result then
               Result := False;
               return;
            end if;
            --  delete, line 138
            Slice_Del (Z);
         when others =>
            null;
      end case;

      Result := True;
   end R_Verb_sfx;

   procedure Stem (Z : in out Context_Type; Result : out Boolean) is
      C : Integer;
      A : Integer;
      v_1 : Integer;
      v_3 : Integer;
      v_4 : Integer;
      v_5 : Integer;
   begin
      --  (, line 143
      --  do, line 144
      v_1 := Z.C;
      --  call initial_morph, line 144
      R_Initial_morph (Z, Result);
      Z.C := v_1;
      --  do, line 145
      --  call mark_regions, line 145
      R_Mark_regions (Z, Result);
      Z.Lb := Z.C; Z.C := Z.L;      --  backwards, line 146

      --  (, line 146
      --  do, line 147
      v_3 := Z.L - Z.C;
      --  call noun_sfx, line 147
      R_Noun_sfx (Z, Result);
      Z.C := Z.L - v_3;
      --  do, line 148
      v_4 := Z.L - Z.C;
      --  call deriv, line 148
      R_Deriv (Z, Result);
      Z.C := Z.L - v_4;
      --  do, line 149
      v_5 := Z.L - Z.C;
      --  call verb_sfx, line 149
      R_Verb_sfx (Z, Result);
      Z.C := Z.L - v_5;
      Z.C := Z.Lb;

      Result := True;
   end Stem;
end Stemmer.Irish;
