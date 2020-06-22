create table Participant (
	partID int not null auto_increment,
	partTitle varchar(10) not null,
	partFName varchar(45) not null,
	partLName varchar(45) not null,
	partDOB date not null,
	partAddress1 varchar(100) not null,
	partAddress2 varchar(100) not null,
	partCity varchar(45) not null,
	partPostcode varchar(10) not null,
	partPhone varchar(15) not null,
	partEmail varchar(60) not null,
	amountRaised decimal not null,
	primary key (partID)
	);
create table Client (
	clientID int not null auto_increment,
	clientTitle varchar(10) not null,
	clientFNmae varchar(45) not null,
	clientLName varchar(45) not null,
	clientAddress1 varchar(100) not null,
	clientAddress2 varchar(100) not null,
	clientCity varchar(45) not null,
	clientCounty varchar(45) not null,
	clientPostcode varchar(10) not null,
	clientPhone varchar(15) not null,
	clientEmail varchar(60) not null,
	clientAccount int not null,
	primary key (clientID)
	);
create table LocalAuthority (
	authID int not null auto_increment,
	authName varchar(45) not null,
	authAddress1 varchar(100) not null,
	authAddress2 varchar(100) not null,
	authCity varchar(45) not null,
	authPostcode varchar(10) not null,
	primary key (authID)
	);
create table LandOwner (
	landID int not null auto_increment,
	landTitle varchar(10) not null,
	landFName varchar(45) not null,
	landLName varchar(45) not null,
	landAddress1 varchar(100) not null,
	landAddress2 varchar(100) not null,
	landCity varchar(45) not null,
	landCounty varchar(45) not null,
	landPostcode varchar(10) not null,
	landPhone varchar(15) not null,
	primary key (landID)
	);
create table Sponsor (
	sponsorID int not null auto_increment,
	sponsorName varchar(90) not null,
	sponsorAddress1 varchar(100) not null,
	sponsorAddress2 varchar(100) not null,
	sponsorCity varchar(45) not null,
	sponsorPostcode varchar(10) not null,
	sponsorPhone varchar(15) not null,
	sponsorEmail varchar(60) not null,
	primary key (sponsorID)
	);
create table Supplier (
	supplierID int not null auto_increment,
	supplierType varchar(40) not null,
	supplierContactName varchar(45) not null,
	supplierAddress1 varchar(100) not null,
	supplierAddress2 varchar(100) not null,
	supplierCity varchar(45) not null,
	supplierPostcode varchar(10) not null,
	supplierPhone varchar(15) not null,
	supplierEmail varchar(60) not null,
	primary key (supplierID)
	);
create table EventPlanner (
	evPlannerName varchar(80) not null, 
	evPlannerPhone varchar(15) not null,
	primary key (evPlannerName)
	);
create table Event (
	eventID int not null auto_increment,
	eventName varchar(80) not null, 
	eventDate date not null,
	eventBriefDate date not null,
	eventPropPresentationDate date not null, 
	eventPropClientApproval date not null, 
	eventCostToClient int not null,
	eventDuration int not null,
	clientID int not null,
	evPlannerName varchar(80) not null,
	landID int not null,
	primary key (eventID),
	foreign key (clientID) references Client (clientID),
	foreign key (evPlannerName) references EventPlanner (evPlannerName),
	foreign key (landID) references LandOwner (landID)
	);
create table Job (
	jobID int not null auto_increment,
	jobTitle varchar(60) not null,
	pay decimal(6,2) not null,
	primary key (jobID)
	);
create table Staff (
	staffID int not null auto_increment,
	staffFName varchar(45) not null,
	staffLName varchar(45) not null,
	staffAddress1 varchar(100) not null,
	staffAddress2 varchar(100) not null,
	staffCity varchar(45) not null,
	staffPostcode varchar(10) not null,
	staffPhone varchar(15) not null,
	staffEmail varchar(60) not null,
	jobID int not null,
	primary key (staffID),
	foreign key (jobID) references Job (jobID)
	);
