-----------------------------------------------------------------------
--  stemmer-tests -- Tests for stemmer
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
with Stemmer.Factory;
package Stemmer.Tests is

   procedure Add_Tests (Suite : in Util.Tests.Access_Test_Suite);

   type Test is new Util.Tests.Test with null record;

   procedure Verify (T : in out Test;
                     L : in Stemmer.Factory.Language_Type;
                     S : in String;
                     R : in String);

   procedure Verify (T : in out Test;
                     L : in Factory.Language_Type;
                     Source : in String);

   --  Stem on French words.
   procedure Test_Stem_French (T : in out Test);

   --  Stem on English words.
   procedure Test_Stem_English (T : in out Test);

   --  Stem on Greek words.
   procedure Test_Stem_Greek (T : in out Test);

   --  Stem on Spanish words.
   procedure Test_Stem_Spanish (T : in out Test);

   --  Stem on Swedish words.
   procedure Test_Stem_Swedish (T : in out Test);

   --  Stem on Russian words.
   procedure Test_Stem_Russian (T : in out Test);

   --  Stem on Serbian words.
   procedure Test_Stem_Serbian (T : in out Test);

   --  Stem on French word using the reference file.
   procedure Test_Stem_French_Reference_File (T : in out Test);

   --  Stem on Spanish word using the reference file.
   procedure Test_Stem_Spanish_Reference_File (T : in out Test);

   --  Stem on English word using the reference file.
   procedure Test_Stem_English_Reference_File (T : in out Test);

   --  Stem on Swedish word using the reference file.
   procedure Test_Stem_Swedish_Reference_File (T : in out Test);

   --  Stem on Russian word using the reference file.
   procedure Test_Stem_Russian_Reference_File (T : in out Test);

   --  Stem on Serbian word using the reference file.
   procedure Test_Stem_Serbian_Reference_File (T : in out Test);

end Stemmer.Tests;
