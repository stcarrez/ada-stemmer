-----------------------------------------------------------------------
--  stemmer -- Multi-language stemmer with Snowball generator
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
package Stemmer with SPARK_Mode is

   type Context_Type is abstract tagged private;

   procedure Stem_Word (Context  : in out Context_Type'Class;
                        Word     : in String;
                        Result   : out Boolean);

   procedure Stem (Z      : in out Context_Type;
                   Result : out Boolean) is abstract;

   function Get_Result (Context : in Context_Type'Class) return String;

private

   WORD_MAX_LENGTH : constant := 1024;

   subtype Among_Index is Natural range 0 .. 65535;
   subtype Among_Start_Index is Among_Index range 1 .. Among_Index'Last;

   type Among_Type is record
      First       : Among_Start_Index;
      Last        : Among_Index;
      Substring_I : Integer;
      Result      : Integer;
   end record;

   type Grouping_Array is array (Natural range <>) of Boolean with Pack;

   type Among_Array_Type is array (Natural range <>) of Among_Type;

   function Eq_S (Context : in Context_Type'Class;
                  S       : in String) return Natural with
     Global => null,
     Pre => S'Length > 0,
     Post => Eq_S'Result = 0 or Eq_S'Result = S'Length;

   function Eq_S_Backward (Context : in Context_Type'Class;
                           S       : in String) return Natural with
     Global => null,
     Pre => S'Length > 0,
     Post => Eq_S_Backward'Result = 0 or Eq_S_Backward'Result = S'Length;

   procedure Find_Among (Context : in out Context_Type'Class;
                         Amongs  : in Among_Array_Type;
                         Pattern : in String;
                         Result  : out Integer) with
     Global => null,
     Pre => Pattern'Length > 0 and Amongs'Length > 0;

   procedure Find_Among_Backward (Context : in out Context_Type'Class;
                                  Amongs  : in Among_Array_Type;
                                  Pattern : in String;
                                  Result  : out Integer) with
     Global => null,
     Pre => Pattern'Length > 0 and Amongs'Length > 0;

   function Skip_Utf8 (Context : in Context_Type'Class;
                       N       : in Positive) return Integer with
     Global => null;

   function Skip_Utf8_Backward (Context : in Context_Type'Class;
                                N       : in Positive) return Integer with
     Global => null;

   function Length (Context : in Context_Type'Class) return Natural;

   procedure Out_Grouping (Context : in out Context_Type'Class;
                           S       : in Grouping_Array;
                           Min     : in Integer;
                           Max     : in Integer;
                           Repeat  : in Boolean;
                           Result  : out Integer);

   procedure Out_Grouping_Backward (Context : in out Context_Type'Class;
                                    S       : in Grouping_Array;
                                    Min     : in Integer;
                                    Max     : in Integer;
                                    Repeat  : in Boolean;
                                    Result  : out Integer);

   procedure In_Grouping (Context : in out Context_Type'Class;
                          S       : in Grouping_Array;
                          Min     : in Integer;
                          Max     : in Integer;
                          Repeat  : in Boolean;
                          Result  : out Integer);

   procedure In_Grouping_Backward (Context : in out Context_Type'Class;
                                   S       : in Grouping_Array;
                                   Min     : in Integer;
                                   Max     : in Integer;
                                   Repeat  : in Boolean;
                                   Result  : out Integer);

   procedure Replace (Context    : in out Context_Type'Class;
                      C_Bra      : in Integer;
                      C_Ket      : in Integer;
                      S          : in String;
                      Adjustment : out Integer) with
     Pre => C_Bra >= Context.Lb and C_Ket >= C_Bra and C_Ket <= Context.L;

   procedure Slice_Del (Context : in out Context_Type'Class) with
     Pre => Context.Bra >= Context.Lb and Context.Ket >= Context.Bra
     and Context.Ket <= Context.L;

   procedure Slice_From (Context : in out Context_Type'Class;
                         Text    : in String) with
     Global => null,
     Pre => Context.Bra >= Context.Lb and Context.Ket >= Context.Bra
     and Context.Ket <= Context.L
     and Context.L - Context.Lb + Text'Length + Context.Ket - Context.Bra < Context.P'Length;

   procedure Insert (Context : in out Context_Type'Class;
                     C_Bra   : in Natural;
                     C_Ket   : in Natural;
                     S       : in String) with
     Pre => C_Bra >= Context.Lb and C_Ket >= C_Bra and C_Ket <= Context.L;

   type Context_Type is abstract tagged record
      C   : Integer := 0;
      L   : Integer := 0;
      Lb  : Integer := 0;
      Bra : Integer := 0;
      Ket : Integer := 0;
      P   : String (1 .. WORD_MAX_LENGTH);
   end record;

end Stemmer;