create table EventStaff (
	staffID int not null,
	eventID int not null,
	primary key (staffID, eventID)
	);
create table EventSupplier (
	supplierID int not null,
	eventID int not null,
	evSuppCost decimal not null,
	primary key (supplierID, eventID)
	);
create table SponsorEvent (
	sponsorID int not null,
	eventID int not null,
	sponsorEventAmount DECIMAL not null,
	primary key (sponsorID, eventID)
	);
create table Register (
	partID int not null,
	eventID int not null,
	regDate date not null,
	regDatePaid date not null,
	primary key (partID, eventID)
	);
create table LocalAuthorityEvent(
	authID int not null,
	eventID int not null,
	authContactName varchar(80) not null,
	authContactPhone varchar(15) not null,
	primary key (authID, eventID)
	);


Participant
INSERT INTO `Participant` (`partID`,`partTitle`,`partFName`,`partLName`,`partDOB`,`partAddress1`,`partAddress2`,`partCity`,`partPostcode`,`partPhone`,`partEmail`,`amountRaised`) 
VALUES (1,"Mr.","Carol","Giles","1981-08-24","880-513 Pellentesque Av.","P.O. Box 731, 8915 Litora Rd.","Sannazzaro de' Burgondi","P3M 6IF","03885 294651","nec@mauris.ca","8408.32"),
(2,"Mr.","Ahmed","Browning","1973-09-18","Ap #550-9395 Blandit Road","P.O. Box 911, 2828 Mollis Rd.","Llanquihue","WO47 4HR","06200 825517","non@eget.co.uk","6104.53"),
(3,"Ms.","Tamara","Powers","1975-01-03","Ap #815-4083 Urna, Av.","P.O. Box 835, 7499 Enim Rd.","Weert","Z2K 7II","07509 547211","tempus.eu.ligula@egestasAliquamnec.edu","6446.00"),
(4,"Ms.","Wallace","Velasquez","1985-11-24","8015 Quisque Road","P.O. Box 498, 9443 Vehicula. Ave","Rathenow","L02 8AE","07483 669663","ac.fermentum.vel@orciPhasellusdapibus.edu","8202.78"),
(5,"Mr.","Elaine","Terry","1990-11-18","795-7399 Et, Street","Ap #869-5047 Diam Street","Wismar","W1 7MZ","07326 399839","est.mollis.non@semconsequat.net","7955.42"),
(6,"Ms.","Merrill","Chang","1978-11-26","P.O. Box 892, 964 Aliquam Avenue","235-6635 Magna, Street","Sossano","DO2L 2YV","03278 873522","vel.arcu.eu@hendrerit.co.uk","9.06"),
(7,"Mr","George","Sharp","1988-12-31","806-3873 Eu Av.","308-758 Sem. Ave","Seilles","DM2N 1KY","00463 551523","in.felis@gravidasitamet.org","9234.87"),
(8,"Dr.","Marvin","Shepard","1984-08-10","Ap #407-7827 Ac Ave","P.O. Box 746, 1015 Aliquet Rd.","Bleid","NE9 1OE","07595 964975","a@ametmassa.org","3062.27"),
(9,"Mr","Macaulay","Wilson","1974-09-04","Ap #763-3497 Magnis Road","6878 Vestibulum Street","Biez","A9O 9HO","06309 276683","tristique.ac@sem.net","5458.88"),
(10,"Dr.","Brianna","Foreman","1980-05-23","598-7139 Amet Road","Ap #856-4039 Dictum. Rd.","Macklin","X4 8EW","06549 444229","a.tortor.Nunc@ataugueid.org","739.84");



