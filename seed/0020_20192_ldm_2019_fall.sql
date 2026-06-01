-- Seed data: "Laboratoryjna diagnostyka medyczna - jesień 2019" practice exam (WERSJA I).
--
-- This is a DATA script, NOT a Sqitch migration. It is intentionally kept out of
-- deploy/revert/verify and out of sqitch.plan so it is never run by `sqitch deploy`.
--
-- Run it by hand against the target database:
--     psql "$CONN" -f seed/0020_20192_ldm_2019_fall.sql
--
-- Re-runnable: it first deletes any previously seeded copy of this exam (the
-- ON DELETE CASCADE on questions/answers removes the children) and re-inserts it.
-- Source: 0020_20192_p.pdf (questions) + 0020_20192_k.pdf (answer key), 120 questions.


BEGIN;

DELETE FROM exams WHERE id = 'fa67c30e6f46470987c00ff03d20abd5';

INSERT INTO exams (id, title, description, category_id, duration_mins, difficulty, students, rating, popular, is_new) VALUES (
    'fa67c30e6f46470987c00ff03d20abd5',
    'Laboratoryjna diagnostyka medyczna - jesień 2019',
    'Egzamin specjalizacyjny z laboratoryjnej diagnostyki medycznej, jesień 2019 (WERSJA I). 120 pytań jednokrotnego wyboru.',
    '221ec27e93e319ba4a06151abd49ce8d', 120, 70, NULL, 4.2, false, false
);

-- Q1
INSERT INTO questions (id, exam_id, text) VALUES ('5513ff2ded5543c5b4f02795ad047ad8', 'fa67c30e6f46470987c00ff03d20abd5', '1. Wskaźnik albumina/kreatynina (ACR): 1) jest metodą oceny albuminurii w pojedynczej próbce moczu; 2) jest wyrażany w mg/g lub w mg/mol; 3) pozwala na rozpoznanie nefropatii cukrzycowej; 4) jest wykorzystywany do różnicowania przyczyn azotemii. Prawidłowa odpowiedź to:');
INSERT INTO answers (id, question_id, text, is_correct) VALUES
('b2e4281ecdbb4795a12ae956d48caaea', '5513ff2ded5543c5b4f02795ad047ad8', '1,2.', false),
('83906fbe03c34103ba58dd2da87f2a24', '5513ff2ded5543c5b4f02795ad047ad8', '1,3,4.', false),
('66e6dbfd655046d29d886afe0094a73e', '5513ff2ded5543c5b4f02795ad047ad8', '1,2,3.', false),
('7d0a4a667ba24fbd80eb6a74d54a276a', '5513ff2ded5543c5b4f02795ad047ad8', '2,4.', false),
('c93b6676f3fd4f90819d6573ee4df693', '5513ff2ded5543c5b4f02795ad047ad8', '1,3.', true);

-- Q2
INSERT INTO questions (id, exam_id, text) VALUES ('60b5e240e8284c699025be900ab0c8c8', 'fa67c30e6f46470987c00ff03d20abd5', '2. Oznaczanie aktywności anty-Xa wykonuje się w celu oceny efektu antykoagulacyjnego:');
INSERT INTO answers (id, question_id, text, is_correct) VALUES
('476aa9e472ba4a8b9b421010192140e8', '60b5e240e8284c699025be900ab0c8c8', 'heparyny niefrakcjonowanej.', false),
('40921f363d77467693186c3aedbb40bc', '60b5e240e8284c699025be900ab0c8c8', 'heparyny drobnocząsteczkowej.', true),
('2b09f8824d9d40428179d54445436aee', '60b5e240e8284c699025be900ab0c8c8', 'antagonistów witaminy K.', false),
('e2c74baa6048436c9341783c3a7a3aaf', '60b5e240e8284c699025be900ab0c8c8', 'kwasu acetylosalicylowego.', false),
('f81abddd19fc4f3088bdde541e5bd3c0', '60b5e240e8284c699025be900ab0c8c8', 'antykoagulantu tocznia.', false);

-- Q3
INSERT INTO questions (id, exam_id, text) VALUES ('caf7ac6d48e7497caee459c47b821de6', 'fa67c30e6f46470987c00ff03d20abd5', '3. Diagnostyka prenatalna - przesiewowy test potrójny wykonywany w 14.-20. tygodniu ciąży - obejmuje oznaczenie:');
INSERT INTO answers (id, question_id, text, is_correct) VALUES
('be3a19dab06143b8a548542d83fe8a4b', 'caf7ac6d48e7497caee459c47b821de6', 'PlGF, α-fetoproteiny, inhibiny A.', false),
('2c829da91572419980ad21e76cc70627', 'caf7ac6d48e7497caee459c47b821de6', 'PAPP-A, β-hCG, aktywiny.', false),
('e0a1134fadf44b6699088d7181dd60d4', 'caf7ac6d48e7497caee459c47b821de6', 'PAPP-A, PlGF, wolnego estriolu.', false),
('6f0ae38d702a4336b7f5fc4e7492a5df', 'caf7ac6d48e7497caee459c47b821de6', 'β-hCG, α-fetoproteiny, wolnego estriolu.', true),
('57a50990717e45b7b666ef5c6a5d5f0c', 'caf7ac6d48e7497caee459c47b821de6', 'inhibiny A, aktywiny, białko PP-13.', false);

-- Q4
INSERT INTO questions (id, exam_id, text) VALUES ('a5e7e6597afc4d74af20117778ca3afa', 'fa67c30e6f46470987c00ff03d20abd5', '4. Przesunięcie obrazu odsetkowego granulocytów w prawo obserwuje się w:');
INSERT INTO answers (id, question_id, text, is_correct) VALUES
('0cc04814327142d69f37376087ee4735', 'a5e7e6597afc4d74af20117778ca3afa', 'przewlekłej białaczce szpikowej.', false),
('d701325638f3412e9c57c6eaeee8e0dd', 'a5e7e6597afc4d74af20117778ca3afa', 'erytroleukemii.', false),
('a730b10f092a49e0894978c4146e5015', 'a5e7e6597afc4d74af20117778ca3afa', 'przerzutach nowotworów do kości.', false),
('5b8552ada03149a98ac938f92026c211', 'a5e7e6597afc4d74af20117778ca3afa', 'niedokrwistości megaloblastycznej.', true),
('80e720ff6292472cbd63c986c67e0ee5', 'a5e7e6597afc4d74af20117778ca3afa', 'ostrych chorobach zakaźnych.', false);

-- Q5
INSERT INTO questions (id, exam_id, text) VALUES ('ef2df03d34534f92af82f360095edc81', 'fa67c30e6f46470987c00ff03d20abd5', '5. Hiperbilirubinemią z przewagą bilirubiny wolnej jest:');
INSERT INTO answers (id, question_id, text, is_correct) VALUES
('9f272df02c1b4e55b5dfc813d32b21c9', 'ef2df03d34534f92af82f360095edc81', 'zespół Gilberta.', true),
('7e2cbe7935b945829714ff977fe26dce', 'ef2df03d34534f92af82f360095edc81', 'żółtaczka mechaniczna.', false),
('961b245c1bc544a2ab9c5ac204931569', 'ef2df03d34534f92af82f360095edc81', 'zespół Dubin-Johnsona.', false),
('d93b93b0f57b4c34bd4e82bb9841e5de', 'ef2df03d34534f92af82f360095edc81', 'żółtaczka w przebiegu WZW typu B.', false),
('33bbafbe82c646439af8a4a928a4c65f', 'ef2df03d34534f92af82f360095edc81', 'zespół Rotora.', false);

-- Q6
INSERT INTO questions (id, exam_id, text) VALUES ('8f2cd296c1b94ad6a7b3930caa7d6e2c', 'fa67c30e6f46470987c00ff03d20abd5', '6. Poziom hemoglobiny glikowanej HbA1c odzwierciedla średni poziom glikemii w ciągu:');
INSERT INTO answers (id, question_id, text, is_correct) VALUES
('24f9489ac2c74fb4b1755d2e0f6032bc', '8f2cd296c1b94ad6a7b3930caa7d6e2c', 'ostatnich 2 tygodni.', false),
('68ed0384c84148e7ba47fefd8b87cf2c', '8f2cd296c1b94ad6a7b3930caa7d6e2c', 'ostatniego miesiąca.', false),
('cda36479822f413d857297a136972026', '8f2cd296c1b94ad6a7b3930caa7d6e2c', 'ostatnich 2 miesięcy.', false),
('616f516f60c94abd804865037f68a36d', '8f2cd296c1b94ad6a7b3930caa7d6e2c', 'ostatnich 3-4 miesięcy.', true),
('6fea494fa2ba4ae99e7f75027cd22ed0', '8f2cd296c1b94ad6a7b3930caa7d6e2c', 'ostatnich 6 miesięcy.', false);

-- Q7
INSERT INTO questions (id, exam_id, text) VALUES ('29e250d833cc4060adc6a525f6a68a3d', 'fa67c30e6f46470987c00ff03d20abd5', '7. Do późnych powikłań cukrzycy zalicza się:');
INSERT INTO answers (id, question_id, text, is_correct) VALUES
('ab0040fa562c47489732d65f0276cc27', '29e250d833cc4060adc6a525f6a68a3d', 'kwasicę ketonową.', false),
('03a8ff225e424cd99b738db644e4ec56', '29e250d833cc4060adc6a525f6a68a3d', 'nieketonową hiperglikemię hiperosmolalną.', false),
('7e277380130c4b78a6c3ebc3a358275a', '29e250d833cc4060adc6a525f6a68a3d', 'kwasicę mleczanową.', false),
('848d67eb41c248de9694f293438e3aa3', '29e250d833cc4060adc6a525f6a68a3d', 'hipoglikemię.', false),
('1bb3f4cfe8ea49179ac972f1d1295eaa', '29e250d833cc4060adc6a525f6a68a3d', 'nefropatię.', true);

-- Q8
INSERT INTO questions (id, exam_id, text) VALUES ('46c4458e75ba411b9dad57eb3baf7034', 'fa67c30e6f46470987c00ff03d20abd5', '8. Stężenie peptydu C we krwi jest:');
INSERT INTO answers (id, question_id, text, is_correct) VALUES
('da986348997645cfa4b8682641afa94f', '46c4458e75ba411b9dad57eb3baf7034', 'obniżone w cukrzycy typu I i typu II.', false),
('2fccdab903914788a4816fac2c205c2f', '46c4458e75ba411b9dad57eb3baf7034', 'podwyższone w cukrzycy typu I i typu II.', false),
('444a15ca3d0e43d4af4f1b313038d906', '46c4458e75ba411b9dad57eb3baf7034', 'obniżone w cukrzycy typu I, podwyższone w cukrzycy typu II.', true),
('4cef7224f6094c0782ac70beb516feee', '46c4458e75ba411b9dad57eb3baf7034', 'podwyższone w cukrzycy typu I, obniżone w cukrzycy typu II.', false),
('5a9345c20a364f629c09d8b2ea8d8c22', '46c4458e75ba411b9dad57eb3baf7034', 'w normie, niezależnie od typu cukrzycy.', false);

-- Q9
INSERT INTO questions (id, exam_id, text) VALUES ('e774717efa614cff92fce47692857021', 'fa67c30e6f46470987c00ff03d20abd5', '9. Toksycznym produktem metabolizmu metanolu jest:');
INSERT INTO answers (id, question_id, text, is_correct) VALUES
('e90ede9d7e994fbe9a149732b7c6a734', 'e774717efa614cff92fce47692857021', 'aldehyd octowy.', false),
('f2c3bc2bada142b3af1a8c758c612f28', 'e774717efa614cff92fce47692857021', 'aldehyd mrówkowy.', true),
('8b98701c1ab94678b1e8bf37e2bf2264', 'e774717efa614cff92fce47692857021', 'etanol.', false),
('d6807ccff0b4428bbd8a59330ae7173a', 'e774717efa614cff92fce47692857021', 'glikol etylenowy.', false),
('aaea44450e3c45c6a4205c4a9bb9b64e', 'e774717efa614cff92fce47692857021', 'kwas mlekowy.', false);

-- Q10
INSERT INTO questions (id, exam_id, text) VALUES ('6c41b874ad584abb8864e0e08afd478b', 'fa67c30e6f46470987c00ff03d20abd5', '10. Najwcześniejszym wskaźnikiem cholestazy ciężarnych jest:');
INSERT INTO answers (id, question_id, text, is_correct) VALUES
('2e82e12459684aca920822ca9b9cc0c9', '6c41b874ad584abb8864e0e08afd478b', 'stężenie bilirubiny całkowitej we krwi.', false),
('56184c43713b4134b9d3343565228cdb', '6c41b874ad584abb8864e0e08afd478b', 'stężenie urobilinogenu w moczu.', false),
('b3024799a5894c4e81d8353b73d54381', '6c41b874ad584abb8864e0e08afd478b', 'stężenie bilirubiny pośredniej we krwi.', false),
('3b0e2b88cc4c409d95beb7dd57e17129', '6c41b874ad584abb8864e0e08afd478b', 'aktywność GGT we krwi.', false),
('41a62043f336403c83644efaa35afe5b', '6c41b874ad584abb8864e0e08afd478b', 'stężenie całkowitych kwasów żółciowych we krwi.', true);

-- Q11
INSERT INTO questions (id, exam_id, text) VALUES ('9b65d66a931e4a11b490e0d37d21666f', 'fa67c30e6f46470987c00ff03d20abd5', '11. W przypadku przewlekłej białaczki szpikowej, w rozmazie krwi obwodowej dominują komórki szeregu:');
INSERT INTO answers (id, question_id, text, is_correct) VALUES
('ebeb4343a66f42bea4cd152424917a37', '9b65d66a931e4a11b490e0d37d21666f', 'neutrofilowego, wszystkich postaci.', false),
('f58800cdb3c04ac996b7f8248a4340f5', '9b65d66a931e4a11b490e0d37d21666f', 'granulocytarnego, dojrzałych postaci.', false),
('b470bb3ae8f64d468c9ec333f595a0b1', '9b65d66a931e4a11b490e0d37d21666f', 'granulocytarnego, młodych postaci.', false),
('294f0e2fa6d8424e97d87814e9b727bd', '9b65d66a931e4a11b490e0d37d21666f', 'neutrofilowego, postaci blastów.', false),
('d1f6de56944c4924b28b4def011b04c3', '9b65d66a931e4a11b490e0d37d21666f', 'granulocytarnego, wszystkich postaci.', true);

-- Q12
INSERT INTO questions (id, exam_id, text) VALUES ('e3540ba90e894b9e9aa49778f9cf372f', 'fa67c30e6f46470987c00ff03d20abd5', '12. Do grupy niedokrwistości hemolitycznych nie należy:');
INSERT INTO answers (id, question_id, text, is_correct) VALUES
('f6aa0e0ed8194df38883c7fe97307977', 'e3540ba90e894b9e9aa49778f9cf372f', 'dziedziczna sferocytoza.', false),
('5c9339192ec64e7a9e99aeaddee7923a', 'e3540ba90e894b9e9aa49778f9cf372f', 'niedokrwistość z niedoboru żelaza.', true),
('c3f99bacc8d24d639ab80dedb97fde90', 'e3540ba90e894b9e9aa49778f9cf372f', 'talasemia.', false),
('9a46309c170a45019f8ceb5ab86ac4b3', 'e3540ba90e894b9e9aa49778f9cf372f', 'niedokrwistość sierpowatokrwinkowa.', false),
('896fee905884458b8f6198e6d5fac443', 'e3540ba90e894b9e9aa49778f9cf372f', 'niedokrwistość mikroangiopatyczna.', false);

-- Q13
INSERT INTO questions (id, exam_id, text) VALUES ('f124cd45937948fe9fbc367444d75f60', 'fa67c30e6f46470987c00ff03d20abd5', '13. Dodatnia reakcja na obecność mieloperoksydazy i fenotyp komórek blastycznych: CD13+, CD33+, CD117+, CD14-, CD61-, CD41-, CD3-, CD7-, CD19-, CD22- pozwalają na rozpoznanie:');
INSERT INTO answers (id, question_id, text, is_correct) VALUES
('ffa6d0e4205348649f712aba6d29ae18', 'f124cd45937948fe9fbc367444d75f60', 'ostrej białaczki limfoblastycznej z komórek B.', false),
('0426e6623da44e76a8dcc1b696329196', 'f124cd45937948fe9fbc367444d75f60', 'ostrej białaczki limfoblastycznej z komórek T.', false),
('f885a846cf394bafa4cf892fd72b49f5', 'f124cd45937948fe9fbc367444d75f60', 'ostrej białaczki megakarioblastycznej.', false),
('6e5a27204a1b43d497deb9f431567d5f', 'f124cd45937948fe9fbc367444d75f60', 'ostrej białaczki mieloblastycznej.', true),
('e4aa7d07f4bb405f846d44133b6aa09b', 'f124cd45937948fe9fbc367444d75f60', 'ostrej białaczki monoblastycznej.', false);

-- Q14
INSERT INTO questions (id, exam_id, text) VALUES ('c7f1e98746734cc287e7c9d05f4ee486', 'fa67c30e6f46470987c00ff03d20abd5', '14. Obecność licznych schistocytów w rozmazie krwi towarzyszy:');
INSERT INTO answers (id, question_id, text, is_correct) VALUES
('fc113457156a404c9b6a022ab89a067d', 'c7f1e98746734cc287e7c9d05f4ee486', 'czerwienicy prawdziwej.', false),
('48dd431dbe54496a9f6b25e1c50b2bd1', 'c7f1e98746734cc287e7c9d05f4ee486', 'hemolizie wewnątrznaczyniowej.', true),
('b4028d7d6a5a484897579eef7191ad39', 'c7f1e98746734cc287e7c9d05f4ee486', 'niedoborowi kwasu foliowego.', false),
('84cfaae9df824ecd99bc6758656fdeef', 'c7f1e98746734cc287e7c9d05f4ee486', 'niedoborowi żelaza.', false),
('d90edf9d1a24491eb0088890eb19f106', 'c7f1e98746734cc287e7c9d05f4ee486', 'sferocytozie wrodzonej.', false);

