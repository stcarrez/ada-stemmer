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
with Stemmer.Danish;
with Stemmer.Dutch;
with Stemmer.English;
with Stemmer.Italian;
with Stemmer.French;
with Stemmer.German;
with Stemmer.Greek;
with Stemmer.Serbian;
with Stemmer.Spanish;
with Stemmer.Swedish;
with Stemmer.Russian;
package body Stemmer.Factory with SPARK_Mode is

   function Stem (Language : in Language_Type;
                  Word     : in String) return String is
      Result : Boolean := False;
   begin
      case Language is
         when L_DANISH =>
            declare
               C : Stemmer.Danish.Context_Type;
            begin
               C.Stem_Word (Word, Result);
               return Get_Result (C);
            end;

         when L_DUTCH =>
            declare
               C : Stemmer.Dutch.Context_Type;
            begin
               C.Stem_Word (Word, Result);
               return Get_Result (C);
            end;

         when L_ENGLISH =>
            declare
               C : Stemmer.English.Context_Type;
            begin
               C.Stem_Word (Word, Result);
               return Get_Result (C);
            end;

         when L_FRENCH =>
            declare
               C : Stemmer.French.Context_Type;
            begin
               C.Stem_Word (Word, Result);
               return Get_Result (C);
            end;

         when L_GERMAN =>
            declare
               C : Stemmer.German.Context_Type;
            begin
               C.Stem_Word (Word, Result);
               return Get_Result (C);
            end;

         when L_GREEK =>
            declare
               C : Stemmer.Greek.Context_Type;
            begin
               C.Stem_Word (Word, Result);
               return Get_Result (C);
            end;

         when L_ITALIAN =>
            declare
               C : Stemmer.Italian.Context_Type;
            begin
               C.Stem_Word (Word, Result);
               return Get_Result (C);
            end;

         when L_SPANISH =>
            declare
               C : Stemmer.Spanish.Context_Type;
            begin
               C.Stem_Word (Word, Result);
               return Get_Result (C);
            end;

         when L_SERBIAN =>
            declare
               C : Stemmer.Serbian.Context_Type;
            begin
               C.Stem_Word (Word, Result);
               return Get_Result (C);
            end;

         when L_SWEDISH =>
            declare
               C : Stemmer.Swedish.Context_Type;
            begin
               C.Stem_Word (Word, Result);
               return Get_Result (C);
            end;

         when L_RUSSIAN =>
            declare
               C : Stemmer.Russian.Context_Type;
            begin
               C.Stem_Word (Word, Result);
               return Get_Result (C);
            end;
      end case;
   end Stem;

end Stemmer.Factory;
