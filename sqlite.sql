BEGIN TRANSACTION;
CREATE TABLE `Variables` (
	`Id`	INTEGER NOT NULL CONSTRAINT "PK_Variable" PRIMARY KEY AUTOINCREMENT,
	`Code`	TEXT,
	`SectionId`	INTEGER NOT NULL,
	`Name`	TEXT,
	`Position`	INTEGER,
	`Value`	TEXT,
	CONSTRAINT "FK_Variable_Section_SectionId" FOREIGN KEY(`SectionId`) REFERENCES "Sections" ( "Id" )
);
INSERT INTO `Variables` VALUES (1,'SmtpServer',1,'SMTP server',1,'test');
INSERT INTO `Variables` VALUES (2,'SmtpPort',1,'SMTP port',2,'25');
INSERT INTO `Variables` VALUES (3,'SmtpLogin',1,'SMTP login',3,'test');
INSERT INTO `Variables` VALUES (4,'SmtpPassword',1,'SMTP password',4,'test');
INSERT INTO `Variables` VALUES (5,'SmtpSenderEmail',1,'SMTP sender email',5,'test');
INSERT INTO `Variables` VALUES (6,'SmtpSenderName',1,'SMTP sender name',6,'test');
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
INSERT INTO `Tabs` VALUES (1,1,'SEO',100);
INSERT INTO `Tabs` VALUES (2,3,'Features',1);
CREATE TABLE "Sections" (
    "Id" INTEGER NOT NULL CONSTRAINT "PK_Section" PRIMARY KEY AUTOINCREMENT,
    "Code" TEXT,
    "Name" TEXT
);
INSERT INTO `Sections` VALUES (1,'Email','Email');
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
INSERT INTO `Relations` VALUES (1,2,6,8);
INSERT INTO `Relations` VALUES (2,2,6,9);
INSERT INTO `Relations` VALUES (3,2,6,10);
INSERT INTO `Relations` VALUES (4,2,6,11);
INSERT INTO `Relations` VALUES (5,4,8,3);
INSERT INTO `Relations` VALUES (6,5,8,3);
INSERT INTO `Relations` VALUES (7,6,8,3);
CREATE TABLE "Properties" (
    "Id" INTEGER NOT NULL CONSTRAINT "PK_Property" PRIMARY KEY AUTOINCREMENT,
    "HtmlId" INTEGER NOT NULL,
    "MemberId" INTEGER NOT NULL,
    "ObjectId" INTEGER,
    CONSTRAINT "FK_Property_Dictionary_HtmlId" FOREIGN KEY ("HtmlId") REFERENCES "Dictionaries" ("Id"),
    CONSTRAINT "FK_Property_Member_MemberId" FOREIGN KEY ("MemberId") REFERENCES "Members" ("Id"),
    CONSTRAINT "FK_Property_Object_ObjectId" FOREIGN KEY ("ObjectId") REFERENCES "Objects" ("Id")
);
INSERT INTO `Properties` VALUES (1,10,4,1);
INSERT INTO `Properties` VALUES (2,11,1,1);
INSERT INTO `Properties` VALUES (3,12,2,1);
INSERT INTO `Properties` VALUES (4,13,3,1);
INSERT INTO `Properties` VALUES (5,14,5,2);
INSERT INTO `Properties` VALUES (6,15,1,2);
INSERT INTO `Properties` VALUES (7,16,2,2);
INSERT INTO `Properties` VALUES (8,17,3,2);
INSERT INTO `Properties` VALUES (9,18,7,3);
INSERT INTO `Properties` VALUES (10,19,1,3);
INSERT INTO `Properties` VALUES (11,20,2,3);
INSERT INTO `Properties` VALUES (12,21,3,3);
INSERT INTO `Properties` VALUES (13,22,9,4);
INSERT INTO `Properties` VALUES (14,23,10,4);
INSERT INTO `Properties` VALUES (15,24,11,4);
INSERT INTO `Properties` VALUES (16,25,1,4);
INSERT INTO `Properties` VALUES (17,26,2,4);
INSERT INTO `Properties` VALUES (18,27,3,4);
INSERT INTO `Properties` VALUES (19,28,9,5);
INSERT INTO `Properties` VALUES (20,29,10,5);
INSERT INTO `Properties` VALUES (21,30,11,5);
INSERT INTO `Properties` VALUES (22,31,1,5);
INSERT INTO `Properties` VALUES (23,32,2,5);
INSERT INTO `Properties` VALUES (24,33,3,5);
INSERT INTO `Properties` VALUES (25,34,9,6);
INSERT INTO `Properties` VALUES (26,35,10,6);
INSERT INTO `Properties` VALUES (27,36,11,6);
INSERT INTO `Properties` VALUES (28,37,1,6);
INSERT INTO `Properties` VALUES (29,38,2,6);
INSERT INTO `Properties` VALUES (30,39,3,6);
INSERT INTO `Properties` VALUES (31,40,12,7);
INSERT INTO `Properties` VALUES (32,41,1,7);
INSERT INTO `Properties` VALUES (33,42,2,7);
INSERT INTO `Properties` VALUES (34,43,3,7);
INSERT INTO `Properties` VALUES (35,44,13,8);
INSERT INTO `Properties` VALUES (36,45,14,8);
INSERT INTO `Properties` VALUES (37,46,13,9);
INSERT INTO `Properties` VALUES (38,47,14,9);
INSERT INTO `Properties` VALUES (39,48,13,10);
INSERT INTO `Properties` VALUES (40,49,14,10);
INSERT INTO `Properties` VALUES (41,50,13,11);
INSERT INTO `Properties` VALUES (42,51,14,11);
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
INSERT INTO `Objects` VALUES (1,2,NULL,'/');
INSERT INTO `Objects` VALUES (2,3,NULL,'/features');
INSERT INTO `Objects` VALUES (3,4,NULL,'/blog');
INSERT INTO `Objects` VALUES (4,5,NULL,'/blog/post-1');
INSERT INTO `Objects` VALUES (5,5,NULL,'/blog/post-2');
INSERT INTO `Objects` VALUES (6,5,NULL,'/blog/post-3');
INSERT INTO `Objects` VALUES (7,6,NULL,'/contacts');
INSERT INTO `Objects` VALUES (8,7,NULL,NULL);
INSERT INTO `Objects` VALUES (9,7,NULL,NULL);
INSERT INTO `Objects` VALUES (10,7,NULL,NULL);
INSERT INTO `Objects` VALUES (11,7,NULL,NULL);
CREATE TABLE "Menus" (
    "Id" INTEGER NOT NULL CONSTRAINT "PK_Menu" PRIMARY KEY AUTOINCREMENT,
    "Code" TEXT,
    "NameId" INTEGER NOT NULL,
    CONSTRAINT "FK_Menu_Dictionary_NameId" FOREIGN KEY ("NameId") REFERENCES "Dictionaries" ("Id")
);
INSERT INTO `Menus` VALUES (1,'Main',1);
CREATE TABLE "MenuItems" (
	`Id`	INTEGER NOT NULL CONSTRAINT "PK_MenuItem" PRIMARY KEY AUTOINCREMENT,
	`MenuId`	INTEGER,
	`MenuItemId`	INTEGER,
	`NameId`	INTEGER NOT NULL,
	`Position`	INTEGER,
	`Url`	TEXT,
	CONSTRAINT "FK_MenuItem_Menu_MenuId" FOREIGN KEY(`MenuId`) REFERENCES "Menus" ( "Id" ),
	CONSTRAINT "FK_MenuItem_MenuItem_MenuItemId" FOREIGN KEY(`MenuItemId`) REFERENCES "MenuItems" ( "Id" ),
	CONSTRAINT "FK_MenuItem_Dictionary_NameId" FOREIGN KEY(`NameId`) REFERENCES "Dictionaries" ( "Id" )
);
INSERT INTO `MenuItems` VALUES (1,1,NULL,2,1,'/');
INSERT INTO `MenuItems` VALUES (2,1,NULL,3,2,'/features');
INSERT INTO `MenuItems` VALUES (3,1,NULL,4,3,'/blog');
INSERT INTO `MenuItems` VALUES (4,1,NULL,5,4,'/contacts');
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
	CONSTRAINT "FK_Member_DataType_PropertyDataTypeId" FOREIGN KEY(`PropertyDataTypeId`) REFERENCES "DataTypes" ( "Id" ),
	CONSTRAINT "FK_Member_Class_RelationClassId" FOREIGN KEY(`RelationClassId`) REFERENCES "Classes" ( "Id" )
);
INSERT INTO `Members` VALUES (1,1,'Title',1,1,NULL,'Title',100,1,NULL,1);
INSERT INTO `Members` VALUES (2,1,'MetaDescription',1,NULL,NULL,'META description',101,1,NULL,1);
INSERT INTO `Members` VALUES (3,1,'MetaKeywords',1,NULL,NULL,'META keywords',102,1,NULL,1);
INSERT INTO `Members` VALUES (4,2,'Content',1,NULL,NULL,'Content',1,3,NULL,NULL);
INSERT INTO `Members` VALUES (5,3,'Content',1,NULL,NULL,'Content',1,3,NULL,NULL);
INSERT INTO `Members` VALUES (6,3,'Features',NULL,NULL,NULL,'Features',50,NULL,7,2);
INSERT INTO `Members` VALUES (7,4,'Content',1,NULL,NULL,'Content',1,3,NULL,NULL);
INSERT INTO `Members` VALUES (8,5,'BlogPage',NULL,NULL,1,'Blog page',1,NULL,4,NULL);
INSERT INTO `Members` VALUES (9,5,'Image',NULL,NULL,NULL,'Image',2,4,NULL,NULL);
INSERT INTO `Members` VALUES (10,5,'Preview',1,NULL,NULL,'Preview',3,2,NULL,NULL);
INSERT INTO `Members` VALUES (11,5,'Content',1,NULL,NULL,'Content',4,3,NULL,NULL);
INSERT INTO `Members` VALUES (12,6,'Content',1,NULL,NULL,'Content',1,3,NULL,NULL);
INSERT INTO `Members` VALUES (13,7,'Name',1,1,NULL,'Name',1,1,NULL,NULL);
INSERT INTO `Members` VALUES (14,7,'State',1,NULL,NULL,'State',2,1,NULL,NULL);
CREATE TABLE "Localizations" (
    "Id" INTEGER NOT NULL CONSTRAINT "PK_Localization" PRIMARY KEY AUTOINCREMENT,
    "CultureId" INTEGER NOT NULL,
    "DictionaryId" INTEGER NOT NULL,
    "Value" TEXT,
    CONSTRAINT "FK_Localization_Culture_CultureId" FOREIGN KEY ("CultureId") REFERENCES "Cultures" ("Id"),
    CONSTRAINT "FK_Localization_Dictionary_DictionaryId" FOREIGN KEY ("DictionaryId") REFERENCES "Dictionaries" ("Id")
);
INSERT INTO `Localizations` VALUES (1,4,1,'Головне');
INSERT INTO `Localizations` VALUES (2,3,1,'Главное');
INSERT INTO `Localizations` VALUES (3,2,1,'Main');
INSERT INTO `Localizations` VALUES (4,4,2,'Головна');
INSERT INTO `Localizations` VALUES (5,3,2,'Главная');
INSERT INTO `Localizations` VALUES (6,2,2,'Home');
INSERT INTO `Localizations` VALUES (7,4,3,'Особливості');
INSERT INTO `Localizations` VALUES (8,3,3,'Особенности');
INSERT INTO `Localizations` VALUES (9,2,3,'Features');
INSERT INTO `Localizations` VALUES (10,4,4,'Блог');
INSERT INTO `Localizations` VALUES (11,3,4,'Блог');
INSERT INTO `Localizations` VALUES (12,2,4,'Blog');
INSERT INTO `Localizations` VALUES (13,4,5,'Контакти');
INSERT INTO `Localizations` VALUES (14,3,5,'Контакты');
INSERT INTO `Localizations` VALUES (15,2,5,'Contacts');
INSERT INTO `Localizations` VALUES (16,4,6,'Зворотний зв’язок');
INSERT INTO `Localizations` VALUES (17,3,6,'Обратная связь');
INSERT INTO `Localizations` VALUES (18,2,6,'Feedback');
INSERT INTO `Localizations` VALUES (19,4,7,'Ваше ім’я');
INSERT INTO `Localizations` VALUES (20,3,7,'Ваше имя');
INSERT INTO `Localizations` VALUES (21,2,7,'Your name');
INSERT INTO `Localizations` VALUES (22,4,8,'Ваш телефон');
INSERT INTO `Localizations` VALUES (23,3,8,'Ваш телефон');
INSERT INTO `Localizations` VALUES (24,2,8,'Your phone');
INSERT INTO `Localizations` VALUES (25,4,9,'Ваше повідомлення');
INSERT INTO `Localizations` VALUES (26,3,9,'Ваше сообщение');
INSERT INTO `Localizations` VALUES (27,2,9,'Your message');
INSERT INTO `Localizations` VALUES (28,2,10,'<p>This is a demo website running on Platformus CMS.</p>
<p>You can manage it using the <a href="/backend/">backend</a>.</p>
<p>Email: <a href="mailto:admin@platformus.net">admin@platformus.net</a></p>
<p>Password: admin</p>');
INSERT INTO `Localizations` VALUES (29,3,10,'<p>Это демонстрационный сайт, работающий на CMS Platforms.</p>
<p>Вы можете управлять им с помощью <a href="/backend/">бекенда</a>.</p>
<p>Электронная почта: <a href="mailto:admin@platformus.net">admin@platformus.net</a></p>
<p>Пароль: admin</p>');
INSERT INTO `Localizations` VALUES (30,4,10,'<p>Це демонстраційний веб-сайт, що працює на CMS Platformus.</p>
<p>Ви можете&nbsp;керувати ним&nbsp;за допомогою <a href="/backend/">бекенду</a>.</p>
<p>Електронна пошта: <a href="mailto:admin@platformus.net">admin@platformus.net</a></p>
<p>Пароль: admin</p>');
INSERT INTO `Localizations` VALUES (31,2,11,'Platformus CMS demo website');
INSERT INTO `Localizations` VALUES (32,3,11,'Демонстрационный веб-сайт на CMS Platforms');
INSERT INTO `Localizations` VALUES (33,4,11,'Демонстраційний веб-сайт на CMS Platformus');
INSERT INTO `Localizations` VALUES (34,2,12,'This is a demo website running on Platformus CMS.');
INSERT INTO `Localizations` VALUES (35,3,12,'Это демонстрационный веб-сайт, работающий на CMS Platforms.');
INSERT INTO `Localizations` VALUES (36,4,12,'Це демонстраційний веб-сайт, що працює на CMS Platformus.');
INSERT INTO `Localizations` VALUES (37,2,13,'CMS, Platformus');
INSERT INTO `Localizations` VALUES (38,3,13,'CMS, Platformus');
INSERT INTO `Localizations` VALUES (39,4,13,'CMS, Platformus');
INSERT INTO `Localizations` VALUES (40,2,14,'<p>The main features of the Platformus CMS:</p>');
INSERT INTO `Localizations` VALUES (41,3,14,'<p>Главные особенности CMS Platformus:</p>');
INSERT INTO `Localizations` VALUES (42,4,14,'<p>Основні особливості CMS Platformus:</p>');
INSERT INTO `Localizations` VALUES (43,2,15,'Features');
INSERT INTO `Localizations` VALUES (44,3,15,'Особенности');
INSERT INTO `Localizations` VALUES (45,4,15,'Особливості');
INSERT INTO `Localizations` VALUES (46,2,16,'');
INSERT INTO `Localizations` VALUES (47,3,16,'');
INSERT INTO `Localizations` VALUES (48,4,16,'');
INSERT INTO `Localizations` VALUES (49,2,17,'');
INSERT INTO `Localizations` VALUES (50,3,17,'');
INSERT INTO `Localizations` VALUES (51,4,17,'');
INSERT INTO `Localizations` VALUES (52,2,18,'<p>Only related objects demo.</p>');
INSERT INTO `Localizations` VALUES (53,3,18,'<p>Только для демонстрации связанных объектов.</p>');
INSERT INTO `Localizations` VALUES (54,4,18,'<p>Лише демонстрація пов&rsquo;язаних об&rsquo;єктів.</p>');
INSERT INTO `Localizations` VALUES (55,2,19,'Blog');
INSERT INTO `Localizations` VALUES (56,3,19,'Блог');
INSERT INTO `Localizations` VALUES (57,4,19,'Блог');
INSERT INTO `Localizations` VALUES (58,2,20,'');
INSERT INTO `Localizations` VALUES (59,3,20,'');
INSERT INTO `Localizations` VALUES (60,4,20,'');
INSERT INTO `Localizations` VALUES (61,2,21,'');
INSERT INTO `Localizations` VALUES (62,3,21,'');
INSERT INTO `Localizations` VALUES (63,4,21,'');
INSERT INTO `Localizations` VALUES (64,1,22,'/images/temp/img.png');
INSERT INTO `Localizations` VALUES (65,2,23,'Post 1');
INSERT INTO `Localizations` VALUES (66,3,23,'Пост 1');
INSERT INTO `Localizations` VALUES (67,4,23,'Пост 1');
INSERT INTO `Localizations` VALUES (68,2,24,'<p>Post 1 content</p>');
INSERT INTO `Localizations` VALUES (69,3,24,'<p>Содержимое поста 1</p>');
INSERT INTO `Localizations` VALUES (70,4,24,'<p>Зміст посту 1</p>');
INSERT INTO `Localizations` VALUES (71,2,25,'Post 1');
INSERT INTO `Localizations` VALUES (72,3,25,'Пост 1');
INSERT INTO `Localizations` VALUES (73,4,25,'Пост 1');
INSERT INTO `Localizations` VALUES (74,2,26,'');
INSERT INTO `Localizations` VALUES (75,3,26,'');
INSERT INTO `Localizations` VALUES (76,4,26,'');
INSERT INTO `Localizations` VALUES (77,2,27,'');
INSERT INTO `Localizations` VALUES (78,3,27,'');
INSERT INTO `Localizations` VALUES (79,1,28,'/images/temp/img.png');
INSERT INTO `Localizations` VALUES (80,2,29,'Post 2');
INSERT INTO `Localizations` VALUES (81,3,29,'Пост 2');
INSERT INTO `Localizations` VALUES (82,4,29,'Пост 2');
INSERT INTO `Localizations` VALUES (83,2,30,'<p>Post 2 content</p>');
INSERT INTO `Localizations` VALUES (84,3,30,'<p>Содержимое поста 2</p>');
INSERT INTO `Localizations` VALUES (85,4,30,'<p>Зміст посту 2</p>');
INSERT INTO `Localizations` VALUES (86,4,27,'');
INSERT INTO `Localizations` VALUES (87,2,31,'Post 2');
INSERT INTO `Localizations` VALUES (88,3,31,'Пост 2');
INSERT INTO `Localizations` VALUES (89,4,31,'Пост 2');
INSERT INTO `Localizations` VALUES (90,2,32,'');
INSERT INTO `Localizations` VALUES (91,3,32,'');
INSERT INTO `Localizations` VALUES (92,4,32,'');
INSERT INTO `Localizations` VALUES (93,2,33,'');
INSERT INTO `Localizations` VALUES (94,3,33,'');
INSERT INTO `Localizations` VALUES (95,4,33,'');
INSERT INTO `Localizations` VALUES (96,1,34,'/images/temp/img.png');
INSERT INTO `Localizations` VALUES (97,2,35,'Post 3');
INSERT INTO `Localizations` VALUES (98,3,35,'Пост 3');
INSERT INTO `Localizations` VALUES (99,4,35,'Пост 3');
INSERT INTO `Localizations` VALUES (100,2,36,'<p>Post 3 content</p>');
INSERT INTO `Localizations` VALUES (101,3,36,'<p>Содержимое поста 3</p>');
INSERT INTO `Localizations` VALUES (102,4,36,'<p>Зміст посту 3</p>');
INSERT INTO `Localizations` VALUES (103,2,37,'Post 3');
INSERT INTO `Localizations` VALUES (104,3,37,'Пост 3');
INSERT INTO `Localizations` VALUES (105,4,37,'Пост 3');
INSERT INTO `Localizations` VALUES (106,2,38,'');
INSERT INTO `Localizations` VALUES (107,3,38,'');
INSERT INTO `Localizations` VALUES (108,4,38,'');
INSERT INTO `Localizations` VALUES (109,2,39,'');
INSERT INTO `Localizations` VALUES (110,3,39,'');
INSERT INTO `Localizations` VALUES (111,4,39,'');
INSERT INTO `Localizations` VALUES (112,2,40,'<p>Website: <a href="http://platformus.net/">http://platformus.net/</a></p>
<p>Git: <a href="https://github.com/Platformus">https://github.com/Platformus</a></p>');
INSERT INTO `Localizations` VALUES (113,2,41,'Contacts');
INSERT INTO `Localizations` VALUES (114,3,41,'Контакты');
INSERT INTO `Localizations` VALUES (115,4,41,'Контакти');
INSERT INTO `Localizations` VALUES (116,2,42,'');
INSERT INTO `Localizations` VALUES (117,3,42,'');
INSERT INTO `Localizations` VALUES (118,4,42,'');
INSERT INTO `Localizations` VALUES (119,2,43,'');
INSERT INTO `Localizations` VALUES (120,3,43,'');
INSERT INTO `Localizations` VALUES (121,3,40,'<p>Веб-сайт: <a href="http://platformus.net/">http://platformus.net/</a></p>
<p>Git: <a href="https://github.com/Platformus">https://github.com/Platformus</a></p>');
INSERT INTO `Localizations` VALUES (122,4,40,'<p>Веб-сайт: <a href="http://platformus.net/">http://platformus.net/</a></p>
<p>Git: <a href="https://github.com/Platformus">https://github.com/Platformus</a></p>');
INSERT INTO `Localizations` VALUES (123,4,43,'');
INSERT INTO `Localizations` VALUES (124,2,44,'Modular structure');
INSERT INTO `Localizations` VALUES (125,3,44,'Модульная структура');
INSERT INTO `Localizations` VALUES (126,4,44,'Модульна структура');
INSERT INTO `Localizations` VALUES (127,2,45,'yes');
INSERT INTO `Localizations` VALUES (128,3,45,'да');
INSERT INTO `Localizations` VALUES (129,4,45,'так');
INSERT INTO `Localizations` VALUES (130,2,46,'User interface localization');
INSERT INTO `Localizations` VALUES (131,3,46,'Локализация пользовательского интерфейса');
INSERT INTO `Localizations` VALUES (132,4,46,'Локалізація інтерфейсу користувача');
INSERT INTO `Localizations` VALUES (133,2,47,'no');
INSERT INTO `Localizations` VALUES (134,3,47,'нет');
INSERT INTO `Localizations` VALUES (135,4,47,'ні');
INSERT INTO `Localizations` VALUES (136,2,48,'Content localization');
INSERT INTO `Localizations` VALUES (137,3,48,'Локализация контета');
INSERT INTO `Localizations` VALUES (138,4,48,'Локалізація контенту');
INSERT INTO `Localizations` VALUES (139,2,49,'yes');
INSERT INTO `Localizations` VALUES (140,3,49,'да');
INSERT INTO `Localizations` VALUES (141,4,49,'так');
INSERT INTO `Localizations` VALUES (142,2,50,'Flexible content management');
INSERT INTO `Localizations` VALUES (143,3,50,'Гибкое управление содержимым');
INSERT INTO `Localizations` VALUES (144,4,50,'Гнучке управління контентом');
INSERT INTO `Localizations` VALUES (145,2,51,'yes');
INSERT INTO `Localizations` VALUES (146,3,51,'да');
INSERT INTO `Localizations` VALUES (147,4,51,'так');
CREATE TABLE "Forms" (
    "Id" INTEGER NOT NULL CONSTRAINT "PK_Form" PRIMARY KEY AUTOINCREMENT,
    "Code" TEXT,
    "Email" TEXT,
    "NameId" INTEGER NOT NULL,
    CONSTRAINT "FK_Form_Dictionary_NameId" FOREIGN KEY ("NameId") REFERENCES "Dictionaries" ("Id")
);
INSERT INTO `Forms` VALUES (1,'Feedback','admin@platformus.net',6);
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
INSERT INTO `Fields` VALUES (1,1,1,7,1);
INSERT INTO `Fields` VALUES (2,1,1,8,2);
INSERT INTO `Fields` VALUES (3,2,1,9,3);
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
INSERT INTO `Dictionaries` VALUES (1);
INSERT INTO `Dictionaries` VALUES (2);
INSERT INTO `Dictionaries` VALUES (3);
INSERT INTO `Dictionaries` VALUES (4);
INSERT INTO `Dictionaries` VALUES (5);
INSERT INTO `Dictionaries` VALUES (6);
INSERT INTO `Dictionaries` VALUES (7);
INSERT INTO `Dictionaries` VALUES (8);
INSERT INTO `Dictionaries` VALUES (9);
INSERT INTO `Dictionaries` VALUES (10);
INSERT INTO `Dictionaries` VALUES (11);
INSERT INTO `Dictionaries` VALUES (12);
INSERT INTO `Dictionaries` VALUES (13);
INSERT INTO `Dictionaries` VALUES (14);
INSERT INTO `Dictionaries` VALUES (15);
INSERT INTO `Dictionaries` VALUES (16);
INSERT INTO `Dictionaries` VALUES (17);
INSERT INTO `Dictionaries` VALUES (18);
INSERT INTO `Dictionaries` VALUES (19);
INSERT INTO `Dictionaries` VALUES (20);
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
INSERT INTO `Dictionaries` VALUES (31);
INSERT INTO `Dictionaries` VALUES (32);
INSERT INTO `Dictionaries` VALUES (33);
INSERT INTO `Dictionaries` VALUES (34);
INSERT INTO `Dictionaries` VALUES (35);
INSERT INTO `Dictionaries` VALUES (36);
INSERT INTO `Dictionaries` VALUES (37);
INSERT INTO `Dictionaries` VALUES (38);
INSERT INTO `Dictionaries` VALUES (39);
INSERT INTO `Dictionaries` VALUES (40);
INSERT INTO `Dictionaries` VALUES (41);
INSERT INTO `Dictionaries` VALUES (42);
INSERT INTO `Dictionaries` VALUES (43);
INSERT INTO `Dictionaries` VALUES (44);
INSERT INTO `Dictionaries` VALUES (45);
INSERT INTO `Dictionaries` VALUES (46);
INSERT INTO `Dictionaries` VALUES (47);
INSERT INTO `Dictionaries` VALUES (48);
INSERT INTO `Dictionaries` VALUES (49);
INSERT INTO `Dictionaries` VALUES (50);
INSERT INTO `Dictionaries` VALUES (51);
CREATE TABLE "DataTypes" (
    "Id" INTEGER NOT NULL CONSTRAINT "PK_DataType" PRIMARY KEY AUTOINCREMENT,
    "JavaScriptEditorClassName" TEXT,
    "Name" TEXT,
    "Position" INTEGER
);
INSERT INTO `DataTypes` VALUES (1,'singleLinePlainText','Single line plain text',1);
INSERT INTO `DataTypes` VALUES (2,'multilinePlainText','Multiline plain text',2);
INSERT INTO `DataTypes` VALUES (3,'html','Html',3);
INSERT INTO `DataTypes` VALUES (4,'image','Image',4);
CREATE TABLE "DataSources" (
    "Id" INTEGER NOT NULL CONSTRAINT "PK_DataSource" PRIMARY KEY AUTOINCREMENT,
    "CSharpClassName" TEXT,
    "ClassId" INTEGER NOT NULL,
    "Code" TEXT,
    "Parameters" TEXT,
    CONSTRAINT "FK_DataSource_Class_ClassId" FOREIGN KEY ("ClassId") REFERENCES "Classes" ("Id")
);
INSERT INTO `DataSources` VALUES (1,'Platformus.Content.DataSources.PrimaryObjectsDataSource',3,'Features',NULL);
INSERT INTO `DataSources` VALUES (2,'Platformus.Content.DataSources.ForeignObjectsDataSource',4,'BlogPosts',NULL);
CREATE TABLE "Cultures" (
	`Id`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`Code`	TEXT,
	`Name`	TEXT,
	`IsNeutral`	INTEGER NOT NULL,
	`IsDefault`	INTEGER NOT NULL
);
INSERT INTO `Cultures` VALUES (1,'__','Neutral',1,0);
INSERT INTO `Cultures` VALUES (2,'en','English',0,1);
INSERT INTO `Cultures` VALUES (3,'ru','Русский',0,0);
INSERT INTO `Cultures` VALUES (4,'uk','Українська',0,0);
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
	`Code`	TEXT NOT NULL,
	`Name`	TEXT NOT NULL,
	`PluralizedName`	TEXT NOT NULL,
	`DefaultViewName`	TEXT,
	CONSTRAINT "FK_Class_Class_ClassId" FOREIGN KEY(`ClassId`) REFERENCES "Classes" ( "Id" )
);
INSERT INTO `Classes` VALUES (1,NULL,1,NULL,'BasePage','Base Page','Base Pages',NULL);
INSERT INTO `Classes` VALUES (2,1,NULL,1,'IndexPage','Index Page','Index Pages','Index');
INSERT INTO `Classes` VALUES (3,1,NULL,1,'FeaturesPage','Features Page','Features Pages','Features');
INSERT INTO `Classes` VALUES (4,1,NULL,1,'BlogPage','Blog Page','Blog Pages','Blog');
INSERT INTO `Classes` VALUES (5,1,NULL,1,'BlogPostPage','Blog Post Page','Blog Post Pages','BlogPost');
INSERT INTO `Classes` VALUES (6,1,NULL,1,'ContactsPage','Contacts Page','Contacts Pages','Contacts');
INSERT INTO `Classes` VALUES (7,NULL,NULL,NULL,'Feature','Feature','Features',NULL);
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
INSERT INTO `CachedObjects` VALUES (2,1,NULL,'[{"PropertyId":1,"MemberCode":"Content","Html":"<p>This is a demo website running on Platformus CMS.</p>\r\n<p>You can manage it using the <a href=\"/backend/\">backend</a>.</p>\r\n<p>Email: <a href=\"mailto:admin@platformus.net\">admin@platformus.net</a></p>\r\n<p>Password: admin</p>"},{"PropertyId":2,"MemberCode":"Title","Html":"Platformus CMS demo website"},{"PropertyId":3,"MemberCode":"MetaDescription","Html":"This is a demo website running on Platformus CMS."},{"PropertyId":4,"MemberCode":"MetaKeywords","Html":"CMS, Platformus"}]',2,'Index','/');
INSERT INTO `CachedObjects` VALUES (1,1,NULL,'[{"PropertyId":1,"MemberCode":"Content","Html":null},{"PropertyId":2,"MemberCode":"Title","Html":null},{"PropertyId":3,"MemberCode":"MetaDescription","Html":null},{"PropertyId":4,"MemberCode":"MetaKeywords","Html":null}]',2,'Index','/');
INSERT INTO `CachedObjects` VALUES (3,1,NULL,'[{"PropertyId":1,"MemberCode":"Content","Html":"<p>Это демонстрационный сайт, работающий на CMS Platforms.</p>\r\n<p>Вы можете управлять им с помощью <a href=\"/backend/\">бекенда</a>.</p>\r\n<p>Электронная почта: <a href=\"mailto:admin@platformus.net\">admin@platformus.net</a></p>\r\n<p>Пароль: admin</p>"},{"PropertyId":2,"MemberCode":"Title","Html":"Демонстрационный веб-сайт на CMS Platforms"},{"PropertyId":3,"MemberCode":"MetaDescription","Html":"Это демонстрационный веб-сайт, работающий на CMS Platforms."},{"PropertyId":4,"MemberCode":"MetaKeywords","Html":"CMS, Platformus"}]',2,'Index','/');
INSERT INTO `CachedObjects` VALUES (4,1,NULL,'[{"PropertyId":1,"MemberCode":"Content","Html":"<p>Це демонстраційний веб-сайт, що працює на CMS Platformus.</p>\r\n<p>Ви можете&nbsp;керувати ним&nbsp;за допомогою <a href=\"/backend/\">бекенду</a>.</p>\r\n<p>Електронна пошта: <a href=\"mailto:admin@platformus.net\">admin@platformus.net</a></p>\r\n<p>Пароль: admin</p>"},{"PropertyId":2,"MemberCode":"Title","Html":"Демонстраційний веб-сайт на CMS Platformus"},{"PropertyId":3,"MemberCode":"MetaDescription","Html":"Це демонстраційний веб-сайт, що працює на CMS Platformus."},{"PropertyId":4,"MemberCode":"MetaKeywords","Html":"CMS, Platformus"}]',2,'Index','/');
INSERT INTO `CachedObjects` VALUES (2,3,'[{"DataSourceId":2,"Code":"BlogPosts","CSharpClassName":"Platformus.Content.DataSources.ForeignObjectsDataSource","Parameters":null}]','[{"PropertyId":9,"MemberCode":"Content","Html":"<p>Only related objects demo.</p>"},{"PropertyId":10,"MemberCode":"Title","Html":"Blog"},{"PropertyId":11,"MemberCode":"MetaDescription","Html":""},{"PropertyId":12,"MemberCode":"MetaKeywords","Html":""}]',4,'Blog','/blog');
INSERT INTO `CachedObjects` VALUES (1,3,'[{"DataSourceId":2,"Code":"BlogPosts","CSharpClassName":"Platformus.Content.DataSources.ForeignObjectsDataSource","Parameters":null}]','[{"PropertyId":9,"MemberCode":"Content","Html":null},{"PropertyId":10,"MemberCode":"Title","Html":null},{"PropertyId":11,"MemberCode":"MetaDescription","Html":null},{"PropertyId":12,"MemberCode":"MetaKeywords","Html":null}]',4,'Blog','/blog');
INSERT INTO `CachedObjects` VALUES (3,3,'[{"DataSourceId":2,"Code":"BlogPosts","CSharpClassName":"Platformus.Content.DataSources.ForeignObjectsDataSource","Parameters":null}]','[{"PropertyId":9,"MemberCode":"Content","Html":"<p>Только для демонстрации связанных объектов.</p>"},{"PropertyId":10,"MemberCode":"Title","Html":"Блог"},{"PropertyId":11,"MemberCode":"MetaDescription","Html":""},{"PropertyId":12,"MemberCode":"MetaKeywords","Html":""}]',4,'Blog','/blog');
INSERT INTO `CachedObjects` VALUES (4,3,'[{"DataSourceId":2,"Code":"BlogPosts","CSharpClassName":"Platformus.Content.DataSources.ForeignObjectsDataSource","Parameters":null}]','[{"PropertyId":9,"MemberCode":"Content","Html":"<p>Лише демонстрація пов&rsquo;язаних об&rsquo;єктів.</p>"},{"PropertyId":10,"MemberCode":"Title","Html":"Блог"},{"PropertyId":11,"MemberCode":"MetaDescription","Html":""},{"PropertyId":12,"MemberCode":"MetaKeywords","Html":""}]',4,'Blog','/blog');
INSERT INTO `CachedObjects` VALUES (2,4,NULL,'[{"PropertyId":13,"MemberCode":"Image","Html":"/images/temp/img.png"},{"PropertyId":14,"MemberCode":"Preview","Html":"Post 1"},{"PropertyId":15,"MemberCode":"Content","Html":"<p>Post 1 content</p>"},{"PropertyId":16,"MemberCode":"Title","Html":"Post 1"},{"PropertyId":17,"MemberCode":"MetaDescription","Html":""},{"PropertyId":18,"MemberCode":"MetaKeywords","Html":""}]',5,'BlogPost','/blog/post-1');
INSERT INTO `CachedObjects` VALUES (1,4,NULL,'[{"PropertyId":13,"MemberCode":"Image","Html":"/images/temp/img.png"},{"PropertyId":14,"MemberCode":"Preview","Html":null},{"PropertyId":15,"MemberCode":"Content","Html":null},{"PropertyId":16,"MemberCode":"Title","Html":null},{"PropertyId":17,"MemberCode":"MetaDescription","Html":null},{"PropertyId":18,"MemberCode":"MetaKeywords","Html":null}]',5,'BlogPost','/blog/post-1');
INSERT INTO `CachedObjects` VALUES (3,4,NULL,'[{"PropertyId":13,"MemberCode":"Image","Html":"/images/temp/img.png"},{"PropertyId":14,"MemberCode":"Preview","Html":"Пост 1"},{"PropertyId":15,"MemberCode":"Content","Html":"<p>Содержимое поста 1</p>"},{"PropertyId":16,"MemberCode":"Title","Html":"Пост 1"},{"PropertyId":17,"MemberCode":"MetaDescription","Html":""},{"PropertyId":18,"MemberCode":"MetaKeywords","Html":""}]',5,'BlogPost','/blog/post-1');
INSERT INTO `CachedObjects` VALUES (4,4,NULL,'[{"PropertyId":13,"MemberCode":"Image","Html":"/images/temp/img.png"},{"PropertyId":14,"MemberCode":"Preview","Html":"Пост 1"},{"PropertyId":15,"MemberCode":"Content","Html":"<p>Зміст посту 1</p>"},{"PropertyId":16,"MemberCode":"Title","Html":"Пост 1"},{"PropertyId":17,"MemberCode":"MetaDescription","Html":""},{"PropertyId":18,"MemberCode":"MetaKeywords","Html":""}]',5,'BlogPost','/blog/post-1');
INSERT INTO `CachedObjects` VALUES (2,5,NULL,'[{"PropertyId":19,"MemberCode":"Image","Html":"/images/temp/img.png"},{"PropertyId":20,"MemberCode":"Preview","Html":"Post 2"},{"PropertyId":21,"MemberCode":"Content","Html":"<p>Post 2 content</p>"},{"PropertyId":22,"MemberCode":"Title","Html":"Post 2"},{"PropertyId":23,"MemberCode":"MetaDescription","Html":""},{"PropertyId":24,"MemberCode":"MetaKeywords","Html":""}]',5,'BlogPost','/blog/post-2');
INSERT INTO `CachedObjects` VALUES (1,5,NULL,'[{"PropertyId":19,"MemberCode":"Image","Html":"/images/temp/img.png"},{"PropertyId":20,"MemberCode":"Preview","Html":null},{"PropertyId":21,"MemberCode":"Content","Html":null},{"PropertyId":22,"MemberCode":"Title","Html":null},{"PropertyId":23,"MemberCode":"MetaDescription","Html":null},{"PropertyId":24,"MemberCode":"MetaKeywords","Html":null}]',5,'BlogPost','/blog/post-2');
INSERT INTO `CachedObjects` VALUES (3,5,NULL,'[{"PropertyId":19,"MemberCode":"Image","Html":"/images/temp/img.png"},{"PropertyId":20,"MemberCode":"Preview","Html":"Пост 2"},{"PropertyId":21,"MemberCode":"Content","Html":"<p>Содержимое поста 2</p>"},{"PropertyId":22,"MemberCode":"Title","Html":"Пост 2"},{"PropertyId":23,"MemberCode":"MetaDescription","Html":""},{"PropertyId":24,"MemberCode":"MetaKeywords","Html":""}]',5,'BlogPost','/blog/post-2');
INSERT INTO `CachedObjects` VALUES (4,5,NULL,'[{"PropertyId":19,"MemberCode":"Image","Html":"/images/temp/img.png"},{"PropertyId":20,"MemberCode":"Preview","Html":"Пост 2"},{"PropertyId":21,"MemberCode":"Content","Html":"<p>Зміст посту 2</p>"},{"PropertyId":22,"MemberCode":"Title","Html":"Пост 2"},{"PropertyId":23,"MemberCode":"MetaDescription","Html":""},{"PropertyId":24,"MemberCode":"MetaKeywords","Html":""}]',5,'BlogPost','/blog/post-2');
INSERT INTO `CachedObjects` VALUES (2,6,NULL,'[{"PropertyId":25,"MemberCode":"Image","Html":"/images/temp/img.png"},{"PropertyId":26,"MemberCode":"Preview","Html":"Post 3"},{"PropertyId":27,"MemberCode":"Content","Html":"<p>Post 3 content</p>"},{"PropertyId":28,"MemberCode":"Title","Html":"Post 3"},{"PropertyId":29,"MemberCode":"MetaDescription","Html":""},{"PropertyId":30,"MemberCode":"MetaKeywords","Html":""}]',5,'BlogPost','/blog/post-3');
INSERT INTO `CachedObjects` VALUES (1,6,NULL,'[{"PropertyId":25,"MemberCode":"Image","Html":"/images/temp/img.png"},{"PropertyId":26,"MemberCode":"Preview","Html":null},{"PropertyId":27,"MemberCode":"Content","Html":null},{"PropertyId":28,"MemberCode":"Title","Html":null},{"PropertyId":29,"MemberCode":"MetaDescription","Html":null},{"PropertyId":30,"MemberCode":"MetaKeywords","Html":null}]',5,'BlogPost','/blog/post-3');
INSERT INTO `CachedObjects` VALUES (3,6,NULL,'[{"PropertyId":25,"MemberCode":"Image","Html":"/images/temp/img.png"},{"PropertyId":26,"MemberCode":"Preview","Html":"Пост 3"},{"PropertyId":27,"MemberCode":"Content","Html":"<p>Содержимое поста 3</p>"},{"PropertyId":28,"MemberCode":"Title","Html":"Пост 3"},{"PropertyId":29,"MemberCode":"MetaDescription","Html":""},{"PropertyId":30,"MemberCode":"MetaKeywords","Html":""}]',5,'BlogPost','/blog/post-3');
INSERT INTO `CachedObjects` VALUES (4,6,NULL,'[{"PropertyId":25,"MemberCode":"Image","Html":"/images/temp/img.png"},{"PropertyId":26,"MemberCode":"Preview","Html":"Пост 3"},{"PropertyId":27,"MemberCode":"Content","Html":"<p>Зміст посту 3</p>"},{"PropertyId":28,"MemberCode":"Title","Html":"Пост 3"},{"PropertyId":29,"MemberCode":"MetaDescription","Html":""},{"PropertyId":30,"MemberCode":"MetaKeywords","Html":""}]',5,'BlogPost','/blog/post-3');
INSERT INTO `CachedObjects` VALUES (2,7,NULL,'[{"PropertyId":31,"MemberCode":"Content","Html":"<p>Website: <a href=\"http://platformus.net/\">http://platformus.net/</a></p>\r\n<p>Git: <a href=\"https://github.com/Platformus\">https://github.com/Platformus</a></p>"},{"PropertyId":32,"MemberCode":"Title","Html":"Contacts"},{"PropertyId":33,"MemberCode":"MetaDescription","Html":""},{"PropertyId":34,"MemberCode":"MetaKeywords","Html":""}]',6,'Contacts','/contacts');
INSERT INTO `CachedObjects` VALUES (1,7,NULL,'[{"PropertyId":31,"MemberCode":"Content","Html":null},{"PropertyId":32,"MemberCode":"Title","Html":null},{"PropertyId":33,"MemberCode":"MetaDescription","Html":null},{"PropertyId":34,"MemberCode":"MetaKeywords","Html":null}]',6,'Contacts','/contacts');
INSERT INTO `CachedObjects` VALUES (3,7,NULL,'[{"PropertyId":31,"MemberCode":"Content","Html":"<p>Веб-сайт: <a href=\"http://platformus.net/\">http://platformus.net/</a></p>\r\n<p>Git: <a href=\"https://github.com/Platformus\">https://github.com/Platformus</a></p>"},{"PropertyId":32,"MemberCode":"Title","Html":"Контакты"},{"PropertyId":33,"MemberCode":"MetaDescription","Html":""},{"PropertyId":34,"MemberCode":"MetaKeywords","Html":""}]',6,'Contacts','/contacts');
INSERT INTO `CachedObjects` VALUES (4,7,NULL,'[{"PropertyId":31,"MemberCode":"Content","Html":"<p>Веб-сайт: <a href=\"http://platformus.net/\">http://platformus.net/</a></p>\r\n<p>Git: <a href=\"https://github.com/Platformus\">https://github.com/Platformus</a></p>"},{"PropertyId":32,"MemberCode":"Title","Html":"Контакти"},{"PropertyId":33,"MemberCode":"MetaDescription","Html":""},{"PropertyId":34,"MemberCode":"MetaKeywords","Html":""}]',6,'Contacts','/contacts');
INSERT INTO `CachedObjects` VALUES (2,8,NULL,'[{"PropertyId":35,"MemberCode":"Name","Html":"Modular structure"},{"PropertyId":36,"MemberCode":"State","Html":"yes"}]',7,NULL,NULL);
INSERT INTO `CachedObjects` VALUES (1,8,NULL,'[{"PropertyId":35,"MemberCode":"Name","Html":null},{"PropertyId":36,"MemberCode":"State","Html":null}]',7,NULL,NULL);
INSERT INTO `CachedObjects` VALUES (3,8,NULL,'[{"PropertyId":35,"MemberCode":"Name","Html":"Модульная структура"},{"PropertyId":36,"MemberCode":"State","Html":"да"}]',7,NULL,NULL);
INSERT INTO `CachedObjects` VALUES (4,8,NULL,'[{"PropertyId":35,"MemberCode":"Name","Html":"Модульна структура"},{"PropertyId":36,"MemberCode":"State","Html":"так"}]',7,NULL,NULL);
INSERT INTO `CachedObjects` VALUES (2,9,NULL,'[{"PropertyId":37,"MemberCode":"Name","Html":"User interface localization"},{"PropertyId":38,"MemberCode":"State","Html":"no"}]',7,NULL,NULL);
INSERT INTO `CachedObjects` VALUES (1,9,NULL,'[{"PropertyId":37,"MemberCode":"Name","Html":null},{"PropertyId":38,"MemberCode":"State","Html":null}]',7,NULL,NULL);
INSERT INTO `CachedObjects` VALUES (3,9,NULL,'[{"PropertyId":37,"MemberCode":"Name","Html":"Локализация пользовательского интерфейса"},{"PropertyId":38,"MemberCode":"State","Html":"нет"}]',7,NULL,NULL);
INSERT INTO `CachedObjects` VALUES (4,9,NULL,'[{"PropertyId":37,"MemberCode":"Name","Html":"Локалізація інтерфейсу користувача"},{"PropertyId":38,"MemberCode":"State","Html":"ні"}]',7,NULL,NULL);
INSERT INTO `CachedObjects` VALUES (2,10,NULL,'[{"PropertyId":39,"MemberCode":"Name","Html":"Content localization"},{"PropertyId":40,"MemberCode":"State","Html":"yes"}]',7,NULL,NULL);
INSERT INTO `CachedObjects` VALUES (1,10,NULL,'[{"PropertyId":39,"MemberCode":"Name","Html":null},{"PropertyId":40,"MemberCode":"State","Html":null}]',7,NULL,NULL);
INSERT INTO `CachedObjects` VALUES (3,10,NULL,'[{"PropertyId":39,"MemberCode":"Name","Html":"Локализация контета"},{"PropertyId":40,"MemberCode":"State","Html":"да"}]',7,NULL,NULL);
INSERT INTO `CachedObjects` VALUES (4,10,NULL,'[{"PropertyId":39,"MemberCode":"Name","Html":"Локалізація контенту"},{"PropertyId":40,"MemberCode":"State","Html":"так"}]',7,NULL,NULL);
INSERT INTO `CachedObjects` VALUES (2,11,NULL,'[{"PropertyId":41,"MemberCode":"Name","Html":"Flexible content management"},{"PropertyId":42,"MemberCode":"State","Html":"yes"}]',7,NULL,NULL);
INSERT INTO `CachedObjects` VALUES (1,11,NULL,'[{"PropertyId":41,"MemberCode":"Name","Html":null},{"PropertyId":42,"MemberCode":"State","Html":null}]',7,NULL,NULL);
INSERT INTO `CachedObjects` VALUES (3,11,NULL,'[{"PropertyId":41,"MemberCode":"Name","Html":"Гибкое управление содержимым"},{"PropertyId":42,"MemberCode":"State","Html":"да"}]',7,NULL,NULL);
INSERT INTO `CachedObjects` VALUES (4,11,NULL,'[{"PropertyId":41,"MemberCode":"Name","Html":"Гнучке управління контентом"},{"PropertyId":42,"MemberCode":"State","Html":"так"}]',7,NULL,NULL);
INSERT INTO `CachedObjects` VALUES (2,2,'[{"DataSourceId":1,"Code":"Features","CSharpClassName":"Platformus.Content.DataSources.PrimaryObjectsDataSource","Parameters":null}]','[{"PropertyId":5,"MemberCode":"Content","Html":"<p>The main features of the Platformus CMS:</p>"},{"PropertyId":6,"MemberCode":"Title","Html":"Features"},{"PropertyId":7,"MemberCode":"MetaDescription","Html":""},{"PropertyId":8,"MemberCode":"MetaKeywords","Html":""}]',3,'Features','/features');
INSERT INTO `CachedObjects` VALUES (1,2,'[{"DataSourceId":1,"Code":"Features","CSharpClassName":"Platformus.Content.DataSources.PrimaryObjectsDataSource","Parameters":null}]','[{"PropertyId":5,"MemberCode":"Content","Html":null},{"PropertyId":6,"MemberCode":"Title","Html":null},{"PropertyId":7,"MemberCode":"MetaDescription","Html":null},{"PropertyId":8,"MemberCode":"MetaKeywords","Html":null}]',3,'Features','/features');
INSERT INTO `CachedObjects` VALUES (3,2,'[{"DataSourceId":1,"Code":"Features","CSharpClassName":"Platformus.Content.DataSources.PrimaryObjectsDataSource","Parameters":null}]','[{"PropertyId":5,"MemberCode":"Content","Html":"<p>Главные особенности CMS Platformus:</p>"},{"PropertyId":6,"MemberCode":"Title","Html":"Особенности"},{"PropertyId":7,"MemberCode":"MetaDescription","Html":""},{"PropertyId":8,"MemberCode":"MetaKeywords","Html":""}]',3,'Features','/features');
INSERT INTO `CachedObjects` VALUES (4,2,'[{"DataSourceId":1,"Code":"Features","CSharpClassName":"Platformus.Content.DataSources.PrimaryObjectsDataSource","Parameters":null}]','[{"PropertyId":5,"MemberCode":"Content","Html":"<p>Основні особливості CMS Platformus:</p>"},{"PropertyId":6,"MemberCode":"Title","Html":"Особливості"},{"PropertyId":7,"MemberCode":"MetaDescription","Html":""},{"PropertyId":8,"MemberCode":"MetaKeywords","Html":""}]',3,'Features','/features');
CREATE TABLE "CachedMenus" (
    "CultureId" INTEGER NOT NULL,
    "MenuId" INTEGER NOT NULL,
    "CachedMenuItems" TEXT,
    "Code" TEXT,
    CONSTRAINT "PK_CachedMenu" PRIMARY KEY ("CultureId", "MenuId"),
    CONSTRAINT "FK_CachedMenu_Culture_CultureId" FOREIGN KEY ("CultureId") REFERENCES "Cultures" ("Id"),
    CONSTRAINT "FK_CachedMenu_Menu_MenuId" FOREIGN KEY ("MenuId") REFERENCES "Menus" ("Id")
);
INSERT INTO `CachedMenus` VALUES (2,1,'[{"MenuItemId":1,"Name":"Home","Url":"/","Position":1,"CachedMenuItems":null},{"MenuItemId":2,"Name":"Features","Url":"/features","Position":2,"CachedMenuItems":null},{"MenuItemId":3,"Name":"Blog","Url":"/blog","Position":3,"CachedMenuItems":null},{"MenuItemId":4,"Name":"Contacts","Url":"/contacts","Position":4,"CachedMenuItems":null}]','Main');
INSERT INTO `CachedMenus` VALUES (1,1,'[{"MenuItemId":1,"Name":null,"Url":"/","Position":1,"CachedMenuItems":null},{"MenuItemId":2,"Name":null,"Url":"/features","Position":2,"CachedMenuItems":null},{"MenuItemId":3,"Name":null,"Url":"/blog","Position":3,"CachedMenuItems":null},{"MenuItemId":4,"Name":null,"Url":"/contacts","Position":4,"CachedMenuItems":null}]','Main');
INSERT INTO `CachedMenus` VALUES (3,1,'[{"MenuItemId":1,"Name":"Главная","Url":"/","Position":1,"CachedMenuItems":null},{"MenuItemId":2,"Name":"Особенности","Url":"/features","Position":2,"CachedMenuItems":null},{"MenuItemId":3,"Name":"Блог","Url":"/blog","Position":3,"CachedMenuItems":null},{"MenuItemId":4,"Name":"Контакты","Url":"/contacts","Position":4,"CachedMenuItems":null}]','Main');
INSERT INTO `CachedMenus` VALUES (4,1,'[{"MenuItemId":1,"Name":"Головна","Url":"/","Position":1,"CachedMenuItems":null},{"MenuItemId":2,"Name":"Особливості","Url":"/features","Position":2,"CachedMenuItems":null},{"MenuItemId":3,"Name":"Блог","Url":"/blog","Position":3,"CachedMenuItems":null},{"MenuItemId":4,"Name":"Контакти","Url":"/contacts","Position":4,"CachedMenuItems":null}]','Main');
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
COMMIT;