Client
INSERT INTO `Client` (`clientID`,`clientTitle`,`clientFName`,`clientLName`,`clientAddress1`,`clientAddress2`,`clientCity`,`clientCounty`,`clientPostcode`,`clientPhone`,`clientEmail`,`clientAccount`) 
VALUES (1,"Mr.","Herman","Vazquez","Ap #155-4410 Consequat St.","7699 Lorem Ave","Inverness","IN","PH1 9UM","04710 617731","Phasellus.libero@sitamet.edu",1000),
(2,"Ms.","Winter","Hebert","P.O. Box 378, 8490 Montes, Avenue","4149 Neque. Street","Trowbridge","Wiltshire","F40 7RY","05052 038782","Praesent.eu.nulla@aliquet.com",1001),
(3,"Ms.","Mira","Griffin","3013 Mollis Street","711-5322 Luctus Av.","Winchester","Hampshire","K65 2YE","09613 339169","consequat.nec@aptenttaciti.ca",1002),
(4,"Mrs.","Nora","Hensley","P.O. Box 768, 7126 Est St.","Ap #701-3550 In St.","Millport","BU","X1 1VW","07287 011595","enim.sit@sitamet.net",1003),
(5,"Mrs.","Sandra","Wyatt","578-2792 Diam. Avenue","6166 Dignissim St.","Newquay","Cornwall","DD3 1VZ","07318 307702","ipsum.sodales@Pellentesque.net",1004),
(6,"Mr.","Yoshio","Navarro","Ap #810-5077 Lorem St.","Ap #196-7219 Justo. St.","Glasgow","Lanarkshire","OO4 4EN","09051 008858","amet@sedconsequat.com",1005),
(7,"Dr.","Nicholas","Underwood","Ap #462-1196 Mauris. Rd.","P.O. Box 383, 169 A, St.","Milnathort","Kinross-shire","RL83 7MQ","01467 801698","imperdiet@idliberoDonec.ca",1006),
(8,"Mr.","Mark","Nichols","453-4496 Faucibus Ave","358-7239 Nisl Rd.","Flint","Flintshire","O63 2HG","09429 370881","eu.accumsan@dui.edu",1007),
(9,"Mr","Sheila","Mcpherson","P.O. Box 369, 4941 Aliquam Rd.","787-5698 Iaculis Street","Matlock","DB","L74 4GW","05800 192248","commodo.at@Aliquamgravida.net",1008),
(10,"Mrs.","Oren","Ryan","983-5521 Aliquam Avenue","6202 Id, Avenue","Milnathort","KR","S7W 2RR","08509 505640","nonummy.Fusce@blanditmattisCras.net",1009);

LocalAuthority
INSERT INTO `LocalAuthority` (`authID`,`authName`,`authAddress1`,`authAddress2`,`authCity`,`authPostcode`) 
VALUES (1,"Shea J. Brennan","Ap #987-4490 Aptent Street","661-7398 Faucibus Street","Maiolati Spontini","TX90 9VD"),
(2,"Hilda L. Bartlett","3908 Condimentum Avenue","Ap #820-5682 Eleifend, Street","Tubeke Tubize","OM82 6DU"),
(3,"Patrick H. Sparks","Ap #371-1906 Quis Street","4244 Vestibulum Rd.","Vitrolles","S2A 9XW"),
(4,"Harlan N. Levy","2061 Sapien. Ave","P.O. Box 970, 9755 Ultrices. Ave","Belcarra","KL54 6NH"),
(5,"Amal A. Ray","P.O. Box 639, 9958 Pede St.","P.O. Box 106, 9063 In Ave","Campbeltown","J9O 1VY"),
(6,"Colton C. Landry","7862 At Rd.","P.O. Box 260, 7936 Interdum Street","Curitiba","NZ6 5MZ"),
(7,"Lance H. Levy","373-3342 Porttitor Street","Ap #111-4549 Gravida Road","Zaventem","H7 4AD"),
(8,"Axel Y. Knox","2823 Ac Rd.","124-9222 Libero. Ave","Luziânia","QH6A 9DG"),
(9,"August Wood","4635 Sed St.","7920 Egestas. Av.","Vitrolles","R1Z 9AZ"),
(10,"Alice T. Carney","144-4744 Lacinia Avenue","392-8148 Donec Av.","Ashburton","ZW2I 1CO");