-- Q15
INSERT INTO questions (id, exam_id, text) VALUES ('4befca01982b48d0a58bd6fbc89a597c', 'fa67c30e6f46470987c00ff03d20abd5', '15. W przewlekłej białaczce limfocytowej B-komórkowej w rozmazie krwi występują:');
INSERT INTO answers (id, question_id, text, is_correct) VALUES
('875c201e44844ef5846cc5a16bf55c50', '4befca01982b48d0a58bd6fbc89a597c', 'komórki blastyczne w odsetku > 20%.', false),
('045dc400b89b41029aa910cad8eceb38', '4befca01982b48d0a58bd6fbc89a597c', 'morfologicznie dojrzałe limfocyty i cienie Gumprechta.', true),
('f3838668f5c7489fb6bade31081519bb', '4befca01982b48d0a58bd6fbc89a597c', 'duże ziarniste limfocyty.', false),
('53110a81aaa64ae4a3229a4f583b5182', '4befca01982b48d0a58bd6fbc89a597c', 'limfocyty z wypustkami cytoplazmy.', false),
('4a60849833a545ac9dc7a0081a8eb037', '4befca01982b48d0a58bd6fbc89a597c', 'prolimfocyty w odsetku > 55%.', false);

-- Q16
INSERT INTO questions (id, exam_id, text) VALUES ('d03f91094c0c43a89c9a906a9ffd02ab', 'fa67c30e6f46470987c00ff03d20abd5', '16. Jednym z kryteriów fazy akceleracji białaczki szpikowej przewlekłej wg WHO jest:');
INSERT INTO answers (id, question_id, text, is_correct) VALUES
('b800fb6e56a04672bdb04ec9bd024993', 'd03f91094c0c43a89c9a906a9ffd02ab', 'małopłytkowość < 100 x10⁹/l (niezwiązana z leczeniem).', true),
('7a020e9c566c4480b36721bedcd82256', 'd03f91094c0c43a89c9a906a9ffd02ab', 'obecność > 15% pierścieniowatych syderoblastów w szpiku.', false),
('72a486c9f5ad49159928dbbae3a87099', 'd03f91094c0c43a89c9a906a9ffd02ab', 'obniżona do zerowych wartości aktywność fosfatazy alkalicznej neutrofili.', false),
('0a2277c84ef94a1fad3df92c3837a6c0', 'd03f91094c0c43a89c9a906a9ffd02ab', 'odsetek komórek blastycznych w szpiku ≥ 20%.', false),
('c893faf1ab8a48cabf59b12b20244397', 'd03f91094c0c43a89c9a906a9ffd02ab', 'zwiększenie stężenia hemoglobiny > 16,5 g/dl u kobiet lub > 18,5 g/dl u mężczyzn.', false);

-- Q17
INSERT INTO questions (id, exam_id, text) VALUES ('28c2a2b895ed466fab72764177aca482', 'fa67c30e6f46470987c00ff03d20abd5', '17. Kryterium przydatnym w różnicowaniu czerwienicy prawdziwej i nadkrwistości objawowej jest:');
INSERT INTO answers (id, question_id, text, is_correct) VALUES
('b0d9313695654a379a5505d3da997351', '28c2a2b895ed466fab72764177aca482', 'liczba erytrocytów.', false),
('c32dc1a165ad4ae9a6bb320fb2ad3451', '28c2a2b895ed466fab72764177aca482', 'liczba retykulocytów.', false),
('c33020668aa045328824e877308eb453', '28c2a2b895ed466fab72764177aca482', 'liczba leukocytów i trombocytów.', true),
('94e0b8ec014f4eda992edf2f3bdf9194', '28c2a2b895ed466fab72764177aca482', 'stężenie hemoglobiny.', false),
('df869f9aa63d43c5bc63e305c2528b6d', '28c2a2b895ed466fab72764177aca482', 'wartość MCV.', false);

-- Q18
INSERT INTO questions (id, exam_id, text) VALUES ('98e8708c450d4b20807a68eb399433fc', 'fa67c30e6f46470987c00ff03d20abd5', '18. W diagnostyce różnicowej przewlekłych nowotworów mieloproliferacyjnych obecność genu fuzyjnego BCR/ABL jest kluczowa do rozpoznania:');
INSERT INTO answers (id, question_id, text, is_correct) VALUES
('2e94e973a4ce4712ae5970f1ceb6ad5d', '98e8708c450d4b20807a68eb399433fc', 'przewlekłej białaczki szpikowej.', true),
('a813294f5b1a44b6a7fc95f29841f343', '98e8708c450d4b20807a68eb399433fc', 'czerwienicy prawdziwej.', false),
('1e4ae965d8794398a328c53042452987', '98e8708c450d4b20807a68eb399433fc', 'mastocytozy.', false),
('3957c81271c64941b873e9160730c678', '98e8708c450d4b20807a68eb399433fc', 'nadpłytkowości samoistnej.', false),
('ef2e4e0170744c8d9dbd24e492b5a964', '98e8708c450d4b20807a68eb399433fc', 'pierwotnego zwłóknienia szpiku.', false);

-- Q19
INSERT INTO questions (id, exam_id, text) VALUES ('ad82149c7178471e83ca96233d9f958b', 'fa67c30e6f46470987c00ff03d20abd5', '19. Trombocytopenia i leukopenia mogą towarzyszyć:');
INSERT INTO answers (id, question_id, text, is_correct) VALUES
('15a639a0073c4e6a9311ae6ce303731d', 'ad82149c7178471e83ca96233d9f958b', 'białaczce włochatokomórkowej.', false),
('ec1d7696050947168261e166bab63f19', 'ad82149c7178471e83ca96233d9f958b', 'niedokrwistości aplastycznej.', false),
('63e976bb55684be2961b9b494529ffb6', 'ad82149c7178471e83ca96233d9f958b', 'niedokrwistości megaloblastycznej.', false),
('3bf2f5e8d36c4c128d40da31ce842341', 'ad82149c7178471e83ca96233d9f958b', 'zespołom mielodysplastycznym.', false),
('78a194b66c32443589c9f7e04944b591', 'ad82149c7178471e83ca96233d9f958b', 'wszystkim wymienionym.', true);

-- Q20
INSERT INTO questions (id, exam_id, text) VALUES ('d100c6f3a2b54ebfa7f0f0bc7e5a9414', 'fa67c30e6f46470987c00ff03d20abd5', '20. „Klonalny rozrost jednej lub więcej linii mieloidalnych oraz zwiększona lepkość krwi, wynikająca z dużej liczby erytrocytów, leukocytów i/lub płytek krwi" - to zdanie charakteryzujące:');
INSERT INTO answers (id, question_id, text, is_correct) VALUES
('c6da4b6043d54a919a8f98fc4e360158', 'd100c6f3a2b54ebfa7f0f0bc7e5a9414', 'zespoły limfoproliferacyjne.', false),
('74b38f80d61548858e62173d2e92f123', 'd100c6f3a2b54ebfa7f0f0bc7e5a9414', 'przewlekłe nowotwory mieloproliferacyjne.', true),
('c7c65d2b8b034bef8bbeca304ee28e9f', 'd100c6f3a2b54ebfa7f0f0bc7e5a9414', 'zespoły mielodysplastyczne.', false),
('f4bedeed641b414399ee964b5ff1820c', 'd100c6f3a2b54ebfa7f0f0bc7e5a9414', 'ostre białaczki szpikowe.', false),
('4da0c4f446f54cdebfc60cb431594534', 'd100c6f3a2b54ebfa7f0f0bc7e5a9414', 'ostre białaczki limfoblastyczne.', false);

-- Q21
INSERT INTO questions (id, exam_id, text) VALUES ('26eede694e7544629dfea0720a3e0550', 'fa67c30e6f46470987c00ff03d20abd5', '21. Barwienie cytochemiczne fosfatazy alkalicznej granulocytów (FAG) znalazło zastosowanie w diagnostyce laboratoryjnej:');
INSERT INTO answers (id, question_id, text, is_correct) VALUES
('7dde5a58351447548eeab040d9bf8193', '26eede694e7544629dfea0720a3e0550', 'ostrej białaczki szpikowej.', false),
('ce3f486babe642059f1d51ad492bd190', '26eede694e7544629dfea0720a3e0550', 'przewlekłej białaczki limfocytowej B-komórkowej.', false),
('3857f65faa224f5ba6c67ed915f6fbb4', '26eede694e7544629dfea0720a3e0550', 'ostrej białaczki limfoblastycznej.', false),
('538a4aa893e340498d590e2af3da20a0', '26eede694e7544629dfea0720a3e0550', 'przewlekłej białaczki szpikowej.', true),
('bd8edd32f05b4bc6962b74395f066404', '26eede694e7544629dfea0720a3e0550', 'szpiczaka plazmocytowego.', false);

-- Q22
INSERT INTO questions (id, exam_id, text) VALUES ('fbbee6417b004451ac69927d797433f4', 'fa67c30e6f46470987c00ff03d20abd5', '22. Do niekorzystnych laboratoryjnych czynników rokowniczych w szpiczaku plazmocytowym zalicza się:');
INSERT INTO answers (id, question_id, text, is_correct) VALUES
('b063bd6a360c4a598cedf26ff08da7ce', 'fbbee6417b004451ac69927d797433f4', 'duże stężenie wolnych łańcuchów lekkich.', false),
('8795b59efe834271954653ef34b9e1c0', 'fbbee6417b004451ac69927d797433f4', 'liczbę płytek powyżej 400 × 10⁹/l.', false),
('e00264ed002a48cabeb52f943d450c75', 'fbbee6417b004451ac69927d797433f4', 'stężenie β₂-mikroglobuliny powyżej 30 g/l.', false),
('bc56bab2f3aa4bdaab5ced5e7b6b24c8', 'fbbee6417b004451ac69927d797433f4', 'prawdziwe są odpowiedzi A i C.', true),
('ee3b26bc2e2a4236b70d7296bb700ea7', 'fbbee6417b004451ac69927d797433f4', 'prawdziwe są odpowiedzi A,B,C.', false);

-- Q23
INSERT INTO questions (id, exam_id, text) VALUES ('751f4b33c1914824847407be6bcd8c80', 'fa67c30e6f46470987c00ff03d20abd5', '23. Wskaż prawdziwe stwierdzenie dotyczące przewlekłej białaczki limfocytowej B-komórkowej:');
INSERT INTO answers (id, question_id, text, is_correct) VALUES
('8e61f795ba444f1c89566c788414fafc', '751f4b33c1914824847407be6bcd8c80', 'immunofenotyp limfocytów nowotworowych to CD3+, CD5+, CD4+, CD8-.', false),
('b0587024ee884b648b36226bc1ed0337', '751f4b33c1914824847407be6bcd8c80', 'w rozmazie krwi obecne są limfocyty włochate.', false),
('267aa01bae274b8da3702ea3152fb2be', '751f4b33c1914824847407be6bcd8c80', 'w rozmazie krwi dominują limfocyty.', true),
('a15aaecf98e04b5dabef65b0bad44a71', '751f4b33c1914824847407be6bcd8c80', 'na powierzchni nowotworowych limfocytów nie wykrywa się ekspresji CD23.', false),
('e221fe4192444fb9ad386bd12fec961b', '751f4b33c1914824847407be6bcd8c80', 'w rozmazie krwi ponad 20% stanowią limfoblasty.', false);

-- Q24
INSERT INTO questions (id, exam_id, text) VALUES ('7c343b7fb45b4dadb642c800bd0bcf92', 'fa67c30e6f46470987c00ff03d20abd5', '24. Do powierzchniowych markerów granulocytarnych zalicza się:');
INSERT INTO answers (id, question_id, text, is_correct) VALUES
('5d6b8d21576d466ab8256f385647c9c2', '7c343b7fb45b4dadb642c800bd0bcf92', 'CD13, CD33, CD65.', true),
('e515c52ddad344f1a3191b1a63a94820', '7c343b7fb45b4dadb642c800bd0bcf92', 'CD41, CD42, CD61.', false),
('d2c611d3da5c4e32bed7359469e7a077', '7c343b7fb45b4dadb642c800bd0bcf92', 'CD3, CD5, CD7.', false),
('3033ead35d6242a580333b792f170633', '7c343b7fb45b4dadb642c800bd0bcf92', 'CD34, CD133, HLA-DR.', false),
('5da2a343d49d4746998da125e4ef7de8', '7c343b7fb45b4dadb642c800bd0bcf92', 'CD11c, CD14, CD64.', false);

-- Q25
INSERT INTO questions (id, exam_id, text) VALUES ('1d7533c23af0428a8b23fab41ac991d9', 'fa67c30e6f46470987c00ff03d20abd5', '25. Nasilenie niedokrwistości chorób przewlekłych (ACD) koreluje z zaawansowaniem:');
INSERT INTO answers (id, question_id, text, is_correct) VALUES
('8d32eb8b573b4ea59088dea2a53928e5', '1d7533c23af0428a8b23fab41ac991d9', 'przewlekłego zakażenia dróg moczowych.', false),
('0066689336d14e54bc1814ed23542df5', '1d7533c23af0428a8b23fab41ac991d9', 'reumatoidalnego zapalenia stawów.', false),
('387bc7eb2f2e44dbbd61d90cf42b606a', '1d7533c23af0428a8b23fab41ac991d9', 'sarkoidozy.', false),
('3cdae7c31abd4cda953b5a92b4ec6805', '1d7533c23af0428a8b23fab41ac991d9', 'przewlekłych chorób nerek.', false),
('e2248168ac7f4c40a7ab8061af9213bd', '1d7533c23af0428a8b23fab41ac991d9', 'wszystkich wyżej wymienionych.', true);

-- Q26
INSERT INTO questions (id, exam_id, text) VALUES ('4a0ff499627d46d196dd658dacadabd9', 'fa67c30e6f46470987c00ff03d20abd5', '26. Fruktozamina jest miernikiem oceny:');
INSERT INTO answers (id, question_id, text, is_correct) VALUES
('c38913d2706a4d08aa0d79aa030e47df', '4a0ff499627d46d196dd658dacadabd9', 'glikacji białek osocza.', true),
('4fad4f7e8fea4e6983a53780c79ce326', '4a0ff499627d46d196dd658dacadabd9', 'glikacji hemoglobiny.', false),
('660afdab3ac140f198edd9aeeb091b76', '4a0ff499627d46d196dd658dacadabd9', 'stanu zapalnego.', false),
('afa2140f0e914829980e76b3c1e00036', '4a0ff499627d46d196dd658dacadabd9', 'zespołu fosfolipidowego.', false),
('eddb45a569aa4c519ea64be4f6fc69e5', '4a0ff499627d46d196dd658dacadabd9', 'metabolizmu kostnego.', false);

-- Q27
INSERT INTO questions (id, exam_id, text) VALUES ('b985f63817214d2781b7dc8c7f1dd055', 'fa67c30e6f46470987c00ff03d20abd5', '27. Który metabolit witaminy D₃ jest miarą statusu witaminy D w organizmie ludzkim?');
INSERT INTO answers (id, question_id, text, is_correct) VALUES
('0ec336635f1448eca0fe858dcb603c28', 'b985f63817214d2781b7dc8c7f1dd055', '1,25(OH)₂D.', false),
('68f04499f33a4d6eae0160f7853f522d', 'b985f63817214d2781b7dc8c7f1dd055', '25(OH)D.', true),
('2cb029505e7e4fd5a7f811e778e2636c', 'b985f63817214d2781b7dc8c7f1dd055', '24,25(OH)₂D.', false),
('88417e5727324fb29dc75178530295f5', 'b985f63817214d2781b7dc8c7f1dd055', 'ergokalcyferol.', false),
('4225c47353934faab06b201437a437f5', 'b985f63817214d2781b7dc8c7f1dd055', '7-dehydrocholesterol (prowitamina D₃).', false);

-- Q28
INSERT INTO questions (id, exam_id, text) VALUES ('a16a1cbe7b8542aa84c3fa861bba5fac', 'fa67c30e6f46470987c00ff03d20abd5', '28. Wskaż prawidłową wartość przedziału referencyjnego:');
INSERT INTO answers (id, question_id, text, is_correct) VALUES
('c0f42d39901a4f22ab3bd84776a3d09b', 'a16a1cbe7b8542aa84c3fa861bba5fac', '± 1 SD.', false),
('d64e3a1053ad462d8a5b63c10eb90c4b', 'a16a1cbe7b8542aa84c3fa861bba5fac', '± 2 SD.', true),
('129b2f1632324071b9339e52f9a4b41e', 'a16a1cbe7b8542aa84c3fa861bba5fac', '± 3 SD.', false),
('fcdd46097fb94c2093dddc11b624158c', 'a16a1cbe7b8542aa84c3fa861bba5fac', '+2/-3 SD.', false),
('89855ca29484407dbc9723aef583d410', 'a16a1cbe7b8542aa84c3fa861bba5fac', '+3/-3 SD.', false);

-- Q29
INSERT INTO questions (id, exam_id, text) VALUES ('aa2696c18b6c47979e0b67c7fcb8e94e', 'fa67c30e6f46470987c00ff03d20abd5', '29. Immunoglobulina IgA syntetyzowana w tzw. postaci wydzielniczej jest:');
INSERT INTO answers (id, question_id, text, is_correct) VALUES
('828f02e1a52b476caa645236482cc039', 'aa2696c18b6c47979e0b67c7fcb8e94e', 'monomerem.', false),
('5e2a8beb3bc94373b65cb3321b4752b0', 'aa2696c18b6c47979e0b67c7fcb8e94e', 'trimerem.', false),
('c8bd362a82924f54a5977bec3b6fccf3', 'aa2696c18b6c47979e0b67c7fcb8e94e', 'dimerem.', true),
('6313b05e34e04ff7a0d37826bce97a4c', 'aa2696c18b6c47979e0b67c7fcb8e94e', 'tetramerem.', false),
('a9270b21c45a4671ab8bc258475b15ac', 'aa2696c18b6c47979e0b67c7fcb8e94e', 'pentamerem.', false);

-- Q30
INSERT INTO questions (id, exam_id, text) VALUES ('a264253627f546e6924e25dd4c619472', 'fa67c30e6f46470987c00ff03d20abd5', '30. Komponent metaboliczny buforu wodorowęglanowego to:');
INSERT INTO answers (id, question_id, text, is_correct) VALUES
('853c0ce1618b465ea492c101de7f4e9b', 'a264253627f546e6924e25dd4c619472', 'H₂CO₃.', false),
('ab79b9fed92a40109dee3698a2d4c63e', 'a264253627f546e6924e25dd4c619472', 'HCO₃⁻.', true),
('326516ba647b4fb284f4f738452a32e9', 'a264253627f546e6924e25dd4c619472', 'α x pCO₂.', false),
('b45ee3eff10e49308fea55c00f6dcca5', 'a264253627f546e6924e25dd4c619472', 'stężenie jonów H⁺.', false),
('1aaba1e37b4e48f79222c9c64ee0f4ab', 'a264253627f546e6924e25dd4c619472', 'stężenie jonów Na⁺.', false);

