-----------------------------------------------------------------------
--  stemmer-factory -- Multi-language stemmer with Snowball generator
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
package Stemmer.Factory with SPARK_Mode is

   type Language_Type is (L_ENGLISH, L_FRENCH, L_ITALIAN, L_GERMAN,
                          L_GREEK, L_SERBIAN, L_SPANISH,
                          L_SWEDISH, L_RUSSIAN);

   function Stem (Language : in Language_Type;
                  Word     : in String) return String;

end Stemmer.Factory;