Sponsor
INSERT INTO `Sponsor` (`sponsorID`,`sponsorName`,`sponsorAddress1`,`sponsorAddress2`,`sponsorCity`,`sponsorPostcode`,`sponsorPhone`,`sponsorEmail`) 
VALUES (1,"Cadman Miller","Ap #281-6268 Nam Street","759 Tincidunt Ave","King Township","A70 7JK","06386 427723","Phasellus.nulla@facilisiSedneque.com"),
(2,"Howard K. Andrews","Ap #402-6023 Malesuada Av.","P.O. Box 843, 4464 Elit Street","Newtonmore","N3 3VJ","06491 086736","ligula.eu@massaQuisqueporttitor.edu"),
(3,"Alden U. Dennis","4758 Eget, Rd.","194-5396 Ornare Street","Crystal Springs","JU16 3DP","00609 996457","vel.faucibus.id@eutelluseu.co.uk"),
(4,"Baxter Nicholson","154-8102 Turpis Avenue","4702 Dolor. St.","Québec City","OQ6 2UR","04229 972509","adipiscing@atsemmolestie.net"),
(5,"Magee Barr","Ap #946-816 Lobortis Rd.","P.O. Box 301, 5676 Gravida St.","Rosarno","TM9T 2BW","05363 580056","Aliquam@maurisblandit.ca"),
(6,"Drew Reed","2880 Fusce Rd.","481-4016 Sociosqu Rd.","Bangor","QN2D 5ZY","04815 477512","Donec@lectusconvallis.co.uk"),
(7,"Amela Knapp","Ap #967-8510 Ornare Ave","590-7636 Fusce St.","Meerle","A5X 1GQ","06140 559199","euismod@Phasellusin.org"),
(8,"Rudyard Gaines","Ap #909-9724 Est. Road","4496 Hendrerit Av.","Luik","T13 2CZ","04967 891827","nisi.dictum@enimcondimentum.net"),
(9,"Yoshi Mcintyre","9372 Pede. Avenue","Ap #593-3216 Magna. Street","Getafe","JA04 2CD","07248 139968","vitae@Intinciduntcongue.edu"),
(10,"Tarik Frederick","7057 Pellentesque, Av.","Ap #407-5096 Morbi Road","Esneux","R3U 9MV","09750 358864","volutpat.nunc.sit@urnasuscipitnonummy.ca");

Supplier
INSERT INTO `Supplier` (`supplierID`,`SupplierType`,`supplierContactName`,`supplierAddress1`,`supplierAddress2`,`supplierCity`,`supplierPostcode`,`supplierPhone`,`supplierEmail`) 
VALUES (1,"Medical","Shay Whitfield","424-9897 Mattis Ave","7450 Pede. Avenue","Chiguayante","B4 0ZI","01261 928126","mi.Aliquam.gravida@pharetrafeliseget.co.uk"),
(2,"Medical","Sydney Forbes","830 Ridiculus Avenue","P.O. Box 670, 6243 Duis Street","Reading","G8 0ZX","01826 539938","eu@maurisblanditmattis.org"),
(3,"Merchandise","Flavia Q. Mckinney","498-5012 Neque. St.","Ap #759-3686 Imperdiet Street","Oppido Mamertina","SU9 3NY","03142 403072","volutpat@faucibusorciluctus.net"),
(4,"Food","Wanda Harrington","Ap #749-7245 Inceptos St.","P.O. Box 479, 925 At, Av.","Spy","JP93 5PB","01972 343958","nibh.dolor@auctorquis.ca"),
(5,"Drink","Keith Hyde","1025 Non Street","5568 Nec Street","Zoerle-Parwijs","H4F 7AS","09093 690364","Proin@quistristiqueac.net"),
(6,"Medical","Xenos D. Kerr","583-8132 Arcu. Road","P.O. Box 838, 5985 Tempor, St.","Ketchikan","M7S 3QZ","08668 776565","est.arcu.ac@mattis.ca"),
(7,"Medical","Rama Long","1323 Aliquam Street","P.O. Box 858, 4208 Vel Ave","Trois-Rivières","N9 2OZ","06929 290195","non.lacinia@feugiat.co.uk"),
(8,"Food","Serena Flores","107-4902 Parturient Ave","5202 Vestibulum St.","Ambala Sadar","Z4I 6DO","02431 772327","arcu.imperdiet.ullamcorper@arcuSedeu.net"),
(9,"Food","Nicholas X. Ross","118-3943 Sed Ave","582-1948 Morbi Street","Wepion","Z98 8IQ","03569 106914","nisi.nibh@suscipitnonummyFusce.com"),
(10,"Merchandise","Carson Duke","916-1880 Sit Rd.","103-769 Dolor Ave","Petit-Hallet","Y4 2KA","09405 662045","sed.libero@rhoncusDonec.com");