-- Q31
INSERT INTO questions (id, exam_id, text) VALUES ('63c5b8300678432091a154f892120d5e', 'fa67c30e6f46470987c00ff03d20abd5', '31. Źródłem (miejscem powstawania) lipoprotein VLDL jest:');
INSERT INTO answers (id, question_id, text, is_correct) VALUES
('76cfa5db67be450e9fe4c4dad89af4ce', '63c5b8300678432091a154f892120d5e', 'jelito.', false),
('c9d5d3ad9e744b0ea55ff02f06f9a281', '63c5b8300678432091a154f892120d5e', 'wątroba.', true),
('e1b4b7a1b6be4cceac28beeafc4ffd63', '63c5b8300678432091a154f892120d5e', 'żołądek.', false),
('137a47d1f3e6441fa7c078305bc6e9df', '63c5b8300678432091a154f892120d5e', 'tkanka tłuszczowa.', false),
('1213f96725be42628f3c66081de972eb', '63c5b8300678432091a154f892120d5e', 'krew (osocze).', false);

-- Q32
INSERT INTO questions (id, exam_id, text) VALUES ('cfa85e4585464bec8ea9d8a4737b3e5e', 'fa67c30e6f46470987c00ff03d20abd5', '32. Które z wymienionych białek nie ma zastosowania w diagnostyce kardiologicznej?');
INSERT INTO answers (id, question_id, text, is_correct) VALUES
('f63135f58c5e487bb4ab1aa51346af44', 'cfa85e4585464bec8ea9d8a4737b3e5e', 'różnicujący czynnik wzrostu-15 (GDF-15).', false),
('25e5b614de574947830889642c9115e0', 'cfa85e4585464bec8ea9d8a4737b3e5e', 'ST2.', false),
('969c58ad9eac4cfca6f665584a8a7418', 'cfa85e4585464bec8ea9d8a4737b3e5e', 'galektyna 3.', false),
('7e8262ea66644ddab5442b8d1f1b52cc', 'cfa85e4585464bec8ea9d8a4737b3e5e', 'mieloperoksydaza.', false),
('0fadefedfc1e4b1a88adc33be6b7aa65', 'cfa85e4585464bec8ea9d8a4737b3e5e', 'chromogranina A.', true);

-- Q33
INSERT INTO questions (id, exam_id, text) VALUES ('d69e8cbb05434078b9e2687e48c00600', 'fa67c30e6f46470987c00ff03d20abd5', '33. Lipokaina, związana z żelatynazą neutrofili (NGAL), jest markerem:');
INSERT INTO answers (id, question_id, text, is_correct) VALUES
('94b92764fcd14972add9bec0afb3db04', 'd69e8cbb05434078b9e2687e48c00600', 'nowotworów wątroby.', false),
('337774be315e48b9981e272199d94fed', 'd69e8cbb05434078b9e2687e48c00600', 'ostrej białaczki szpikowej.', false),
('8e5b2e09df364bda9ae794195a42fc24', 'd69e8cbb05434078b9e2687e48c00600', 'ostrego uszkodzenia nerek.', true),
('c3883d9a8abf4a7e970d1c24698b16d3', 'd69e8cbb05434078b9e2687e48c00600', 'nowotworów trzustki.', false),
('b0d298d8246246ba908f4fcfe9fb2346', 'd69e8cbb05434078b9e2687e48c00600', 'nowotworów jajnika.', false);

-- Q34
INSERT INTO questions (id, exam_id, text) VALUES ('00a9824639f243a596b0aa3bc63171e6', 'fa67c30e6f46470987c00ff03d20abd5', '34. Wskaż enzymy wydalnicze wątroby:');
INSERT INTO answers (id, question_id, text, is_correct) VALUES
('997483af33c24a88a0ac01a2c2a60608', '00a9824639f243a596b0aa3bc63171e6', 'ALT, LDH.', false),
('70c7f11d5613470692aac11b0d11d5f5', '00a9824639f243a596b0aa3bc63171e6', 'GGT, ALP, 5''-nukleotydaza.', true),
('4a5678a5ac4d4a19af5de0f9ca933a66', '00a9824639f243a596b0aa3bc63171e6', 'AST, LDH.', false),
('12524037a1eb474795cec5db09a02583', '00a9824639f243a596b0aa3bc63171e6', 'ALT, GGTP.', false),
('971e9eaf6a4044d0a7a6ef1713e575fa', '00a9824639f243a596b0aa3bc63171e6', 'AST, ALP.', false);

-- Q35
INSERT INTO questions (id, exam_id, text) VALUES ('cccbf006a85245f193281ef5c424ef86', 'fa67c30e6f46470987c00ff03d20abd5', '35. Czułość diagnostyczna jest wskaźnikiem określającym u ilu osób chorych uzyskuje się dodatni wynik. Teoretycznie parametr ten jest względnie stały, co decyduje o przydatności określonego badania w postępowaniu diagnostycznym. Należy jednak pamiętać, że w praktyce czułość diagnostyczna jest modyfikowana przez wiele czynników i zmniejsza się:');
INSERT INTO answers (id, question_id, text, is_correct) VALUES
('0542f989334d4fcfbd5cef0779ba30c0', 'cccbf006a85245f193281ef5c424ef86', 'u pacjentów we wczesnym stadium choroby.', false),
('f655ae806ce0422482fcaaa5b9c8fa33', 'cccbf006a85245f193281ef5c424ef86', 'na wskutek popełnienia błędów przedanalitycznych przemieszczających wyniki badań w stronę obserwowanych u osób zdrowych.', false),
('7329652500ee45d288b7c02087fee053', 'cccbf006a85245f193281ef5c424ef86', 'przy utracie precyzji pomiarów.', false),
('596f643e19554a2dba1a514274b86d81', 'cccbf006a85245f193281ef5c424ef86', 'przy narastaniu błędów systematycznych, przemieszczających wyniki badań w stronę wyników obserwowanych u osób zdrowych.', false),
('c532781d29774577b45cda728b7e4506', 'cccbf006a85245f193281ef5c424ef86', 'we wszystkich wymienionych przypadkach.', true);

-- Q36
INSERT INTO questions (id, exam_id, text) VALUES ('d872ebd68b0c475bb0422c81a6696b73', 'fa67c30e6f46470987c00ff03d20abd5', '36. Obraz laboratoryjny typu V hiperlipidemii wg. Fredriksona charakteryzuje się:');
INSERT INTO answers (id, question_id, text, is_correct) VALUES
('a992f2a27d884f8780a35bb8bd90fc22', 'd872ebd68b0c475bb0422c81a6696b73', 'dodatnim testem zimnej flotacji, wzrostem stężenia cholesterolu i nadmiarem LDL.', false),
('51746b5488414cfcadbe732e9ee52bd7', 'd872ebd68b0c475bb0422c81a6696b73', 'ujemnym testem zimnej flotacji i nadmiarem VLDL.', false),
('ed4debce0ff548a4bcca40546cbc61ed', 'd872ebd68b0c475bb0422c81a6696b73', 'dodatnim testem zimnej flotacji, wzrostem triglicerydów, nadmiarem chylomikronów i VLDL.', true),
('30d6a98fbb82404f86cbcb908da51eed', 'd872ebd68b0c475bb0422c81a6696b73', 'ujemnym testem zimnej flotacji, wzrostem stężenia cholesterolu i nadmiarem IDL.', false),
('4ddc7148f7074ee2badf80f5622b7c0f', 'd872ebd68b0c475bb0422c81a6696b73', 'dodatnim testem zimnej flotacji i wzrostem stężenia IDL.', false);

-- Q37
INSERT INTO questions (id, exam_id, text) VALUES ('9b3d99567308452aaea044fdbf39d85c', 'fa67c30e6f46470987c00ff03d20abd5', '37. Ze znanych i stosowanych metod oznaczania białka całkowitego metodą opartą o tworzenie kompleksu jonów miedzi z wiązaniami peptydowymi jest metoda:');
INSERT INTO answers (id, question_id, text, is_correct) VALUES
('62720c6c74b54d08bac28232a1df0ba2', '9b3d99567308452aaea044fdbf39d85c', 'spektrofotometryczna.', false),
('4f7adda1b78244eab7098612b46d48d3', '9b3d99567308452aaea044fdbf39d85c', 'Bradforda.', false),
('dce9c4e18b994800b3b0a7e104939367', '9b3d99567308452aaea044fdbf39d85c', 'Folin Ciocalteu.', false),
('1b912329e4684d148c1bc667bf2d6e90', '9b3d99567308452aaea044fdbf39d85c', 'biuretowa.', true),
('f57d94e47f074be79dfa310bb57148b5', '9b3d99567308452aaea044fdbf39d85c', 'Lowry-Rosenbau.', false);

-- Q38
INSERT INTO questions (id, exam_id, text) VALUES ('f5e26b35487d4ff694be706d37656a6c', 'fa67c30e6f46470987c00ff03d20abd5', '38. Hemoliza to istotna przyczyna błędnych wyników badań laboratoryjnych. Oznaczając stężenie cholesterolu i kreatyniny w osoczu należy pamiętać, iż hemoliza:');
INSERT INTO answers (id, question_id, text, is_correct) VALUES
('0e103a443d544cceaeb66ddb5d881508', 'f5e26b35487d4ff694be706d37656a6c', 'powoduje wzrost stężeń obu parametrów.', false),
('ebd0089fe6e4497fb60faecbfd2b1fd1', 'f5e26b35487d4ff694be706d37656a6c', 'powoduje spadek stężeń obu parametrów.', false),
('8c151ae03c6b4636a2fcc557bef11af6', 'f5e26b35487d4ff694be706d37656a6c', 'powoduje wzrost stężenia jedynie cholesterolu.', false),
('fcf3d7658ccf48dbaa71995ec29fc942', 'f5e26b35487d4ff694be706d37656a6c', 'powoduje wzrost stężenia jedynie kreatyniny.', false),
('59eea89f209140e193c32acf0d5caa77', 'f5e26b35487d4ff694be706d37656a6c', 'nie zmienia stężeń obu parametrów.', true);

-- Q39
INSERT INTO questions (id, exam_id, text) VALUES ('966d6b69537f43d6a0da12578b115b56', 'fa67c30e6f46470987c00ff03d20abd5', '39. Fotometria płomieniowa to klasyczna metoda oznaczania stężeń podstawowych pierwiastków w płynach biologicznych. Ze swej istoty należy do:');
INSERT INTO answers (id, question_id, text, is_correct) VALUES
('9f0351619cf44c6db9837f85c986ae4c', '966d6b69537f43d6a0da12578b115b56', 'metod elektrochemicznych.', false),
('673b25d3fb394d7c819a77ea2125629a', '966d6b69537f43d6a0da12578b115b56', 'metod spektroskopowych.', true),
('ea323864549540aea412d90177025e98', '966d6b69537f43d6a0da12578b115b56', 'metod rozdzielczych.', false),
('035a96918ea64a6cafde1224d688eb6b', '966d6b69537f43d6a0da12578b115b56', 'metod immunochemicznych.', false),
('d94930f86c63404f9a23211e9924956b', '966d6b69537f43d6a0da12578b115b56', 'technik łączonych.', false);

-- Q40
INSERT INTO questions (id, exam_id, text) VALUES ('4b4a9f92529642e7a6ba7e9b454fbb6a', 'fa67c30e6f46470987c00ff03d20abd5', '40. Albumina jest ważnym białkiem osocza. Głównym czynnikiem zwiększającym syntezę albuminy jest:');
INSERT INTO answers (id, question_id, text, is_correct) VALUES
('d8ef7d06ce1f45458349584cb8eada09', '4b4a9f92529642e7a6ba7e9b454fbb6a', 'spadek ciśnienia osmotycznego.', true),
('f53cf4cbf84749ea8eb5dccb4dd55d56', '4b4a9f92529642e7a6ba7e9b454fbb6a', 'wzrost stężenia hormonów tarczycy.', false),
('304fbb406be54e929abd29ca7275d41e', '4b4a9f92529642e7a6ba7e9b454fbb6a', 'wzrost stężenia insuliny.', false),
('a331ce3269254b198bc9580ace86f934', '4b4a9f92529642e7a6ba7e9b454fbb6a', 'wzrost stężenia kortyzolu.', false),
('9ea471dd24984b679a68d583b982596f', '4b4a9f92529642e7a6ba7e9b454fbb6a', 'wzrost stężenia cytokin prozapalnych.', false);

-- Q41
INSERT INTO questions (id, exam_id, text) VALUES ('c75d5835e51d456dbf3108fa4bfe3e9f', 'fa67c30e6f46470987c00ff03d20abd5', '41. W zapalnym uszkodzeniu wątroby wartość wskaźnika de Ritisa AST/ALT wynosi:');
INSERT INTO answers (id, question_id, text, is_correct) VALUES
('9809d2de3ef24ff798783801bfb4c67c', 'c75d5835e51d456dbf3108fa4bfe3e9f', 'poniżej 1.', true),
('22d7715b73ec44478642923993122bde', 'c75d5835e51d456dbf3108fa4bfe3e9f', 'powyżej 1.', false),
('86ea69f86aff4b7b99d3ea43864c56df', 'c75d5835e51d456dbf3108fa4bfe3e9f', 'powyżej 2.', false),
('7d4695a0848c4967a859ec359f36ea80', 'c75d5835e51d456dbf3108fa4bfe3e9f', 'powyżej 3.', false),
('a27c8f2866664d0a9eecd6ba7b043bd8', 'c75d5835e51d456dbf3108fa4bfe3e9f', 'powyżej 6.', false);

-- Q42
INSERT INTO questions (id, exam_id, text) VALUES ('ed95a2abdf57475b81b6a08e70a161e9', 'fa67c30e6f46470987c00ff03d20abd5', '42. Który z niżej wymienionych parametrów płynu pobranego z jamy ciała pozwala na jego najlepszą identyfikację jako wysięku?');
INSERT INTO answers (id, question_id, text, is_correct) VALUES
('b2530496a0de4d6ea94b59c7612b571e', 'ed95a2abdf57475b81b6a08e70a161e9', 'barwa i przejrzystość płynu.', false),
('be9340b3fc7f48e598832e5343f22856', 'ed95a2abdf57475b81b6a08e70a161e9', 'stężenie białka całkowitego i pomiar ciężaru właściwego płynu.', false),
('f1844bc843494ecc853d3fe3bde046b2', 'ed95a2abdf57475b81b6a08e70a161e9', 'wskaźnik białka całkowitego i wskaźnik dehydrogenazy mleczanowej (płyn/surowica).', true),
('d29afa45930a4f99b1886f68bc0750f4', 'ed95a2abdf57475b81b6a08e70a161e9', 'liczba leukocytów i wzór odsetkowy leukocytów w płynie.', false),
('8eb1b8c8b6624a75b26996949887e931', 'ed95a2abdf57475b81b6a08e70a161e9', 'stężenie glukozy w płynie.', false);

-- Q43
INSERT INTO questions (id, exam_id, text) VALUES ('35400e8aaba344278a4251c8fa728eab', 'fa67c30e6f46470987c00ff03d20abd5', '43. Do zwiększenia stężenia glukozy w płynie mózgowo-rdzeniowym dochodzi na skutek:');
INSERT INTO answers (id, question_id, text, is_correct) VALUES
('ebd968b8d23741ff92f0ad8e194abedb', '35400e8aaba344278a4251c8fa728eab', 'zapalenia opon mózgowo-rdzeniowych o etiologii bakteryjnej.', false),
('4654fb852a29434bb4e20fcf7c5bef14', '35400e8aaba344278a4251c8fa728eab', 'przyspieszonej glikolizy w ośrodkowym układzie nerwowym.', false),
('547fc6f4c63041c59ddf28f6b04e35d3', '35400e8aaba344278a4251c8fa728eab', 'zapalenia opon mózgowo-rdzeniowych o etiologii gruźliczej.', false),
('f266eed579414ad5bd6b2319b40e9ab1', '35400e8aaba344278a4251c8fa728eab', 'naciekania opon przez nowotwory pierwotne lub przerzutowe.', false),
('049f0f2fec0c473c8f1333c27bc38c97', '35400e8aaba344278a4251c8fa728eab', 'stanów hiperglikemii i traumatycznego nakłucia lędźwiowego.', true);

-- Q44
INSERT INTO questions (id, exam_id, text) VALUES ('5b4d5841049549cbae915e360c496803', 'fa67c30e6f46470987c00ff03d20abd5', '44. Obecność w kale leukocytów (krwinek białych) przyczynia się do rozpoznania różnicowego biegunki, która towarzyszy stanom zapalnym ściany jelit. Leukocytów w kale nie stwierdza się w przebiegu:');
INSERT INTO answers (id, question_id, text, is_correct) VALUES
('46c760c1f9084aeab91d17230029965b', '5b4d5841049549cbae915e360c496803', 'pełzakowicy jelit.', true),
('2ce3b56a93194fe79bab102051a9ba0d', '5b4d5841049549cbae915e360c496803', 'wrzodziejącego zapalenia jelita grubego.', false),
('923a799cff2643fca6155981c56ddc43', '5b4d5841049549cbae915e360c496803', 'czerwonki bakteryjnej.', false),
('ea2f25b4c00a473d83111f929e95b642', '5b4d5841049549cbae915e360c496803', 'gruźlicy jelit.', false),
('464e8f9d22ee4d90badd0563ce422186', '5b4d5841049549cbae915e360c496803', 'uchyłkowego zapalenia jelita grubego.', false);

-- Q45
INSERT INTO questions (id, exam_id, text) VALUES ('9aa2e3344ff64832806a83056a33c158', 'fa67c30e6f46470987c00ff03d20abd5', '45. Zwiększenie liczby limfocytów w płynie mózgowo-rdzeniowym towarzyszy zapaleniu opon mózgowo-rdzeniowych. Pleocytoza limfocytarna może mieć przyczyny infekcyjne i nieinfekcyjne. Przyczyną nieinfekcyjną zwiększenia liczby limfocytów w płynie mózgowo-rdzeniowym jest:');
INSERT INTO answers (id, question_id, text, is_correct) VALUES
('12ddbeb3b0be499280f61e295a6e0a34', '9aa2e3344ff64832806a83056a33c158', 'wirusowe zapalenie opon mózgowo-rdzeniowych.', false),
('1b73179a8ea74558b51aa6b39879e6c0', '9aa2e3344ff64832806a83056a33c158', 'gruźlicze zapalenie opon mózgowo-rdzeniowych.', false),
('df9ab42a7a5648b2ba4822e2f9ada1ab', '9aa2e3344ff64832806a83056a33c158', 'grzybicze zapalenie opon mózgowo-rdzeniowych.', false),
('8274775c248e44789b8ccfe8ee457ca6', '9aa2e3344ff64832806a83056a33c158', 'stwardnienie rozsiane.', true),
('b2d50dac5eb649e386057449f1ec8d02', '9aa2e3344ff64832806a83056a33c158', 'kiłowe zapalenie opon mózgowo-rdzeniowych.', false);

