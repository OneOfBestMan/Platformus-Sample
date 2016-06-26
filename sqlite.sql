BEGIN TRANSACTION;
CREATE TABLE `Variables` (
	`Id`	INTEGER NOT NULL CONSTRAINT "PK_Variable" PRIMARY KEY AUTOINCREMENT,
	`Code`	TEXT,
	`SectionId`	INTEGER NOT NULL,
	`Name`	TEXT,
	`Position`	INTEGER,
	`Value`	TEXT,
	FOREIGN KEY(`SectionId`) REFERENCES "Sections" ( "Id" )
);
CREATE TABLE "Users" (
	`Id`	INTEGER NOT NULL CONSTRAINT "PK_User" PRIMARY KEY AUTOINCREMENT,
	`Created`	INTEGER NOT NULL,
	`Name`	TEXT
);
INSERT INTO `Users` VALUES (1,1441274400,'Administrator');
CREATE TABLE "UserRoles" (
    "UserId" INTEGER NOT NULL,
    "RoleId" INTEGER NOT NULL,
    CONSTRAINT "PK_UserRole" PRIMARY KEY ("UserId", "RoleId"),
    CONSTRAINT "FK_UserRole_Role_RoleId" FOREIGN KEY ("RoleId") REFERENCES "Roles" ("Id"),
    CONSTRAINT "FK_UserRole_User_UserId" FOREIGN KEY ("UserId") REFERENCES "Users" ("Id")
);
INSERT INTO `UserRoles` VALUES (1,1);
CREATE TABLE "Tabs" (
    "Id" INTEGER NOT NULL CONSTRAINT "PK_Tab" PRIMARY KEY AUTOINCREMENT,
    "ClassId" INTEGER NOT NULL,
    "Name" TEXT,
    "Position" INTEGER
);
INSERT INTO `Tabs` VALUES (6,2,'Features',1);
INSERT INTO `Tabs` VALUES (7,7,'SEO',100);
CREATE TABLE "Sections" (
    "Id" INTEGER NOT NULL CONSTRAINT "PK_Section" PRIMARY KEY AUTOINCREMENT,
    "Code" TEXT,
    "Name" TEXT
);
CREATE TABLE "Roles" (
    "Id" INTEGER NOT NULL CONSTRAINT "PK_Role" PRIMARY KEY AUTOINCREMENT,
    "Code" TEXT,
    "Name" TEXT,
    "Position" INTEGER
);
INSERT INTO `Roles` VALUES (1,'Administrator','Administrator',1);
CREATE TABLE "RolePermissions" (
    "RoleId" INTEGER NOT NULL,
    "PermissionId" INTEGER NOT NULL,
    CONSTRAINT "PK_RolePermission" PRIMARY KEY ("RoleId", "PermissionId"),
    CONSTRAINT "FK_RolePermission_Permission_PermissionId" FOREIGN KEY ("PermissionId") REFERENCES "Permissions" ("Id"),
    CONSTRAINT "FK_RolePermission_Role_RoleId" FOREIGN KEY ("RoleId") REFERENCES "Roles" ("Id")
);
INSERT INTO `RolePermissions` VALUES (1,1);
CREATE TABLE "Relations" (
    "Id" INTEGER NOT NULL CONSTRAINT "PK_Relation" PRIMARY KEY AUTOINCREMENT,
    "ForeignId" INTEGER NOT NULL,
    "MemberId" INTEGER NOT NULL,
    "PrimaryId" INTEGER NOT NULL,
    CONSTRAINT "FK_Relation_Object_ForeignId" FOREIGN KEY ("ForeignId") REFERENCES "Objects" ("Id"),
    CONSTRAINT "FK_Relation_Member_MemberId" FOREIGN KEY ("MemberId") REFERENCES "Members" ("Id"),
    CONSTRAINT "FK_Relation_Object_PrimaryId" FOREIGN KEY ("PrimaryId") REFERENCES "Objects" ("Id")
);
INSERT INTO `Relations` VALUES (112,2,25,8);
INSERT INTO `Relations` VALUES (113,2,25,9);
INSERT INTO `Relations` VALUES (114,2,25,10);
INSERT INTO `Relations` VALUES (115,2,25,11);
INSERT INTO `Relations` VALUES (128,5,24,4);
INSERT INTO `Relations` VALUES (129,6,24,4);
INSERT INTO `Relations` VALUES (130,7,24,4);
CREATE TABLE "Properties" (
    "Id" INTEGER NOT NULL CONSTRAINT "PK_Property" PRIMARY KEY AUTOINCREMENT,
    "HtmlId" INTEGER NOT NULL,
    "MemberId" INTEGER NOT NULL,
    "ObjectId" INTEGER,
    CONSTRAINT "FK_Property_Dictionary_HtmlId" FOREIGN KEY ("HtmlId") REFERENCES "Dictionaries" ("Id"),
    CONSTRAINT "FK_Property_Member_MemberId" FOREIGN KEY ("MemberId") REFERENCES "Members" ("Id"),
    CONSTRAINT "FK_Property_Object_ObjectId" FOREIGN KEY ("ObjectId") REFERENCES "Objects" ("Id")
);
INSERT INTO `Properties` VALUES (43,43,13,9);
INSERT INTO `Properties` VALUES (44,44,14,9);
INSERT INTO `Properties` VALUES (45,45,13,10);
INSERT INTO `Properties` VALUES (46,46,14,10);
INSERT INTO `Properties` VALUES (47,47,13,11);
INSERT INTO `Properties` VALUES (48,48,14,11);
INSERT INTO `Properties` VALUES (69,78,13,8);
INSERT INTO `Properties` VALUES (70,79,14,8);
INSERT INTO `Properties` VALUES (209,218,15,4);
INSERT INTO `Properties` VALUES (210,219,27,4);
INSERT INTO `Properties` VALUES (211,220,29,4);
INSERT INTO `Properties` VALUES (212,221,28,4);
INSERT INTO `Properties` VALUES (213,222,9,3);
INSERT INTO `Properties` VALUES (214,223,27,3);
INSERT INTO `Properties` VALUES (215,224,29,3);
INSERT INTO `Properties` VALUES (216,225,28,3);
INSERT INTO `Properties` VALUES (217,226,5,2);
INSERT INTO `Properties` VALUES (218,227,27,2);
INSERT INTO `Properties` VALUES (219,228,29,2);
INSERT INTO `Properties` VALUES (220,229,28,2);
INSERT INTO `Properties` VALUES (297,309,30,5);
INSERT INTO `Properties` VALUES (298,310,19,5);
INSERT INTO `Properties` VALUES (299,311,20,5);
INSERT INTO `Properties` VALUES (300,312,27,5);
INSERT INTO `Properties` VALUES (301,313,29,5);
INSERT INTO `Properties` VALUES (302,314,28,5);
INSERT INTO `Properties` VALUES (303,315,30,6);
INSERT INTO `Properties` VALUES (304,316,19,6);
INSERT INTO `Properties` VALUES (305,317,20,6);
INSERT INTO `Properties` VALUES (306,318,27,6);
INSERT INTO `Properties` VALUES (307,319,29,6);
INSERT INTO `Properties` VALUES (308,320,28,6);
INSERT INTO `Properties` VALUES (309,321,30,7);
INSERT INTO `Properties` VALUES (310,322,19,7);
INSERT INTO `Properties` VALUES (311,323,20,7);
INSERT INTO `Properties` VALUES (312,324,27,7);
INSERT INTO `Properties` VALUES (313,325,29,7);
INSERT INTO `Properties` VALUES (314,326,28,7);
INSERT INTO `Properties` VALUES (315,327,1,1);
INSERT INTO `Properties` VALUES (316,328,27,1);
INSERT INTO `Properties` VALUES (317,329,29,1);
INSERT INTO `Properties` VALUES (318,330,28,1);
CREATE TABLE "Permissions" (
    "Id" INTEGER NOT NULL CONSTRAINT "PK_Permission" PRIMARY KEY AUTOINCREMENT,
    "Code" TEXT,
    "Name" TEXT,
    "Position" INTEGER
);
INSERT INTO `Permissions` VALUES (1,'DoEverything','Do everything',1);
CREATE TABLE "Objects" (
	`Id`	INTEGER NOT NULL CONSTRAINT "PK_Object" PRIMARY KEY AUTOINCREMENT,
	`ClassId`	INTEGER NOT NULL,
	`ViewName`	TEXT,
	`Url`	TEXT
);
INSERT INTO `Objects` VALUES (1,1,NULL,'/');
INSERT INTO `Objects` VALUES (2,2,NULL,'/features');
INSERT INTO `Objects` VALUES (3,3,NULL,'/contacts');
INSERT INTO `Objects` VALUES (4,5,NULL,'/blog');
INSERT INTO `Objects` VALUES (5,6,NULL,'/blog/post-1');
INSERT INTO `Objects` VALUES (6,6,NULL,'/blog/post-2');
INSERT INTO `Objects` VALUES (7,6,NULL,'/blog/post-3');
INSERT INTO `Objects` VALUES (8,4,NULL,NULL);
INSERT INTO `Objects` VALUES (9,4,NULL,NULL);
INSERT INTO `Objects` VALUES (10,4,NULL,NULL);
INSERT INTO `Objects` VALUES (11,4,NULL,NULL);
CREATE TABLE "Menus" (
    "Id" INTEGER NOT NULL CONSTRAINT "PK_Menu" PRIMARY KEY AUTOINCREMENT,
    "Code" TEXT,
    "NameId" INTEGER NOT NULL,
    CONSTRAINT "FK_Menu_Dictionary_NameId" FOREIGN KEY ("NameId") REFERENCES "Dictionaries" ("Id")
);
INSERT INTO `Menus` VALUES (6,'Main',53);
CREATE TABLE "MenuItems" (
	`Id`	INTEGER NOT NULL CONSTRAINT "PK_MenuItem" PRIMARY KEY AUTOINCREMENT,
	`MenuId`	INTEGER,
	`MenuItemId`	INTEGER,
	`NameId`	INTEGER NOT NULL,
	`Position`	INTEGER,
	`Url`	TEXT,
	FOREIGN KEY(`MenuId`) REFERENCES "Menus" ( "Id" ),
	FOREIGN KEY(`MenuItemId`) REFERENCES "MenuItems" ( "Id" ),
	FOREIGN KEY(`NameId`) REFERENCES "Dictionaries" ( "Id" )
);
INSERT INTO `MenuItems` VALUES (39,6,NULL,54,1,NULL);
INSERT INTO `MenuItems` VALUES (40,6,NULL,55,2,NULL);
INSERT INTO `MenuItems` VALUES (41,6,NULL,56,3,NULL);
INSERT INTO `MenuItems` VALUES (42,6,NULL,57,4,NULL);
CREATE TABLE "Members" (
	`Id`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`ClassId`	INTEGER NOT NULL,
	`Code`	TEXT,
	`IsPropertyLocalizable`	INTEGER,
	`IsPropertyVisibleInList`	INTEGER,
	`IsRelationSingleParent`	INTEGER,
	`Name`	TEXT,
	`Position`	INTEGER,
	`PropertyDataTypeId`	INTEGER,
	`RelationClassId`	INTEGER,
	`TabId`	INTEGER,
	FOREIGN KEY(`PropertyDataTypeId`) REFERENCES "DataTypes" ( "Id" ),
	FOREIGN KEY(`RelationClassId`) REFERENCES "Classes" ( "Id" )
);
INSERT INTO `Members` VALUES (1,1,'Content',1,NULL,NULL,'Content',1,3,NULL,NULL);
INSERT INTO `Members` VALUES (5,2,'Content',1,NULL,NULL,'Content',1,3,NULL,NULL);
INSERT INTO `Members` VALUES (9,3,'Content',1,NULL,NULL,'Content',1,3,NULL,NULL);
INSERT INTO `Members` VALUES (13,4,'Name',1,1,NULL,'Name',1,1,NULL,NULL);
INSERT INTO `Members` VALUES (14,4,'State',1,NULL,NULL,'State',2,1,NULL,NULL);
INSERT INTO `Members` VALUES (15,5,'Content',1,NULL,NULL,'Content',1,3,NULL,NULL);
INSERT INTO `Members` VALUES (19,6,'Preview',1,NULL,NULL,'Preview',3,2,NULL,NULL);
INSERT INTO `Members` VALUES (20,6,'Content',1,NULL,NULL,'Content',4,3,NULL,NULL);
INSERT INTO `Members` VALUES (24,6,'BlogPage',NULL,NULL,1,'Blog page',1,NULL,5,NULL);
INSERT INTO `Members` VALUES (25,2,'Features',NULL,NULL,NULL,'Features',2,NULL,4,6);
INSERT INTO `Members` VALUES (27,7,'Title',1,1,NULL,'Title',100,1,NULL,7);
INSERT INTO `Members` VALUES (28,7,'MetaKeywords',1,NULL,NULL,'META keywords',102,1,NULL,7);
INSERT INTO `Members` VALUES (29,7,'MetaDescription',1,NULL,NULL,'META description',101,1,NULL,7);
INSERT INTO `Members` VALUES (30,6,'Image',NULL,NULL,NULL,'Image',2,4,NULL,NULL);
CREATE TABLE "Localizations" (
    "Id" INTEGER NOT NULL CONSTRAINT "PK_Localization" PRIMARY KEY AUTOINCREMENT,
    "CultureId" INTEGER NOT NULL,
    "DictionaryId" INTEGER NOT NULL,
    "Value" TEXT,
    CONSTRAINT "FK_Localization_Culture_CultureId" FOREIGN KEY ("CultureId") REFERENCES "Cultures" ("Id"),
    CONSTRAINT "FK_Localization_Dictionary_DictionaryId" FOREIGN KEY ("DictionaryId") REFERENCES "Dictionaries" ("Id")
);
INSERT INTO `Localizations` VALUES (85,2,43,'Локалізація інтерфейсу користувача');
INSERT INTO `Localizations` VALUES (86,1,43,'User interface localization');
INSERT INTO `Localizations` VALUES (87,1,44,'no');
INSERT INTO `Localizations` VALUES (88,2,44,'ні');
INSERT INTO `Localizations` VALUES (89,2,45,'Локалізація контенту');
INSERT INTO `Localizations` VALUES (90,1,45,'Content localization');
INSERT INTO `Localizations` VALUES (91,1,46,'yes');
INSERT INTO `Localizations` VALUES (92,2,46,'так');
INSERT INTO `Localizations` VALUES (93,2,47,'Гнучке управління контентом');
INSERT INTO `Localizations` VALUES (94,1,47,'Flexible content management');
INSERT INTO `Localizations` VALUES (95,1,48,'yes');
INSERT INTO `Localizations` VALUES (96,2,48,'так');
INSERT INTO `Localizations` VALUES (105,1,53,'Main');
INSERT INTO `Localizations` VALUES (106,2,53,'Головне');
INSERT INTO `Localizations` VALUES (107,1,54,'Home');
INSERT INTO `Localizations` VALUES (108,2,54,'Головна');
INSERT INTO `Localizations` VALUES (109,1,55,'Features');
INSERT INTO `Localizations` VALUES (110,2,55,'Особливості');
INSERT INTO `Localizations` VALUES (111,1,56,'Blog');
INSERT INTO `Localizations` VALUES (112,2,56,'Блог');
INSERT INTO `Localizations` VALUES (113,1,57,'Contacts');
INSERT INTO `Localizations` VALUES (114,2,57,'Контакти');
INSERT INTO `Localizations` VALUES (115,1,58,'Feedback');
INSERT INTO `Localizations` VALUES (116,2,58,' Зворотний зв’язок');
INSERT INTO `Localizations` VALUES (117,1,59,'Your name');
INSERT INTO `Localizations` VALUES (118,2,59,'Ваше ім’я');
INSERT INTO `Localizations` VALUES (119,1,60,'Your phone');
INSERT INTO `Localizations` VALUES (120,2,60,'Ваш телефон');
INSERT INTO `Localizations` VALUES (121,1,61,'Your message');
INSERT INTO `Localizations` VALUES (122,2,61,'Ваше повідомлення');
INSERT INTO `Localizations` VALUES (155,2,78,'Модульна структура');
INSERT INTO `Localizations` VALUES (156,1,78,'Modular structure');
INSERT INTO `Localizations` VALUES (157,1,79,'yes');
INSERT INTO `Localizations` VALUES (158,2,79,'так');
INSERT INTO `Localizations` VALUES (435,2,218,'<p>Блог</p>
<p>Лише демонстрація пов&rsquo;язаних об&rsquo;єктів.</p>');
INSERT INTO `Localizations` VALUES (436,1,218,'<p>Blog</p>
<p>Only related objects demo.</p>');
INSERT INTO `Localizations` VALUES (437,2,219,'Блог');
INSERT INTO `Localizations` VALUES (438,1,219,'Blog');
INSERT INTO `Localizations` VALUES (439,2,220,'');
INSERT INTO `Localizations` VALUES (440,1,220,'');
INSERT INTO `Localizations` VALUES (441,1,221,'');
INSERT INTO `Localizations` VALUES (442,2,221,'');
INSERT INTO `Localizations` VALUES (443,2,222,'<p>Контакти</p>
<p>Веб-сайт: <a href="http://platformus.net/">http://platformus.net/</a></p>
<p>Git: <a href="https://github.com/Platformus">https://github.com/Platformus</a></p>');
INSERT INTO `Localizations` VALUES (444,1,222,'<p>Contacts</p>
<p>Website: <a href="http://platformus.net/">http://platformus.net/</a></p>
<p>Git: <a href="https://github.com/Platformus">https://github.com/Platformus</a></p>');
INSERT INTO `Localizations` VALUES (445,2,223,'Контакти');
INSERT INTO `Localizations` VALUES (446,1,223,'Contacts');
INSERT INTO `Localizations` VALUES (447,2,224,'');
INSERT INTO `Localizations` VALUES (448,1,224,'');
INSERT INTO `Localizations` VALUES (449,1,225,'');
INSERT INTO `Localizations` VALUES (450,2,225,'');
INSERT INTO `Localizations` VALUES (451,2,226,'<p>Основні особливості CMS Platformus:</p>');
INSERT INTO `Localizations` VALUES (452,1,226,'<p>The main features of the Platformus CMS:</p>');
INSERT INTO `Localizations` VALUES (453,2,227,'Особливості');
INSERT INTO `Localizations` VALUES (454,1,227,'Features');
INSERT INTO `Localizations` VALUES (455,2,228,'');
INSERT INTO `Localizations` VALUES (456,1,228,'');
INSERT INTO `Localizations` VALUES (457,1,229,'');
INSERT INTO `Localizations` VALUES (458,2,229,'');
INSERT INTO `Localizations` VALUES (608,3,309,'/images/temp/img.png');
INSERT INTO `Localizations` VALUES (609,2,310,'Пост 1');
INSERT INTO `Localizations` VALUES (610,1,310,'Post 1');
INSERT INTO `Localizations` VALUES (611,2,311,'<p>Зміст посту 1</p>');
INSERT INTO `Localizations` VALUES (612,1,311,'<p>Post 1 content</p>');
INSERT INTO `Localizations` VALUES (613,2,312,'Пост 1');
INSERT INTO `Localizations` VALUES (614,1,312,'Post 1');
INSERT INTO `Localizations` VALUES (615,2,313,'');
INSERT INTO `Localizations` VALUES (616,1,313,'');
INSERT INTO `Localizations` VALUES (617,1,314,'');
INSERT INTO `Localizations` VALUES (618,2,314,'');
INSERT INTO `Localizations` VALUES (619,3,315,'/images/temp/img.png');
INSERT INTO `Localizations` VALUES (620,2,316,'Пост 2');
INSERT INTO `Localizations` VALUES (621,1,316,'Post 2');
INSERT INTO `Localizations` VALUES (622,2,317,'<p>Зміст посту 2</p>');
INSERT INTO `Localizations` VALUES (623,1,317,'<p>Post&nbsp;2 content</p>');
INSERT INTO `Localizations` VALUES (624,2,318,'Пост 2');
INSERT INTO `Localizations` VALUES (625,1,318,'Post 2');
INSERT INTO `Localizations` VALUES (626,2,319,'');
INSERT INTO `Localizations` VALUES (627,1,319,'');
INSERT INTO `Localizations` VALUES (628,1,320,'');
INSERT INTO `Localizations` VALUES (629,2,320,'');
INSERT INTO `Localizations` VALUES (630,3,321,'/images/temp/img.png');
INSERT INTO `Localizations` VALUES (631,2,322,'Пост 3');
INSERT INTO `Localizations` VALUES (632,1,322,'Post 3');
INSERT INTO `Localizations` VALUES (633,2,323,'<p>Зміст посту 3</p>');
INSERT INTO `Localizations` VALUES (634,1,323,'<p>Post&nbsp;3 content</p>');
INSERT INTO `Localizations` VALUES (635,2,324,'Пост 3');
INSERT INTO `Localizations` VALUES (636,1,324,'Post 3');
INSERT INTO `Localizations` VALUES (637,2,325,'');
INSERT INTO `Localizations` VALUES (638,1,325,'');
INSERT INTO `Localizations` VALUES (639,1,326,'');
INSERT INTO `Localizations` VALUES (640,2,326,'');
INSERT INTO `Localizations` VALUES (641,2,327,'<p>Це демонстраційний веб-сайт, що працює на CMS Platformus.</p>
<p>Ви можете&nbsp;керувати ним&nbsp;за допомогою <a href="/backend/">бекенду</a>.</p>
<p>Електронна пошта: <a href="mailto:admin@platformus.net">admin@platformus.net</a></p>
<p>Пароль: admin</p>');
INSERT INTO `Localizations` VALUES (642,1,327,'<p>This is a demo website running on Platformus CMS.</p>
<p>You can manage it using the <a href="/backend/">backend</a>.</p>
<p>Email: <a href="mailto:admin@platformus.net">admin@platformus.net</a></p>
<p>Password: admin</p>');
INSERT INTO `Localizations` VALUES (643,2,328,'Демонстраційний веб-сайт на CMS Platformus');
INSERT INTO `Localizations` VALUES (644,1,328,'Platformus CMS demo website');
INSERT INTO `Localizations` VALUES (645,2,329,'CMS, Platformus');
INSERT INTO `Localizations` VALUES (646,1,329,'CMS, Platformus');
INSERT INTO `Localizations` VALUES (647,1,330,'This is a demo website running on Platformus CMS.');
INSERT INTO `Localizations` VALUES (648,2,330,'Це демонстраційний веб-сайт, що працює на CMS Platformus.');
CREATE TABLE "Forms" (
    "Id" INTEGER NOT NULL CONSTRAINT "PK_Form" PRIMARY KEY AUTOINCREMENT,
    "Code" TEXT,
    "Email" TEXT,
    "NameId" INTEGER NOT NULL,
    CONSTRAINT "FK_Form_Dictionary_NameId" FOREIGN KEY ("NameId") REFERENCES "Dictionaries" ("Id")
);
INSERT INTO `Forms` VALUES (5,'Feedback','admin@platformus.net',58);
CREATE TABLE "Files" (
    "Id" INTEGER NOT NULL CONSTRAINT "PK_File" PRIMARY KEY AUTOINCREMENT,
    "Name" TEXT,
    "Size" INTEGER NOT NULL
);
CREATE TABLE "Fields" (
    "Id" INTEGER NOT NULL CONSTRAINT "PK_Field" PRIMARY KEY AUTOINCREMENT,
    "FieldTypeId" INTEGER NOT NULL,
    "FormId" INTEGER NOT NULL,
    "NameId" INTEGER NOT NULL,
    "Position" INTEGER,
    CONSTRAINT "FK_Field_FieldType_FieldTypeId" FOREIGN KEY ("FieldTypeId") REFERENCES "FieldTypes" ("Id"),
    CONSTRAINT "FK_Field_Form_FormId" FOREIGN KEY ("FormId") REFERENCES "Forms" ("Id"),
    CONSTRAINT "FK_Field_Dictionary_NameId" FOREIGN KEY ("NameId") REFERENCES "Dictionaries" ("Id")
);
INSERT INTO `Fields` VALUES (17,1,5,59,1);
INSERT INTO `Fields` VALUES (18,1,5,60,2);
INSERT INTO `Fields` VALUES (19,2,5,61,3);
CREATE TABLE "FieldTypes" (
    "Id" INTEGER NOT NULL CONSTRAINT "PK_FieldType" PRIMARY KEY AUTOINCREMENT,
    "Code" TEXT,
    "Name" TEXT,
    "Position" INTEGER
);
INSERT INTO `FieldTypes` VALUES (1,'TextBox','Text box',1);
INSERT INTO `FieldTypes` VALUES (2,'TextArea','Text area',2);
INSERT INTO `FieldTypes` VALUES (3,'DropDownList','Drop down list',3);
CREATE TABLE "FieldOptions" (
    "Id" INTEGER NOT NULL CONSTRAINT "PK_FieldOption" PRIMARY KEY AUTOINCREMENT,
    "FieldId" INTEGER NOT NULL,
    "Position" INTEGER,
    "ValueId" INTEGER NOT NULL,
    CONSTRAINT "FK_FieldOption_Field_FieldId" FOREIGN KEY ("FieldId") REFERENCES "Fields" ("Id"),
    CONSTRAINT "FK_FieldOption_Dictionary_ValueId" FOREIGN KEY ("ValueId") REFERENCES "Dictionaries" ("Id")
);
CREATE TABLE "Dictionaries" (
    "Id" INTEGER NOT NULL CONSTRAINT "PK_Dictionary" PRIMARY KEY AUTOINCREMENT
);
INSERT INTO `Dictionaries` VALUES (43);
INSERT INTO `Dictionaries` VALUES (44);
INSERT INTO `Dictionaries` VALUES (45);
INSERT INTO `Dictionaries` VALUES (46);
INSERT INTO `Dictionaries` VALUES (47);
INSERT INTO `Dictionaries` VALUES (48);
INSERT INTO `Dictionaries` VALUES (53);
INSERT INTO `Dictionaries` VALUES (54);
INSERT INTO `Dictionaries` VALUES (55);
INSERT INTO `Dictionaries` VALUES (56);
INSERT INTO `Dictionaries` VALUES (57);
INSERT INTO `Dictionaries` VALUES (58);
INSERT INTO `Dictionaries` VALUES (59);
INSERT INTO `Dictionaries` VALUES (60);
INSERT INTO `Dictionaries` VALUES (61);
INSERT INTO `Dictionaries` VALUES (78);
INSERT INTO `Dictionaries` VALUES (79);
INSERT INTO `Dictionaries` VALUES (218);
INSERT INTO `Dictionaries` VALUES (219);
INSERT INTO `Dictionaries` VALUES (220);
INSERT INTO `Dictionaries` VALUES (221);
INSERT INTO `Dictionaries` VALUES (222);
INSERT INTO `Dictionaries` VALUES (223);
INSERT INTO `Dictionaries` VALUES (224);
INSERT INTO `Dictionaries` VALUES (225);
INSERT INTO `Dictionaries` VALUES (226);
INSERT INTO `Dictionaries` VALUES (227);
INSERT INTO `Dictionaries` VALUES (228);
INSERT INTO `Dictionaries` VALUES (229);
INSERT INTO `Dictionaries` VALUES (309);
INSERT INTO `Dictionaries` VALUES (310);
INSERT INTO `Dictionaries` VALUES (311);
INSERT INTO `Dictionaries` VALUES (312);
INSERT INTO `Dictionaries` VALUES (313);
INSERT INTO `Dictionaries` VALUES (314);
INSERT INTO `Dictionaries` VALUES (315);
INSERT INTO `Dictionaries` VALUES (316);
INSERT INTO `Dictionaries` VALUES (317);
INSERT INTO `Dictionaries` VALUES (318);
INSERT INTO `Dictionaries` VALUES (319);
INSERT INTO `Dictionaries` VALUES (320);
INSERT INTO `Dictionaries` VALUES (321);
INSERT INTO `Dictionaries` VALUES (322);
INSERT INTO `Dictionaries` VALUES (323);
INSERT INTO `Dictionaries` VALUES (324);
INSERT INTO `Dictionaries` VALUES (325);
INSERT INTO `Dictionaries` VALUES (326);
INSERT INTO `Dictionaries` VALUES (327);
INSERT INTO `Dictionaries` VALUES (328);
INSERT INTO `Dictionaries` VALUES (329);
INSERT INTO `Dictionaries` VALUES (330);
CREATE TABLE "DataTypes" (
    "Id" INTEGER NOT NULL CONSTRAINT "PK_DataType" PRIMARY KEY AUTOINCREMENT,
    "JavaScriptEditorClassName" TEXT,
    "Name" TEXT,
    "Position" INTEGER
);
INSERT INTO `DataTypes` VALUES (1,'SingleLinePlainText','Single line plain text',1);
INSERT INTO `DataTypes` VALUES (2,'MultilinePlainText','Multiline plain text',2);
INSERT INTO `DataTypes` VALUES (3,'Html','Html',3);
INSERT INTO `DataTypes` VALUES (4,'Image','Image',4);
CREATE TABLE "DataSources" (
    "Id" INTEGER NOT NULL CONSTRAINT "PK_DataSource" PRIMARY KEY AUTOINCREMENT,
    "CSharpClassName" TEXT,
    "ClassId" INTEGER NOT NULL,
    "Code" TEXT,
    "Parameters" TEXT,
    CONSTRAINT "FK_DataSource_Class_ClassId" FOREIGN KEY ("ClassId") REFERENCES "Classes" ("Id")
);
INSERT INTO `DataSources` VALUES (7,'Platformus.Content.DataSources.PrimaryObjectsDataSource',2,'Features',NULL);
INSERT INTO `DataSources` VALUES (8,'Platformus.Content.DataSources.ForeignObjectsDataSource',5,'BlogPosts',NULL);
CREATE TABLE "Cultures" (
	`Id`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`Code`	TEXT,
	`Name`	TEXT,
	`IsNeutral`	INTEGER
);
INSERT INTO `Cultures` VALUES (1,'en','English',NULL);
INSERT INTO `Cultures` VALUES (2,'uk','Українська',NULL);
INSERT INTO `Cultures` VALUES (3,'__','Neutral',1);
CREATE TABLE "Credentials" (
    "Id" INTEGER NOT NULL CONSTRAINT "PK_Credential" PRIMARY KEY AUTOINCREMENT,
    "CredentialTypeId" INTEGER NOT NULL,
    "Identifier" TEXT,
    "Secret" TEXT,
    "UserId" INTEGER NOT NULL,
    CONSTRAINT "FK_Credential_CredentialType_CredentialTypeId" FOREIGN KEY ("CredentialTypeId") REFERENCES "CredentialTypes" ("Id"),
    CONSTRAINT "FK_Credential_User_UserId" FOREIGN KEY ("UserId") REFERENCES "Users" ("Id")
);
INSERT INTO `Credentials` VALUES (1,1,'admin@platformus.net','21-23-2F-29-7A-57-A5-A7-43-89-4A-0E-4A-80-1F-C3',1);
CREATE TABLE "CredentialTypes" (
    "Id" INTEGER NOT NULL CONSTRAINT "PK_CredentialType" PRIMARY KEY AUTOINCREMENT,
    "Code" TEXT,
    "Name" TEXT,
    "Position" INTEGER
);
INSERT INTO `CredentialTypes` VALUES (1,'Email','Email',1);
CREATE TABLE "Classes" (
	`Id`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`ClassId`	INTEGER,
	`IsAbstract`	INTEGER,
	`IsStandalone`	INTEGER,
	`Name`	TEXT,
	`PluralizedName`	TEXT,
	`DefaultViewName`	TEXT,
	FOREIGN KEY(`ClassId`) REFERENCES "Classes" ( "Id" )
);
INSERT INTO `Classes` VALUES (1,7,NULL,1,'Index Page','Index Pages','Index');
INSERT INTO `Classes` VALUES (2,7,NULL,1,'Features Page','Features Pages','Features');
INSERT INTO `Classes` VALUES (3,7,NULL,1,'Contacts Page','Contacts Pages','Contacts');
INSERT INTO `Classes` VALUES (4,NULL,NULL,NULL,'Feature','Features',NULL);
INSERT INTO `Classes` VALUES (5,7,NULL,1,'Blog Page','Blog Pages','Blog');
INSERT INTO `Classes` VALUES (6,7,NULL,1,'Blog Post Page','Blog Post Pages','BlogPost');
INSERT INTO `Classes` VALUES (7,NULL,1,NULL,'Base Page','Base Pages',NULL);
CREATE TABLE "CachedObjects" (
	`CultureId`	INTEGER NOT NULL,
	`ObjectId`	INTEGER NOT NULL,
	`CachedDataSources`	TEXT,
	`CachedProperties`	TEXT,
	`ClassId`	INTEGER NOT NULL,
	`ViewName`	TEXT,
	`Url`	TEXT,
	CONSTRAINT "PK_CachedObject" PRIMARY KEY(CultureId,ObjectId),
	CONSTRAINT "FK_CachedObject_Culture_CultureId" FOREIGN KEY(`CultureId`) REFERENCES "Cultures" ( "Id" ),
	CONSTRAINT "FK_CachedObject_Object_ObjectId" FOREIGN KEY(`ObjectId`) REFERENCES "Objects" ( "Id" )
);
INSERT INTO `CachedObjects` VALUES (1,8,NULL,'[{"PropertyId":69,"MemberCode":"Name","Html":"Modular structure"},{"PropertyId":70,"MemberCode":"State","Html":"yes"}]',4,NULL,NULL);
INSERT INTO `CachedObjects` VALUES (1,9,NULL,'[{"PropertyId":43,"MemberCode":"Name","Html":"User interface localization"},{"PropertyId":44,"MemberCode":"State","Html":"no"}]',4,NULL,NULL);
INSERT INTO `CachedObjects` VALUES (1,10,NULL,'[{"PropertyId":45,"MemberCode":"Name","Html":"Content localization"},{"PropertyId":46,"MemberCode":"State","Html":"yes"}]',4,NULL,NULL);
INSERT INTO `CachedObjects` VALUES (2,8,NULL,'[{"PropertyId":69,"MemberCode":"Name","Html":"Модульна структура"},{"PropertyId":70,"MemberCode":"State","Html":"так"}]',4,NULL,NULL);
INSERT INTO `CachedObjects` VALUES (2,9,NULL,'[{"PropertyId":43,"MemberCode":"Name","Html":"Локалізація інтерфейсу користувача"},{"PropertyId":44,"MemberCode":"State","Html":"ні"}]',4,NULL,NULL);
INSERT INTO `CachedObjects` VALUES (2,10,NULL,'[{"PropertyId":45,"MemberCode":"Name","Html":"Локалізація контенту"},{"PropertyId":46,"MemberCode":"State","Html":"так"}]',4,NULL,NULL);
INSERT INTO `CachedObjects` VALUES (2,11,NULL,'[{"PropertyId":47,"MemberCode":"Name","Html":"Гнучке управління контентом"},{"PropertyId":48,"MemberCode":"State","Html":"так"}]',4,NULL,NULL);
INSERT INTO `CachedObjects` VALUES (1,11,NULL,'[{"PropertyId":47,"MemberCode":"Name","Html":"Flexible content management"},{"PropertyId":48,"MemberCode":"State","Html":"yes"}]',4,NULL,NULL);
INSERT INTO `CachedObjects` VALUES (1,4,'[{"DataSourceId":8,"Code":"BlogPosts","CSharpClassName":"Platformus.Content.DataSources.ForeignObjectsDataSource","Parameters":null}]','[{"PropertyId":209,"MemberCode":"Content","Html":"<p>Blog</p>\r\n<p>Only related objects demo.</p>"},{"PropertyId":210,"MemberCode":"Title","Html":"Blog"},{"PropertyId":211,"MemberCode":"MetaDescription","Html":""},{"PropertyId":212,"MemberCode":"MetaKeywords","Html":""}]',5,'Blog','/blog');
INSERT INTO `CachedObjects` VALUES (2,4,'[{"DataSourceId":8,"Code":"BlogPosts","CSharpClassName":"Platformus.Content.DataSources.ForeignObjectsDataSource","Parameters":null}]','[{"PropertyId":209,"MemberCode":"Content","Html":"<p>Блог</p>\r\n<p>Лише демонстрація пов&rsquo;язаних об&rsquo;єктів.</p>"},{"PropertyId":210,"MemberCode":"Title","Html":"Блог"},{"PropertyId":211,"MemberCode":"MetaDescription","Html":""},{"PropertyId":212,"MemberCode":"MetaKeywords","Html":""}]',5,'Blog','/blog');
INSERT INTO `CachedObjects` VALUES (1,5,NULL,'[{"PropertyId":297,"MemberCode":"Image","Html":"/images/temp/img.png"},{"PropertyId":298,"MemberCode":"Preview","Html":"Post 1"},{"PropertyId":299,"MemberCode":"Content","Html":"<p>Post 1 content</p>"},{"PropertyId":300,"MemberCode":"Title","Html":"Post 1"},{"PropertyId":301,"MemberCode":"MetaDescription","Html":""},{"PropertyId":302,"MemberCode":"MetaKeywords","Html":""}]',6,'BlogPost','/blog/post-1');
INSERT INTO `CachedObjects` VALUES (2,5,NULL,'[{"PropertyId":297,"MemberCode":"Image","Html":"/images/temp/img.png"},{"PropertyId":298,"MemberCode":"Preview","Html":"Пост 1"},{"PropertyId":299,"MemberCode":"Content","Html":"<p>Зміст посту 1</p>"},{"PropertyId":300,"MemberCode":"Title","Html":"Пост 1"},{"PropertyId":301,"MemberCode":"MetaDescription","Html":""},{"PropertyId":302,"MemberCode":"MetaKeywords","Html":""}]',6,'BlogPost','/blog/post-1');
INSERT INTO `CachedObjects` VALUES (1,6,NULL,'[{"PropertyId":303,"MemberCode":"Image","Html":"/images/temp/img.png"},{"PropertyId":304,"MemberCode":"Preview","Html":"Post 2"},{"PropertyId":305,"MemberCode":"Content","Html":"<p>Post&nbsp;2 content</p>"},{"PropertyId":306,"MemberCode":"Title","Html":"Post 2"},{"PropertyId":307,"MemberCode":"MetaDescription","Html":""},{"PropertyId":308,"MemberCode":"MetaKeywords","Html":""}]',6,'BlogPost','/blog/post-2');
INSERT INTO `CachedObjects` VALUES (2,6,NULL,'[{"PropertyId":303,"MemberCode":"Image","Html":"/images/temp/img.png"},{"PropertyId":304,"MemberCode":"Preview","Html":"Пост 2"},{"PropertyId":305,"MemberCode":"Content","Html":"<p>Зміст посту 2</p>"},{"PropertyId":306,"MemberCode":"Title","Html":"Пост 2"},{"PropertyId":307,"MemberCode":"MetaDescription","Html":""},{"PropertyId":308,"MemberCode":"MetaKeywords","Html":""}]',6,'BlogPost','/blog/post-2');
INSERT INTO `CachedObjects` VALUES (1,7,NULL,'[{"PropertyId":309,"MemberCode":"Image","Html":"/images/temp/img.png"},{"PropertyId":310,"MemberCode":"Preview","Html":"Post 3"},{"PropertyId":311,"MemberCode":"Content","Html":"<p>Post&nbsp;3 content</p>"},{"PropertyId":312,"MemberCode":"Title","Html":"Post 3"},{"PropertyId":313,"MemberCode":"MetaDescription","Html":""},{"PropertyId":314,"MemberCode":"MetaKeywords","Html":""}]',6,'BlogPost','/blog/post-3');
INSERT INTO `CachedObjects` VALUES (2,7,NULL,'[{"PropertyId":309,"MemberCode":"Image","Html":"/images/temp/img.png"},{"PropertyId":310,"MemberCode":"Preview","Html":"Пост 3"},{"PropertyId":311,"MemberCode":"Content","Html":"<p>Зміст посту 3</p>"},{"PropertyId":312,"MemberCode":"Title","Html":"Пост 3"},{"PropertyId":313,"MemberCode":"MetaDescription","Html":""},{"PropertyId":314,"MemberCode":"MetaKeywords","Html":""}]',6,'BlogPost','/blog/post-3');
INSERT INTO `CachedObjects` VALUES (1,3,NULL,'[{"PropertyId":213,"MemberCode":"Content","Html":"<p>Contacts</p>\r\n<p>Website: <a href=\"http://platformus.net/\">http://platformus.net/</a></p>\r\n<p>Git: <a href=\"https://github.com/Platformus\">https://github.com/Platformus</a></p>"},{"PropertyId":214,"MemberCode":"Title","Html":"Contacts"},{"PropertyId":215,"MemberCode":"MetaDescription","Html":""},{"PropertyId":216,"MemberCode":"MetaKeywords","Html":""}]',3,'Contacts','/contacts');
INSERT INTO `CachedObjects` VALUES (2,3,NULL,'[{"PropertyId":213,"MemberCode":"Content","Html":"<p>Контакти</p>\r\n<p>Веб-сайт: <a href=\"http://platformus.net/\">http://platformus.net/</a></p>\r\n<p>Git: <a href=\"https://github.com/Platformus\">https://github.com/Platformus</a></p>"},{"PropertyId":214,"MemberCode":"Title","Html":"Контакти"},{"PropertyId":215,"MemberCode":"MetaDescription","Html":""},{"PropertyId":216,"MemberCode":"MetaKeywords","Html":""}]',3,'Contacts','/contacts');
INSERT INTO `CachedObjects` VALUES (1,2,'[{"DataSourceId":7,"Code":"Features","CSharpClassName":"Platformus.Content.DataSources.PrimaryObjectsDataSource","Parameters":null}]','[{"PropertyId":217,"MemberCode":"Content","Html":"<p>The main features of the Platformus CMS:</p>"},{"PropertyId":218,"MemberCode":"Title","Html":"Features"},{"PropertyId":219,"MemberCode":"MetaDescription","Html":""},{"PropertyId":220,"MemberCode":"MetaKeywords","Html":""}]',2,'Features','/features');
INSERT INTO `CachedObjects` VALUES (2,2,'[{"DataSourceId":7,"Code":"Features","CSharpClassName":"Platformus.Content.DataSources.PrimaryObjectsDataSource","Parameters":null}]','[{"PropertyId":217,"MemberCode":"Content","Html":"<p>Основні особливості CMS Platformus:</p>"},{"PropertyId":218,"MemberCode":"Title","Html":"Особливості"},{"PropertyId":219,"MemberCode":"MetaDescription","Html":""},{"PropertyId":220,"MemberCode":"MetaKeywords","Html":""}]',2,'Features','/features');
INSERT INTO `CachedObjects` VALUES (1,1,NULL,'[{"PropertyId":315,"MemberCode":"Content","Html":"<p>This is a demo website running on Platformus CMS.</p>\r\n<p>You can manage it using the <a href=\"/backend/\">backend</a>.</p>\r\n<p>Email: <a href=\"mailto:admin@platformus.net\">admin@platformus.net</a></p>\r\n<p>Password: admin</p>"},{"PropertyId":316,"MemberCode":"Title","Html":"Platformus CMS demo website"},{"PropertyId":317,"MemberCode":"MetaDescription","Html":"CMS, Platformus"},{"PropertyId":318,"MemberCode":"MetaKeywords","Html":"This is a demo website running on Platformus CMS."}]',1,'Index','/');
INSERT INTO `CachedObjects` VALUES (2,1,NULL,'[{"PropertyId":315,"MemberCode":"Content","Html":"<p>Це демонстраційний веб-сайт, що працює на CMS Platformus.</p>\r\n<p>Ви можете&nbsp;керувати ним&nbsp;за допомогою <a href=\"/backend/\">бекенду</a>.</p>\r\n<p>Електронна пошта: <a href=\"mailto:admin@platformus.net\">admin@platformus.net</a></p>\r\n<p>Пароль: admin</p>"},{"PropertyId":316,"MemberCode":"Title","Html":"Демонстраційний веб-сайт на CMS Platformus"},{"PropertyId":317,"MemberCode":"MetaDescription","Html":"CMS, Platformus"},{"PropertyId":318,"MemberCode":"MetaKeywords","Html":"Це демонстраційний веб-сайт, що працює на CMS Platformus."}]',1,'Index','/');
INSERT INTO `CachedObjects` VALUES (3,5,NULL,'[{"PropertyId":297,"MemberCode":"Image","Html":"/images/temp/img.png"},{"PropertyId":298,"MemberCode":"Preview","Html":null},{"PropertyId":299,"MemberCode":"Content","Html":null},{"PropertyId":300,"MemberCode":"Title","Html":null},{"PropertyId":301,"MemberCode":"MetaDescription","Html":null},{"PropertyId":302,"MemberCode":"MetaKeywords","Html":null}]',6,'BlogPost','/blog/post-1');
INSERT INTO `CachedObjects` VALUES (3,6,NULL,'[{"PropertyId":303,"MemberCode":"Image","Html":"/images/temp/img.png"},{"PropertyId":304,"MemberCode":"Preview","Html":null},{"PropertyId":305,"MemberCode":"Content","Html":null},{"PropertyId":306,"MemberCode":"Title","Html":null},{"PropertyId":307,"MemberCode":"MetaDescription","Html":null},{"PropertyId":308,"MemberCode":"MetaKeywords","Html":null}]',6,'BlogPost','/blog/post-2');
INSERT INTO `CachedObjects` VALUES (3,7,NULL,'[{"PropertyId":309,"MemberCode":"Image","Html":"/images/temp/img.png"},{"PropertyId":310,"MemberCode":"Preview","Html":null},{"PropertyId":311,"MemberCode":"Content","Html":null},{"PropertyId":312,"MemberCode":"Title","Html":null},{"PropertyId":313,"MemberCode":"MetaDescription","Html":null},{"PropertyId":314,"MemberCode":"MetaKeywords","Html":null}]',6,'BlogPost','/blog/post-3');
INSERT INTO `CachedObjects` VALUES (3,1,NULL,'[{"PropertyId":315,"MemberCode":"Content","Html":null},{"PropertyId":316,"MemberCode":"Title","Html":null},{"PropertyId":317,"MemberCode":"MetaDescription","Html":null},{"PropertyId":318,"MemberCode":"MetaKeywords","Html":null}]',1,'Index','/');
CREATE TABLE "CachedMenus" (
    "CultureId" INTEGER NOT NULL,
    "MenuId" INTEGER NOT NULL,
    "CachedMenuItems" TEXT,
    "Code" TEXT,
    CONSTRAINT "PK_CachedMenu" PRIMARY KEY ("CultureId", "MenuId"),
    CONSTRAINT "FK_CachedMenu_Culture_CultureId" FOREIGN KEY ("CultureId") REFERENCES "Cultures" ("Id"),
    CONSTRAINT "FK_CachedMenu_Menu_MenuId" FOREIGN KEY ("MenuId") REFERENCES "Menus" ("Id")
);
INSERT INTO `CachedMenus` VALUES (1,6,'[{"MenuItemId":39,"Name":"Home","Url":"/","Position":1,"CachedMenuItems":null},{"MenuItemId":40,"Name":"Features","Url":"/features","Position":2,"CachedMenuItems":null},{"MenuItemId":41,"Name":"Blog","Url":"/blog","Position":3,"CachedMenuItems":null},{"MenuItemId":42,"Name":"Contacts","Url":"/contacts","Position":4,"CachedMenuItems":null}]','Main');
INSERT INTO `CachedMenus` VALUES (2,6,'[{"MenuItemId":39,"Name":"Головна","Url":"/","Position":1,"CachedMenuItems":null},{"MenuItemId":40,"Name":"Особливості","Url":"/features","Position":2,"CachedMenuItems":null},{"MenuItemId":41,"Name":"Блог","Url":"/blog","Position":3,"CachedMenuItems":null},{"MenuItemId":42,"Name":"Контакти","Url":"/contacts","Position":4,"CachedMenuItems":null}]','Main');
CREATE TABLE "CachedForms" (
    "CultureId" INTEGER NOT NULL,
    "FormId" INTEGER NOT NULL,
    "CachedFields" TEXT,
    "Code" TEXT,
    "Name" TEXT,
    CONSTRAINT "PK_CachedForm" PRIMARY KEY ("CultureId", "FormId"),
    CONSTRAINT "FK_CachedForm_Culture_CultureId" FOREIGN KEY ("CultureId") REFERENCES "Cultures" ("Id"),
    CONSTRAINT "FK_CachedForm_Form_FormId" FOREIGN KEY ("FormId") REFERENCES "Forms" ("Id")
);
INSERT INTO `CachedForms` VALUES (2,5,'[{"FieldId":17,"FieldTypeCode":"TextBox","Name":"Ваше ім’я","Position":1,"CachedFieldOptions":null},{"FieldId":18,"FieldTypeCode":"TextBox","Name":"Ваш телефон","Position":2,"CachedFieldOptions":null},{"FieldId":19,"FieldTypeCode":"TextArea","Name":"Ваше повідомлення","Position":3,"CachedFieldOptions":null}]','Feedback',' Зворотний зв’язок');
INSERT INTO `CachedForms` VALUES (1,5,'[{"FieldId":17,"FieldTypeCode":"TextBox","Name":"Your name","Position":1,"CachedFieldOptions":null},{"FieldId":18,"FieldTypeCode":"TextBox","Name":"Your phone","Position":2,"CachedFieldOptions":null},{"FieldId":19,"FieldTypeCode":"TextArea","Name":"Your message","Position":3,"CachedFieldOptions":null}]','Feedback','Feedback');
COMMIT;