EventPlanner
INSERT INTO `EventPlanner` (`evPlannerName`,`evPlannerPhone`) 
VALUES ("Rae Richards","09584 413118"),
("Gavin Munoz","04775 973102"),
("Amery Wong","06477 393652"),
("Charlotte Z. Morales","09576 727383"),
("Cairo Butler","00677 960179"),
("Haley A. Bird","07250 744829"),
("Hermione Gentry","04603 118874"),
("Madonna U. Webb","09147 047455"),
("Eliana Grant","09980 973951"),
("Carol E. Nichols","06920 996722");

LandOwner
INSERT INTO `LandOwner` (`landID`,`landTitle`,`landFName`,`landLName`,`landAddress1`,`landAddress2`,`landCity`,`landCounty`,`landPostcode`,`landPhone`) 
VALUES (1,"Mrs.","Noel","Valenzuela","148-7536 Sagittis. Rd.","Ap #195-1871 Fames St.","Fochabers","MO","FI7 7ZG","00114 552822"),
(2,"Dr.","Sade","Mckenzie","P.O. Box 988, 3369 Luctus Rd.","4921 Vel Rd.","Great Yarmouth","NF","H68 3ZT","05364 193591"),
(3,"Ms.","Leslie","Price","Ap #704-4343 Suspendisse Rd.","1972 Nibh Ave","Abingdon","Berkshire","X70 4DU","08054 222044"),
(4,"Mr.","Joan","Roberson","699-4480 Non Rd.","P.O. Box 137, 8777 Blandit Rd.","Presteigne","Radnorshire","J73 9EW","02876 168956"),
(5,"Mrs.","Urielle","Hubbard","847-4947 At Rd.","974-8479 Augue Street","Chepstow","MO","RB2 3SM","02017 326908"),
(6,"Mr","Octavia","Mcmillan","2215 Natoque Road","868 Purus, Avenue","Crieff","Perthshire","M7 4ST","04529 858869"),
(7,"Mr","Rahim","Robinson","Ap #158-5406 Sed Rd.","Ap #116-6246 Mauris Street","Chichester","SS","U74 0WO","05952 028736"),
(8,"Dr.","Aristotle","Carrillo","Ap #156-2562 In Rd.","140-9924 Nulla Avenue","Bedford","Bedfordshire","K66 7TV","03736 476877"),
(9,"Ms.","Ocean","Trujillo","Ap #597-5560 Ut St.","P.O. Box 606, 1426 Rhoncus. Av.","Llandovery","Carmarthenshire","C9 6HT","04187 279313"),
(10,"Dr.","Cynthia","Maddox","416-2894 Eros Avenue","990-3608 Mauris Street","Telford","Shropshire","R0 7FM","06995 658536");