-- Q46
INSERT INTO questions (id, exam_id, text) VALUES ('6b18a90e51b247d3a54dc051bbffeaa5', 'fa67c30e6f46470987c00ff03d20abd5', '46. Wskaż prawdziwe stwierdzenie dotyczące urobilinogenu:');
INSERT INTO answers (id, question_id, text, is_correct) VALUES
('8af1af01c5eb46688fb1ee3a2040ce70', '6b18a90e51b247d3a54dc051bbffeaa5', 'jest związkiem labilnym i łatwo ulega fotooksydacji do urobiliny.', true),
('f458de40bf934a1f94e347cfe8c141cc', '6b18a90e51b247d3a54dc051bbffeaa5', 'wydalanie urobilinogenu z moczem służy do oceny czynności nerek.', false),
('ce2b570cef9b4199a47981f570ed5a4d', '6b18a90e51b247d3a54dc051bbffeaa5', 'wydalanie urobilinogenu z moczem zmniejsza się po posiłku.', false),
('04b88f22060f4149a4dee1d963ac478e', '6b18a90e51b247d3a54dc051bbffeaa5', 'urobilinogen nie występuje w moczu w warunkach prawidłowych.', false),
('fbf3867b003649c18f1dfad5bce94cb4', '6b18a90e51b247d3a54dc051bbffeaa5', 'urobilinogen zabarwia mocz na kolor czarny.', false);

-- Q47
INSERT INTO questions (id, exam_id, text) VALUES ('5efcf050dead4c40a52739513a2768c6', 'fa67c30e6f46470987c00ff03d20abd5', '47. Który z wymienionych ciężarów właściwych moczu jest fizjologicznie niemożliwy do uzyskania?');
INSERT INTO answers (id, question_id, text, is_correct) VALUES
('dae0201761e34e3fa1588747b06f48a1', '5efcf050dead4c40a52739513a2768c6', '1,000.', true),
('48bdf1b88bbf44dfa7254893664d496c', '5efcf050dead4c40a52739513a2768c6', '1,010.', false),
('4c2483e3498946bbad652def53c60809', '5efcf050dead4c40a52739513a2768c6', '1,015.', false),
('29145c0d8b4347bb9fd73b735b4278a6', '5efcf050dead4c40a52739513a2768c6', '1,020.', false),
('d9eaefd8eb2a4e84926994b60f15e5d2', '5efcf050dead4c40a52739513a2768c6', '1,030.', false);

-- Q48
INSERT INTO questions (id, exam_id, text) VALUES ('ac5b185c8e154245ba753a32c91349ab', 'fa67c30e6f46470987c00ff03d20abd5', '48. Dezintegracji wałeczków występujących w osadzie moczu sprzyja:');
INSERT INTO answers (id, question_id, text, is_correct) VALUES
('025752184a91482eab501c34aa9329e7', 'ac5b185c8e154245ba753a32c91349ab', 'zmiana pH w kierunku kwaśnym.', false),
('d94b183f032245a0bb98bd9fd7ed3588', 'ac5b185c8e154245ba753a32c91349ab', 'zwiększone stężenie substancji rozpuszczonych w moczu.', false),
('dddfb760d65c4e80945fef84121cb817', 'ac5b185c8e154245ba753a32c91349ab', 'zastój moczu.', false),
('59535d98883349e7a0969cfac5bc1716', 'ac5b185c8e154245ba753a32c91349ab', 'podwyższone stężenie białek w osoczu (zwłaszcza albuminy).', false),
('1eb9ce8ef1794c998435d3679e016aae', 'ac5b185c8e154245ba753a32c91349ab', 'zasadowy odczyn moczu.', true);

-- Q49
INSERT INTO questions (id, exam_id, text) VALUES ('b18b67f06b3943e189ededa4ef1ca722', 'fa67c30e6f46470987c00ff03d20abd5', '49. Krwiomocz (hematuria) oznacza nieprawidłową liczbę krwinek czerwonych w moczu. Jego przyczyną mogą być: 1) kamica; 2) zapalenie pęcherza moczowego; 3) zakażenia bakteryjne (kiła, Clostridium perfringens), zarażenie Plasmodium spp. (malaria); 4) kłębuszkowe zapalenie nerek; 5) uszkodzenie mięśni szkieletowych - zespół zmiażdżenia, operacje. Prawidłowa odpowiedź to:');
INSERT INTO answers (id, question_id, text, is_correct) VALUES
('9333ecd1b70248c68893a59eff67d6ac', 'b18b67f06b3943e189ededa4ef1ca722', '1,3,5.', false),
('4f48d86a0b7246fcb93a24897c538c60', 'b18b67f06b3943e189ededa4ef1ca722', '1,4,5.', false),
('9b25257d694a45a68785e862ff014a6a', 'b18b67f06b3943e189ededa4ef1ca722', '1,2,4.', true),
('55470fe921154c2d815086a6cca8cd8c', 'b18b67f06b3943e189ededa4ef1ca722', '2,3,4.', false),
('4354dca378a04d15abca135c6b8c2a7b', 'b18b67f06b3943e189ededa4ef1ca722', '2,3,5.', false);

-- Q50
INSERT INTO questions (id, exam_id, text) VALUES ('bf329e23a2f545c1a0113de75a5181a8', 'fa67c30e6f46470987c00ff03d20abd5', '50. Czas ekarynowy jest testem wykorzystywanym do:');
INSERT INTO answers (id, question_id, text, is_correct) VALUES
('18258ebd8b1d405eb4f5783a419937ca', 'bf329e23a2f545c1a0113de75a5181a8', 'pomiaru adhezji płytek.', false),
('e81e12460eb9452798c94cc9708dfe5b', 'bf329e23a2f545c1a0113de75a5181a8', 'ilościowego pomiaru dabigatranu.', true),
('7d61f37b07874f9f86ba629ac6451d86', 'bf329e23a2f545c1a0113de75a5181a8', 'diagnostyki trombofilii nabytej.', false),
('914568f22cda4ae89aeb4dbf3fd5f9b1', 'bf329e23a2f545c1a0113de75a5181a8', 'monitorowania leczenia LMWH.', false),
('16a905865ff8443fbdb7b0a0348ec825', 'bf329e23a2f545c1a0113de75a5181a8', 'wykrywania antykoagulantu tocznia.', false);

-- Q51
INSERT INTO questions (id, exam_id, text) VALUES ('bced8b69be8140adbd4e1e86593db41c', 'fa67c30e6f46470987c00ff03d20abd5', '51. W podejrzeniu zaburzeń płytkowych najmniej przydatnym badaniem laboratoryjnym jest:');
INSERT INTO answers (id, question_id, text, is_correct) VALUES
('c35ff82e30d14bc8b740c6318e1efaea', 'bced8b69be8140adbd4e1e86593db41c', 'pomiar liczby płytek we krwi obwodowej.', false),
('39edb0a8eedb43769d3638ab61c8d4a6', 'bced8b69be8140adbd4e1e86593db41c', 'ocena morfologii płytek.', false),
('8fdbe930966d493ebef9a02834c12ce3', 'bced8b69be8140adbd4e1e86593db41c', 'pomiar czasu reptylazowego.', true),
('aec991df418448938409668b45850f05', 'bced8b69be8140adbd4e1e86593db41c', 'pomiar czasu okluzji.', false),
('0a4ecf4b9999414e97a1f6dcd0917930', 'bced8b69be8140adbd4e1e86593db41c', 'oznaczanie czynnika von Willebranda.', false);

-- Q52
INSERT INTO questions (id, exam_id, text) VALUES ('d670834f258d48c2be66bdf065aee9ea', 'fa67c30e6f46470987c00ff03d20abd5', '52. Wskaż prawdziwe stwierdzenie dotyczące testu korekcji APTT:');
INSERT INTO answers (id, question_id, text, is_correct) VALUES
('27a44482273248c88a23dec0c67b1aaf', 'd670834f258d48c2be66bdf065aee9ea', 'jest przydatny w potwierdzaniu lub wykluczaniu niedoboru czynników krzepnięcia.', true),
('60bfb37477504b90ac2108dcf5bda7f1', 'd670834f258d48c2be66bdf065aee9ea', 'wymaga użycia rekombinowanej tromboplastyny tkankowej.', false),
('0f4ecdeff1dc4594bfad449bda0a4411', 'd670834f258d48c2be66bdf065aee9ea', 'wymaga zmieszania osocza badanego z osoczem pozbawionym jednego z czynników krzepnięcia.', false),
('04b4f0cc716f42ac9b567e7f00861c09', 'd670834f258d48c2be66bdf065aee9ea', '„dodatni" wskazuje na obecność inhibitora immunologicznego.', false),
('6cba891975784c128d2d03323c2ec308', 'd670834f258d48c2be66bdf065aee9ea', '„ujemny" wyklucza obecność inhibitora farmakologicznego.', false);

-- Q53
INSERT INTO questions (id, exam_id, text) VALUES ('f9737bddb84542ff8cf7541c147acdf8', 'fa67c30e6f46470987c00ff03d20abd5', '53. Któremu typowi/podtypowi choroby von Willebranda odpowiada łagodna skaza krwotoczna z częściowym niedoborem ilościowym czynnika von Willebranda?');
INSERT INTO answers (id, question_id, text, is_correct) VALUES
('e249a548914c48d7ad6bd1b759948d18', 'f9737bddb84542ff8cf7541c147acdf8', '2B.', false),
('aa65d92f014a48c4a77de2f08017029d', 'f9737bddb84542ff8cf7541c147acdf8', 'I.', true),
('58011bbdfd4c481c82170b65ca36912d', 'f9737bddb84542ff8cf7541c147acdf8', '2M.', false),
('ad0b0ca048714c278704530680c132ca', 'f9737bddb84542ff8cf7541c147acdf8', 'III.', false),
('1ccf6446535d4106aced5f022c2ceeac', 'f9737bddb84542ff8cf7541c147acdf8', '2A.', false);

-- Q54
INSERT INTO questions (id, exam_id, text) VALUES ('c2038c3169ff4e6f9a152790677d42c9', 'fa67c30e6f46470987c00ff03d20abd5', '54. U pacjenta leczonego przeciwzakrzepowo antagonistą witaminy K stwierdzono znaczne przedłużenie PT i wydłużenie APTT. Wskaż właściwą interpretację tego zjawiska:');
INSERT INTO answers (id, question_id, text, is_correct) VALUES
('c35f7fcba5c94d678322697f22d72a02', 'c2038c3169ff4e6f9a152790677d42c9', 'jest oczekiwane w tego typu leczeniu.', false),
('731a81d8ddca43d2a693c144f3a5bb15', 'c2038c3169ff4e6f9a152790677d42c9', 'świadczy o przekroczeniu zakresu INR 2-3.', false),
('628b3a0a85e648ebab0743821cac4ff7', 'c2038c3169ff4e6f9a152790677d42c9', 'świadczy o obniżeniu aktywności czynnika IX.', false),
('cc8dce1ee9f24fb385c59a6279d4c110', 'c2038c3169ff4e6f9a152790677d42c9', 'świadczy o obniżeniu aktywności czynnika VIII.', false),
('f58c80da7a2d42a693e844ed4abe726b', 'c2038c3169ff4e6f9a152790677d42c9', 'prawdziwe są odpowiedzi B i C.', true);

-- Q55
INSERT INTO questions (id, exam_id, text) VALUES ('e7ecd8d05e834e209d440eb0b288aff6', 'fa67c30e6f46470987c00ff03d20abd5', '55. Wskaż fałszywe stwierdzenie dotyczące objawów kliniczno-laboratoryjnych zespołu antyfosfolipidowego (APS):');
INSERT INTO answers (id, question_id, text, is_correct) VALUES
('d9b188be32554161800f8cbb8b813251', 'e7ecd8d05e834e209d440eb0b288aff6', 'APS charakteryzuje się obecnością autoprzeciwciał, głównie antyfosfolipidowych (LA) i antykardiolipinowych (ACA).', false),
('3f5313fce739424683353bd4b5f241b6', 'e7ecd8d05e834e209d440eb0b288aff6', 'objawami APS jest głównie zakrzepica tętnicza i nadpłytkowość.', true),
('379bd9cfa70c4156a6215594dba980ec', 'e7ecd8d05e834e209d440eb0b288aff6', 'do wykrywania przeciwciał odpowiedzialnych za incydenty zakrzepowe w APS konieczna jest obecność kofaktorów białkowych, tj. głównie β2-GPI.', false),
('adbc8e2bb7a04a858bee17d36c4c41b3', 'e7ecd8d05e834e209d440eb0b288aff6', 'przeciwciała LA wykrywa się w testach krzepnięcia osocza zależnych od fosfolipidów, tj. APTT lub dRVVT.', false),
('20a837d2a0f3447bb12881762b9c0f9e', 'e7ecd8d05e834e209d440eb0b288aff6', 'przeciwciała ACA wykrywa się za pomocą testów ELISA.', false);

-- Q56
INSERT INTO questions (id, exam_id, text) VALUES ('90dcf5f464454a0c8310c7a1b3a2892d', 'fa67c30e6f46470987c00ff03d20abd5', '56. Do markerów generacji trombiny nie należą:');
INSERT INTO answers (id, question_id, text, is_correct) VALUES
('a837dd8f05fe4370a1523baacb978a51', '90dcf5f464454a0c8310c7a1b3a2892d', 'fragmenty protrombiny 1+2 (F1+2).', false),
('2a2ffb8377a4471aa8237b59ea940bf0', '90dcf5f464454a0c8310c7a1b3a2892d', 'kompleksy trombina-antytrombina (TAT).', false),
('f99a2546bf3a4dc9b5ac4dd14fe159c4', '90dcf5f464454a0c8310c7a1b3a2892d', 'fibrynopeptyd A (FpA).', false),
('76448f4928fb4a6ba8658a2c958d8288', '90dcf5f464454a0c8310c7a1b3a2892d', 'D-Dimery (D-D).', true),
('6f3b67166b7e4746a2fd5e9d35bda938', '90dcf5f464454a0c8310c7a1b3a2892d', 'monomery fibryny (FM).', false);

-- Q57
INSERT INTO questions (id, exam_id, text) VALUES ('1b1fea688c3948c3bfd3abeb649a21a8', 'fa67c30e6f46470987c00ff03d20abd5', '57. Wskaż prawdziwe stwierdzenie dotyczące monitorowania leczenia przeciwzakrzepowego:');
INSERT INTO answers (id, question_id, text, is_correct) VALUES
('357daf7344db454494102dd2eab85fc4', '1b1fea688c3948c3bfd3abeb649a21a8', 'czas protrombinowy (PT) jest wrażliwy na działanie heparyny i może być stosowany do monitorowania leczenia heparyną.', false),
('d72c2f0ea6a846eabb951e938f259608', '1b1fea688c3948c3bfd3abeb649a21a8', 'leczenie heparyną niefrakcjonowaną wymaga monitorowania poprzez oznaczanie czasu APTT i aktywności anty-Xa.', false),
('9c16a34c6b674c40b51db701c94cf6e0', '1b1fea688c3948c3bfd3abeb649a21a8', 'współczynnik INR wyliczany jest z ilorazu PT osocza badanego do kontrolnego i podniesionego do potęgi ISI.', true),
('316d824c3987418eaeb35fa1cee06610', '1b1fea688c3948c3bfd3abeb649a21a8', 'podczas leczenia antagonistami witaminy K najszybciej obniża się poziom protrombiny, a najpóźniej czynnika VII.', false),
('b46fa8538d4142f09eeec0ae940be1f9', '1b1fea688c3948c3bfd3abeb649a21a8', 'leki z grupy NOAC hamują wyłącznie trombinę, nie hamują czynnika Xa.', false);

-- Q58
INSERT INTO questions (id, exam_id, text) VALUES ('77cb3e6d8bea4d5ca0f5f817fe4d8590', 'fa67c30e6f46470987c00ff03d20abd5', '58. Celem terapii zaburzeń lipidowych według najnowszych rekomendacji są stężenia:');
INSERT INTO answers (id, question_id, text, is_correct) VALUES
('94e075dc33aa472eb9ecc7e58abc2ec7', '77cb3e6d8bea4d5ca0f5f817fe4d8590', 'LDL i HDL.', false),
('aff55f21250f4cae950164dbe6d05495', '77cb3e6d8bea4d5ca0f5f817fe4d8590', 'LDL i LDH.', false),
('718c2855191842ba84167992658c34fb', '77cb3e6d8bea4d5ca0f5f817fe4d8590', 'LDL-Ch i HDL-Ch.', false),
('1d65adda00ae4294bd1d4b18be0f19a8', '77cb3e6d8bea4d5ca0f5f817fe4d8590', 'LDL-Ch i Tg.', false),
('5b24fc3775ad417bbcda53c92251c110', '77cb3e6d8bea4d5ca0f5f817fe4d8590', 'LDL-Ch i nie-HDL-Ch.', true);

-- Q59
INSERT INTO questions (id, exam_id, text) VALUES ('f62c48df41a14ac9bdcd943ffb1cd46e', 'fa67c30e6f46470987c00ff03d20abd5', '59. Ujemnymi białkami ostrej fazy są: 1) transferyna; 2) CRP; 3) surowicze amyloidowe białko A; 4) albumina; 5) prealbumina. Prawidłowa odpowiedź to:');
INSERT INTO answers (id, question_id, text, is_correct) VALUES
('a7d89658885547febe209450ed4beadb', 'f62c48df41a14ac9bdcd943ffb1cd46e', '1,2.', false),
('822c2a8bcfb54998a0601f9e79e12fdb', 'f62c48df41a14ac9bdcd943ffb1cd46e', '1,3,5.', false),
('860f009d09e14983b6bab10d60f8bf0c', 'f62c48df41a14ac9bdcd943ffb1cd46e', '3,4,5.', false),
('f04c242376174df68b4688d1d0416e0a', 'f62c48df41a14ac9bdcd943ffb1cd46e', '1,4,5.', true),
('f4cfeb304f48439ab6d59bbaf88d3d6b', 'f62c48df41a14ac9bdcd943ffb1cd46e', 'tylko 1.', false);

