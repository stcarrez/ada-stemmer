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

with Util.Tests;
with Util.Test_Caller;
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
   end Add_Tests;

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

--      T.Verify (L_ENGLISH, "academies", "academy");
--      T.Verify (L_ENGLISH, "abolished", "abolish");
   end Test_Stem_English;

   --  Stem on Greek words.
   procedure Test_Stem_Greek (T : in out Test) is
   begin
      T.Verify (L_GREEK, "ΠΟΣΟΤΗΤΑ", "ποσοτητ");
      T.Verify (L_GREEK, "ΜΝΗΜΕΙΩΔΕΣ", "μνημειωδ");
   end Test_Stem_Greek;

end Stemmer.Tests;