Event
INSERT INTO `Event` (`eventID`,`eventName`,`eventDate`,`eventBriefDate`,`eventPropPresentationDate`,`eventPropClientApproval`,`eventCostToClient`,`eventDuration`,`clientID`,`evPlannerName`,`landID`) 
VALUES (1,"Anime Festival","2017-09-18","2017-06-03","2017-07-02","2017-08-20","9946",28,7,"Amery Wong",7),
(2,"Food Festival,","2017-07-26","2017-04-28","2017-05-16","2017-06-06","15778",30,10,"Gavin Munoz",1),
(3,"Beer Festival","2017-09-20","2017-06-28","2017-07-20","2017-08-13","11987",36,2,"Amery Wong",10),
(4,"Gaming Festival","2017-12-16","2017-09-06","2017-10-28","2017-11-10","17969",23,2,"Gavin Munoz",6),
(5,"Movie Festival","2017-11-25","2017-08-17","2017-09-25","2017-11-04","14334",29,6,"Amery Wong",3),
(6,"Comic Festival","2017-06-11","2017-03-29","2017-04-09","2017-05-17","12581",35,1,"Rae Richards",4),
(7,"Japanese Market","2017-05-21","2017-03-03","2017-04-01","2017-04-22","7874",23,4,"Rae Richards",2),
(8,"Korean Market","2017-11-13","2017-08-17","2017-09-28","2017-10-02","12498",31,8,"Rae Richards",8),
(9,"Vietnamese Market.","2017-04-15","2017-01-14","2017-02-14","2017-03-27","12018",27,8,"Amery Wong",5),
(10,"Chinese Market","2017-11-22","2017-08-16","2017-09-24","2017-10-25","16008",27,9,"Gavin Munoz",9);

Job
INSERT INTO `Job` (`jobID`,`jobTitle`,`pay`) 
VALUES (1,"Medical","688.33"),
(2,"Accommodation","278.44"),
(3,"Medals","418.71"),
(4,"Infomration packs","422.09"),
(5,"Route","639.23"),
(6,"Feeding station","526.31"),
(7,"Waste disposal","277.50"),
(8,"Organisating event","625.23"),
(9,"Asistance","287.70"),
(10,"Advertising","205.79");

Staff
INSERT INTO `Staff` (`staffID`,`staffFName`,`staffLName`,`staffAddress1`,`staffAddress2`,`staffCity`,`staffPostcode`,`staffPhone`,`staffEmail`,`jobID`) 
VALUES (1,"Tate","Rodgers","Ap #210-3638 Pede Street","Ap #579-8743 Volutpat Av.","Naninne","BG2E 3KX","08368 242796","purus.Maecenas.libero@sagittisplacerat.ca",7),
(2,"Josephine","Kramer","P.O. Box 816, 5875 Malesuada St.","Ap #745-9677 Fermentum Av.","Perth","AG8 8WS","05117 920952","urna@aarcuSed.com",3),
(3,"Cruz","Holloway","Ap #413-5192 Fusce Ave","314-4870 Euismod Road","Brighton","PQ22 7CT","01377 187305","gravida.mauris.ut@feugiatnec.co.uk",4),
(4,"Ingrid","Harper","P.O. Box 281, 3215 Elit. Rd.","Ap #305-4208 Luctus St.","Valcourt","O03 0MW","01557 482196","nostra@Aliquamauctor.net",5),
(5,"Mark","Pollard","446-634 Nunc St.","P.O. Box 119, 6204 Morbi Rd.","Marcinelle","W8 9ZZ","07703 423287","dolor@semper.ca",2),
(6,"Lacota","Pugh","Ap #761-1452 Integer St.","256-7477 Nulla Rd.","Minturno","UQ55 8IQ","06283 070199","Nunc.mauris@lectusjustoeu.org",6),
(7,"Noelle","Boyle","Ap #822-6013 Etiam St.","593 Ac Av.","Grand Rapids","RA68 5WI","08399 929568","faucibus.Morbi@nonmassanon.net",9),
(8,"Malachi","Blake","3532 Vitae, Av.","P.O. Box 440, 6871 Donec Street","Alva","H4S 8EU","03758 252227","eu.turpis@necmetusfacilisis.org",1),
(9,"Lillith","Burks","750-9269 Magna. Av.","Ap #535-8962 Diam St.","Jefferson City","I69 6VS","08510 017126","id@pedeblandit.ca",8),
(10,"Elmo","Poole","Ap #838-8267 Integer Rd.","P.O. Box 545, 4584 Dictum. Road","Neerglabbeek","WT61 2WV","05643 429264","rhoncus@etlacinia.com",10);