-- Q60
INSERT INTO questions (id, exam_id, text) VALUES ('e266650da1924e7ebfe9cc21ffb15cc1', 'fa67c30e6f46470987c00ff03d20abd5', '60. Całkowity PSA osocza jest sumą:');
INSERT INTO answers (id, question_id, text, is_correct) VALUES
('e894be2f17cd45d2a4dea6b044c544f1', 'e266650da1924e7ebfe9cc21ffb15cc1', 'wolnego PSA i związanego z alfa₂-makroglobuliną.', false),
('832d17ed5a1642d58fdc023a9b71c44d', 'e266650da1924e7ebfe9cc21ffb15cc1', 'wolnego PSA i związanego z alfa₁-antytrypsyną.', false),
('dd12408e677342b189028a1dfaedde05', 'e266650da1924e7ebfe9cc21ffb15cc1', 'wolnego PSA i związanego z alfa₁-antytrypsyną i alfa₂-makroglobuliną.', false),
('b6ac855afbad43c5bae036759230e0ef', 'e266650da1924e7ebfe9cc21ffb15cc1', 'wolnego PSA i związanego z alfa₁-antytrypsyną i alfa₁-kwaśną glikoproteiną.', false),
('1bf9f578e51440c6a19914e61ca5741c', 'e266650da1924e7ebfe9cc21ffb15cc1', 'wolnego PSA i związanego alfa₁-antychymotrypsyną i alfa₁-antytrypsyną.', true);

-- Q61
INSERT INTO questions (id, exam_id, text) VALUES ('98398a8bce6e44dc9c97fa6f37e166fb', 'fa67c30e6f46470987c00ff03d20abd5', '61. Za najlepszy marker resorpcji kości uznaje się obecnie:');
INSERT INTO answers (id, question_id, text, is_correct) VALUES
('6238217c00174f6a9cbed6467dfc0d53', '98398a8bce6e44dc9c97fa6f37e166fb', 'usieciowany karboksyterminalny telopeptyd kolagenu typu I (ICTP).', false),
('121fed1fdbd34c58b325b6152ae9e57b', '98398a8bce6e44dc9c97fa6f37e166fb', 'osteokalcynę (OC).', false),
('b6dc4e1d97804830a3157abb42b608d5', '98398a8bce6e44dc9c97fa6f37e166fb', 'końcowe propeptydy prokolagenu typu I (P1NP, P1CP).', false),
('8af3e09ae8eb4854bec52b3125bea6f0', '98398a8bce6e44dc9c97fa6f37e166fb', 'końcowe usieciowane telopeptydy łańcucha α kolagenu typu I (NTX, CTX).', true),
('1f59167c220643459f8472d7425cbf21', '98398a8bce6e44dc9c97fa6f37e166fb', 'winianooporną fosfatazę kwaśną.', false);

-- Q62
INSERT INTO questions (id, exam_id, text) VALUES ('d6418c0d80ef44278ce3fdcbe1bb4ea6', 'fa67c30e6f46470987c00ff03d20abd5', '62. Wskaż parametry morfologii krwi najbardziej charakterystyczne dla niedokrwistości aplastycznych:');
INSERT INTO answers (id, question_id, text, is_correct) VALUES
('fbadb4b19a494484b3cafd8078acf66e', 'd6418c0d80ef44278ce3fdcbe1bb4ea6', 'WBC N, RBC ↓, HGB ↓, HCT ↓, MCV N/↑, MCH N, MCHC N, PLT N.', false),
('fc3d7e5082774a60bb3ce49735143ad5', 'd6418c0d80ef44278ce3fdcbe1bb4ea6', 'WBC ↑, RBC ↓, HGB ↑, HCT ↑, MCV N/↑, MCH N, MCHC N, PLT ↑.', false),
('658b4941cf00490f91d03d3ccc114974', 'd6418c0d80ef44278ce3fdcbe1bb4ea6', 'WBC ↓, RBC N, HGB N, HCT N, MCV ↑, MCH ↓, MCHC ↓, PLT ↓.', false),
('db75af5d43e041c883bb2d39f05ccff3', 'd6418c0d80ef44278ce3fdcbe1bb4ea6', 'WBC ↓, RBC ↓, HGB ↓, HCT ↓, MCV N/↑, MCH N, MCHC N, PLT ↓.', true),
('1da1a5bc27074eff804a359b904ab466', 'd6418c0d80ef44278ce3fdcbe1bb4ea6', 'WBC ↓, RBC ↑, HGB ↓, HCT ↓, MCV ↑, MCH ↑, MCHC ↑, PLT ↑.', false);

-- Q63
INSERT INTO questions (id, exam_id, text) VALUES ('f4b1cf1c97284288ae114fb561e5a519', 'fa67c30e6f46470987c00ff03d20abd5', '63. Wskaż prawdziwe stwierdzenie dotyczące akromegalii:');
INSERT INTO answers (id, question_id, text, is_correct) VALUES
('e0b7628240ba4de78d1f3c8f5420150a', 'f4b1cf1c97284288ae114fb561e5a519', 'rozwija się w skutek wydzielania hormonu wzrostu (GH) przez gruczolaka przysadki u osób dorosłych.', true),
('da81c628a55d44e38a6361b9783bc6dd', 'f4b1cf1c97284288ae114fb561e5a519', 'rozwija się w skutek wydzielania hormonu wzrostu (GH) przez gruczolaka przysadki u dzieci na etapie wzrastania.', false),
('d951a72c39584172b0eb493bddafabc8', 'f4b1cf1c97284288ae114fb561e5a519', 'może być rozpoznana po pojedynczym oznaczeniu GH w surowicy pacjenta.', false),
('8955cc22ef8644bf9d356c423e180ed1', 'f4b1cf1c97284288ae114fb561e5a519', 'do jej diagnostyki wykorzystywany jest test hipoglikemii poinsulinowej.', false),
('55470b315e9f4f779de1e0b82f425738', 'f4b1cf1c97284288ae114fb561e5a519', 'istotne dla jej rozpoznania jest wykazanie obniżenia stężenia insulinopodobnego czynnika wzrostu (IGF-1) w surowicy.', false);

-- Q64
INSERT INTO questions (id, exam_id, text) VALUES ('03c7740cef8542c99ea4017be12fb50c', 'fa67c30e6f46470987c00ff03d20abd5', '64. Tłuszcz w kale można wykryć za pomocą barwienia:');
INSERT INTO answers (id, question_id, text, is_correct) VALUES
('f9fe748e75304eb789f620ff0da944a1', '03c7740cef8542c99ea4017be12fb50c', 'sudanem III.', false),
('e9633e28365a456cb90349cc4d6c52d9', '03c7740cef8542c99ea4017be12fb50c', 'sudanem IV.', false),
('e0d6c0fe328b4473a5a9b5eb2772a95a', '03c7740cef8542c99ea4017be12fb50c', 'czerwienią olejową O.', false),
('f63944db40e14ad3aff1fba4c73938c1', '03c7740cef8542c99ea4017be12fb50c', 'prawdziwe są odpowiedzi A i B.', false),
('8e78ff411246481ab53ddd54bb70e40c', '03c7740cef8542c99ea4017be12fb50c', 'prawdziwe są odpowiedzi A, B i C.', true);

-- Q65
INSERT INTO questions (id, exam_id, text) VALUES ('174aa3da60df4d45b2dfe792c2965d09', 'fa67c30e6f46470987c00ff03d20abd5', '65. W badaniu płynu mózgowo-rdzeniowego u chorych na stwardnienie rozsiane można zaobserwować:');
INSERT INTO answers (id, question_id, text, is_correct) VALUES
('62c37d511f51431e949d7cfeefb726a3', '174aa3da60df4d45b2dfe792c2965d09', 'prążki monoklonalne.', false),
('3d9491fc5cce4d8a882a095f343d853e', '174aa3da60df4d45b2dfe792c2965d09', 'prążki oligoklonalne.', true),
('597a80d5ccba43258c900b4ae2c7fd5d', '174aa3da60df4d45b2dfe792c2965d09', 'mostek beta-gamma.', false),
('6fd4892006db4f85852b157331e3f47d', '174aa3da60df4d45b2dfe792c2965d09', 'mostek alfa-beta.', false),
('623c8a651d6e4257929cb5bc4c6d8235', '174aa3da60df4d45b2dfe792c2965d09', 'krioglobuliny.', false);

-- Q66
INSERT INTO questions (id, exam_id, text) VALUES ('62a11d80e0364fe3aca9c572ca835c66', 'fa67c30e6f46470987c00ff03d20abd5', '66. W diagnostyce różnicowej przyczyny otępienia należy oznaczyć w surowicy m.in. stężenie:');
INSERT INTO answers (id, question_id, text, is_correct) VALUES
('d570e6cd457b44e392638f9055ee469c', '62a11d80e0364fe3aca9c572ca835c66', 'wapnia.', false),
('527c2477f9ab4526abee86ebb5f7b211', '62a11d80e0364fe3aca9c572ca835c66', 'TSH.', false),
('bea494c0bf68466b8134b0c337e32ed6', '62a11d80e0364fe3aca9c572ca835c66', 'kwasu foliowego.', false),
('5fdf1ee4e8e64a83a589e9be3b91ceec', '62a11d80e0364fe3aca9c572ca835c66', 'witaminy B₁₂.', false),
('92790a6c09e14f43abe3196451cdf44a', '62a11d80e0364fe3aca9c572ca835c66', 'wszystkich ww. parametrów.', true);

-- Q67
INSERT INTO questions (id, exam_id, text) VALUES ('545bc7eaed11480d8fc94d54ffdd1c1a', 'fa67c30e6f46470987c00ff03d20abd5', '67. Oznaczanie stężenia beta₂-transferyny (beta ślad) służy do rozpoznania:');
INSERT INTO answers (id, question_id, text, is_correct) VALUES
('bfa28660f489459581f732c3bfab4d48', '545bc7eaed11480d8fc94d54ffdd1c1a', 'gammapatii monoklonalnych.', false),
('b8d7cfbd6a7c40229752bd4c82ab7ec4', '545bc7eaed11480d8fc94d54ffdd1c1a', 'stwardnienia rozsianego.', false),
('52705ed8651547dc8a9c4ece361b63f4', '545bc7eaed11480d8fc94d54ffdd1c1a', 'choroby Alzheimera.', false),
('f499696336604f4d8e4b5127f47f3033', '545bc7eaed11480d8fc94d54ffdd1c1a', 'wycieków płynu mózgowo-rdzeniowego w obrębie twarzoczaszki w wyniku urazów.', true),
('03a9e749b8414f44a4e6b83a6a57d9cd', '545bc7eaed11480d8fc94d54ffdd1c1a', 'choroby Parkinsona.', false);

-- Q68
INSERT INTO questions (id, exam_id, text) VALUES ('739612edd04f4e6eb6899d3dd3f06703', 'fa67c30e6f46470987c00ff03d20abd5', '68. Celem wykrycia białka monoklonalnego należy zastosować metodę:');
INSERT INTO answers (id, question_id, text, is_correct) VALUES
('b6f9551cd0594485a5fcb55d13703df3', '739612edd04f4e6eb6899d3dd3f06703', 'immunofiksacji.', true),
('ba2edb6dd7274f45a5f95e6d3ac43bd6', '739612edd04f4e6eb6899d3dd3f06703', 'ELISA.', false),
('022ab80218cf4b2b9095edfd09a099b6', '739612edd04f4e6eb6899d3dd3f06703', 'RIA.', false),
('ff7c86939c5b4f9faa28a63f39cba426', '739612edd04f4e6eb6899d3dd3f06703', 'radioreceptorową.', false),
('426ee72d2a7b44548c6c9ce183950fe0', '739612edd04f4e6eb6899d3dd3f06703', 'nefelometrii.', false);

-- Q69
INSERT INTO questions (id, exam_id, text) VALUES ('ad0caca282e9467a93d75561b3689eb4', 'fa67c30e6f46470987c00ff03d20abd5', '69. Białko C-reaktywne (CRP):');
INSERT INTO answers (id, question_id, text, is_correct) VALUES
('1ccbdc0fea764722806b581bb1ac31ed', 'ad0caca282e9467a93d75561b3689eb4', 'transportuje żelazo.', false),
('bc46649877604df3bd6f7ffe32c1537a', 'ad0caca282e9467a93d75561b3689eb4', 'należy do silnie reagujących białek ostrej fazy.', true),
('4a392b995da2407ba9594ffe55bcc724', 'ad0caca282e9467a93d75561b3689eb4', 'jest białkowym wskaźnikiem niedoczynności tarczycy.', false),
('4369694d11ec499790ac8e7cff849cc6', 'ad0caca282e9467a93d75561b3689eb4', 'jest najczęściej oznaczanym markerem niedożywienia.', false),
('ea4591accb5a4e878e1d076b59a77970', 'ad0caca282e9467a93d75561b3689eb4', 'zaliczane jest do krioglobulin.', false);

-- Q70
INSERT INTO questions (id, exam_id, text) VALUES ('8e00f4e8420a4c52bfb91c5b172fa77f', 'fa67c30e6f46470987c00ff03d20abd5', '70. W przebiegu ostrego stanu zapalnego możemy zaobserwować w surowicy podwyższenie stężenia:');
INSERT INTO answers (id, question_id, text, is_correct) VALUES
('072a2d33ad794808bc6903cf7b9b96c3', '8e00f4e8420a4c52bfb91c5b172fa77f', 'prealbuminy.', false),
('21c9cbaa0f53415b9adade5017358cd2', '8e00f4e8420a4c52bfb91c5b172fa77f', 'albuminy.', false),
('7ca30973f40b41dfa8666580ad7b17b4', '8e00f4e8420a4c52bfb91c5b172fa77f', 'kwaśnej α₁-glikoproteiny.', true),
('0a6887efb21941769ecba607d1b17360', '8e00f4e8420a4c52bfb91c5b172fa77f', 'transferyny.', false),
('098374fb9c3d4124b6ae276d2edaa6b9', '8e00f4e8420a4c52bfb91c5b172fa77f', 'PSA.', false);

-- Q71
INSERT INTO questions (id, exam_id, text) VALUES ('ea561d0a87b24000b9a5233f440d7978', 'fa67c30e6f46470987c00ff03d20abd5', '71. W przebiegu choroby Alzheimera można zaobserwować w płynie mózgowo-rdzeniowym zmiany stężenia białka:');
INSERT INTO answers (id, question_id, text, is_correct) VALUES
('c796229eea7c4f37947e5e6fd26d9ea3', 'ea561d0a87b24000b9a5233f440d7978', 'TSH.', false),
('4e2e60c4625243299b3520eeb9114712', 'ea561d0a87b24000b9a5233f440d7978', 'alfa-synukleiny.', false),
('bbba8afec4ad4b67b56db5f1c31e096e', 'ea561d0a87b24000b9a5233f440d7978', 'beta-synukleiny.', false),
('dc545370efdc4533be669c71784b34ea', 'ea561d0a87b24000b9a5233f440d7978', 'pTau.', true),
('0587c82ffb5245f1a54db1a40a91eef3', 'ea561d0a87b24000b9a5233f440d7978', 'S120.', false);

-- Q72
INSERT INTO questions (id, exam_id, text) VALUES ('9a6e9a7e33d7464bb34d175eb641ce65', 'fa67c30e6f46470987c00ff03d20abd5', '72. Markerem z wyboru w diagnostyce raka szyjki macicy jest:');
INSERT INTO answers (id, question_id, text, is_correct) VALUES
('27121cd6711a460ab75107bd912e6380', '9a6e9a7e33d7464bb34d175eb641ce65', 'SCC-Ag.', true),
('c6cc0b9d7f434d89bbffe131c633b561', '9a6e9a7e33d7464bb34d175eb641ce65', 'AFP.', false),
('bdf1950e6a334962a611b7b8b08716d4', '9a6e9a7e33d7464bb34d175eb641ce65', 'CEA.', false),
('76fffa7a3c784d7ca75f4f7ab500afa2', '9a6e9a7e33d7464bb34d175eb641ce65', 'PSA.', false),
('c8c04d7df30e4cb29f902f23a1b93f68', '9a6e9a7e33d7464bb34d175eb641ce65', 'CA 15-3.', false);

-- Q73
INSERT INTO questions (id, exam_id, text) VALUES ('d0391e9c7d9d4a338e2c9f078e43233e', 'fa67c30e6f46470987c00ff03d20abd5', '73. Wzrost stężenia przeciwciał IgM we krwi, obecność białka monoklonalnego oraz nadlepkość krwi są charakterystyczne w przebiegu:');
INSERT INTO answers (id, question_id, text, is_correct) VALUES
('d28daeca93444cb8bde1f01976ca1621', 'd0391e9c7d9d4a338e2c9f078e43233e', 'szpiczaka.', false),
('ba14ff2baf0b47ea9fc9773fd2493313', 'd0391e9c7d9d4a338e2c9f078e43233e', 'alergii.', false),
('f2fff26215274ec0833db7e6742ecfd2', 'd0391e9c7d9d4a338e2c9f078e43233e', 'zapalenia płuc.', false),
('20f7ee3d704c4887af648afec626b19b', 'd0391e9c7d9d4a338e2c9f078e43233e', 'odry.', false),
('84cf28746231413490570d8b8c86571d', 'd0391e9c7d9d4a338e2c9f078e43233e', 'makroglobulinemii Waldenströma (MW).', true);

-- Q74
INSERT INTO questions (id, exam_id, text) VALUES ('93a0b55eb76f4a0da18990120aa94e78', 'fa67c30e6f46470987c00ff03d20abd5', '74. Obniżone ↓stężenie sodu, podwyższone ↑stężenie białka całkowitego, ↑↑hematokrytu, ↑MCV wskazują na:');
INSERT INTO answers (id, question_id, text, is_correct) VALUES
('b1a5bf72b14945629e48af64c233591a', '93a0b55eb76f4a0da18990120aa94e78', 'odwodnienie hipotoniczne.', true),
('c23926c1c3d4409c9d5885d378267569', '93a0b55eb76f4a0da18990120aa94e78', 'odwodnienie izotoniczne.', false),
('33a2f86d3e0c4afdbbb0ed5c43036d50', '93a0b55eb76f4a0da18990120aa94e78', 'odwodnienie hipertoniczne.', false),
('012619aef9fe45539c24b49740487736', '93a0b55eb76f4a0da18990120aa94e78', 'przewodnienie hipotoniczne.', false),
('3da6c373a53540c6954a2a03815d6adc', '93a0b55eb76f4a0da18990120aa94e78', 'przewodnienie hipertoniczne.', false);

-- Q75
INSERT INTO questions (id, exam_id, text) VALUES ('e41099a07c1542a9af228e96c1087bee', 'fa67c30e6f46470987c00ff03d20abd5', '75. Peptydy natriuretyczne (BNP/NT-proBNP) są markerami:');
INSERT INTO answers (id, question_id, text, is_correct) VALUES
('398a01e1ab3f47428732ba98fe9192c0', 'e41099a07c1542a9af228e96c1087bee', 'martwicy kardiomiocytów.', false),
('e21bdfa9b3e340999d3f9901fb32fde2', 'e41099a07c1542a9af228e96c1087bee', 'zwłóknienia mięśnia sercowego.', false),
('fbfb3fe1bfce48f4b88cd56646da401f', 'e41099a07c1542a9af228e96c1087bee', 'niewydolności serca.', true),
('5ad8da7b44314d0f98a77d386816c598', 'e41099a07c1542a9af228e96c1087bee', 'destabilizacji blaszki miażdżycowej.', false),
('c8b48747395a4675ae38f2ed32de8b72', 'e41099a07c1542a9af228e96c1087bee', 'toczącego się procesu zapalnego w naczyniach.', false);

