BEGIN TRANSACTION;
CREATE TABLE `Variables` (
	`Id`	INTEGER NOT NULL,
	`Code`	TEXT,
	`SectionId`	INTEGER NOT NULL,
	`Name`	TEXT,
	`Position`	INTEGER,
	`Value`	TEXT,
	FOREIGN KEY(`SectionId`) REFERENCES "Sections" ( "Id" )
);
CREATE TABLE "Users" (
	`Id`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
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
INSERT INTO `Tabs` VALUES (1,1,'SEO',1);
INSERT INTO `Tabs` VALUES (2,2,'SEO',2);
INSERT INTO `Tabs` VALUES (3,3,'SEO',1);
INSERT INTO `Tabs` VALUES (4,5,'SEO',1);
INSERT INTO `Tabs` VALUES (5,6,'SEO',1);
INSERT INTO `Tabs` VALUES (6,2,'Features',1);
CREATE TABLE "Sections" (
    "Id" INTEGER NOT NULL CONSTRAINT "PK_Configuration" PRIMARY KEY AUTOINCREMENT,
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
INSERT INTO `Relations` VALUES (81,5,24,4);
INSERT INTO `Relations` VALUES (82,6,24,4);
INSERT INTO `Relations` VALUES (84,7,24,4);
INSERT INTO `Relations` VALUES (93,2,25,8);
INSERT INTO `Relations` VALUES (94,2,25,9);
INSERT INTO `Relations` VALUES (95,2,25,10);
INSERT INTO `Relations` VALUES (96,2,25,11);
CREATE TABLE "Properties" (
    "Id" INTEGER NOT NULL CONSTRAINT "PK_Property" PRIMARY KEY AUTOINCREMENT,
    "HtmlId" INTEGER NOT NULL,
    "MemberId" INTEGER NOT NULL,
    "ObjectId" INTEGER,
    CONSTRAINT "FK_Property_Dictionary_HtmlId" FOREIGN KEY ("HtmlId") REFERENCES "Dictionaries" ("Id"),
    CONSTRAINT "FK_Property_Member_MemberId" FOREIGN KEY ("MemberId") REFERENCES "Members" ("Id"),
    CONSTRAINT "FK_Property_Object_ObjectId" FOREIGN KEY ("ObjectId") REFERENCES "Objects" ("Id")
);
INSERT INTO `Properties` VALUES (13,13,9,3);
INSERT INTO `Properties` VALUES (14,14,10,3);
INSERT INTO `Properties` VALUES (15,15,11,3);
INSERT INTO `Properties` VALUES (16,16,12,3);
INSERT INTO `Properties` VALUES (21,21,19,5);
INSERT INTO `Properties` VALUES (22,22,20,5);
INSERT INTO `Properties` VALUES (23,23,21,5);
INSERT INTO `Properties` VALUES (24,24,22,5);
INSERT INTO `Properties` VALUES (25,25,23,5);
INSERT INTO `Properties` VALUES (26,26,19,6);
INSERT INTO `Properties` VALUES (27,27,20,6);
INSERT INTO `Properties` VALUES (28,28,21,6);
INSERT INTO `Properties` VALUES (29,29,22,6);
INSERT INTO `Properties` VALUES (30,30,23,6);
INSERT INTO `Properties` VALUES (36,36,19,7);
INSERT INTO `Properties` VALUES (37,37,20,7);
INSERT INTO `Properties` VALUES (38,38,21,7);
INSERT INTO `Properties` VALUES (39,39,22,7);
INSERT INTO `Properties` VALUES (40,40,23,7);
INSERT INTO `Properties` VALUES (43,43,13,9);
INSERT INTO `Properties` VALUES (44,44,14,9);
INSERT INTO `Properties` VALUES (45,45,13,10);
INSERT INTO `Properties` VALUES (46,46,14,10);
INSERT INTO `Properties` VALUES (47,47,13,11);
INSERT INTO `Properties` VALUES (48,48,14,11);
INSERT INTO `Properties` VALUES (53,62,15,4);
INSERT INTO `Properties` VALUES (54,63,16,4);
INSERT INTO `Properties` VALUES (55,64,17,4);
INSERT INTO `Properties` VALUES (56,65,18,4);
INSERT INTO `Properties` VALUES (69,78,13,8);
INSERT INTO `Properties` VALUES (70,79,14,8);
INSERT INTO `Properties` VALUES (71,80,5,2);
INSERT INTO `Properties` VALUES (72,81,6,2);
INSERT INTO `Properties` VALUES (73,82,7,2);
INSERT INTO `Properties` VALUES (74,83,8,2);
INSERT INTO `Properties` VALUES (87,96,1,1);
INSERT INTO `Properties` VALUES (88,97,2,1);
INSERT INTO `Properties` VALUES (89,98,3,1);
INSERT INTO `Properties` VALUES (90,99,4,1);
CREATE TABLE "Permissions" (
    "Id" INTEGER NOT NULL CONSTRAINT "PK_Permission" PRIMARY KEY AUTOINCREMENT,
    "Code" TEXT,
    "Name" TEXT,
    "Position" INTEGER
);
INSERT INTO `Permissions` VALUES (1,'DoEverything','Do everything',1);
CREATE TABLE "Objects" (
	`Id`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
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
	`Id`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
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
    "Id" INTEGER NOT NULL CONSTRAINT "PK_Member" PRIMARY KEY AUTOINCREMENT,
    "ClassId" INTEGER NOT NULL,
    "Code" TEXT,
    "DisplayInList" INTEGER,
    "IsRelationSingleParent" INTEGER,
    "Name" TEXT,
    "Position" INTEGER,
    "PropertyDataTypeId" INTEGER,
    "RelationClassId" INTEGER,
    "TabId" INTEGER,
    CONSTRAINT "FK_Member_DataType_PropertyDataTypeId" FOREIGN KEY ("PropertyDataTypeId") REFERENCES "DataTypes" ("Id")
);
INSERT INTO `Members` VALUES (1,1,'Content',NULL,NULL,'Content',1,3,NULL,NULL);
INSERT INTO `Members` VALUES (2,1,'Title',1,NULL,'Title',2,1,NULL,1);
INSERT INTO `Members` VALUES (3,1,'MetaKeywords',NULL,NULL,'META keywords',3,1,NULL,1);
INSERT INTO `Members` VALUES (4,1,'MetaDescription',NULL,NULL,'META description',4,1,NULL,1);
INSERT INTO `Members` VALUES (5,2,'Content',NULL,NULL,'Content',1,3,NULL,NULL);
INSERT INTO `Members` VALUES (6,2,'Title',1,NULL,'Title',3,1,NULL,2);
INSERT INTO `Members` VALUES (7,2,'MetaKeywords',NULL,NULL,'META keywords',4,1,NULL,2);
INSERT INTO `Members` VALUES (8,2,'MetaDescription',NULL,NULL,'META description',5,1,NULL,2);
INSERT INTO `Members` VALUES (9,3,'Content',NULL,NULL,'Content',1,3,NULL,NULL);
INSERT INTO `Members` VALUES (10,3,'Title',1,NULL,'Title',2,1,NULL,3);
INSERT INTO `Members` VALUES (11,3,'MetaKeywords',NULL,NULL,'META keywords',3,1,NULL,3);
INSERT INTO `Members` VALUES (12,3,'MetaDescription',NULL,NULL,'META description',4,1,NULL,3);
INSERT INTO `Members` VALUES (13,4,'Name',1,NULL,'Name',1,1,NULL,NULL);
INSERT INTO `Members` VALUES (14,4,'State',NULL,NULL,'State',2,1,NULL,NULL);
INSERT INTO `Members` VALUES (15,5,'Content',NULL,NULL,'Content',1,3,NULL,NULL);
INSERT INTO `Members` VALUES (16,5,'Title',1,NULL,'Title',2,1,NULL,4);
INSERT INTO `Members` VALUES (17,5,'MetaKeywords',NULL,NULL,'META keywords',3,1,NULL,4);
INSERT INTO `Members` VALUES (18,5,'MetaDescription',NULL,NULL,'META description',4,1,NULL,4);
INSERT INTO `Members` VALUES (19,6,'Preview',NULL,NULL,'Preview',2,2,NULL,NULL);
INSERT INTO `Members` VALUES (20,6,'Content',NULL,NULL,'Content',3,3,NULL,NULL);
INSERT INTO `Members` VALUES (21,6,'Title',1,NULL,'Title',4,1,NULL,5);
INSERT INTO `Members` VALUES (22,6,'MetaKeywords',NULL,NULL,'META keywords',5,1,NULL,5);
INSERT INTO `Members` VALUES (23,6,'MetaDescription',NULL,NULL,'META description',6,1,NULL,5);
INSERT INTO `Members` VALUES (24,6,'BlogPage',NULL,1,'Blog page',1,NULL,5,NULL);
INSERT INTO `Members` VALUES (25,2,'Features',NULL,NULL,'Features',2,NULL,4,6);
CREATE TABLE "Localizations" (
    "Id" INTEGER NOT NULL CONSTRAINT "PK_Localization" PRIMARY KEY AUTOINCREMENT,
    "CultureId" INTEGER NOT NULL,
    "DictionaryId" INTEGER NOT NULL,
    "Value" TEXT,
    CONSTRAINT "FK_Localization_Culture_CultureId" FOREIGN KEY ("CultureId") REFERENCES "Cultures" ("Id"),
    CONSTRAINT "FK_Localization_Dictionary_DictionaryId" FOREIGN KEY ("DictionaryId") REFERENCES "Dictionaries" ("Id")
);
INSERT INTO `Localizations` VALUES (25,2,13,'<p>Контакти</p>
<p>Веб-сайт: <a href="http://platformus.net/">http://platformus.net/</a></p>
<p>Git: <a href="https://github.com/Platformus">https://github.com/Platformus</a></p>');
INSERT INTO `Localizations` VALUES (26,1,13,'<p>Contacts</p>
<p>Website: <a href="http://platformus.net/">http://platformus.net/</a></p>
<p>Git: <a href="https://github.com/Platformus">https://github.com/Platformus</a></p>');
INSERT INTO `Localizations` VALUES (27,2,14,'Контакти');
INSERT INTO `Localizations` VALUES (28,1,14,'Contacts');
INSERT INTO `Localizations` VALUES (29,2,15,'');
INSERT INTO `Localizations` VALUES (30,1,15,'');
INSERT INTO `Localizations` VALUES (31,1,16,'');
INSERT INTO `Localizations` VALUES (32,2,16,'');
INSERT INTO `Localizations` VALUES (41,2,21,'Пост 1');
INSERT INTO `Localizations` VALUES (42,1,21,'Post 1');
INSERT INTO `Localizations` VALUES (43,2,22,'<p>Зміст посту 1</p>');
INSERT INTO `Localizations` VALUES (44,1,22,'<p>Post 1 content</p>');
INSERT INTO `Localizations` VALUES (45,2,23,'Пост 1');
INSERT INTO `Localizations` VALUES (46,1,23,'Post 1');
INSERT INTO `Localizations` VALUES (47,2,24,'');
INSERT INTO `Localizations` VALUES (48,1,24,'');
INSERT INTO `Localizations` VALUES (49,1,25,'');
INSERT INTO `Localizations` VALUES (50,2,25,'');
INSERT INTO `Localizations` VALUES (51,2,26,'Пост 2');
INSERT INTO `Localizations` VALUES (52,1,26,'Post 2');
INSERT INTO `Localizations` VALUES (53,2,27,'<p>Зміст посту 2</p>');
INSERT INTO `Localizations` VALUES (54,1,27,'<p>Post&nbsp;2 content</p>');
INSERT INTO `Localizations` VALUES (55,2,28,'Пост 2');
INSERT INTO `Localizations` VALUES (56,1,28,'Post 2');
INSERT INTO `Localizations` VALUES (57,2,29,'');
INSERT INTO `Localizations` VALUES (58,1,29,'');
INSERT INTO `Localizations` VALUES (59,1,30,'');
INSERT INTO `Localizations` VALUES (60,2,30,'');
INSERT INTO `Localizations` VALUES (71,2,36,'Пост 3');
INSERT INTO `Localizations` VALUES (72,1,36,'Post 3');
INSERT INTO `Localizations` VALUES (73,2,37,'<p>Зміст посту 3</p>');
INSERT INTO `Localizations` VALUES (74,1,37,'<p>Post&nbsp;3 content</p>');
INSERT INTO `Localizations` VALUES (75,2,38,'Пост 3');
INSERT INTO `Localizations` VALUES (76,1,38,'Post 3');
INSERT INTO `Localizations` VALUES (77,2,39,'');
INSERT INTO `Localizations` VALUES (78,1,39,'');
INSERT INTO `Localizations` VALUES (79,1,40,'');
INSERT INTO `Localizations` VALUES (80,2,40,'');
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
INSERT INTO `Localizations` VALUES (123,2,62,'<p>Блог</p>
<p>Лише демонстрація пов&rsquo;язаних об&rsquo;єктів.</p>');
INSERT INTO `Localizations` VALUES (124,1,62,'<p>Blog</p>
<p>Only related objects demo.</p>');
INSERT INTO `Localizations` VALUES (125,2,63,'Блог');
INSERT INTO `Localizations` VALUES (126,1,63,'Blog');
INSERT INTO `Localizations` VALUES (127,2,64,'');
INSERT INTO `Localizations` VALUES (128,1,64,'');
INSERT INTO `Localizations` VALUES (129,1,65,'');
INSERT INTO `Localizations` VALUES (130,2,65,'');
INSERT INTO `Localizations` VALUES (155,2,78,'Модульна структура');
INSERT INTO `Localizations` VALUES (156,1,78,'Modular structure');
INSERT INTO `Localizations` VALUES (157,1,79,'yes');
INSERT INTO `Localizations` VALUES (158,2,79,'так');
INSERT INTO `Localizations` VALUES (159,2,80,'<p>Основні особливості CMS Platformus:</p>');
INSERT INTO `Localizations` VALUES (160,1,80,'<p>The main features of the Platformus CMS:</p>');
INSERT INTO `Localizations` VALUES (161,2,81,'Особливості');
INSERT INTO `Localizations` VALUES (162,1,81,'Features');
INSERT INTO `Localizations` VALUES (163,2,82,'');
INSERT INTO `Localizations` VALUES (164,1,82,'');
INSERT INTO `Localizations` VALUES (165,1,83,'');
INSERT INTO `Localizations` VALUES (166,2,83,'');
INSERT INTO `Localizations` VALUES (191,2,96,'<p>Це демонстраційний веб-сайт, що працює на CMS Platformus.</p>
<p>Ви можете&nbsp;керувати ним&nbsp;за допомогою <a href="/backend/">бекенду</a>.</p>
<p>Електронна пошта: <a href="mailto:admin@platformus.net">admin@platformus.net</a></p>
<p>Пароль: admin</p>');
INSERT INTO `Localizations` VALUES (192,1,96,'<p>This is a demo website running on Platformus CMS.</p>
<p>You can manage it using the <a href="/backend/">backend</a>.</p>
<p>Email: <a href="mailto:admin@platformus.net">admin@platformus.net</a></p>
<p>Password: admin</p>');
INSERT INTO `Localizations` VALUES (193,2,97,'Демонстраційний веб-сайт на CMS Platformus');
INSERT INTO `Localizations` VALUES (194,1,97,'Platformus CMS demo website');
INSERT INTO `Localizations` VALUES (195,2,98,'CMS, Platformus');
INSERT INTO `Localizations` VALUES (196,1,98,'CMS, Platformus');
INSERT INTO `Localizations` VALUES (197,1,99,'This is a demo website running on Platformus CMS.');
INSERT INTO `Localizations` VALUES (198,2,99,'Це демонстраційний веб-сайт, що працює на CMS Platformus.');
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
INSERT INTO `Dictionaries` VALUES (13);
INSERT INTO `Dictionaries` VALUES (14);
INSERT INTO `Dictionaries` VALUES (15);
INSERT INTO `Dictionaries` VALUES (16);
INSERT INTO `Dictionaries` VALUES (21);
INSERT INTO `Dictionaries` VALUES (22);
INSERT INTO `Dictionaries` VALUES (23);
INSERT INTO `Dictionaries` VALUES (24);
INSERT INTO `Dictionaries` VALUES (25);
INSERT INTO `Dictionaries` VALUES (26);
INSERT INTO `Dictionaries` VALUES (27);
INSERT INTO `Dictionaries` VALUES (28);
INSERT INTO `Dictionaries` VALUES (29);
INSERT INTO `Dictionaries` VALUES (30);
INSERT INTO `Dictionaries` VALUES (36);
INSERT INTO `Dictionaries` VALUES (37);
INSERT INTO `Dictionaries` VALUES (38);
INSERT INTO `Dictionaries` VALUES (39);
INSERT INTO `Dictionaries` VALUES (40);
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
INSERT INTO `Dictionaries` VALUES (62);
INSERT INTO `Dictionaries` VALUES (63);
INSERT INTO `Dictionaries` VALUES (64);
INSERT INTO `Dictionaries` VALUES (65);
INSERT INTO `Dictionaries` VALUES (78);
INSERT INTO `Dictionaries` VALUES (79);
INSERT INTO `Dictionaries` VALUES (80);
INSERT INTO `Dictionaries` VALUES (81);
INSERT INTO `Dictionaries` VALUES (82);
INSERT INTO `Dictionaries` VALUES (83);
INSERT INTO `Dictionaries` VALUES (96);
INSERT INTO `Dictionaries` VALUES (97);
INSERT INTO `Dictionaries` VALUES (98);
INSERT INTO `Dictionaries` VALUES (99);
CREATE TABLE "DataTypes" (
    "Id" INTEGER NOT NULL CONSTRAINT "PK_DataType" PRIMARY KEY AUTOINCREMENT,
    "JavaScriptEditorClassName" TEXT,
    "Name" TEXT,
    "Position" INTEGER
);
INSERT INTO `DataTypes` VALUES (1,'SingleLinePlainText','Single line plain text',1);
INSERT INTO `DataTypes` VALUES (2,'MultilinePlainText','Multiline plain text',2);
INSERT INTO `DataTypes` VALUES (3,'Html','Html',3);
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
    "Id" INTEGER NOT NULL CONSTRAINT "PK_Culture" PRIMARY KEY AUTOINCREMENT,
    "Code" TEXT,
    "Name" TEXT
);
INSERT INTO `Cultures` VALUES (1,'en','English');
INSERT INTO `Cultures` VALUES (2,'uk','Українська');
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
	`IsStandalone`	INTEGER,
	`Name`	TEXT,
	`PluralizedName`	TEXT,
	`DefaultViewName`	TEXT
);
INSERT INTO `Classes` VALUES (1,1,'Index Page','Index Pages','Index');
INSERT INTO `Classes` VALUES (2,1,'Features Page','Features Pages','Features');
INSERT INTO `Classes` VALUES (3,1,'Contacts Page','Contacts Pages','Contacts');
INSERT INTO `Classes` VALUES (4,NULL,'Feature','Features',NULL);
INSERT INTO `Classes` VALUES (5,1,'Blog Page','Blog Pages','Blog');
INSERT INTO `Classes` VALUES (6,1,'Blog Post Page','Blog Post Pages','BlogPost');
CREATE TABLE "CachedObjects" (
	`CultureId`	INTEGER NOT NULL,
	`ObjectId`	INTEGER NOT NULL,
	`CachedDataSources`	TEXT,
	`CachedProperties`	TEXT,
	`ClassId`	INTEGER NOT NULL,
	`ViewName`	TEXT,
	`Url`	TEXT,
	PRIMARY KEY(CultureId,ObjectId),
	FOREIGN KEY(`CultureId`) REFERENCES "Cultures" ( "Id" ),
	FOREIGN KEY(`ObjectId`) REFERENCES "Objects" ( "Id" )
);
INSERT INTO `CachedObjects` VALUES (1,1,NULL,'[{"PropertyId":87,"MemberCode":"Content","Html":"<p>This is a demo website running on Platformus CMS.</p>\r\n<p>You can manage it using the <a href=\"/backend/\">backend</a>.</p>\r\n<p>Email: <a href=\"mailto:admin@platformus.net\">admin@platformus.net</a></p>\r\n<p>Password: admin</p>"},{"PropertyId":88,"MemberCode":"Title","Html":"Platformus CMS demo website"},{"PropertyId":89,"MemberCode":"MetaKeywords","Html":"CMS, Platformus"},{"PropertyId":90,"MemberCode":"MetaDescription","Html":"This is a demo website running on Platformus CMS."}]',1,'Index','/');
INSERT INTO `CachedObjects` VALUES (1,2,'[{"DataSourceId":7,"Code":"Features","CSharpClassName":"Platformus.Content.DataSources.PrimaryObjectsDataSource","Parameters":null}]','[{"PropertyId":71,"MemberCode":"Content","Html":"<p>The main features of the Platformus CMS:</p>"},{"PropertyId":72,"MemberCode":"Title","Html":"Features"},{"PropertyId":73,"MemberCode":"MetaKeywords","Html":""},{"PropertyId":74,"MemberCode":"MetaDescription","Html":""}]',2,'Features','/features');
INSERT INTO `CachedObjects` VALUES (1,3,NULL,'[{"PropertyId":13,"MemberCode":"Content","Html":"<p>Contacts</p>\r\n<p>Website: <a href=\"http://platformus.net/\">http://platformus.net/</a></p>\r\n<p>Git: <a href=\"https://github.com/Platformus\">https://github.com/Platformus</a></p>"},{"PropertyId":14,"MemberCode":"Title","Html":"Contacts"},{"PropertyId":15,"MemberCode":"MetaKeywords","Html":""},{"PropertyId":16,"MemberCode":"MetaDescription","Html":""}]',3,'Contacts','/contacts');
INSERT INTO `CachedObjects` VALUES (1,4,'[{"DataSourceId":8,"Code":"BlogPosts","CSharpClassName":"Platformus.Content.DataSources.ForeignObjectsDataSource","Parameters":null}]','[{"PropertyId":53,"MemberCode":"Content","Html":"<p>Blog</p>\r\n<p>Only related objects demo.</p>"},{"PropertyId":54,"MemberCode":"Title","Html":"Blog"},{"PropertyId":55,"MemberCode":"MetaKeywords","Html":""},{"PropertyId":56,"MemberCode":"MetaDescription","Html":""}]',5,'Blog','/blog');
INSERT INTO `CachedObjects` VALUES (1,5,NULL,'[{"PropertyId":21,"MemberCode":"Preview","Html":"Post 1"},{"PropertyId":22,"MemberCode":"Content","Html":"<p>Post 1 content</p>"},{"PropertyId":23,"MemberCode":"Title","Html":"Post 1"},{"PropertyId":24,"MemberCode":"MetaKeywords","Html":""},{"PropertyId":25,"MemberCode":"MetaDescription","Html":""}]',6,'BlogPost','/blog/post-1');
INSERT INTO `CachedObjects` VALUES (1,6,NULL,'[{"PropertyId":26,"MemberCode":"Preview","Html":"Post 2"},{"PropertyId":27,"MemberCode":"Content","Html":"<p>Post&nbsp;2 content</p>"},{"PropertyId":28,"MemberCode":"Title","Html":"Post 2"},{"PropertyId":29,"MemberCode":"MetaKeywords","Html":""},{"PropertyId":30,"MemberCode":"MetaDescription","Html":""}]',6,'BlogPost','/blog/post-2');
INSERT INTO `CachedObjects` VALUES (1,7,NULL,'[{"PropertyId":36,"MemberCode":"Preview","Html":"Post 3"},{"PropertyId":37,"MemberCode":"Content","Html":"<p>Post&nbsp;3 content</p>"},{"PropertyId":38,"MemberCode":"Title","Html":"Post 3"},{"PropertyId":39,"MemberCode":"MetaKeywords","Html":""},{"PropertyId":40,"MemberCode":"MetaDescription","Html":""}]',6,'BlogPost','/blog/post-3');
INSERT INTO `CachedObjects` VALUES (1,8,NULL,'[{"PropertyId":69,"MemberCode":"Name","Html":"Modular structure"},{"PropertyId":70,"MemberCode":"State","Html":"yes"}]',4,NULL,NULL);
INSERT INTO `CachedObjects` VALUES (1,9,NULL,'[{"PropertyId":43,"MemberCode":"Name","Html":"User interface localization"},{"PropertyId":44,"MemberCode":"State","Html":"no"}]',4,NULL,NULL);
INSERT INTO `CachedObjects` VALUES (1,10,NULL,'[{"PropertyId":45,"MemberCode":"Name","Html":"Content localization"},{"PropertyId":46,"MemberCode":"State","Html":"yes"}]',4,NULL,NULL);
INSERT INTO `CachedObjects` VALUES (2,1,NULL,'[{"PropertyId":87,"MemberCode":"Content","Html":"<p>Це демонстраційний веб-сайт, що працює на CMS Platformus.</p>\r\n<p>Ви можете&nbsp;керувати ним&nbsp;за допомогою <a href=\"/backend/\">бекенду</a>.</p>\r\n<p>Електронна пошта: <a href=\"mailto:admin@platformus.net\">admin@platformus.net</a></p>\r\n<p>Пароль: admin</p>"},{"PropertyId":88,"MemberCode":"Title","Html":"Демонстраційний веб-сайт на CMS Platformus"},{"PropertyId":89,"MemberCode":"MetaKeywords","Html":"CMS, Platformus"},{"PropertyId":90,"MemberCode":"MetaDescription","Html":"Це демонстраційний веб-сайт, що працює на CMS Platformus."}]',1,'Index','/');
INSERT INTO `CachedObjects` VALUES (2,2,'[{"DataSourceId":7,"Code":"Features","CSharpClassName":"Platformus.Content.DataSources.PrimaryObjectsDataSource","Parameters":null}]','[{"PropertyId":71,"MemberCode":"Content","Html":"<p>Основні особливості CMS Platformus:</p>"},{"PropertyId":72,"MemberCode":"Title","Html":"Особливості"},{"PropertyId":73,"MemberCode":"MetaKeywords","Html":""},{"PropertyId":74,"MemberCode":"MetaDescription","Html":""}]',2,'Features','/features');
INSERT INTO `CachedObjects` VALUES (2,3,NULL,'[{"PropertyId":13,"MemberCode":"Content","Html":"<p>Контакти</p>\r\n<p>Веб-сайт: <a href=\"http://platformus.net/\">http://platformus.net/</a></p>\r\n<p>Git: <a href=\"https://github.com/Platformus\">https://github.com/Platformus</a></p>"},{"PropertyId":14,"MemberCode":"Title","Html":"Контакти"},{"PropertyId":15,"MemberCode":"MetaKeywords","Html":""},{"PropertyId":16,"MemberCode":"MetaDescription","Html":""}]',3,'Contacts','/contacts');
INSERT INTO `CachedObjects` VALUES (2,4,'[{"DataSourceId":8,"Code":"BlogPosts","CSharpClassName":"Platformus.Content.DataSources.ForeignObjectsDataSource","Parameters":null}]','[{"PropertyId":53,"MemberCode":"Content","Html":"<p>Блог</p>\r\n<p>Лише демонстрація пов&rsquo;язаних об&rsquo;єктів.</p>"},{"PropertyId":54,"MemberCode":"Title","Html":"Блог"},{"PropertyId":55,"MemberCode":"MetaKeywords","Html":""},{"PropertyId":56,"MemberCode":"MetaDescription","Html":""}]',5,'Blog','/blog');
INSERT INTO `CachedObjects` VALUES (2,5,NULL,'[{"PropertyId":21,"MemberCode":"Preview","Html":"Пост 1"},{"PropertyId":22,"MemberCode":"Content","Html":"<p>Зміст посту 1</p>"},{"PropertyId":23,"MemberCode":"Title","Html":"Пост 1"},{"PropertyId":24,"MemberCode":"MetaKeywords","Html":""},{"PropertyId":25,"MemberCode":"MetaDescription","Html":""}]',6,'BlogPost','/blog/post-1');
INSERT INTO `CachedObjects` VALUES (2,6,NULL,'[{"PropertyId":26,"MemberCode":"Preview","Html":"Пост 2"},{"PropertyId":27,"MemberCode":"Content","Html":"<p>Зміст посту 2</p>"},{"PropertyId":28,"MemberCode":"Title","Html":"Пост 2"},{"PropertyId":29,"MemberCode":"MetaKeywords","Html":""},{"PropertyId":30,"MemberCode":"MetaDescription","Html":""}]',6,'BlogPost','/blog/post-2');
INSERT INTO `CachedObjects` VALUES (2,7,NULL,'[{"PropertyId":36,"MemberCode":"Preview","Html":"Пост 3"},{"PropertyId":37,"MemberCode":"Content","Html":"<p>Зміст посту 3</p>"},{"PropertyId":38,"MemberCode":"Title","Html":"Пост 3"},{"PropertyId":39,"MemberCode":"MetaKeywords","Html":""},{"PropertyId":40,"MemberCode":"MetaDescription","Html":""}]',6,'BlogPost','/blog/post-3');
INSERT INTO `CachedObjects` VALUES (2,8,NULL,'[{"PropertyId":69,"MemberCode":"Name","Html":"Модульна структура"},{"PropertyId":70,"MemberCode":"State","Html":"так"}]',4,NULL,NULL);
INSERT INTO `CachedObjects` VALUES (2,9,NULL,'[{"PropertyId":43,"MemberCode":"Name","Html":"Локалізація інтерфейсу користувача"},{"PropertyId":44,"MemberCode":"State","Html":"ні"}]',4,NULL,NULL);
INSERT INTO `CachedObjects` VALUES (2,10,NULL,'[{"PropertyId":45,"MemberCode":"Name","Html":"Локалізація контенту"},{"PropertyId":46,"MemberCode":"State","Html":"так"}]',4,NULL,NULL);
INSERT INTO `CachedObjects` VALUES (2,11,NULL,'[{"PropertyId":47,"MemberCode":"Name","Html":"Гнучке управління контентом"},{"PropertyId":48,"MemberCode":"State","Html":"так"}]',4,NULL,NULL);
INSERT INTO `CachedObjects` VALUES (1,11,NULL,'[{"PropertyId":47,"MemberCode":"Name","Html":"Flexible content management"},{"PropertyId":48,"MemberCode":"State","Html":"yes"}]',4,NULL,NULL);
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