EventStaff
INSERT INTO `EventStaff` (`staffID`,`eventID`) 
VALUES (1,10),
(2,1),
(3,4),
(4,3),
(5,5),
(6,7),
(7,6),
(8,9),
(9,8),
(10,2);

EventSupplier
INSERT INTO `EventSupplier` (`supplierID`,`eventID`,`evSuppCost`) 
VALUES (1,10,"4202.06"),
(2,8,"4987.28"),
(3,9,"3123.88"),
(4,1,"1133.88"),
(5,8,"4045.81"),
(6,4,"2096.79"),
(7,4,"1814.59"),
(8,10,"1899.02"),
(9,2,"3862.55"),
(10,8,"2838.98");

SponsorEvent
INSERT INTO `SponsorEvent` (`sponsorID`,`eventID`,`sponsorEventAmount`) 
VALUES (1,3,"8100.17"),
(2,6,"9138.42"),
(3,10,"6555.95"),
(4,1,"3588.43"),
(5,1,"4210.84"),
(6,4,"9940.89"),
(7,2,"4803.81"),
(8,7,"7649.58"),
(9,10,"5400.31"),
(10,8,"3507.47");

Register
INSERT INTO `Register` (`partID`,`eventID`,`regDate`,`regDatePaid`) 
VALUES (1,4,"2017-12-16","2017-12-19"),
(2,3,"2017-09-20","2017-09-23"),
(3,4,"2017-12-16","2017-12-19"),
(4,4,"2017-12-16","2017-12-19"),
(5,8,"2017-11-13","2017-11-15"),
(6,10,"2017-11-22","2017-11-25"),
(7,10,"2017-11-22","2017-11-27"),
(8,1,"2017-09-18","2017-09-20"),
(9,9,"2017-04-15","2017-04-20"),
(10,10,"2017-11-22","2017-11-27");

LocalAuthorityEvent
INSERT INTO `LocalAuthorityEvent` (`authID`,`eventID`,`authContactName`,`authContactPhone`) 
VALUES (1,1,"Freya Browning","01718 625067"),
(2,6,"Shaeleigh N. Vinson","03301 714260"),
(3,7,"Adele Gentry","08516 887802"),
(4,5,"Miriam R. Herrera","02915 013368"),
(5,6,"Shay Hopkins","04876 147010"),
(6,2,"Hillary Simpson","09827 801772"),
(7,5,"Ann Craig","03865 382343"),
(8,3,"Kylie Gardner","02870 268678"),
(9,3,"Brady I. Slater","06077 324917"),
(10,8,"Karen Mcmillan","09717 077865");

Basic
select partID, count(distinct regDatePaid) as Participant_Havent_Paid_Yet 
from Register
where regDatePaid = null;

select clientFName, clientPhone from Client where clientAccount = 1000;

select eventName, eventDate from event order by eventDate asc;

select sup.supplierType, sup.supplierContactName, evSup.evSuppCost from Supplier as sup
inner join EventSupplier as evSup
on sup.supplierID = evSup.supplierID;


Advanced
select max(amountRaised)
from Event as ev
inner join Register as reg
on ev.eventID = reg.eventID
inner join Participant as part
on part.partID = reg.partID
where ev.eventID = 1;

select (sum(sponsorEventAmount)-eventCostToClient) as Money_Needed_To_Raise_From_Participant 
from Event as ev
inner join SponsorEvent as spoEve
on ev.eventID = spoEve.eventID
inner join Sponsor as spo
on spo.sponsorID = spoEve.sponsorID
where ev.eventID = 10;

select count(distinct partID) 
from Register as reg
inner join Event as ev
on reg.eventID = ev.eventID
where ev.eventDate between "2017-04-01" and "2017-04-20";

select eventDuration / 8 as Dates_of_Event from Event where eventID = 9;