-- Q76
INSERT INTO questions (id, exam_id, text) VALUES ('515ff34fa0734a4799ef34c7af5bc670', 'fa67c30e6f46470987c00ff03d20abd5', '76. Hormony tropowe syntetyzowane są w:');
INSERT INTO answers (id, question_id, text, is_correct) VALUES
('7d1dc8bc460b4572b9160cbb935bd521', '515ff34fa0734a4799ef34c7af5bc670', 'podwzgórzu.', false),
('c2b9565cc965419da882fb1dc5e05651', '515ff34fa0734a4799ef34c7af5bc670', 'przednim płacie przysadki.', true),
('69cd753ff63843739d8ec69e36b0f495', '515ff34fa0734a4799ef34c7af5bc670', 'tylnym płacie przysadki.', false),
('4bff44fdf1cb47768ac41244b3812b39', '515ff34fa0734a4799ef34c7af5bc670', 'tarczycy.', false),
('b176dee6e4304b65a12f1cd045a3542f', '515ff34fa0734a4799ef34c7af5bc670', 'nadnerczach.', false);

-- Q77
INSERT INTO questions (id, exam_id, text) VALUES ('4e1d8db18f6049688899495cfcdfd3af', 'fa67c30e6f46470987c00ff03d20abd5', '77. Na stężenie hormonów tarczycy w surowicy krwi ma wpływ:');
INSERT INTO answers (id, question_id, text, is_correct) VALUES
('e855c0f1f0794941a1f825007ee0c7a6', '4e1d8db18f6049688899495cfcdfd3af', 'ilość jodu dostarczona do gruczołu tarczowego.', false),
('b2a41cbcbdd74c369b0fdd7bc03e6960', '4e1d8db18f6049688899495cfcdfd3af', 'aktywność peroksydazy.', false),
('b9b9d0938d5442e0b94ba88b9a79b783', '4e1d8db18f6049688899495cfcdfd3af', 'prawidłowa funkcja tyreoglobuliny.', false),
('4d8747025ab04d96b615a01a8766f0c3', '4e1d8db18f6049688899495cfcdfd3af', 'aktywność dejodaz.', false),
('f15156ca20964906a49973ca58b13c92', '4e1d8db18f6049688899495cfcdfd3af', 'każdy z wymienionych czynników.', true);

-- Q78
INSERT INTO questions (id, exam_id, text) VALUES ('8f5d427cc15d461cab35adb277655e72', 'fa67c30e6f46470987c00ff03d20abd5', '78. Terapeutycznemu monitorowaniu (TDM) podlegają wyłącznie leki, które spełniają następujące kryteria: 1) wysoki wskaźnik terapeutyczny; 2) odwracalność efektu farmakologicznego; 3) trwałe lub zagrażające życiu działania toksyczne. Prawidłowa odpowiedź to:');
INSERT INTO answers (id, question_id, text, is_correct) VALUES
('6e8ae39c1cd841d6a8c69f678a6adeca', '8f5d427cc15d461cab35adb277655e72', 'wszystkie wymienione.', false),
('664661b5f0a345e68706d480d1090864', '8f5d427cc15d461cab35adb277655e72', '1,3.', false),
('46a6d5b03cfd44b98d850343c25c059b', '8f5d427cc15d461cab35adb277655e72', '2,3.', true),
('b944f7bf659645a1bf1493a9ea2ca890', '8f5d427cc15d461cab35adb277655e72', 'tylko 1.', false),
('d343a74dc83d4c6eab7129328f864201', '8f5d427cc15d461cab35adb277655e72', 'tylko 3.', false);

-- Q79
INSERT INTO questions (id, exam_id, text) VALUES ('f83de4091fcf45d9b0dd3576dc1ee1e3', 'fa67c30e6f46470987c00ff03d20abd5', '79. Rokownicze skale: Maddrey''a, MELD i Glasgow należą do narzędzi pomagających - poprzez analizę wybranych badań laboratoryjnych - w ocenie rokowania w przypadku:');
INSERT INTO answers (id, question_id, text, is_correct) VALUES
('3bd87bd5fbb34c74a355a5e75a0204b1', 'f83de4091fcf45d9b0dd3576dc1ee1e3', 'przewlekłej niewydolności serca.', false),
('7d8713ead2d048cb82e42e25e5940d7d', 'f83de4091fcf45d9b0dd3576dc1ee1e3', 'choroby niedokrwiennej serca.', false),
('d9bf8fba043447a784b4185093c042a8', 'f83de4091fcf45d9b0dd3576dc1ee1e3', 'alkoholowego zapalenia wątroby.', true),
('10a7997c7bda4e68ac5bff34fc32a642', 'f83de4091fcf45d9b0dd3576dc1ee1e3', 'padaczki.', false),
('eb488219b72b4b36bafe59e9f3fd5b26', 'f83de4091fcf45d9b0dd3576dc1ee1e3', 'zespołów hemolitycznych.', false);

-- Q80
INSERT INTO questions (id, exam_id, text) VALUES ('3b0f8a2a8c9e453f8ea2d7f227c21c5d', 'fa67c30e6f46470987c00ff03d20abd5', '80. Wskaż fałszywe stwierdzenie dotyczące oznaczania alkoholu etylowego w materiale biologicznym:');
INSERT INTO answers (id, question_id, text, is_correct) VALUES
('2bddadf96036460baefae3b94aa5aa37', '3b0f8a2a8c9e453f8ea2d7f227c21c5d', 'metoda enzymatyczna może służyć oznaczaniu w osoczu, surowicy, krwi, moczu.', false),
('9bc0efd71852423db23a2275c2dddd33', '3b0f8a2a8c9e453f8ea2d7f227c21c5d', 'zaletą metody enzymatycznej jest wysoka swoistość analityczna.', false),
('1e362491f8e94d91a1d1acd416a3c89a', '3b0f8a2a8c9e453f8ea2d7f227c21c5d', 'działanie alkomatów do oznaczania etanolu w powietrzu wydechowym opiera się o metodę elektrochemiczną lub spektrometrii w zakresie podczerwieni.', false),
('4af0c7415bfc44938aa2ae4dbf83a93d', '3b0f8a2a8c9e453f8ea2d7f227c21c5d', 'stężenie alkoholu we krwi może być 2000 razy wyższe niż w wydychanym powietrzu.', false),
('7ed75781c6a74e26ab79c243cff223f2', '3b0f8a2a8c9e453f8ea2d7f227c21c5d', 'wg polskiego prawa stan nietrzeźwości oznacza stężenie alkoholu etylowego we krwi w zakresie 0,2 - 0,5 g/l.', true);

-- Q81
INSERT INTO questions (id, exam_id, text) VALUES ('d0d0ad748f2546d781a13f8be831211b', 'fa67c30e6f46470987c00ff03d20abd5', '81. Hemoliza in vitro nie powoduje w badaniach laboratoryjnych:');
INSERT INTO answers (id, question_id, text, is_correct) VALUES
('fb565ef3ccfd4c86a27c0ba93479c847', 'd0d0ad748f2546d781a13f8be831211b', 'wzrostu stężenia jonów potasowych.', false),
('01a9d5ee4a8d49a38733e82070806107', 'd0d0ad748f2546d781a13f8be831211b', 'obniżenia stężenia jonów sodowych.', false),
('610de1c4d27d44d38d824a015dc0db20', 'd0d0ad748f2546d781a13f8be831211b', 'wzrostu stężenia jonów fosforanowych.', false),
('413f206d850446dd93eb42c3dc4e5c89', 'd0d0ad748f2546d781a13f8be831211b', 'wzrostu stężenia jonów chlorkowych.', true),
('dfe2c76b57cb4cd4a0886f36b5af5b7d', 'd0d0ad748f2546d781a13f8be831211b', 'prawdziwe są odpowiedzi B+C.', false);

-- Q82
INSERT INTO questions (id, exam_id, text) VALUES ('2c2aa225e54d462494da44031cb63b78', 'fa67c30e6f46470987c00ff03d20abd5', '82. Wskaż badania laboratoryjne pomocne w diagnostyce niewydolności serca:');
INSERT INTO answers (id, question_id, text, is_correct) VALUES
('494167cf5a1c4c8d87c310efe5d937aa', '2c2aa225e54d462494da44031cb63b78', 'peptyd natriuretyczny typu B (BNP).', false),
('f04c76470c854dabb9bb598e17c36de5', '2c2aa225e54d462494da44031cb63b78', 'fragment prekursora BNP – NT-proBNP.', false),
('8beb79fe9bab4f988f9bf9646fe50c78', '2c2aa225e54d462494da44031cb63b78', 'fragment prekursora ANP (MP-pro ANP).', false),
('d50354b870a64413a2a251e77654e4f0', '2c2aa225e54d462494da44031cb63b78', 'prawdziwe są odpowiedzi A,B,C.', true),
('eef0ed46eb44479390ceb7968af113c0', '2c2aa225e54d462494da44031cb63b78', 'prawdziwe są odpowiedzi A+B.', false);

-- Q83
INSERT INTO questions (id, exam_id, text) VALUES ('fb860287d1c2463c952a14011656e12c', 'fa67c30e6f46470987c00ff03d20abd5', '83. Kryterium diagnostycznym stężenia troponiny w zawale mięśnia sercowego jest jej wzrost powyżej:');
INSERT INTO answers (id, question_id, text, is_correct) VALUES
('3be0910b810b48249f9bee5d426bca4b', 'fb860287d1c2463c952a14011656e12c', '99. centyla ggr.', true),
('64248e034c124ad6aeda533635588d30', 'fb860287d1c2463c952a14011656e12c', '97. centyla ggr.', false),
('82962b228bc84e71899f18b1875dab48', 'fb860287d1c2463c952a14011656e12c', '95. centyla ggr.', false),
('1e0a820540504b2bae8c414da3a56fa2', 'fb860287d1c2463c952a14011656e12c', '90. centyla ggr.', false),
('63ffc571757e478eb084fda0b1be2533', 'fb860287d1c2463c952a14011656e12c', 'wartości prawidłowych podanych przez producenta.', false);

-- Q84
INSERT INTO questions (id, exam_id, text) VALUES ('66ebd2c187954a169673b030a22d510f', 'fa67c30e6f46470987c00ff03d20abd5', '84. Zanikaniu antygenu HBs (HBsAg) w ostrym WZW typu B towarzyszy:');
INSERT INTO answers (id, question_id, text, is_correct) VALUES
('c551e89f838d4b0eabd720eb4b19a2e2', '66ebd2c187954a169673b030a22d510f', 'pojawienie się przeciwciał anty-HBs.', false),
('a5d319f883764d36831eb79e80ad039b', '66ebd2c187954a169673b030a22d510f', 'wzrost aktywności ALT.', false),
('e0b669c4bf814bcba7cb9a00cf00d223', '66ebd2c187954a169673b030a22d510f', 'obecność anty-HBc IgG.', false),
('01bb714c67a4455f952388a3436d240d', '66ebd2c187954a169673b030a22d510f', 'spadek aktywności ALT.', false),
('b14c595c92044edd95229b33dbf5bbfb', '66ebd2c187954a169673b030a22d510f', 'prawdziwe są odpowiedzi A+C.', true);

-- Q85
INSERT INTO questions (id, exam_id, text) VALUES ('bf82037028a84643936663d5cce5907b', 'fa67c30e6f46470987c00ff03d20abd5', '85. Pierwszym markerem serologicznym wykrywanym we krwi w ostrym WZW typu B jest:');
INSERT INTO answers (id, question_id, text, is_correct) VALUES
('808ef853444d4bb3903ff8f4761565ee', 'bf82037028a84643936663d5cce5907b', 'HBsAg.', true),
('6fff6971b6794615a099627a4fa55f3c', 'bf82037028a84643936663d5cce5907b', 'HBcAg.', false),
('0117f2c94dd2401486a85b08ceb58a09', 'bf82037028a84643936663d5cce5907b', 'HBeAg.', false),
('de0f2f4173974ee4aa05ddc07afd3359', 'bf82037028a84643936663d5cce5907b', 'anty-HBc IgM.', false),
('2c747cb6ee93487788cf80ad2d371549', 'bf82037028a84643936663d5cce5907b', 'anty-HBs.', false);

-- Q86
INSERT INTO questions (id, exam_id, text) VALUES ('c6b3629b74de4fbb8b5976025b6db0cd', 'fa67c30e6f46470987c00ff03d20abd5', '86. Wskaż prawdziwe stwierdzenie:');
INSERT INTO answers (id, question_id, text, is_correct) VALUES
('092631fa16114b85ba7c6d3167a893eb', 'c6b3629b74de4fbb8b5976025b6db0cd', 'hipoteza diagnostyczna to rozpoznanie wstępne ustalone na podstawie wyników badań laboratoryjnych.', false),
('8ec90eb045564818a4e9aa87e1473486', 'c6b3629b74de4fbb8b5976025b6db0cd', 'zmiana stężenia/aktywności markera narządowego zwykle wyprzedza wystąpienie objawów klinicznych.', true),
('dd64bebb7f3e44d28552edfda44007b7', 'c6b3629b74de4fbb8b5976025b6db0cd', 'diagnostyka laboratoryjna opiera się na badaniach jakościowych.', false),
('3255df454b6c49d68cd98b4fe8977cde', 'c6b3629b74de4fbb8b5976025b6db0cd', 'międzynarodowa klasyfikacja enzymów ma duże znaczenie w interpretacji wyników aktywności enzymatycznej.', false),
('d550689f19364bb89d3c2ff16cdcbca1', 'c6b3629b74de4fbb8b5976025b6db0cd', 'IU (international unit) jest jednostką Międzynarodowego Układu Jednostek Miar (Système international d''unités, SI).', false);

-- Q87
INSERT INTO questions (id, exam_id, text) VALUES ('3f16aa88ad3749fca46ab200ea3321b7', 'fa67c30e6f46470987c00ff03d20abd5', '87. Dehydrogenaza mleczanowa jest:');
INSERT INTO answers (id, question_id, text, is_correct) VALUES
('f685663bce6b4eeb9d1e13b5c9046eae', '3f16aa88ad3749fca46ab200ea3321b7', 'dimerem podjednostek H.', false),
('3962fe4a4dc546fa870b19069983ee22', '3f16aa88ad3749fca46ab200ea3321b7', 'dimerem podjednostek M.', false),
('f9ab7a7fe072450586eca3b7ebbf41ed', '3f16aa88ad3749fca46ab200ea3321b7', 'dimerem podjednostek H i M.', false),
('6c95d6caf5494e9996e3b535b76f9ad4', '3f16aa88ad3749fca46ab200ea3321b7', 'tetramerem kombinacji podjednostek H i/lub M.', true),
('7f2aa30f879d47588ab54e52396d7828', '3f16aa88ad3749fca46ab200ea3321b7', 'pentamerem kombinacji podjednostek H i/lub M.', false);

-- Q88
INSERT INTO questions (id, exam_id, text) VALUES ('e9dbf0f5061141979317ba9787f9bf36', 'fa67c30e6f46470987c00ff03d20abd5', '88. Wskaż fałszywe stwierdzenie dotyczące odtwarzalności:');
INSERT INTO answers (id, question_id, text, is_correct) VALUES
('63061dc758834febaa2c93ac85e3c0a2', 'e9dbf0f5061141979317ba9787f9bf36', 'służy do oceny precyzji metody.', false),
('104121f0338847d399713a00915c2a0d', 'e9dbf0f5061141979317ba9787f9bf36', 'jest to zgodność wyników w tej samej próbce w różnym czasie.', false),
('7ce580ed75ef41f88a23a04b2adc4e72', 'e9dbf0f5061141979317ba9787f9bf36', 'odtwarzalność wyznacza zmienność metody analitycznej.', false),
('f68a617976a54671a1e16e71db407477', 'e9dbf0f5061141979317ba9787f9bf36', 'zmienność odtwarzalności to nieprecyzyjność metody.', false),
('d3e721dac0df4fe4b9327237611e3269', 'e9dbf0f5061141979317ba9787f9bf36', 'cechuje się mniejszym rozrzutem wartości mierzonych niż powtarzalność.', true);

-- Q89
INSERT INTO questions (id, exam_id, text) VALUES ('3786ff1cd48a46e89226aeeabd4b44b0', 'fa67c30e6f46470987c00ff03d20abd5', '89. Do kalibracji rutynowych metod w medycznym laboratorium diagnostycznym korzysta się ze wzorca:');
INSERT INTO answers (id, question_id, text, is_correct) VALUES
('161219ab4dd5453099b394482fe771dd', '3786ff1cd48a46e89226aeeabd4b44b0', 'pierwotnego.', false),
('fe14b70f5ea54b038f4944e314fdb03b', '3786ff1cd48a46e89226aeeabd4b44b0', 'pierwszorzędowego.', false),
('c5d57da17b0d42568709cf7a65669ede', '3786ff1cd48a46e89226aeeabd4b44b0', 'drugorzędowego.', false),
('d875c464be6f43a3859b592f932e9ff8', '3786ff1cd48a46e89226aeeabd4b44b0', 'trzeciorzędowego.', true),
('763c628d420b4cc5a29eaf52009d9f50', '3786ff1cd48a46e89226aeeabd4b44b0', 'czwartorzędowego.', false);

-- Q90
INSERT INTO questions (id, exam_id, text) VALUES ('65d84493912c47368aa6f6db30c5aeeb', 'fa67c30e6f46470987c00ff03d20abd5', '90. Antykoagulant, który nie działa poprzez kompleksowanie jonów wapnia to:');
INSERT INTO answers (id, question_id, text, is_correct) VALUES
('c8d723ac412b4971a404d389fed0ea25', '65d84493912c47368aa6f6db30c5aeeb', 'heparyna.', true),
('f68be5b38e9940a1bda7d62b2faa3bd8', '65d84493912c47368aa6f6db30c5aeeb', 'wersenian sodowo-potasowy.', false),
('7edd030b774e4dadb438b873fa04c12b', '65d84493912c47368aa6f6db30c5aeeb', 'cytrynian.', false),
('7f73ba540064454fb179347a343022cb', '65d84493912c47368aa6f6db30c5aeeb', 'EDTA.', false),
('df33f4a84d9044fdbe9f41a494a0065a', '65d84493912c47368aa6f6db30c5aeeb', 'szczawian.', false);

