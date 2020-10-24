-----------------------------------------------------------------------
--  stemmer-stemmer-tests -- Tests for stemmer
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

with Ada.Text_IO;
with Util.Test_Caller;
with Util.Files;
with Util.Strings;
package body Stemmer.Tests is

   use Stemmer.Factory;

   package Caller is new Util.Test_Caller (Test, "stemmer");

   procedure Add_Tests (Suite : in Util.Tests.Access_Test_Suite) is
   begin
      Caller.Add_Test (Suite, "Test Stemmer.Stem (French)",
                       Test_Stem_French'Access);
      Caller.Add_Test (Suite, "Test Stemmer.Stem (English)",
                       Test_Stem_English'Access);
      Caller.Add_Test (Suite, "Test Stemmer.Stem (Greek)",
                       Test_Stem_Greek'Access);
      Caller.Add_Test (Suite, "Test Stemmer.Stem (Spanish)",
                       Test_Stem_Spanish'Access);
      Caller.Add_Test (Suite, "Test Stemmer.Stem (Swedish)",
                       Test_Stem_Swedish'Access);
      Caller.Add_Test (Suite, "Test Stemmer.Stem (Russian)",
                       Test_Stem_Russian'Access);
      Caller.Add_Test (Suite, "Test Stemmer.Stem (Serbian)",
                       Test_Stem_Serbian'Access);
      Caller.Add_Test (Suite, "Test Stemmer.Stem (French, Ref File)",
                       Test_Stem_French_Reference_File'Access);
      Caller.Add_Test (Suite, "Test Stemmer.Stem (Spanish, Ref File)",
                       Test_Stem_Spanish_Reference_File'Access);
      Caller.Add_Test (Suite, "Test Stemmer.Stem (English, Ref File)",
                       Test_Stem_English_Reference_File'Access);
      Caller.Add_Test (Suite, "Test Stemmer.Stem (Swedish, Ref File)",
                       Test_Stem_Swedish_Reference_File'Access);
      Caller.Add_Test (Suite, "Test Stemmer.Stem (Russian, Ref File)",
                       Test_Stem_Russian_Reference_File'Access);
      Caller.Add_Test (Suite, "Test Stemmer.Stem (Serbian, Ref File)",
                       Test_Stem_Serbian_Reference_File'Access);
      Caller.Add_Test (Suite, "Test Stemmer.Stem (German, Ref File)",
                       Test_Stem_German_Reference_File'Access);
      Caller.Add_Test (Suite, "Test Stemmer.Stem (Italian, Ref File)",
                       Test_Stem_Italian_Reference_File'Access);
      Caller.Add_Test (Suite, "Test Stemmer.Stem (Greek, Ref File)",
                       Test_Stem_Greek_Reference_File'Access);
      Caller.Add_Test (Suite, "Test Stemmer.Stem (Danish, Ref File)",
                       Test_Stem_Danish_Reference_File'Access);
      Caller.Add_Test (Suite, "Test Stemmer.Stem (Dutch, Ref File)",
                       Test_Stem_Dutch_Reference_File'Access);
      Caller.Add_Test (Suite, "Test Stemmer.Stem (Catalan, Ref File)",
                       Test_Stem_Catalan_Reference_File'Access);
      Caller.Add_Test (Suite, "Test Stemmer.Stem (Basque, Ref File)",
                       Test_Stem_Basque_Reference_File'Access);
      Caller.Add_Test (Suite, "Test Stemmer.Stem (Finnish, Ref File)",
                       Test_Stem_Finnish_Reference_File'Access);
      Caller.Add_Test (Suite, "Test Stemmer.Stem (Hindi, Ref File)",
                       Test_Stem_Hindi_Reference_File'Access);
      Caller.Add_Test (Suite, "Test Stemmer.Stem (Hungarian, Ref File)",
                       Test_Stem_Hungarian_Reference_File'Access);
   end Add_Tests;

   procedure Verify (T : in out Test;
                     L : in Factory.Language_Type;
                     Source : in String) is
      procedure Process (Line : in String);

      Error : Boolean := False;

      procedure Process (Line : in String) is
         Pos : constant Natural := Util.Strings.Index (Line, ASCII.HT);
      begin
         if Pos > 0 then
            declare
               Word   : constant String := Line (Line'First .. Pos - 1);
               Expect : constant String := Line (Pos + 1 .. Line'Last);
               Result : constant String := Stemmer.Factory.Stem (L, Word);
            begin
               if Result /= Expect then
                  Ada.Text_IO.Put_Line ("Bad [" & Word & "] -> [" & Result & "] <== " & Expect);
                  Error := True;
               end if;
            end;
         end if;
      end Process;
   begin
      Util.Files.Read_File (Source, Process'Access);
      T.Assert (not Error, "Stemming error for " & Source);
   end Verify;

   procedure Verify (T : in out Test;
                     L : in Factory.Language_Type;
                     S : in String;
                     R : in String) is
      Result : constant String := Stemmer.Factory.Stem (L, S);
   begin
      T.Assert_Equals (R, Result, S, "Invalid Stem for " & S);
   end Verify;

   --  Stem on French words.
   procedure Test_Stem_French (T : in out Test) is
   begin
      T.Verify (L_FRENCH, "bonjour", "bonjour");
      T.Verify (L_FRENCH, "chienne", "chien");
      T.Verify (L_FRENCH, "chevalier", "chevali");
      T.Verify (L_FRENCH, "échographe", "échograph");
      T.Verify (L_FRENCH, "abandonnait", "abandon");
      T.Verify (L_FRENCH, "affectées", "affect");
      Verify (T, L_FRENCH, "regtests/files/fr-test.txt");
      T.Verify (L_FRENCH, "affectionné", "affection");
      T.Verify (L_FRENCH, "affectionnait", "affection");
   end Test_Stem_French;

   --  Stem on English words.
   procedure Test_Stem_English (T : in out Test) is
   begin
      T.Verify (L_ENGLISH, "zealously", "zealous");
      T.Verify (L_ENGLISH, "caesars", "caesar");
      T.Verify (L_ENGLISH, "about", "about");
      T.Verify (L_ENGLISH, "acceding", "acced");
      T.Verify (L_ENGLISH, "younger", "younger");
      T.Verify (L_ENGLISH, "skis", "ski");
      T.Verify (L_ENGLISH, "ugly", "ugli");
      T.Verify (L_ENGLISH, "dying", "die");
      T.Verify (L_ENGLISH, "cosmos", "cosmos");
      T.Verify (L_ENGLISH, "transitional", "transit");

      T.Verify (L_ENGLISH, "academies", "academi");
      T.Verify (L_ENGLISH, "abolished", "abolish");
   end Test_Stem_English;

   --  Stem on Greek words.
   procedure Test_Stem_Greek (T : in out Test) is
   begin
      T.Verify (L_GREEK, "ΠΟΣΟΤΗΤΑ", "ποσοτητ");
      T.Verify (L_GREEK, "ΜΝΗΜΕΙΩΔΕΣ", "μνημειωδ");
      T.Verify (L_GREEK, "ΩΣΤΙΚΟ", "ωστ");
      T.Verify (L_GREEK, "ΩΦΕΛΕΙ", "ωφελ");
   end Test_Stem_Greek;

   --  Stem on Spanish words.
   procedure Test_Stem_Spanish (T : in out Test) is
   begin
      T.Verify (L_SPANISH, "abarcaría", "abarc");
      T.Verify (L_SPANISH, "abarroteros", "abarroter");
      T.Verify (L_SPANISH, "aseguramiento", "asegur");
      T.Verify (L_SPANISH, "zubillaga", "zubillag");
   end Test_Stem_Spanish;

   --  Stem on Swedish words.
   procedure Test_Stem_Swedish (T : in out Test) is
   begin
      T.Verify (L_SWEDISH, "ackompanjerade", "ackompanjer");
      T.Verify (L_SWEDISH, "abskons", "abskon");
      T.Verify (L_SWEDISH, "afhölja", "afhölj");
      T.Verify (L_SWEDISH, "överändakastade", "överändakast");
   end Test_Stem_Swedish;

   --  Stem on Russian words.
   procedure Test_Stem_Russian (T : in out Test) is
   begin
      T.Verify (L_RUSSIAN, "авдотьей", "авдот");
      T.Verify (L_RUSSIAN, "адом", "ад");
      T.Verify (L_RUSSIAN, "ячменный", "ячмен");
   end Test_Stem_Russian;

   --  Stem on Serbian words.
   procedure Test_Stem_Serbian (T : in out Test) is
   begin
      T.Verify (L_SERBIAN, "abecendom", "abecend");
      T.Verify (L_SERBIAN, "ocenjujući", "ocenjuj");
      T.Verify (L_SERBIAN, "padobranskim", "padobransk");
   end Test_Stem_Serbian;

   --  Stem on French words using the reference file.
   procedure Test_Stem_French_Reference_File (T : in out Test) is
   begin
      Verify (T, L_FRENCH, "regtests/files/fr-test.txt");
   end Test_Stem_French_Reference_File;

   --  Stem on Spanish words using the reference file.
   procedure Test_Stem_Spanish_Reference_File (T : in out Test) is
   begin
      Verify (T, L_SPANISH, "regtests/files/es-test.txt");
   end Test_Stem_Spanish_Reference_File;

   --  Stem on English words using the reference file.
   procedure Test_Stem_English_Reference_File (T : in out Test) is
   begin
      Verify (T, L_ENGLISH, "regtests/files/en-test.txt");
   end Test_Stem_English_Reference_File;

   --  Stem on Swedish words using the reference file.
   procedure Test_Stem_Swedish_Reference_File (T : in out Test) is
   begin
      Verify (T, L_SWEDISH, "regtests/files/sv-test.txt");
   end Test_Stem_Swedish_Reference_File;

   --  Stem on Russian words using the reference file.
   procedure Test_Stem_Russian_Reference_File (T : in out Test) is
   begin
      Verify (T, L_RUSSIAN, "regtests/files/ru-test.txt");
   end Test_Stem_Russian_Reference_File;

   --  Stem on Serbian words using the reference file.
   procedure Test_Stem_Serbian_Reference_File (T : in out Test) is
   begin
      Verify (T, L_SERBIAN, "regtests/files/sr-test.txt");
   end Test_Stem_Serbian_Reference_File;

   --  Stem on German words using the reference file.
   procedure Test_Stem_German_Reference_File (T : in out Test) is
   begin
      Verify (T, L_GERMAN, "regtests/files/gr-test.txt");
   end Test_Stem_German_Reference_File;

   --  Stem on Italian words using the reference file.
   procedure Test_Stem_Italian_Reference_File (T : in out Test) is
   begin
      Verify (T, L_ITALIAN, "regtests/files/it-test.txt");
   end Test_Stem_Italian_Reference_File;

   --  Stem on Greek words using the reference file.
   procedure Test_Stem_Greek_Reference_File (T : in out Test) is
   begin
      Verify (T, L_GREEK, "regtests/files/el-test.txt");
   end Test_Stem_Greek_Reference_File;

   --  Stem on Danish words using the reference file.
   procedure Test_Stem_Danish_Reference_File (T : in out Test) is
   begin
      Verify (T, L_DANISH, "regtests/files/da-test.txt");
   end Test_Stem_Danish_Reference_File;

   --  Stem on Dutch words using the reference file.
   procedure Test_Stem_Dutch_Reference_File (T : in out Test) is
   begin
      Verify (T, L_DUTCH, "regtests/files/nl-test.txt");
   end Test_Stem_Dutch_Reference_File;

   --  Stem on Dutch words using the reference file.
   procedure Test_Stem_Catalan_Reference_File (T : in out Test) is
   begin
      Verify (T, L_CATALAN, "regtests/files/ca-test.txt");
   end Test_Stem_Catalan_Reference_File;

   --  Stem on Basque words using the reference file.
   procedure Test_Stem_Basque_Reference_File (T : in out Test) is
   begin
      Verify (T, L_BASQUE, "regtests/files/eu-test.txt");
   end Test_Stem_Basque_Reference_File;

   --  Stem on Finnish words using the reference file.
   procedure Test_Stem_Finnish_Reference_File (T : in out Test) is
   begin
      Verify (T, L_FINNISH, "regtests/files/fi-test.txt");
   end Test_Stem_Finnish_Reference_File;

   --  Stem on Hindi words using the reference file.
   procedure Test_Stem_Hindi_Reference_File (T : in out Test) is
   begin
      Verify (T, L_HINDI, "regtests/files/hi-test.txt");
   end Test_Stem_Hindi_Reference_File;

   --  Stem on Hungarian words using the reference file.
   procedure Test_Stem_Hungarian_Reference_File (T : in out Test) is
   begin
      Verify (T, L_HUNGARIAN, "regtests/files/hu-test.txt");
   end Test_Stem_Hungarian_Reference_File;

end Stemmer.Tests;
