--  Generated by Snowball 2.0.0 - https://snowballstem.org/

package body Stemmer.Catalan is

   pragma Style_Checks ("-mr");
   pragma Warnings (Off, "*variable*is never read and never assigned*");
   pragma Warnings (Off, "*mode could be*instead of*");
   pragma Warnings (Off, "*formal parameter.*is not modified*");
   pragma Warnings (Off, "*this line is too long*");
   pragma Warnings (Off, "*is not referenced*");

   procedure R_Residual_suffix (Z : in out Context_Type; Result : out Boolean);
   procedure R_Verb_suffix (Z : in out Context_Type; Result : out Boolean);
   procedure R_Standard_suffix (Z : in out Context_Type; Result : out Boolean);
   procedure R_Attached_pronoun (Z : in out Context_Type; Result : out Boolean);
   procedure R_R2 (Z : in out Context_Type; Result : out Boolean);
   procedure R_R1 (Z : in out Context_Type; Result : out Boolean);
   procedure R_Mark_regions (Z : in out Context_Type; Result : out Boolean);
   procedure R_Cleaning (Z : in out Context_Type; Result : out Boolean);

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
      False, False, False, False, False, False, False, True,
      True, False, False, False, False, False, False, True,
      True, False, False, False, True, False, True, False,
      False, True, True, False, False, False, False, False,
      False, True, False, True, False, False, False, False
   );
   Among_String : constant String := "" & "·" & "à" & "á" & "è" & "é"
      & "ì" & "í" & "ï" & "ò" & "ó" & "ú" & "ü" & "la" & "-la" & "sela" & "le"
      & "me" & "-me" & "se" & "-te" & "hi" & "'hi" & "li" & "-li" & "'l" & "'m" & "-m"
      & "'n" & "-n" & "ho" & "'ho" & "lo" & "selo" & "'s" & "las" & "selas" & "les"
      & "-les" & "'ls" & "-ls" & "'ns" & "-ns" & "ens" & "los" & "selos" & "nos"
      & "-nos" & "vos" & "us" & "-us" & "'t" & "ica" & "lógica" & "enca" & "ada"
      & "ancia" & "encia" & "ència" & "ícia" & "logia" & "inia" & "íinia" & "eria"
      & "ària" & "atòria" & "alla" & "ella" & "ívola" & "ima" & "íssima"
      & "quíssima" & "ana" & "ina" & "era" & "sfera" & "ora" & "dora" & "adora"
      & "adura" & "esa" & "osa" & "assa" & "essa" & "issa" & "eta" & "ita" & "ota"
      & "ista" & "ialista" & "ionista" & "iva" & "ativa" & "nça" & "logía" & "ic"
      & "ístic" & "enc" & "esc" & "ud" & "atge" & "ble" & "able" & "ible" & "isme"
      & "ialisme" & "ionisme" & "ivisme" & "aire" & "icte" & "iste" & "ici" & "íci"
      & "logi" & "ari" & "tori" & "al" & "il" & "all" & "ell" & "ívol" & "isam"
      & "issem" & "ìssem" & "íssem" & "íssim" & "quíssim" & "amen" & "ìssin"
      & "ar" & "ificar" & "egar" & "ejar" & "itar" & "itzar" & "fer" & "or" & "dor"
      & "dur" & "doras" & "ics" & "lógics" & "uds" & "nces" & "ades" & "ancies"
      & "encies" & "ències" & "ícies" & "logies" & "inies" & "ínies" & "eries"
      & "àries" & "atòries" & "bles" & "ables" & "ibles" & "imes" & "íssimes"
      & "quíssimes" & "formes" & "ismes" & "ialismes" & "ines" & "eres" & "ores"
      & "dores" & "idores" & "dures" & "eses" & "oses" & "asses" & "ictes" & "ites"
      & "otes" & "istes" & "ialistes" & "ionistes" & "iques" & "lógiques" & "ives"
      & "atives" & "logíes" & "allengües" & "icis" & "ícis" & "logis" & "aris"
      & "toris" & "ls" & "als" & "ells" & "ims" & "íssims" & "quíssims" & "ions"
      & "cions" & "acions" & "esos" & "osos" & "assos" & "issos" & "ers" & "ors"
      & "dors" & "adors" & "idors" & "ats" & "itats" & "bilitats" & "ivitats"
      & "ativitats" & "ïtats" & "ets" & "ants" & "ents" & "ments" & "aments" & "ots"
      & "uts" & "ius" & "trius" & "atius" & "ès" & "és" & "ís" & "dís" & "ós"
      & "itat" & "bilitat" & "ivitat" & "ativitat" & "ïtat" & "et" & "ant" & "ent"
      & "ient" & "ment" & "ament" & "isament" & "ot" & "isseu" & "ìsseu" & "ísseu"
      & "triu" & "íssiu" & "atiu" & "ó" & "ió" & "ció" & "ació" & "aba" & "esca"
      & "isca" & "ïsca" & "ada" & "ida" & "uda" & "ïda" & "ia" & "aria" & "iria"
      & "ara" & "iera" & "ira" & "adora" & "ïra" & "ava" & "ixa" & "itza" & "ía"
      & "aría" & "ería" & "iría" & "ïa" & "isc" & "ïsc" & "ad" & "ed" & "id"
      & "ie" & "re" & "dre" & "ase" & "iese" & "aste" & "iste" & "ii" & "ini" & "esqui"
      & "eixi" & "itzi" & "am" & "em" & "arem" & "irem" & "àrem" & "írem" & "àssem"
      & "éssem" & "iguem" & "ïguem" & "avem" & "àvem" & "ávem" & "irìem" & "íem"
      & "aríem" & "iríem" & "assim" & "essim" & "issim" & "àssim" & "èssim"
      & "éssim" & "íssim" & "ïm" & "an" & "aban" & "arian" & "aran" & "ieran"
      & "iran" & "ían" & "arían" & "erían" & "irían" & "en" & "ien" & "arien"
      & "irien" & "aren" & "eren" & "iren" & "àren" & "ïren" & "asen" & "iesen"
      & "assen" & "essen" & "issen" & "éssen" & "ïssen" & "esquen" & "isquen"
      & "ïsquen" & "aven" & "ixen" & "eixen" & "ïxen" & "ïen" & "in" & "inin"
      & "sin" & "isin" & "assin" & "essin" & "issin" & "ïssin" & "esquin" & "eixin"
      & "aron" & "ieron" & "arán" & "erán" & "irán" & "iïn" & "ado" & "ido"
      & "ando" & "iendo" & "io" & "ixo" & "eixo" & "ïxo" & "itzo" & "ar" & "tzar"
      & "er" & "eixer" & "ir" & "ador" & "as" & "abas" & "adas" & "idas" & "aras"
      & "ieras" & "ías" & "arías" & "erías" & "irías" & "ids" & "es" & "ades"
      & "ides" & "udes" & "ïdes" & "atges" & "ies" & "aries" & "iries" & "ares"
      & "ires" & "adores" & "ïres" & "ases" & "ieses" & "asses" & "esses" & "isses"
      & "ïsses" & "ques" & "esques" & "ïsques" & "aves" & "ixes" & "eixes" & "ïxes"
      & "ïes" & "abais" & "arais" & "ierais" & "íais" & "aríais" & "eríais"
      & "iríais" & "aseis" & "ieseis" & "asteis" & "isteis" & "inis" & "sis" & "isis"
      & "assis" & "essis" & "issis" & "ïssis" & "esquis" & "eixis" & "itzis" & "áis"
      & "aréis" & "eréis" & "iréis" & "ams" & "ados" & "idos" & "amos" & "ábamos"
      & "áramos" & "iéramos" & "íamos" & "aríamos" & "eríamos" & "iríamos"
      & "aremos" & "eremos" & "iremos" & "ásemos" & "iésemos" & "imos" & "adors"
      & "ass" & "erass" & "ess" & "ats" & "its" & "ents" & "às" & "aràs" & "iràs"
      & "arás" & "erás" & "irás" & "és" & "arés" & "ís" & "iïs" & "at" & "it"
      & "ant" & "ent" & "int" & "ut" & "ït" & "au" & "erau" & "ieu" & "ineu" & "areu"
      & "ireu" & "àreu" & "íreu" & "asseu" & "esseu" & "eresseu" & "àsseu"
      & "ésseu" & "igueu" & "ïgueu" & "àveu" & "áveu" & "itzeu" & "ìeu" & "irìeu"
      & "íeu" & "aríeu" & "iríeu" & "assiu" & "issiu" & "àssiu" & "èssiu"
      & "éssiu" & "íssiu" & "ïu" & "ix" & "eix" & "ïx" & "itz" & "ià" & "arà"
      & "irà" & "itzà" & "ará" & "erá" & "irá" & "irè" & "aré" & "eré" & "iré"
      & "í" & "iï" & "ió" & "a" & "e" & "i" & "ïn" & "o" & "ir" & "s" & "is" & "os"
      & "ïs" & "it" & "eu" & "iu" & "iqu" & "itz" & "à" & "á" & "é" & "ì" & "í"
      & "ï" & "ó";

   A_0 : constant Among_Array_Type (0 .. 12) := (
      (1, 0, -1, 7, 0),
      (1, 2, 0, 6, 0),
      (3, 4, 0, 1, 0),
      (5, 6, 0, 1, 0),
      (7, 8, 0, 2, 0),
      (9, 10, 0, 2, 0),
      (11, 12, 0, 3, 0),
      (13, 14, 0, 3, 0),
      (15, 16, 0, 3, 0),
      (17, 18, 0, 4, 0),
      (19, 20, 0, 4, 0),
      (21, 22, 0, 5, 0),
      (23, 24, 0, 5, 0));

   A_1 : constant Among_Array_Type (0 .. 38) := (
      (25, 26, -1, 1, 0),
      (27, 29, 0, 1, 0),
      (30, 33, 0, 1, 0),
      (34, 35, -1, 1, 0),
      (36, 37, -1, 1, 0),
      (38, 40, 4, 1, 0),
      (41, 42, -1, 1, 0),
      (43, 45, -1, 1, 0),
      (46, 47, -1, 1, 0),
      (48, 50, 8, 1, 0),
      (51, 52, -1, 1, 0),
      (53, 55, 10, 1, 0),
      (56, 57, -1, 1, 0),
      (58, 59, -1, 1, 0),
      (60, 61, -1, 1, 0),
      (62, 63, -1, 1, 0),
      (64, 65, -1, 1, 0),
      (66, 67, -1, 1, 0),
      (68, 70, 17, 1, 0),
      (71, 72, -1, 1, 0),
      (73, 76, 19, 1, 0),
      (77, 78, -1, 1, 0),
      (79, 81, -1, 1, 0),
      (82, 86, 22, 1, 0),
      (87, 89, -1, 1, 0),
      (90, 93, 24, 1, 0),
      (94, 96, -1, 1, 0),
      (97, 99, -1, 1, 0),
      (100, 102, -1, 1, 0),
      (103, 105, -1, 1, 0),
      (106, 108, -1, 1, 0),
      (109, 111, -1, 1, 0),
      (112, 116, 31, 1, 0),
      (117, 119, -1, 1, 0),
      (120, 123, 33, 1, 0),
      (124, 126, -1, 1, 0),
      (127, 128, -1, 1, 0),
      (129, 131, 36, 1, 0),
      (132, 133, -1, 1, 0));

   A_2 : constant Among_Array_Type (0 .. 199) := (
      (134, 136, -1, 4, 0),
      (137, 143, 0, 3, 0),
      (144, 147, -1, 1, 0),
      (148, 150, -1, 2, 0),
      (151, 155, -1, 1, 0),
      (156, 160, -1, 1, 0),
      (161, 166, -1, 1, 0),
      (167, 171, -1, 1, 0),
      (172, 176, -1, 3, 0),
      (177, 180, -1, 1, 0),
      (181, 186, 9, 1, 0),
      (187, 190, -1, 1, 0),
      (191, 195, -1, 1, 0),
      (196, 202, -1, 1, 0),
      (203, 206, -1, 1, 0),
      (207, 210, -1, 1, 0),
      (211, 216, -1, 1, 0),
      (217, 219, -1, 1, 0),
      (220, 226, 17, 1, 0),
      (227, 235, 18, 5, 0),
      (236, 238, -1, 1, 0),
      (239, 241, -1, 1, 0),
      (242, 244, -1, 1, 0),
      (245, 249, 22, 1, 0),
      (250, 252, -1, 1, 0),
      (253, 256, 24, 1, 0),
      (257, 261, 25, 1, 0),
      (262, 266, -1, 1, 0),
      (267, 269, -1, 1, 0),
      (270, 272, -1, 1, 0),
      (273, 276, -1, 1, 0),
      (277, 280, -1, 1, 0),
      (281, 284, -1, 1, 0),
      (285, 287, -1, 1, 0),
      (288, 290, -1, 1, 0),
      (291, 293, -1, 1, 0),
      (294, 297, -1, 1, 0),
      (298, 304, 36, 1, 0),
      (305, 311, 36, 1, 0),
      (312, 314, -1, 1, 0),
      (315, 319, 39, 1, 0),
      (320, 323, -1, 1, 0),
      (324, 329, -1, 3, 0),
      (330, 331, -1, 4, 0),
      (332, 337, 43, 1, 0),
      (338, 340, -1, 1, 0),
      (341, 343, -1, 1, 0),
      (344, 345, -1, 1, 0),
      (346, 349, -1, 1, 0),
      (350, 352, -1, 1, 0),
      (353, 356, 49, 1, 0),
      (357, 360, 49, 1, 0),
      (361, 364, -1, 1, 0),
      (365, 371, 52, 1, 0),
      (372, 378, 52, 1, 0),
      (379, 384, 52, 1, 0),
      (385, 388, -1, 1, 0),
      (389, 392, -1, 1, 0),
      (393, 396, -1, 1, 0),
      (397, 399, -1, 1, 0),
      (400, 403, -1, 1, 0),
      (404, 407, -1, 3, 0),
      (408, 410, -1, 1, 0),
      (411, 414, -1, 1, 0),
      (415, 416, -1, 1, 0),
      (417, 418, -1, 1, 0),
      (419, 421, -1, 1, 0),
      (422, 424, -1, 1, 0),
      (425, 429, -1, 1, 0),
      (430, 433, -1, 1, 0),
      (434, 438, -1, 1, 0),
      (439, 444, -1, 1, 0),
      (445, 450, -1, 1, 0),
      (451, 456, -1, 1, 0),
      (457, 464, 73, 5, 0),
      (465, 468, -1, 1, 0),
      (469, 474, -1, 1, 0),
      (475, 476, -1, 1, 0),
      (477, 482, 77, 1, 0),
      (483, 486, 77, 1, 0),
      (487, 490, 77, 1, 0),
      (491, 494, 77, 1, 0),
      (495, 499, 77, 1, 0),
      (500, 502, -1, 1, 0),
      (503, 504, -1, 1, 0),
      (505, 507, 84, 1, 0),
      (508, 510, -1, 1, 0),
      (511, 515, -1, 1, 0),
      (516, 518, -1, 4, 0),
      (519, 525, 88, 3, 0),
      (526, 528, -1, 1, 0),
      (529, 532, -1, 1, 0),
      (533, 536, -1, 2, 0),
      (537, 542, -1, 1, 0),
      (543, 548, -1, 1, 0),
      (549, 555, -1, 1, 0),
      (556, 561, -1, 1, 0),
      (562, 567, -1, 3, 0),
      (568, 572, -1, 1, 0),
      (573, 578, -1, 1, 0),
      (579, 583, -1, 1, 0),
      (584, 589, -1, 1, 0),
      (590, 597, -1, 1, 0),
      (598, 601, -1, 1, 0),
      (602, 606, 103, 1, 0),
      (607, 611, 103, 1, 0),
      (612, 615, -1, 1, 0),
      (616, 623, 106, 1, 0),
      (624, 633, 107, 5, 0),
      (634, 639, -1, 1, 0),
      (640, 644, -1, 1, 0),
      (645, 652, 110, 1, 0),
      (653, 656, -1, 1, 0),
      (657, 660, -1, 1, 0),
      (661, 664, -1, 1, 0),
      (665, 669, 114, 1, 0),
      (670, 675, 115, 1, 0),
      (676, 680, -1, 1, 0),
      (681, 684, -1, 1, 0),
      (685, 688, -1, 1, 0),
      (689, 693, -1, 1, 0),
      (694, 698, -1, 1, 0),
      (699, 702, -1, 1, 0),
      (703, 706, -1, 1, 0),
      (707, 711, -1, 1, 0),
      (712, 719, 124, 1, 0),
      (720, 727, 124, 1, 0),
      (728, 732, -1, 4, 0),
      (733, 741, 127, 3, 0),
      (742, 745, -1, 1, 0),
      (746, 751, 129, 1, 0),
      (752, 758, -1, 3, 0),
      (759, 768, -1, 1, 0),
      (769, 772, -1, 1, 0),
      (773, 777, -1, 1, 0),
      (778, 782, -1, 3, 0),
      (783, 786, -1, 1, 0),
      (787, 791, -1, 1, 0),
      (792, 793, -1, 1, 0),
      (794, 796, 138, 1, 0),
      (797, 800, 138, 1, 0),
      (801, 803, -1, 1, 0),
      (804, 810, 141, 1, 0),
      (811, 819, 142, 5, 0),
      (820, 823, -1, 1, 0),
      (824, 828, 144, 1, 0),
      (829, 834, 145, 2, 0),
      (835, 838, -1, 1, 0),
      (839, 842, -1, 1, 0),
      (843, 847, -1, 1, 0),
      (848, 852, -1, 1, 0),
      (853, 855, -1, 1, 0),
      (856, 858, -1, 1, 0),
      (859, 862, 152, 1, 0),
      (863, 867, 153, 1, 0),
      (868, 872, 153, 1, 0),
      (873, 875, -1, 1, 0),
      (876, 880, 156, 1, 0),
      (881, 888, 157, 1, 0),
      (889, 895, 157, 1, 0),
      (896, 904, 159, 1, 0),
      (905, 910, 156, 1, 0),
      (911, 913, -1, 1, 0),
      (914, 917, -1, 1, 0),
      (918, 921, -1, 1, 0),
      (922, 926, 164, 1, 0),
      (927, 932, 165, 1, 0),
      (933, 935, -1, 1, 0),
      (936, 938, -1, 1, 0),
      (939, 941, -1, 1, 0),
      (942, 946, 169, 1, 0),
      (947, 951, 169, 1, 0),
      (952, 954, -1, 1, 0),
      (955, 957, -1, 1, 0),
      (958, 960, -1, 1, 0),
      (961, 964, 174, 1, 0),
      (965, 967, -1, 1, 0),
      (968, 971, -1, 1, 0),
      (972, 978, 177, 1, 0),
      (979, 984, 177, 1, 0),
      (985, 992, 179, 1, 0),
      (993, 997, -1, 1, 0),
      (998, 999, -1, 1, 0),
      (1000, 1002, -1, 1, 0),
      (1003, 1005, -1, 1, 0),
      (1006, 1009, 184, 1, 0),
      (1010, 1013, 184, 1, 0),
      (1014, 1018, 186, 1, 0),
      (1019, 1025, 187, 1, 0),
      (1026, 1027, -1, 1, 0),
      (1028, 1032, -1, 1, 0),
      (1033, 1038, -1, 1, 0),
      (1039, 1044, -1, 1, 0),
      (1045, 1048, -1, 1, 0),
      (1049, 1054, -1, 1, 0),
      (1055, 1058, -1, 1, 0),
      (1059, 1060, -1, 1, 0),
      (1061, 1063, 196, 1, 0),
      (1064, 1067, 197, 1, 0),
      (1068, 1072, 198, 1, 0));

   A_3 : constant Among_Array_Type (0 .. 282) := (
      (1073, 1075, -1, 1, 0),
      (1076, 1079, -1, 1, 0),
      (1080, 1083, -1, 1, 0),
      (1084, 1088, -1, 1, 0),
      (1089, 1091, -1, 1, 0),
      (1092, 1094, -1, 1, 0),
      (1095, 1097, -1, 1, 0),
      (1098, 1101, -1, 1, 0),
      (1102, 1103, -1, 1, 0),
      (1104, 1107, 8, 1, 0),
      (1108, 1111, 8, 1, 0),
      (1112, 1114, -1, 1, 0),
      (1115, 1118, -1, 1, 0),
      (1119, 1121, -1, 1, 0),
      (1122, 1126, -1, 1, 0),
      (1127, 1130, -1, 1, 0),
      (1131, 1133, -1, 1, 0),
      (1134, 1136, -1, 1, 0),
      (1137, 1140, -1, 1, 0),
      (1141, 1143, -1, 1, 0),
      (1144, 1148, 19, 1, 0),
      (1149, 1153, 19, 1, 0),
      (1154, 1158, 19, 1, 0),
      (1159, 1161, -1, 1, 0),
      (1162, 1164, -1, 1, 0),
      (1165, 1168, -1, 1, 0),
      (1169, 1170, -1, 1, 0),
      (1171, 1172, -1, 1, 0),
      (1173, 1174, -1, 1, 0),
      (1175, 1176, -1, 1, 0),
      (1177, 1178, -1, 1, 0),
      (1179, 1181, 30, 1, 0),
      (1182, 1184, -1, 1, 0),
      (1185, 1188, -1, 1, 0),
      (1189, 1192, -1, 1, 0),
      (1193, 1196, -1, 1, 0),
      (1197, 1198, -1, 1, 0),
      (1199, 1201, -1, 1, 0),
      (1202, 1206, -1, 1, 0),
      (1207, 1210, -1, 1, 0),
      (1211, 1214, -1, 1, 0),
      (1215, 1216, -1, 1, 0),
      (1217, 1218, -1, 1, 0),
      (1219, 1222, 42, 1, 0),
      (1223, 1226, 42, 1, 0),
      (1227, 1231, 42, 1, 0),
      (1232, 1236, 42, 1, 0),
      (1237, 1242, 42, 1, 0),
      (1243, 1248, 42, 1, 0),
      (1249, 1253, 42, 1, 0),
      (1254, 1259, 42, 1, 0),
      (1260, 1263, 42, 1, 0),
      (1264, 1268, 42, 1, 0),
      (1269, 1273, 42, 1, 0),
      (1274, 1279, 42, 1, 0),
      (1280, 1283, 42, 1, 0),
      (1284, 1289, 55, 1, 0),
      (1290, 1295, 55, 1, 0),
      (1296, 1300, -1, 1, 0),
      (1301, 1305, -1, 1, 0),
      (1306, 1310, -1, 1, 0),
      (1311, 1316, -1, 1, 0),
      (1317, 1322, -1, 1, 0),
      (1323, 1328, -1, 1, 0),
      (1329, 1334, -1, 1, 0),
      (1335, 1337, -1, 1, 0),
      (1338, 1339, -1, 1, 0),
      (1340, 1343, 66, 1, 0),
      (1344, 1348, 66, 1, 0),
      (1349, 1352, 66, 1, 0),
      (1353, 1357, 66, 1, 0),
      (1358, 1361, 66, 1, 0),
      (1362, 1365, 66, 1, 0),
      (1366, 1371, 72, 1, 0),
      (1372, 1377, 72, 1, 0),
      (1378, 1383, 72, 1, 0),
      (1384, 1385, -1, 1, 0),
      (1386, 1388, 76, 1, 0),
      (1389, 1393, 77, 1, 0),
      (1394, 1398, 77, 1, 0),
      (1399, 1402, 76, 1, 0),
      (1403, 1406, 76, 1, 0),
      (1407, 1410, 76, 1, 0),
      (1411, 1415, 76, 1, 0),
      (1416, 1420, 76, 1, 0),
      (1421, 1424, 76, 1, 0),
      (1425, 1429, 76, 1, 0),
      (1430, 1434, 76, 1, 0),
      (1435, 1439, 76, 1, 0),
      (1440, 1444, 76, 1, 0),
      (1445, 1450, 76, 1, 0),
      (1451, 1456, 76, 1, 0),
      (1457, 1462, 76, 1, 0),
      (1463, 1468, 76, 1, 0),
      (1469, 1475, 76, 1, 0),
      (1476, 1479, 76, 1, 0),
      (1480, 1483, 76, 1, 0),
      (1484, 1488, 96, 1, 0),
      (1489, 1493, 76, 1, 0),
      (1494, 1497, 76, 1, 0),
      (1498, 1499, -1, 1, 0),
      (1500, 1503, 100, 1, 0),
      (1504, 1506, 100, 1, 0),
      (1507, 1510, 102, 1, 0),
      (1511, 1515, 102, 1, 0),
      (1516, 1520, 102, 1, 0),
      (1521, 1525, 102, 1, 0),
      (1526, 1531, 102, 1, 0),
      (1532, 1537, 100, 1, 0),
      (1538, 1542, 100, 1, 0),
      (1543, 1546, -1, 1, 0),
      (1547, 1551, -1, 1, 0),
      (1552, 1556, -1, 1, 0),
      (1557, 1561, -1, 1, 0),
      (1562, 1566, -1, 1, 0),
      (1567, 1570, -1, 1, 0),
      (1571, 1573, -1, 1, 0),
      (1574, 1576, -1, 1, 0),
      (1577, 1580, -1, 2, 0),
      (1581, 1585, -1, 1, 0),
      (1586, 1587, -1, 1, 0),
      (1588, 1590, -1, 1, 0),
      (1591, 1594, 121, 1, 0),
      (1595, 1598, -1, 1, 0),
      (1599, 1602, -1, 1, 0),
      (1603, 1604, -1, 1, 0),
      (1605, 1608, 125, 1, 0),
      (1609, 1610, -1, 1, 0),
      (1611, 1615, 127, 1, 0),
      (1616, 1617, -1, 1, 0),
      (1618, 1621, -1, 1, 0),
      (1622, 1623, -1, 1, 0),
      (1624, 1627, 131, 1, 0),
      (1628, 1631, 131, 1, 0),
      (1632, 1635, 131, 1, 0),
      (1636, 1639, 131, 1, 0),
      (1640, 1644, 131, 1, 0),
      (1645, 1648, 131, 1, 0),
      (1649, 1654, 137, 1, 0),
      (1655, 1660, 137, 1, 0),
      (1661, 1666, 137, 1, 0),
      (1667, 1669, -1, 1, 0),
      (1670, 1671, -1, 1, 0),
      (1672, 1675, 142, 1, 0),
      (1676, 1679, 142, 1, 0),
      (1680, 1683, 142, 1, 0),
      (1684, 1688, 142, 1, 0),
      (1689, 1693, 142, 1, 0),
      (1694, 1696, 142, 1, 0),
      (1697, 1701, 148, 1, 0),
      (1702, 1706, 148, 1, 0),
      (1707, 1710, 142, 1, 0),
      (1711, 1714, 142, 1, 0),
      (1715, 1720, 142, 1, 0),
      (1721, 1725, 142, 1, 0),
      (1726, 1729, 142, 1, 0),
      (1730, 1734, 142, 1, 0),
      (1735, 1739, 142, 1, 0),
      (1740, 1744, 142, 1, 0),
      (1745, 1749, 142, 1, 0),
      (1750, 1755, 142, 1, 0),
      (1756, 1759, 142, 1, 0),
      (1760, 1765, 161, 1, 0),
      (1766, 1772, 161, 1, 0),
      (1773, 1776, 142, 1, 0),
      (1777, 1780, 142, 1, 0),
      (1781, 1785, 165, 1, 0),
      (1786, 1790, 142, 1, 0),
      (1791, 1794, 142, 1, 0),
      (1795, 1799, -1, 1, 0),
      (1800, 1804, -1, 1, 0),
      (1805, 1810, -1, 1, 0),
      (1811, 1815, -1, 1, 0),
      (1816, 1822, 172, 1, 0),
      (1823, 1829, 172, 1, 0),
      (1830, 1836, 172, 1, 0),
      (1837, 1841, -1, 1, 0),
      (1842, 1847, -1, 1, 0),
      (1848, 1853, -1, 1, 0),
      (1854, 1859, -1, 1, 0),
      (1860, 1863, -1, 1, 0),
      (1864, 1866, -1, 1, 0),
      (1867, 1870, 181, 1, 0),
      (1871, 1875, 181, 1, 0),
      (1876, 1880, 181, 1, 0),
      (1881, 1885, 181, 1, 0),
      (1886, 1891, 181, 1, 0),
      (1892, 1897, -1, 1, 0),
      (1898, 1902, -1, 1, 0),
      (1903, 1907, -1, 1, 0),
      (1908, 1911, -1, 1, 0),
      (1912, 1917, -1, 1, 0),
      (1918, 1923, -1, 1, 0),
      (1924, 1929, -1, 1, 0),
      (1930, 1932, -1, 1, 0),
      (1933, 1936, -1, 1, 0),
      (1937, 1940, -1, 1, 0),
      (1941, 1944, -1, 1, 0),
      (1945, 1951, 197, 1, 0),
      (1952, 1958, 197, 1, 0),
      (1959, 1966, 197, 1, 0),
      (1967, 1972, 197, 1, 0),
      (1973, 1980, 201, 1, 0),
      (1981, 1988, 201, 1, 0),
      (1989, 1996, 201, 1, 0),
      (1997, 2002, -1, 1, 0),
      (2003, 2008, -1, 1, 0),
      (2009, 2014, -1, 1, 0),
      (2015, 2021, -1, 1, 0),
      (2022, 2029, -1, 1, 0),
      (2030, 2033, -1, 1, 0),
      (2034, 2038, -1, 1, 0),
      (2039, 2041, -1, 1, 0),
      (2042, 2046, 212, 1, 0),
      (2047, 2049, -1, 1, 0),
      (2050, 2052, -1, 1, 0),
      (2053, 2055, -1, 1, 0),
      (2056, 2059, -1, 1, 0),
      (2060, 2062, -1, 1, 0),
      (2063, 2067, 218, 1, 0),
      (2068, 2072, 218, 1, 0),
      (2073, 2077, -1, 1, 0),
      (2078, 2082, -1, 1, 0),
      (2083, 2087, -1, 1, 0),
      (2088, 2090, -1, 1, 0),
      (2091, 2095, 224, 1, 0),
      (2096, 2098, -1, 1, 0),
      (2099, 2102, -1, 1, 0),
      (2103, 2104, -1, 1, 0),
      (2105, 2106, -1, 1, 0),
      (2107, 2109, -1, 1, 0),
      (2110, 2112, -1, 1, 0),
      (2113, 2115, -1, 1, 0),
      (2116, 2117, -1, 1, 0),
      (2118, 2120, -1, 1, 0),
      (2121, 2122, -1, 1, 0),
      (2123, 2126, 235, 1, 0),
      (2127, 2129, -1, 1, 0),
      (2130, 2133, -1, 1, 0),
      (2134, 2137, -1, 1, 0),
      (2138, 2141, -1, 1, 0),
      (2142, 2146, -1, 1, 0),
      (2147, 2151, -1, 1, 0),
      (2152, 2156, -1, 1, 0),
      (2157, 2161, -1, 1, 0),
      (2162, 2168, 244, 1, 0),
      (2169, 2174, -1, 1, 0),
      (2175, 2180, -1, 1, 0),
      (2181, 2185, -1, 1, 0),
      (2186, 2191, -1, 1, 0),
      (2192, 2196, -1, 1, 0),
      (2197, 2201, -1, 1, 0),
      (2202, 2206, -1, 1, 0),
      (2207, 2210, -1, 1, 0),
      (2211, 2216, 253, 1, 0),
      (2217, 2220, -1, 1, 0),
      (2221, 2226, 255, 1, 0),
      (2227, 2232, 255, 1, 0),
      (2233, 2237, -1, 1, 0),
      (2238, 2242, -1, 1, 0),
      (2243, 2248, -1, 1, 0),
      (2249, 2254, -1, 1, 0),
      (2255, 2260, -1, 1, 0),
      (2261, 2266, -1, 1, 0),
      (2267, 2269, -1, 1, 0),
      (2270, 2271, -1, 1, 0),
      (2272, 2274, 265, 1, 0),
      (2275, 2277, -1, 1, 0),
      (2278, 2280, -1, 1, 0),
      (2281, 2283, -1, 1, 0),
      (2284, 2287, -1, 1, 0),
      (2288, 2291, -1, 1, 0),
      (2292, 2296, -1, 1, 0),
      (2297, 2300, -1, 1, 0),
      (2301, 2304, -1, 1, 0),
      (2305, 2308, -1, 1, 0),
      (2309, 2312, -1, 1, 0),
      (2313, 2316, -1, 1, 0),
      (2317, 2320, -1, 1, 0),
      (2321, 2324, -1, 1, 0),
      (2325, 2326, -1, 1, 0),
      (2327, 2329, -1, 1, 0),
      (2330, 2332, -1, 1, 0));

   A_4 : constant Among_Array_Type (0 .. 21) := (
      (2333, 2333, -1, 1, 0),
      (2334, 2334, -1, 1, 0),
      (2335, 2335, -1, 1, 0),
      (2336, 2338, -1, 1, 0),
      (2339, 2339, -1, 1, 0),
      (2340, 2341, -1, 1, 0),
      (2342, 2342, -1, 1, 0),
      (2343, 2344, 6, 1, 0),
      (2345, 2346, 6, 1, 0),
      (2347, 2349, 6, 1, 0),
      (2350, 2351, -1, 1, 0),
      (2352, 2353, -1, 1, 0),
      (2354, 2355, -1, 1, 0),
      (2356, 2358, -1, 2, 0),
      (2359, 2361, -1, 1, 0),
      (2362, 2363, -1, 1, 0),
      (2364, 2365, -1, 1, 0),
      (2366, 2367, -1, 1, 0),
      (2368, 2369, -1, 1, 0),
      (2370, 2371, -1, 1, 0),
      (2372, 2373, -1, 1, 0),
      (2374, 2375, -1, 1, 0));


   procedure R_Mark_regions (Z : in out Context_Type; Result : out Boolean) is
      C : Result_Index;
      A : Integer;
      v_1 : Char_Index;
   begin
      --  (, line 36
      Z.I_P1 := Z.L;
      Z.I_P2 := Z.L;
      --  do, line 41
      v_1 := Z.C;
      --  (, line 41
            --  gopast, line 42
      --  grouping v, line 42
      Out_Grouping (Z, G_V, 97, 252, True, C);
      if C < 0 then
         goto lab0;
      end if;
      Z.C := Z.C + C;
            --  gopast, line 42
      --  non v, line 42
      In_Grouping (Z, G_V, 97, 252, True, C);
      if C < 0 then
         goto lab0;
      end if;
      Z.C := Z.C + C;
      --  setmark p1, line 42
      Z.I_P1 := Z.C;
            --  gopast, line 43
      --  grouping v, line 43
      Out_Grouping (Z, G_V, 97, 252, True, C);
      if C < 0 then
         goto lab0;
      end if;
      Z.C := Z.C + C;
            --  gopast, line 43
      --  non v, line 43
      In_Grouping (Z, G_V, 97, 252, True, C);
      if C < 0 then
         goto lab0;
      end if;
      Z.C := Z.C + C;
      --  setmark p2, line 43
      Z.I_P2 := Z.C;

      <<lab0>>
      Z.C := v_1;

      Result := True;
   end R_Mark_regions;

   procedure R_Cleaning (Z : in out Context_Type; Result : out Boolean) is
      C : Result_Index;
      A : Integer;
      v_1 : Char_Index;
   begin
      --  repeat, line 47

      <<lab0>>

      loop
         v_1 := Z.C;
         --  (, line 47
         Z.Bra := Z.C;         --  [, line 48

         --  substring, line 48
         if Z.C + 1 >= Z.L or else Check_Among (Z, Z.C + 1, 5, 16#148cb303#) then
            A := 7;
         else            --  substring, line 48
            Find_Among (Z, A_0, Among_String, null, A);
            if A = 0 then
               goto lab1;
            end if;
         end if;
         Z.Ket := Z.C;         --  ], line 48

         --  among, line 48
         case A is
            when 1 =>
               --  (, line 49
               --  <-, line 49
               Slice_From (Z, "a");
            when 2 =>
               --  (, line 51
               --  <-, line 51
               Slice_From (Z, "e");
            when 3 =>
               --  (, line 53
               --  <-, line 53
               Slice_From (Z, "i");
            when 4 =>
               --  (, line 55
               --  <-, line 55
               Slice_From (Z, "o");
            when 5 =>
               --  (, line 57
               --  <-, line 57
               Slice_From (Z, "u");
            when 6 =>
               --  (, line 60
               --  <-, line 60
               Slice_From (Z, ".");
            when 7 =>
               --  (, line 61
               --  next, line 61
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
   end R_Cleaning;

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
      --  (, line 70
      Z.Ket := Z.C;      --  [, line 71

      --  substring, line 71
      if Z.C - 1 <= Z.Lb or else Check_Among (Z, Z.C - 1, 3, 16#18f222#) then
         Result := False;
         return;
         --  substring, line 71
      end if;
      Find_Among_Backward (Z, A_1, Among_String, null, A);
      if A = 0 then
         Result := False;
         return;
      end if;
      Z.Bra := Z.C;      --  ], line 71

      --  (, line 81
      --  call R1, line 81
      R_R1 (Z, Result);
      if not Result then
         Result := False;
         return;
      end if;
      --  delete, line 81
      Slice_Del (Z);

      Result := True;
   end R_Attached_pronoun;

   procedure R_Standard_suffix (Z : in out Context_Type; Result : out Boolean) is
      C : Result_Index;
      A : Integer;
   begin
      --  (, line 85
      Z.Ket := Z.C;      --  [, line 86

      --  substring, line 86
      Find_Among_Backward (Z, A_2, Among_String, null, A);
      if A = 0 then
         Result := False;
         return;
      end if;
      Z.Bra := Z.C;      --  ], line 86

      --  among, line 86
      case A is
         when 1 =>
            --  (, line 110
            --  call R1, line 110
            R_R1 (Z, Result);
            if not Result then
               Result := False;
               return;
            end if;
            --  delete, line 110
            Slice_Del (Z);
         when 2 =>
            --  (, line 112
            --  call R2, line 112
            R_R2 (Z, Result);
            if not Result then
               Result := False;
               return;
            end if;
            --  delete, line 112
            Slice_Del (Z);
         when 3 =>
            --  (, line 114
            --  call R2, line 114
            R_R2 (Z, Result);
            if not Result then
               Result := False;
               return;
            end if;
            --  <-, line 114
            Slice_From (Z, "log");
         when 4 =>
            --  (, line 116
            --  call R2, line 116
            R_R2 (Z, Result);
            if not Result then
               Result := False;
               return;
            end if;
            --  <-, line 116
            Slice_From (Z, "ic");
         when 5 =>
            --  (, line 118
            --  call R1, line 118
            R_R1 (Z, Result);
            if not Result then
               Result := False;
               return;
            end if;
            --  <-, line 118
            Slice_From (Z, "c");
         when others =>
            null;
      end case;

      Result := True;
   end R_Standard_suffix;

   procedure R_Verb_suffix (Z : in out Context_Type; Result : out Boolean) is
      C : Result_Index;
      A : Integer;
   begin
      --  (, line 122
      Z.Ket := Z.C;      --  [, line 123

      --  substring, line 123
      Find_Among_Backward (Z, A_3, Among_String, null, A);
      if A = 0 then
         Result := False;
         return;
      end if;
      Z.Bra := Z.C;      --  ], line 123

      --  among, line 123
      case A is
         when 1 =>
            --  (, line 168
            --  call R1, line 168
            R_R1 (Z, Result);
            if not Result then
               Result := False;
               return;
            end if;
            --  delete, line 168
            Slice_Del (Z);
         when 2 =>
            --  (, line 170
            --  call R2, line 170
            R_R2 (Z, Result);
            if not Result then
               Result := False;
               return;
            end if;
            --  delete, line 170
            Slice_Del (Z);
         when others =>
            null;
      end case;

      Result := True;
   end R_Verb_suffix;

   procedure R_Residual_suffix (Z : in out Context_Type; Result : out Boolean) is
      C : Result_Index;
      A : Integer;
   begin
      --  (, line 174
      Z.Ket := Z.C;      --  [, line 175

      --  substring, line 175
      Find_Among_Backward (Z, A_4, Among_String, null, A);
      if A = 0 then
         Result := False;
         return;
      end if;
      Z.Bra := Z.C;      --  ], line 175

      --  among, line 175
      case A is
         when 1 =>
            --  (, line 178
            --  call R1, line 178
            R_R1 (Z, Result);
            if not Result then
               Result := False;
               return;
            end if;
            --  delete, line 178
            Slice_Del (Z);
         when 2 =>
            --  (, line 180
            --  call R1, line 180
            R_R1 (Z, Result);
            if not Result then
               Result := False;
               return;
            end if;
            --  <-, line 180
            Slice_From (Z, "ic");
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
      --  (, line 185
      --  do, line 186
      --  call mark_regions, line 186
      R_Mark_regions (Z, Result);
      Z.Lb := Z.C; Z.C := Z.L;      --  backwards, line 187

      --  (, line 187
      --  do, line 188
      v_2 := Z.L - Z.C;
      --  call attached_pronoun, line 188
      R_Attached_pronoun (Z, Result);
      Z.C := Z.L - v_2;
      --  do, line 189
      v_3 := Z.L - Z.C;
      --  (, line 189
      --  or, line 189
      v_4 := Z.L - Z.C;
      --  call standard_suffix, line 189
      R_Standard_suffix (Z, Result);
      if not Result then
         goto lab2;
      end if;
      goto lab1;

      <<lab2>>
      Z.C := Z.L - v_4;
      --  call verb_suffix, line 190
      R_Verb_suffix (Z, Result);
      if not Result then
         goto lab0;
      end if;

      <<lab1>>

      <<lab0>>
      Z.C := Z.L - v_3;
      --  do, line 192
      v_5 := Z.L - Z.C;
      --  call residual_suffix, line 192
      R_Residual_suffix (Z, Result);
      Z.C := Z.L - v_5;
      Z.C := Z.Lb;
      --  do, line 194
      v_6 := Z.C;
      --  call cleaning, line 194
      R_Cleaning (Z, Result);
      Z.C := v_6;

      Result := True;
   end Stem;
end Stemmer.Catalan;