-- Q91
INSERT INTO questions (id, exam_id, text) VALUES ('060142229bcb4c6fa823dfcb81cdfc7a', 'fa67c30e6f46470987c00ff03d20abd5', '91. Do błędów przedanalitycznych należą: 1) przedłużony czas transportu próbki do laboratorium; 2) niewłaściwa temperatura przechowywania próbki w czasie transportu do laboratorium; 3) błędna interpretacja wyniku badania; 4) podmienienie próbki w czasie transportu do laboratorium; 5) zastosowanie niewłaściwego antykoagulantu. Prawidłowa odpowiedź to:');
INSERT INTO answers (id, question_id, text, is_correct) VALUES
('be409c803c3848b785fcd13dcbb022cd', '060142229bcb4c6fa823dfcb81cdfc7a', 'tylko 1.', false),
('1d1670c8334445aea035fe2e86b66363', '060142229bcb4c6fa823dfcb81cdfc7a', '1,2.', false),
('6e3b89e27b564544ac20b550aefad0bb', '060142229bcb4c6fa823dfcb81cdfc7a', '1,2,3.', false),
('daa2ea4b90a44713bce062c84f9dcaa7', '060142229bcb4c6fa823dfcb81cdfc7a', '1,2,4,5.', true),
('4d985c9d282348cc867267b1445148b7', '060142229bcb4c6fa823dfcb81cdfc7a', 'wszystkie wymienione.', false);

-- Q92
INSERT INTO questions (id, exam_id, text) VALUES ('41eea39a880446249b9354b8f3c75949', 'fa67c30e6f46470987c00ff03d20abd5', '92. Trafność diagnostyczną wyraża się wzorem (gdzie PU to wyniki prawdziwie ujemne, PD to wyniki prawdziwie dodatnie; FU to wyniki fałszywie ujemne, FD to wyniki fałszywie dodatnie):');
INSERT INTO answers (id, question_id, text, is_correct) VALUES
('fdcbe789ee794d14892712e70bbae033', '41eea39a880446249b9354b8f3c75949', 'PU/PU+FD.', false),
('9fae58831fd64f229ba23373ed2774b1', '41eea39a880446249b9354b8f3c75949', 'PU+FU/PU+PD+FU+FD.', false),
('f1643ae960a24a2c99bcf7ee9567cfa1', '41eea39a880446249b9354b8f3c75949', 'PU+PD/PU+PD+FU+FD.', true),
('7283bf339e1f4c539129b73692e3f876', '41eea39a880446249b9354b8f3c75949', 'PU+FD/PU+PD+FU+FD.', false),
('219a1fc785204b5c951172f13956f4d3', '41eea39a880446249b9354b8f3c75949', 'PU/PU+FU.', false);

-- Q93
INSERT INTO questions (id, exam_id, text) VALUES ('043db10a03de404a862a5f89f477307b', 'fa67c30e6f46470987c00ff03d20abd5', '93. Fluorymetria należy do metod spektroskopowych:');
INSERT INTO answers (id, question_id, text, is_correct) VALUES
('c8c56c02a0d34345a8ef47fb93a66ace', '043db10a03de404a862a5f89f477307b', 'absorpcyjnych.', false),
('5159621a843c47038815309134b75295', '043db10a03de404a862a5f89f477307b', 'ramanowskich.', false),
('1131eed337b940aaa8bf30e73053fafc', '043db10a03de404a862a5f89f477307b', 'rezonansu magnetycznego.', false),
('0a26d20e624542fa85b67aed20a275c2', '043db10a03de404a862a5f89f477307b', 'emisyjnych.', true),
('da0db227c42b455abd333e009a47ba25', '043db10a03de404a862a5f89f477307b', 'nie należy do metod spektroskopowych.', false);

-- Q94
INSERT INTO questions (id, exam_id, text) VALUES ('dba573bcb6364ee68c176b0d7ce5a9de', 'fa67c30e6f46470987c00ff03d20abd5', '94. Wynik próbki kontrolnej powyżej 3 SD na karcie kontroli Leveya-Jenningsa jest błędem:');
INSERT INTO answers (id, question_id, text, is_correct) VALUES
('8e7b2cceb03c47b68ab58911008dbd95', 'dba573bcb6364ee68c176b0d7ce5a9de', 'dopuszczalnym.', false),
('5ba0cb15a1d64a48b58662c38c58b99f', 'dba573bcb6364ee68c176b0d7ce5a9de', 'ostrzegawczym.', false),
('2c4209bcf9a84135bc45d09e341cf07d', 'dba573bcb6364ee68c176b0d7ce5a9de', 'całkowitym.', false),
('e5de5e6f20494c829a92164c6cfcd5c9', 'dba573bcb6364ee68c176b0d7ce5a9de', 'nieznaczącym.', false),
('6ccf666a47c046c6a533efce687c57db', 'dba573bcb6364ee68c176b0d7ce5a9de', 'krytycznym.', true);

-- Q95
INSERT INTO questions (id, exam_id, text) VALUES ('0c37528b057849b38a49fca89af1cd07', 'fa67c30e6f46470987c00ff03d20abd5', '95. Stwierdzenie w badaniu gazometrii krwi tętniczej następujących zmian: pH ↑, pCO₂ ↓, HCO₃⁻ ↑, przemawia za występowaniem:');
INSERT INTO answers (id, question_id, text, is_correct) VALUES
('63df36c7388f46c7a756c6fb6d81dfc7', '0c37528b057849b38a49fca89af1cd07', 'mieszanej zasadowicy oddechowo-metabolicznej.', true),
('c014f42ee23941fe916924dce10968c7', '0c37528b057849b38a49fca89af1cd07', 'zasadowicy metabolicznej niewyrównanej.', false),
('efda43bd957e42999228073192dcdeb3', '0c37528b057849b38a49fca89af1cd07', 'zasadowicy metabolicznej częściowo wyrównanej.', false),
('773e0dbfd9714e3ea42657b585b25a23', '0c37528b057849b38a49fca89af1cd07', 'zasadowicy metabolicznej całkowicie wyrównanej.', false),
('684f4350ec744325b28cbb2d97f1b6b8', '0c37528b057849b38a49fca89af1cd07', 'zasadowicy oddechowej częściowo wyrównanej.', false);

-- Q96
INSERT INTO questions (id, exam_id, text) VALUES ('8bd13b552af84623a914bb957f17ce08', 'fa67c30e6f46470987c00ff03d20abd5', '96. Układem buforowym krwi, działającym w systemie otwartym jest bufor:');
INSERT INTO answers (id, question_id, text, is_correct) VALUES
('afe21d119b7848c3b461cd0d3cbde7a9', '8bd13b552af84623a914bb957f17ce08', 'hemoglobinianowy.', false),
('9ff26cea2a7247bb8a8b686a8eb6bf60', '8bd13b552af84623a914bb957f17ce08', 'białczanowy.', false),
('6ed9af3996bc42d48206d52381c856dc', '8bd13b552af84623a914bb957f17ce08', 'fosforanowy.', false),
('ee54ca1670c940dc850075d01d09f636', '8bd13b552af84623a914bb957f17ce08', 'wodorowęglanowy.', true),
('cef42d1bdb8e4c448608d393650ded5b', '8bd13b552af84623a914bb957f17ce08', 'siarkowy.', false);

-- Q97
INSERT INTO questions (id, exam_id, text) VALUES ('84190194a4d04b7297a6ecba4bc67259', 'fa67c30e6f46470987c00ff03d20abd5', '97. Zmiana stężenia białka we krwi może wywołać zmianę stężenia:');
INSERT INTO answers (id, question_id, text, is_correct) VALUES
('7fb1286cabd74f4e9785f52cc16157c1', '84190194a4d04b7297a6ecba4bc67259', 'sodu i potasu.', false),
('3b6bbd79f5594c2c975e063e2ad0a7af', '84190194a4d04b7297a6ecba4bc67259', 'jonów chlorkowych.', false),
('064c34629cc04cc0b498afa0c1768d8d', '84190194a4d04b7297a6ecba4bc67259', 'jonów wodorowęglanowych.', false),
('5addcc816e4441968b7ff9f6f825399b', '84190194a4d04b7297a6ecba4bc67259', 'wapnia zjonizowanego i magnezu zjonizowanego.', false),
('9168d7bcdac848fd9016409541a1abc1', '84190194a4d04b7297a6ecba4bc67259', 'wapnia całkowitego i magnezu całkowitego.', true);

-- Q98
INSERT INTO questions (id, exam_id, text) VALUES ('bb61ba392a6d48ca99158bf25f5c1b57', 'fa67c30e6f46470987c00ff03d20abd5', '98. Procesem kompensacyjnym (wyrównawczym) w zasadowicy metabolicznej jest:');
INSERT INTO answers (id, question_id, text, is_correct) VALUES
('c09ebed8104347678a6402762bc07c44', 'bb61ba392a6d48ca99158bf25f5c1b57', 'zwiększenie wchłaniania jonów wodorowęglanowych w nerkach.', false),
('3768986d2f024447aee5b4e3d2e80bf4', 'bb61ba392a6d48ca99158bf25f5c1b57', 'zwiększenie usuwania jonów wodorowęglanowych z moczem.', false),
('841bea4fd47245b8bd8a2d3d981c0d14', 'bb61ba392a6d48ca99158bf25f5c1b57', 'hipowentylacja.', true),
('d44e264582b7422f8ceb6ccf4370e82a', 'bb61ba392a6d48ca99158bf25f5c1b57', 'hiperwentylacja.', false),
('e531931ab1244f02a2a0538dad3f6362', 'bb61ba392a6d48ca99158bf25f5c1b57', 'transmineralizacja jonów potasowych z płynu zewnątrz- do wewnątrzkomórkowego.', false);

-- Q99
INSERT INTO questions (id, exam_id, text) VALUES ('246260c459794e9fa602ce54f0d29056', 'fa67c30e6f46470987c00ff03d20abd5', '99. Oznaczanie stężeń zewnątrzkomórkowej domeny receptora HER2 (sHER2) jest przydatne w monitorowaniu reakcji na leczenie chorych na:');
INSERT INTO answers (id, question_id, text, is_correct) VALUES
('743d675e306c4e7094a821159d67b463', '246260c459794e9fa602ce54f0d29056', 'nowotwory nabłonkowe jajnika.', false),
('7ce1b6e1df9948feaf1a88badab426d8', '246260c459794e9fa602ce54f0d29056', 'raka szyjki macicy.', false),
('e045751e60af4e529a82603523fd5569', '246260c459794e9fa602ce54f0d29056', 'raka trzonu macicy.', false),
('513dfbe46f7747fda3c6bc35248f026d', '246260c459794e9fa602ce54f0d29056', 'nowotwory zarodkowe jajnika.', false),
('8c75ba6c6ff34a00ac645060b01cf70a', '246260c459794e9fa602ce54f0d29056', 'raka piersi.', true);

-- Q100
INSERT INTO questions (id, exam_id, text) VALUES ('af878127e0924193aebdfa7d3bbdc6f2', 'fa67c30e6f46470987c00ff03d20abd5', '100. Wskaż fałszywe stwierdzenie dotyczące zastosowania oznaczania stężeń markerów nowotworowych w praktyce klinicznej:');
INSERT INTO answers (id, question_id, text, is_correct) VALUES
('5305b927864e457782b36c26350a32f3', 'af878127e0924193aebdfa7d3bbdc6f2', 'monitorowanie przebiegu choroby.', false),
('aedfc671662549c08b72857c48d5cf71', 'af878127e0924193aebdfa7d3bbdc6f2', 'badania przesiewowe populacji ogólnej.', true),
('11b6c5f5e0bf4927b6fffbfbd0a14eca', 'af878127e0924193aebdfa7d3bbdc6f2', 'wykrywanie nowotworów w populacji podwyższonego ryzyka.', false),
('2afad4d26bf641909c297c2ff22fb91d', 'af878127e0924193aebdfa7d3bbdc6f2', 'wykrywanie wznowy i przerzutów odległych.', false),
('51cc4a733a0644a696528778fb1e6a82', 'af878127e0924193aebdfa7d3bbdc6f2', 'ocena efektywności leczenia pierwotnego i uzupełniającego.', false);

-- Q101
INSERT INTO questions (id, exam_id, text) VALUES ('8ed993a5353b4558a5d64576a4b071ba', 'fa67c30e6f46470987c00ff03d20abd5', '101. Markerem nowotworowym swoistym narządowo jest:');
INSERT INTO answers (id, question_id, text, is_correct) VALUES
('afcba6f3cdb24c9396ab42ded56600c9', '8ed993a5353b4558a5d64576a4b071ba', 'swoisty antygen prostaty (PSA).', true),
('77a324437ab74185abd50ab91faa5d9f', '8ed993a5353b4558a5d64576a4b071ba', 'antygen karcynoembrionalny (CEA).', false),
('e836bd9f8f51442fb5716494be0e790e', '8ed993a5353b4558a5d64576a4b071ba', 'antygen raka płaskonabłonkowego (SCC-Ag).', false),
('3dab8feb2e7b4a848484f8a4a385f67d', '8ed993a5353b4558a5d64576a4b071ba', 'swoista enolaza neuronowa (NSE).', false),
('78982966829240b192e05e4432c17bfe', '8ed993a5353b4558a5d64576a4b071ba', 'antygen nowotworowy 15-3 (CA 15-3).', false);

-- Q102
INSERT INTO questions (id, exam_id, text) VALUES ('83d8fb860b114ed2b4aa5cab26fbeabe', 'fa67c30e6f46470987c00ff03d20abd5', '102. Zmiany stężeń swoistego antygenu prostaty (PSA) i antygenu prostaty niezwiązanego z serpinami (wolnego PSA) u chorych na raka prostaty dotyczą:');
INSERT INTO answers (id, question_id, text, is_correct) VALUES
('711d688fc1ee4fe199558c1af94f13b4', '83d8fb860b114ed2b4aa5cab26fbeabe', 'obniżenia stężenia PSA, podwyższenia frakcji wolnego PSA.', false),
('6ea7e5a2143e4718b425c54ea2e07e20', '83d8fb860b114ed2b4aa5cab26fbeabe', 'obniżenia stężenia PSA, obniżenia frakcji wolnego PSA.', false),
('cc685bd6303c4947abe18c3707469227', '83d8fb860b114ed2b4aa5cab26fbeabe', 'podwyższenia stężenia PSA, obniżenia frakcji wolnego PSA.', true),
('d70b36d27cdf4007bd4900514697fc50', '83d8fb860b114ed2b4aa5cab26fbeabe', 'podwyższenia stężenia PSA, wolna frakcja PSA pozostaje bez zmian.', false),
('cbf33b505f374f059189624a05eb59f2', '83d8fb860b114ed2b4aa5cab26fbeabe', 'podwyższenia stężenia PSA, podwyższenia frakcji wolnego PSA.', false);

-- Q103
INSERT INTO questions (id, exam_id, text) VALUES ('c895870e14e6425684e3f5f8f8144417', 'fa67c30e6f46470987c00ff03d20abd5', '103. Podstawowym markerem nowotworowym stosowanym w diagnostyce chorych na raka trzustki jest:');
INSERT INTO answers (id, question_id, text, is_correct) VALUES
('c7d532657ff742938cedf4f842af65fc', 'c895870e14e6425684e3f5f8f8144417', 'antygen karcynoembrionalny (CEA).', false),
('8adb0a7d9af0499e8cbaca036391f006', 'c895870e14e6425684e3f5f8f8144417', 'antygen nowotworowy 72-4 (CA 72-4).', false),
('f4983e16e12041c0ad66af53a946d65f', 'c895870e14e6425684e3f5f8f8144417', 'antygen nowotworowy 19-9 (CA 19-9).', true),
('84b53bcf0c034d5089d3ab74e91bfd98', 'c895870e14e6425684e3f5f8f8144417', 'antygen nowotworowy 125 (CA 125).', false),
('d65f70c9ce0744789940310683ece85d', 'c895870e14e6425684e3f5f8f8144417', 'antygen nowotworowy 15-3 (CA 15-3).', false);

-- Q104
INSERT INTO questions (id, exam_id, text) VALUES ('458e2a310e054a839e37d3b24725d3f2', 'fa67c30e6f46470987c00ff03d20abd5', '104. Markerem nowotworowym należącym do grupy antygenów płodowo-zarodkowych jest:');
INSERT INTO answers (id, question_id, text, is_correct) VALUES
('a5d05ae01d40432e9c7a882cff8e9381', '458e2a310e054a839e37d3b24725d3f2', 'antygen raka płaskonabłonkowego (SCC-Ag).', false),
('a064e040b48d450a8a4089b4ba98a092', '458e2a310e054a839e37d3b24725d3f2', 'antygen nowotworowy 72-4 (CA 72-4).', false),
('9d1335709f804f18b859e4576d0abbb3', '458e2a310e054a839e37d3b24725d3f2', 'tkankowy swoisty antygen polipeptydowy (TPS).', false),
('1cd4aab955854e3f90e1b95537dbb2ac', '458e2a310e054a839e37d3b24725d3f2', 'alfafetoproteina (AFP).', true),
('58f2760ac32c4eb4a15a81fa53c23c69', '458e2a310e054a839e37d3b24725d3f2', 'antygen nowotworowy 15-3 (CA 15-3).', false);

-- Q105
INSERT INTO questions (id, exam_id, text) VALUES ('81b407dba3c546069e8e045d453f04ab', 'fa67c30e6f46470987c00ff03d20abd5', '105. Który z parametrów laboratoryjnych ulega obniżeniu podczas starzenia?');
INSERT INTO answers (id, question_id, text, is_correct) VALUES
('1a443b8f9eef4c4dac63b2a53d5992d5', '81b407dba3c546069e8e045d453f04ab', 'odczyn opadania erytrocytów.', false),
('b7b5457f3192489cb3c5b86e64229234', '81b407dba3c546069e8e045d453f04ab', 'cholesterol.', false),
('6a6afca60b9545d2b67f2d3d636fe2e7', '81b407dba3c546069e8e045d453f04ab', 'fibrynogen.', false),
('f68bc0a471dc474a9038a6f0433de2a8', '81b407dba3c546069e8e045d453f04ab', 'klirens kreatyniny.', true),
('c5c217a967dd405b92c8597482cf059a', '81b407dba3c546069e8e045d453f04ab', 'glukoza.', false);

-- Q106
INSERT INTO questions (id, exam_id, text) VALUES ('72c2117e9a174da7b3e7c6ba3f7b91e5', 'fa67c30e6f46470987c00ff03d20abd5', '106. Jak zachowują się objętości przestrzeni wodnych organizmu w przewodnieniu hipotonicznym? (kolejno: przestrzeń zewnątrzkomórkowa / przestrzeń wewnątrzkomórkowa)');
INSERT INTO answers (id, question_id, text, is_correct) VALUES
('bbdce254069f4baeae4bec1e8a582071', '72c2117e9a174da7b3e7c6ba3f7b91e5', 'zmniejszona / zwiększona.', false),
('7620d9c3fadb44b3b31618aece0d1ee4', '72c2117e9a174da7b3e7c6ba3f7b91e5', 'zmniejszona / bez zmian.', false),
('4c2ef9c497424833ba0cce6e1eca0886', '72c2117e9a174da7b3e7c6ba3f7b91e5', 'zwiększona / zwiększona.', true),
('29f56b24f8574ac8a6349b9f2e1983dd', '72c2117e9a174da7b3e7c6ba3f7b91e5', 'bez zmian / zwiększona.', false),
('f1cf5557989a4efc986f21bb1c5791f1', '72c2117e9a174da7b3e7c6ba3f7b91e5', 'zwiększona / bez zmian.', false);

-- Q107
INSERT INTO questions (id, exam_id, text) VALUES ('76f6ce2659bd4111a34297e856fd5cc2', 'fa67c30e6f46470987c00ff03d20abd5', '107. Do obliczenia którego parametru badania laboratoryjnego służy poniższy wzór? ? = PU/(PU + FD), gdzie PU oznacza wyniki prawdziwie ujemne, a FD fałszywie dodatnie.');
INSERT INTO answers (id, question_id, text, is_correct) VALUES
('4cd95f3687c54e1a8d21b681b5dcac24', '76f6ce2659bd4111a34297e856fd5cc2', 'czułość diagnostyczna.', false),
('df739e46a0434edb9be4ee5b682c7502', '76f6ce2659bd4111a34297e856fd5cc2', 'swoistość diagnostyczna.', true),
('a49494bc79524a29a1da38f377fe062c', '76f6ce2659bd4111a34297e856fd5cc2', 'dodatnia wartość predykcyjna.', false),
('9ce39d173ff24d51b51c58c8944876c9', '76f6ce2659bd4111a34297e856fd5cc2', 'ujemna wartość predykcyjna.', false),
('6ae9571304544a0590fb8e6be9fefa35', '76f6ce2659bd4111a34297e856fd5cc2', 'prawdopodobieństwo dla wyniku ujemnego.', false);

-- Q108
INSERT INTO questions (id, exam_id, text) VALUES ('cbad0277ac604ecea2d2def52e4572ec', 'fa67c30e6f46470987c00ff03d20abd5', '108. Pożądany poziom cholesterolu LDL w surowicy pacjenta z cukrzycą i chorobą wieńcową wynosi:');
INSERT INTO answers (id, question_id, text, is_correct) VALUES
('2e2d384283894f6ab6208addbae596eb', 'cbad0277ac604ecea2d2def52e4572ec', '< 70 mg/dL.', true),
('9b33d8e7fbcf44058c3257373b42ff5e', 'cbad0277ac604ecea2d2def52e4572ec', '< 90 mg/dL.', false),
('c616c2047be2469db80f0bda2fd875ac', 'cbad0277ac604ecea2d2def52e4572ec', '< 100 mg/dL.', false),
('5c592c032cec476fa77f7f0fc2615ebe', 'cbad0277ac604ecea2d2def52e4572ec', '< 115 mg/dL.', false),
('d9181a0b8f3c423b86764d91f819b37b', 'cbad0277ac604ecea2d2def52e4572ec', '< 130 mg/dL.', false);

-- Q109
INSERT INTO questions (id, exam_id, text) VALUES ('07d70ed67bdc4c03abaf2d7245afdd1f', 'fa67c30e6f46470987c00ff03d20abd5', '109. Następujące stężenia anionów: HCO₃⁻ 12 mEq/L; białczany 65 mEq/L; fosforany i inne aniony 109 mEq/L; Cl⁻ 14 mEq/L są charakterystyczne dla:');
INSERT INTO answers (id, question_id, text, is_correct) VALUES
('c0f71206960141b394a1b4727552e605', '07d70ed67bdc4c03abaf2d7245afdd1f', 'osocza.', false),
('0dec7f7f8615410b8166db799b3d7fd5', '07d70ed67bdc4c03abaf2d7245afdd1f', 'płynu śródmiąższowego.', false),
('45c76e3f64a44efa9f6eff879aa5a7d6', '07d70ed67bdc4c03abaf2d7245afdd1f', 'płynu wewnątrzkomórkowego.', true),
('8cf54e4a197a432ca59a52a0319cfe4d', '07d70ed67bdc4c03abaf2d7245afdd1f', 'płynu mózgowo-rdzeniowego.', false),
('175c91ab49ee477983ffb8063140cf68', '07d70ed67bdc4c03abaf2d7245afdd1f', 'moczu.', false);

-- Q110
INSERT INTO questions (id, exam_id, text) VALUES ('817df3630663409183e7cc4709dfd76e', 'fa67c30e6f46470987c00ff03d20abd5', '110. Złotym standardem w diagnostyce niedoboru hormonu wzrostu jest:');
INSERT INTO answers (id, question_id, text, is_correct) VALUES
('3595182d41404f2ca660afcc44fedb96', '817df3630663409183e7cc4709dfd76e', 'oznaczanie insulino-podobnego czynnika wzrostu (IGF-1).', false),
('4cc313ddee38496a8055e24d460e1654', '817df3630663409183e7cc4709dfd76e', 'test hipoglikemii bezwzględnej z insuliną.', true),
('8f38f11e32254db3929b8caa49f31ffd', '817df3630663409183e7cc4709dfd76e', 'test z klonidyną.', false),
('159485e986f34eb282125cf4c6724cba', '817df3630663409183e7cc4709dfd76e', 'test stymulacji somatoliberyną (GHRH).', false),
('2fbf4144c6e6436f8f2c19beb52a4821', '817df3630663409183e7cc4709dfd76e', 'test z lewodopą.', false);

-- Q111
INSERT INTO questions (id, exam_id, text) VALUES ('42cb28e450824d46bbce1b5a9ef61bca', 'fa67c30e6f46470987c00ff03d20abd5', '111. Wyniki oznaczeń czasu protrombinowego powinny być wyrażane w postaci INR (international normalized ratio) w przypadku:');
INSERT INTO answers (id, question_id, text, is_correct) VALUES
('6c1460451b944ba3bc1859039454413c', '42cb28e450824d46bbce1b5a9ef61bca', 'diagnostyki skaz krwotocznych.', false),
('5eb82799d6e34971b2cb4c8ef901cf23', '42cb28e450824d46bbce1b5a9ef61bca', 'monitorowania leczenia antagonistami witaminy K (VKA).', true),
('334bb64b0d5b428684b0be6900a3e669', '42cb28e450824d46bbce1b5a9ef61bca', 'diagnostyki upośledzenia czynności wątroby.', false),
('64a351a1ba2c463fbc7efbcf837c6c4b', '42cb28e450824d46bbce1b5a9ef61bca', 'prawdziwe są odpowiedzi A,B,C.', false),
('df25f5b793cf4bed9c207b529bf1a87a', '42cb28e450824d46bbce1b5a9ef61bca', 'prawdziwe są odpowiedzi A i B.', false);

-- Q112
INSERT INTO questions (id, exam_id, text) VALUES ('c64c0c879b11471481263149be908308', 'fa67c30e6f46470987c00ff03d20abd5', '112. U pacjenta bez klinicznych ani elektrokardiograficznych objawów niedotlenienia miokardium, u którego stwierdzono wzrastające stężenie cTn przekraczające górną granicę przedziału referencyjnego (99. percentyl), należy rozpoznać:');
INSERT INTO answers (id, question_id, text, is_correct) VALUES
('1ad859033fc248dda4eb790cbc43429e', 'c64c0c879b11471481263149be908308', 'świeży zawał serca.', false),
('ba9309f1d2c848568f49fb0fa4ed0448', 'c64c0c879b11471481263149be908308', 'ostre uszkodzenie mięśnia sercowego.', true),
('3e0af63d12bf492b8fcb11698fe9434d', 'c64c0c879b11471481263149be908308', 'niestabilną dławicę piersiową.', false),
('49a13f9da90f4ca8a79090f4d3e192b1', 'c64c0c879b11471481263149be908308', 'stabilną dławicę piersiową.', false),
('c43f508a29d64419bc3ecf4f8ba923d6', 'c64c0c879b11471481263149be908308', 'przebyty zawał serca.', false);

-- Q113
INSERT INTO questions (id, exam_id, text) VALUES ('8f0a5e5d59894e86a318494cb7fc5c06', 'fa67c30e6f46470987c00ff03d20abd5', '113. Wartość predykcyjna dodatniego wyniku testu (PPV) równa 90% oznacza, że:');
INSERT INTO answers (id, question_id, text, is_correct) VALUES
('b0025bb062844b469d7defce623157d0', '8f0a5e5d59894e86a318494cb7fc5c06', 'dodatni wynik testu występuje u 90% osób chorych.', false),
('6a870075e92d4e3a9c0efa17a40582c9', '8f0a5e5d59894e86a318494cb7fc5c06', 'dodatni wynik testu występuje u 90% osób wolnych od choroby.', false),
('2e8faabd2bd54139b255d20851d26aa1', '8f0a5e5d59894e86a318494cb7fc5c06', 'choroba występuje u 90% osób z dodatnim wynikiem testu.', false),
('4f67a0f46828484cbeb9824dd51eb15d', '8f0a5e5d59894e86a318494cb7fc5c06', '90% wyników dodatnich stanowią wyniki prawdziwie dodatnie.', false),
('5e63aeda64794d3a986e7c273c53d580', '8f0a5e5d59894e86a318494cb7fc5c06', 'prawdziwe są odpowiedzi C i D.', true);

-- Q114
INSERT INTO questions (id, exam_id, text) VALUES ('a13fce44041945e9909a713ba021e8dc', 'fa67c30e6f46470987c00ff03d20abd5', '114. Zawartość w osoczu lipoprotein o małej gęstości (LDL) jest pośrednio odzwierciedlana przez:');
INSERT INTO answers (id, question_id, text, is_correct) VALUES
('d8878268b2c141679832ccd813ab1d50', 'a13fce44041945e9909a713ba021e8dc', 'stężenie cholesterolu LDL.', false),
('abcbe28ef739495093f53eee9b7c1a22', 'a13fce44041945e9909a713ba021e8dc', 'stężenie apolipoproteiny AI.', false),
('2b7b2b5840df4d66ba6939259a6c3d63', 'a13fce44041945e9909a713ba021e8dc', 'stężenie apolipoproteiny B.', false),
('9f045fdf089847c6b379db93b947bf2c', 'a13fce44041945e9909a713ba021e8dc', 'prawdziwe są odpowiedzi A,B,C.', false),
('7fa8549d7d494dda9d61d0516e77db9b', 'a13fce44041945e9909a713ba021e8dc', 'prawdziwe są odpowiedzi A i C.', true);

-- Q115
INSERT INTO questions (id, exam_id, text) VALUES ('527857d4e8cb48ff84a00301af7d3725', 'fa67c30e6f46470987c00ff03d20abd5', '115. Przyczyną fałszywie zwiększonego stężenia potasu w surowicy/osoczu krwi (hiperkaliemia rzekoma) jest:');
INSERT INTO answers (id, question_id, text, is_correct) VALUES
('b7090ed186e649eb943e111463b76a7d', '527857d4e8cb48ff84a00301af7d3725', 'hemoliza in vitro.', false),
('d353b16d84644550ba5c457e10305d4d', '527857d4e8cb48ff84a00301af7d3725', 'długotrwałe przechowywanie próbki pełnej krwi.', false),
('3a84c1c2473845c88f5b636b4d8509d1', '527857d4e8cb48ff84a00301af7d3725', 'pobranie krwi na antykoagulant zawierający potas.', false),
('f57e987f9fe8434496f97be2e02a86a9', '527857d4e8cb48ff84a00301af7d3725', 'pobranie próbki krwi w trakcie dożylnego wlewu roztworu potasu.', false),
('e8cd09acd2e54a0ebf79898c338dac3f', '527857d4e8cb48ff84a00301af7d3725', 'każde z wymienionych.', true);

-- Q116
INSERT INTO questions (id, exam_id, text) VALUES ('cb654f04da3d4593a7b999139cebf252', 'fa67c30e6f46470987c00ff03d20abd5', '116. Błędem w wykonywaniu doustnego testu tolerancji glukozy (DTTG, OGTT) jest:');
INSERT INTO answers (id, question_id, text, is_correct) VALUES
('089a4f948b2e40dc9165b57f7b37761b', 'cb654f04da3d4593a7b999139cebf252', 'wykonanie go na czczo.', false),
('b557d1282636472ca14e99b8eafe9f08', 'cb654f04da3d4593a7b999139cebf252', 'wykonanie go w godzinach popołudniowych.', false),
('3c91984c77344c4f8ad16f7827e5e193', 'cb654f04da3d4593a7b999139cebf252', 'oznaczanie stężenia glukozy w pełnej krwi przy pomocy analizatora POCT, np. glukometru.', false),
('d6604c3b11ee4f5796bbc0a375f927fa', 'cb654f04da3d4593a7b999139cebf252', 'obciążenie 75 g glukozy rozpuszczonej w 300 ml wody.', false),
('a607edfd4d5d4cdaa3b7a2b1ebfd94be', 'cb654f04da3d4593a7b999139cebf252', 'prawdziwe są odpowiedzi B i C.', true);

-- Q117
INSERT INTO questions (id, exam_id, text) VALUES ('918712c3108b40afa195ad0166cd607f', 'fa67c30e6f46470987c00ff03d20abd5', '117. Wskaż parametry czerwonokrwinkowe morfologii krwi w niedokrwistości z niedoboru witaminy B₁₂ i folianów:');
INSERT INTO answers (id, question_id, text, is_correct) VALUES
('721ffa5a850844fba6eb8f941757e22f', '918712c3108b40afa195ad0166cd607f', 'RBC ↓, HGB ↓, HCT ↓, MCV ↑, MCH ↑, MCHC N, RDW ↑.', true),
('789cbea024924f4bb6e2fd0cabf71f7d', '918712c3108b40afa195ad0166cd607f', 'RBC ↓, HGB ↓, HCT ↓, MCV ↓, MCH ↓, MCHC N, RDW ↑.', false),
('0bac5caf7ef24effb90ca569732d2519', '918712c3108b40afa195ad0166cd607f', 'RBC ↓, HGB ↓, HCT ↓, MCV N, MCH N, MCHC N, RDW N.', false),
('93879d3a97504e709e8d9bf78be6a20d', '918712c3108b40afa195ad0166cd607f', 'RBC ↓, HGB ↓, HCT ↓, MCV ↑, MCH N, MCHC ↓, RDW ↓.', false),
('ba90a56ffc13480b93c6be6e157840c5', '918712c3108b40afa195ad0166cd607f', 'RBC ↓, HGB ↓, HCT ↓, MCV ↓, MCH ↑, MCHC ↓, RDW N.', false);

-- Q118
INSERT INTO questions (id, exam_id, text) VALUES ('8261839928c54f8697b38efb7dd68fd5', 'fa67c30e6f46470987c00ff03d20abd5', '118. Do ustalenia rozpoznania przewlekłej białaczki limfocytowej konieczne jest stwierdzenie:');
INSERT INTO answers (id, question_id, text, is_correct) VALUES
('e1416500eee24321a49fcb51f2377d09', '8261839928c54f8697b38efb7dd68fd5', 'stale podwyższonej liczby limfocytów > 4,5 x 10⁹/l, o charakterze monoklonalnym.', false),
('0fdef00337e041758a95ef3da9e360b0', '8261839928c54f8697b38efb7dd68fd5', 'stale podwyższonej liczby limfocytów > 5 x 10⁹/l, o charakterze monoklonalnym.', true),
('4fd9bf18982f4573bdd68e6280dfec75', '8261839928c54f8697b38efb7dd68fd5', 'stale podwyższonej liczby limfocytów < 5 x 10⁹/l, o charakterze poliklonalnym.', false),
('ffd33596ebc146b2b32f4ae39b4b1ccb', '8261839928c54f8697b38efb7dd68fd5', 'stale podwyższonej liczby limfocytów > 5 x 10⁹/l, o charakterze poliklonalnym.', false),
('3febb42acf7e4d70ba0cec9dc786cbff', '8261839928c54f8697b38efb7dd68fd5', 'stale podwyższonej liczby limfocytów < 4,5 x 10⁹/l, o charakterze poliklonalnym.', false);

-- Q119
INSERT INTO questions (id, exam_id, text) VALUES ('f28ff42dfc6447a6a830bb0dc442a71e', 'fa67c30e6f46470987c00ff03d20abd5', '119. Wskaż komórki dominujące w prawidłowym rozmazie krwi obwodowej, u półtorarocznego dziecka i u noworodka:');
INSERT INTO answers (id, question_id, text, is_correct) VALUES
('652dbd4081c44ae9b225e92ac216be76', 'f28ff42dfc6447a6a830bb0dc442a71e', 'limfocyty i neutrofile.', true),
('16369beb2f7349ad9c13408b3f2a6e25', 'f28ff42dfc6447a6a830bb0dc442a71e', 'neutrofile i limfocyty.', false),
('c856655f252249c4bc15a2c30214e464', 'f28ff42dfc6447a6a830bb0dc442a71e', 'monocyty i neutrofile.', false),
('7ede8898a80442b793b903d352c1ca78', 'f28ff42dfc6447a6a830bb0dc442a71e', 'limfocyty i monocyty.', false),
('bbf493e859314b37ba2d084493982b06', 'f28ff42dfc6447a6a830bb0dc442a71e', 'neutrofile i monocyty.', false);

-- Q120
INSERT INTO questions (id, exam_id, text) VALUES ('04c4190f2daa42f7bbbaefdfcad6dede', 'fa67c30e6f46470987c00ff03d20abd5', '120. Najczęściej występująca mutacja w czerwienicy prawdziwej to obecność:');
INSERT INTO answers (id, question_id, text, is_correct) VALUES
('c94ded957ee94307bd6aea4d85a6add5', '04c4190f2daa42f7bbbaefdfcad6dede', 'mutacji JAK2V617F.', true),
('d5880bb78d90487b9e1c16dedb05b4ab', '04c4190f2daa42f7bbbaefdfcad6dede', 'chromosomu Philadelphia.', false),
('eb3991ea649c419983c40256435ff32d', '04c4190f2daa42f7bbbaefdfcad6dede', 'Del(5q13).', false),
('7d4bb8c1cdf348038a2aab3462aec92b', '04c4190f2daa42f7bbbaefdfcad6dede', 'mutacji somatycznej genu PIG-A.', false),
('37b7ca50cfbb4de1a81fe3819a9fa383', '04c4190f2daa42f7bbbaefdfcad6dede', 'mutacji genów RAS i NF1.', false);

COMMIT;
