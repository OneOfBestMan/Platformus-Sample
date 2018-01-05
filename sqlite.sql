BEGIN TRANSACTION;
CREATE TABLE "Variables" (
	"Id" INTEGER NOT NULL CONSTRAINT "PK_Variable" PRIMARY KEY AUTOINCREMENT,
	"ConfigurationId" INTEGER NOT NULL,
	"Code" TEXT NOT NULL,
	"Name" TEXT NOT NULL,
	"Value" TEXT NOT NULL,
	"Position" INTEGER,
	CONSTRAINT "FK_Variable_Configuration_ConfigurationId" FOREIGN KEY("ConfigurationId") REFERENCES "Configurations" ("Id")
);
INSERT INTO `Variables` (Id,ConfigurationId,Code,Name,Value,Position) VALUES (1,1,'SmtpServer','SMTP server','test',1);
INSERT INTO `Variables` (Id,ConfigurationId,Code,Name,Value,Position) VALUES (2,1,'SmtpPort','SMTP port','25',2);
INSERT INTO `Variables` (Id,ConfigurationId,Code,Name,Value,Position) VALUES (3,1,'SmtpLogin','SMTP login','test',3);
INSERT INTO `Variables` (Id,ConfigurationId,Code,Name,Value,Position) VALUES (4,1,'SmtpPassword','SMTP password','test',4);
INSERT INTO `Variables` (Id,ConfigurationId,Code,Name,Value,Position) VALUES (5,1,'SmtpSenderEmail','SMTP sender email','test',5);
INSERT INTO `Variables` (Id,ConfigurationId,Code,Name,Value,Position) VALUES (6,1,'SmtpSenderName','SMTP sender name','test',6);
INSERT INTO `Variables` (Id,ConfigurationId,Code,Name,Value,Position) VALUES (7,2,'SpecifyCultureInUrl','Specify culture in URL','yes',1);
CREATE TABLE "Users" (
	"Id" INTEGER NOT NULL CONSTRAINT "PK_User" PRIMARY KEY AUTOINCREMENT,
	"Name" TEXT NOT NULL,
	"Created" TEXT NOT NULL
);
INSERT INTO `Users` (Id,Name,Created) VALUES (1,'Administrator','2017-01-01 00:00:00.0000000');
CREATE TABLE "UserRoles" (
	"UserId" INTEGER NOT NULL,
	"RoleId" INTEGER NOT NULL,
	CONSTRAINT "PK_UserRole" PRIMARY KEY ("UserId", "RoleId"),
	CONSTRAINT "FK_UserRole_User_UserId" FOREIGN KEY ("UserId") REFERENCES "Users" ("Id"),
	CONSTRAINT "FK_UserRole_Role_RoleId" FOREIGN KEY ("RoleId") REFERENCES "Roles" ("Id")
);
INSERT INTO `UserRoles` (UserId,RoleId) VALUES (1,1);
INSERT INTO `UserRoles` (UserId,RoleId) VALUES (1,2);
CREATE TABLE "Tabs" (
	"Id" INTEGER NOT NULL CONSTRAINT "PK_Tab" PRIMARY KEY AUTOINCREMENT,
	"ClassId" INTEGER NOT NULL,
	"Name" TEXT NOT NULL,
	"Position" INTEGER,
	CONSTRAINT "FK_Tab_Class_ClassId" FOREIGN KEY("ClassId") REFERENCES "Classes" ("Id")
);
INSERT INTO `Tabs` (Id,ClassId,Name,Position) VALUES (1,1,'SEO',100);
INSERT INTO `Tabs` (Id,ClassId,Name,Position) VALUES (2,3,'Features',10);
CREATE TABLE "SerializedObjects" (
	"CultureId" INTEGER NOT NULL,
	"ObjectId" INTEGER NOT NULL,
	"ClassId" INTEGER NOT NULL,
	"UrlPropertyStringValue" TEXT,
	"SerializedProperties" TEXT,
	CONSTRAINT "PK_SerializedObject" PRIMARY KEY("CultureId","ObjectId"),
	CONSTRAINT "FK_SerializedObject_Culture_CultureId" FOREIGN KEY("CultureId") REFERENCES "Cultures"("Id"),
	CONSTRAINT "FK_SerializedObject_Object_ObjectId" FOREIGN KEY("ObjectId") REFERENCES "Objects"("Id"),
	CONSTRAINT "FK_SerializedObject_Class_ClassId" FOREIGN KEY("ClassId") REFERENCES "Classes"("Id")
);
INSERT INTO `SerializedObjects` (CultureId,ObjectId,ClassId,UrlPropertyStringValue,SerializedProperties) VALUES (2,1,2,'/','[{"Member":{"Code":"Content","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"<p>This is a demo website running on Platformus CMS.</p>\r\n<p>You can manage it using the <a href=\"/backend/\">backend</a>.</p>\r\n<p>Email: <a href=\"mailto:admin@platformus.net\">admin@platformus.net</a></p>\r\n<p>Password: admin</p>","DateTimeValue":null},{"Member":{"Code":"Url","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"/","DateTimeValue":null},{"Member":{"Code":"Title","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"Platformus CMS demo website","DateTimeValue":null},{"Member":{"Code":"MetaDescription","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"This is a demo website running on Platformus CMS.","DateTimeValue":null},{"Member":{"Code":"MetaKeywords","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"CMS, Platformus","DateTimeValue":null}]');
INSERT INTO `SerializedObjects` (CultureId,ObjectId,ClassId,UrlPropertyStringValue,SerializedProperties) VALUES (3,1,2,'/','[{"Member":{"Code":"Content","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"<p>Это демонстрационный сайт, работающий на CMS Platforms.</p>\r\n<p>Вы можете управлять им с помощью <a href=\"/backend/\">бекенда</a>.</p>\r\n<p>Электронная почта: <a href=\"mailto:admin@platformus.net\">admin@platformus.net</a></p>\r\n<p>Пароль: admin</p>","DateTimeValue":null},{"Member":{"Code":"Url","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"/","DateTimeValue":null},{"Member":{"Code":"Title","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"Демонстрационный веб-сайт на CMS Platforms","DateTimeValue":null},{"Member":{"Code":"MetaDescription","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"Это демонстрационный веб-сайт, работающий на CMS Platforms.","DateTimeValue":null},{"Member":{"Code":"MetaKeywords","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"CMS, Platformus","DateTimeValue":null}]');
INSERT INTO `SerializedObjects` (CultureId,ObjectId,ClassId,UrlPropertyStringValue,SerializedProperties) VALUES (4,1,2,'/','[{"Member":{"Code":"Content","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"<p>Це демонстраційний веб-сайт, що працює на CMS Platformus.</p>\r\n<p>Ви можете&nbsp;керувати ним&nbsp;за допомогою <a href=\"/backend/\">бекенду</a>.</p>\r\n<p>Електронна пошта: <a href=\"mailto:admin@platformus.net\">admin@platformus.net</a></p>\r\n<p>Пароль: admin</p>","DateTimeValue":null},{"Member":{"Code":"Url","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"/","DateTimeValue":null},{"Member":{"Code":"Title","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"Демонстраційний веб-сайт на CMS Platformus","DateTimeValue":null},{"Member":{"Code":"MetaDescription","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"Це демонстраційний веб-сайт, що працює на CMS Platformus.","DateTimeValue":null},{"Member":{"Code":"MetaKeywords","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"CMS, Platformus","DateTimeValue":null}]');
INSERT INTO `SerializedObjects` (CultureId,ObjectId,ClassId,UrlPropertyStringValue,SerializedProperties) VALUES (2,2,2,'/blog','[{"Member":{"Code":"Content","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"<p>Blog posts.</p>","DateTimeValue":null},{"Member":{"Code":"Url","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"/blog","DateTimeValue":null},{"Member":{"Code":"Title","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"Blog","DateTimeValue":null},{"Member":{"Code":"MetaDescription","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"","DateTimeValue":null},{"Member":{"Code":"MetaKeywords","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"","DateTimeValue":null}]');
INSERT INTO `SerializedObjects` (CultureId,ObjectId,ClassId,UrlPropertyStringValue,SerializedProperties) VALUES (3,2,2,'/blog','[{"Member":{"Code":"Content","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"<p>Посты блога.</p>","DateTimeValue":null},{"Member":{"Code":"Url","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"/blog","DateTimeValue":null},{"Member":{"Code":"Title","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"Блог","DateTimeValue":null},{"Member":{"Code":"MetaDescription","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"","DateTimeValue":null},{"Member":{"Code":"MetaKeywords","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"","DateTimeValue":null}]');
INSERT INTO `SerializedObjects` (CultureId,ObjectId,ClassId,UrlPropertyStringValue,SerializedProperties) VALUES (4,2,2,'/blog','[{"Member":{"Code":"Content","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"<p>Пости блогу:</p>","DateTimeValue":null},{"Member":{"Code":"Url","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"/blog","DateTimeValue":null},{"Member":{"Code":"Title","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"Блог","DateTimeValue":null},{"Member":{"Code":"MetaDescription","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"","DateTimeValue":null},{"Member":{"Code":"MetaKeywords","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"","DateTimeValue":null}]');
INSERT INTO `SerializedObjects` (CultureId,ObjectId,ClassId,UrlPropertyStringValue,SerializedProperties) VALUES (2,3,2,'/contacts','[{"Member":{"Code":"Content","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"<p>Website: <a href=\"http://platformus.net/\">http://platformus.net/</a></p>\r\n<p>Git: <a href=\"https://github.com/Platformus\">https://github.com/Platformus</a></p>","DateTimeValue":null},{"Member":{"Code":"Url","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"/contacts","DateTimeValue":null},{"Member":{"Code":"Title","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"Contacts","DateTimeValue":null},{"Member":{"Code":"MetaDescription","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"","DateTimeValue":null},{"Member":{"Code":"MetaKeywords","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"","DateTimeValue":null}]');
INSERT INTO `SerializedObjects` (CultureId,ObjectId,ClassId,UrlPropertyStringValue,SerializedProperties) VALUES (3,3,2,'/contacts','[{"Member":{"Code":"Content","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"<p>Веб-сайт: <a href=\"http://platformus.net/\">http://platformus.net/</a></p>\r\n<p>Git: <a href=\"https://github.com/Platformus\">https://github.com/Platformus</a></p>","DateTimeValue":null},{"Member":{"Code":"Url","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"/contacts","DateTimeValue":null},{"Member":{"Code":"Title","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"Контакты","DateTimeValue":null},{"Member":{"Code":"MetaDescription","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"","DateTimeValue":null},{"Member":{"Code":"MetaKeywords","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"","DateTimeValue":null}]');
INSERT INTO `SerializedObjects` (CultureId,ObjectId,ClassId,UrlPropertyStringValue,SerializedProperties) VALUES (4,3,2,'/contacts','[{"Member":{"Code":"Content","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"<p>Веб-сайт: <a href=\"http://platformus.net/\">http://platformus.net/</a></p>\r\n<p>Git: <a href=\"https://github.com/Platformus\">https://github.com/Platformus</a></p>","DateTimeValue":null},{"Member":{"Code":"Url","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"/contacts","DateTimeValue":null},{"Member":{"Code":"Title","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"Контакти","DateTimeValue":null},{"Member":{"Code":"MetaDescription","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"","DateTimeValue":null},{"Member":{"Code":"MetaKeywords","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"","DateTimeValue":null}]');
INSERT INTO `SerializedObjects` (CultureId,ObjectId,ClassId,UrlPropertyStringValue,SerializedProperties) VALUES (2,4,5,NULL,'[{"Member":{"Code":"Name","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"Modular structure","DateTimeValue":null},{"Member":{"Code":"State","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"yes","DateTimeValue":null}]');
INSERT INTO `SerializedObjects` (CultureId,ObjectId,ClassId,UrlPropertyStringValue,SerializedProperties) VALUES (3,4,5,NULL,'[{"Member":{"Code":"Name","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"Модульная структура","DateTimeValue":null},{"Member":{"Code":"State","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"да","DateTimeValue":null}]');
INSERT INTO `SerializedObjects` (CultureId,ObjectId,ClassId,UrlPropertyStringValue,SerializedProperties) VALUES (4,4,5,NULL,'[{"Member":{"Code":"Name","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"Модульна структура","DateTimeValue":null},{"Member":{"Code":"State","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"так","DateTimeValue":null}]');
INSERT INTO `SerializedObjects` (CultureId,ObjectId,ClassId,UrlPropertyStringValue,SerializedProperties) VALUES (2,5,5,NULL,'[{"Member":{"Code":"Name","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"User interface localization","DateTimeValue":null},{"Member":{"Code":"State","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"yes","DateTimeValue":null}]');
INSERT INTO `SerializedObjects` (CultureId,ObjectId,ClassId,UrlPropertyStringValue,SerializedProperties) VALUES (3,5,5,NULL,'[{"Member":{"Code":"Name","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"Локализация пользовательского интерфейса","DateTimeValue":null},{"Member":{"Code":"State","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"да","DateTimeValue":null}]');
INSERT INTO `SerializedObjects` (CultureId,ObjectId,ClassId,UrlPropertyStringValue,SerializedProperties) VALUES (4,5,5,NULL,'[{"Member":{"Code":"Name","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"Локалізація інтерфейсу користувача","DateTimeValue":null},{"Member":{"Code":"State","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"так","DateTimeValue":null}]');
INSERT INTO `SerializedObjects` (CultureId,ObjectId,ClassId,UrlPropertyStringValue,SerializedProperties) VALUES (2,6,5,NULL,'[{"Member":{"Code":"Name","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"Content localization","DateTimeValue":null},{"Member":{"Code":"State","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"yes","DateTimeValue":null}]');
INSERT INTO `SerializedObjects` (CultureId,ObjectId,ClassId,UrlPropertyStringValue,SerializedProperties) VALUES (3,6,5,NULL,'[{"Member":{"Code":"Name","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"Локализация контета","DateTimeValue":null},{"Member":{"Code":"State","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"да","DateTimeValue":null}]');
INSERT INTO `SerializedObjects` (CultureId,ObjectId,ClassId,UrlPropertyStringValue,SerializedProperties) VALUES (4,6,5,NULL,'[{"Member":{"Code":"Name","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"Локалізація контенту","DateTimeValue":null},{"Member":{"Code":"State","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"так","DateTimeValue":null}]');
INSERT INTO `SerializedObjects` (CultureId,ObjectId,ClassId,UrlPropertyStringValue,SerializedProperties) VALUES (2,7,5,NULL,'[{"Member":{"Code":"Name","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"Flexible content management","DateTimeValue":null},{"Member":{"Code":"State","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"yes","DateTimeValue":null}]');
INSERT INTO `SerializedObjects` (CultureId,ObjectId,ClassId,UrlPropertyStringValue,SerializedProperties) VALUES (3,7,5,NULL,'[{"Member":{"Code":"Name","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"Гибкое управление содержимым","DateTimeValue":null},{"Member":{"Code":"State","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"да","DateTimeValue":null}]');
INSERT INTO `SerializedObjects` (CultureId,ObjectId,ClassId,UrlPropertyStringValue,SerializedProperties) VALUES (4,7,5,NULL,'[{"Member":{"Code":"Name","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"Гнучке управління контентом","DateTimeValue":null},{"Member":{"Code":"State","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"так","DateTimeValue":null}]');
INSERT INTO `SerializedObjects` (CultureId,ObjectId,ClassId,UrlPropertyStringValue,SerializedProperties) VALUES (2,8,3,'/features','[{"Member":{"Code":"Content","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"<p>The main features of the Platformus CMS:</p>","DateTimeValue":null},{"Member":{"Code":"Url","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"/features","DateTimeValue":null},{"Member":{"Code":"Title","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"Features","DateTimeValue":null},{"Member":{"Code":"MetaDescription","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"","DateTimeValue":null},{"Member":{"Code":"MetaKeywords","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"","DateTimeValue":null}]');
INSERT INTO `SerializedObjects` (CultureId,ObjectId,ClassId,UrlPropertyStringValue,SerializedProperties) VALUES (3,8,3,'/features','[{"Member":{"Code":"Content","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"<p>Главные особенности CMS Platformus:</p>","DateTimeValue":null},{"Member":{"Code":"Url","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"/features","DateTimeValue":null},{"Member":{"Code":"Title","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"Особенности","DateTimeValue":null},{"Member":{"Code":"MetaDescription","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"","DateTimeValue":null},{"Member":{"Code":"MetaKeywords","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"","DateTimeValue":null}]');
INSERT INTO `SerializedObjects` (CultureId,ObjectId,ClassId,UrlPropertyStringValue,SerializedProperties) VALUES (4,8,3,'/features','[{"Member":{"Code":"Content","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"<p>Основні особливості CMS Platformus:</p>","DateTimeValue":null},{"Member":{"Code":"Url","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"/features","DateTimeValue":null},{"Member":{"Code":"Title","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"Особливості","DateTimeValue":null},{"Member":{"Code":"MetaDescription","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"","DateTimeValue":null},{"Member":{"Code":"MetaKeywords","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"","DateTimeValue":null}]');
INSERT INTO `SerializedObjects` (CultureId,ObjectId,ClassId,UrlPropertyStringValue,SerializedProperties) VALUES (2,9,4,'/blog/post-1','[{"Member":{"Code":"Image","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"/images/objects/img.png","DateTimeValue":null},{"Member":{"Code":"Preview","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"<p>Post 1</p>","DateTimeValue":null},{"Member":{"Code":"Content","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"<p>Post 1 content</p>","DateTimeValue":null},{"Member":{"Code":"Created","PropertyDataTypeStorageDataType":"datetime"},"IntegerValue":null,"DecimalValue":null,"StringValue":null,"DateTimeValue":"2017-05-01T00:00:00"},{"Member":{"Code":"Url","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"/blog/post-1","DateTimeValue":null},{"Member":{"Code":"Title","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"Post 1","DateTimeValue":null},{"Member":{"Code":"MetaDescription","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"","DateTimeValue":null},{"Member":{"Code":"MetaKeywords","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"","DateTimeValue":null}]');
INSERT INTO `SerializedObjects` (CultureId,ObjectId,ClassId,UrlPropertyStringValue,SerializedProperties) VALUES (3,9,4,'/blog/post-1','[{"Member":{"Code":"Image","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"/images/objects/img.png","DateTimeValue":null},{"Member":{"Code":"Preview","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"<p>Пост 1</p>","DateTimeValue":null},{"Member":{"Code":"Content","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"<p>Содержимое поста 1</p>","DateTimeValue":null},{"Member":{"Code":"Created","PropertyDataTypeStorageDataType":"datetime"},"IntegerValue":null,"DecimalValue":null,"StringValue":null,"DateTimeValue":"2017-05-01T00:00:00"},{"Member":{"Code":"Url","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"/blog/post-1","DateTimeValue":null},{"Member":{"Code":"Title","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"Пост 1","DateTimeValue":null},{"Member":{"Code":"MetaDescription","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"","DateTimeValue":null},{"Member":{"Code":"MetaKeywords","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"","DateTimeValue":null}]');
INSERT INTO `SerializedObjects` (CultureId,ObjectId,ClassId,UrlPropertyStringValue,SerializedProperties) VALUES (4,9,4,'/blog/post-1','[{"Member":{"Code":"Image","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"/images/objects/img.png","DateTimeValue":null},{"Member":{"Code":"Preview","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"<p>Пост 1</p>","DateTimeValue":null},{"Member":{"Code":"Content","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"<p>Зміст посту 1</p>","DateTimeValue":null},{"Member":{"Code":"Created","PropertyDataTypeStorageDataType":"datetime"},"IntegerValue":null,"DecimalValue":null,"StringValue":null,"DateTimeValue":"2017-05-01T00:00:00"},{"Member":{"Code":"Url","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"/blog/post-1","DateTimeValue":null},{"Member":{"Code":"Title","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"Пост 1","DateTimeValue":null},{"Member":{"Code":"MetaDescription","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"","DateTimeValue":null},{"Member":{"Code":"MetaKeywords","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"","DateTimeValue":null}]');
INSERT INTO `SerializedObjects` (CultureId,ObjectId,ClassId,UrlPropertyStringValue,SerializedProperties) VALUES (2,10,4,'/blog/post-2','[{"Member":{"Code":"Image","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"/images/objects/img.png","DateTimeValue":null},{"Member":{"Code":"Preview","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"<p>Post 2</p>","DateTimeValue":null},{"Member":{"Code":"Content","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"<p>Post 2 content</p>","DateTimeValue":null},{"Member":{"Code":"Created","PropertyDataTypeStorageDataType":"datetime"},"IntegerValue":null,"DecimalValue":null,"StringValue":null,"DateTimeValue":"2017-05-02T00:00:00"},{"Member":{"Code":"Url","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"/blog/post-2","DateTimeValue":null},{"Member":{"Code":"Title","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"Post 2","DateTimeValue":null},{"Member":{"Code":"MetaDescription","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"","DateTimeValue":null},{"Member":{"Code":"MetaKeywords","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"","DateTimeValue":null}]');
INSERT INTO `SerializedObjects` (CultureId,ObjectId,ClassId,UrlPropertyStringValue,SerializedProperties) VALUES (3,10,4,'/blog/post-2','[{"Member":{"Code":"Image","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"/images/objects/img.png","DateTimeValue":null},{"Member":{"Code":"Preview","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"<p>Пост 2</p>","DateTimeValue":null},{"Member":{"Code":"Content","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"<p>Содержимое поста 2</p>","DateTimeValue":null},{"Member":{"Code":"Created","PropertyDataTypeStorageDataType":"datetime"},"IntegerValue":null,"DecimalValue":null,"StringValue":null,"DateTimeValue":"2017-05-02T00:00:00"},{"Member":{"Code":"Url","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"/blog/post-2","DateTimeValue":null},{"Member":{"Code":"Title","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"Пост 2","DateTimeValue":null},{"Member":{"Code":"MetaDescription","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"","DateTimeValue":null},{"Member":{"Code":"MetaKeywords","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"","DateTimeValue":null}]');
INSERT INTO `SerializedObjects` (CultureId,ObjectId,ClassId,UrlPropertyStringValue,SerializedProperties) VALUES (4,10,4,'/blog/post-2','[{"Member":{"Code":"Image","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"/images/objects/img.png","DateTimeValue":null},{"Member":{"Code":"Preview","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"<p>Пост 2</p>","DateTimeValue":null},{"Member":{"Code":"Content","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"<p>Зміст посту 2</p>","DateTimeValue":null},{"Member":{"Code":"Created","PropertyDataTypeStorageDataType":"datetime"},"IntegerValue":null,"DecimalValue":null,"StringValue":null,"DateTimeValue":"2017-05-02T00:00:00"},{"Member":{"Code":"Url","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"/blog/post-2","DateTimeValue":null},{"Member":{"Code":"Title","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"Пост 2","DateTimeValue":null},{"Member":{"Code":"MetaDescription","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"","DateTimeValue":null},{"Member":{"Code":"MetaKeywords","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"","DateTimeValue":null}]');
INSERT INTO `SerializedObjects` (CultureId,ObjectId,ClassId,UrlPropertyStringValue,SerializedProperties) VALUES (2,11,4,'/blog/post-3','[{"Member":{"Code":"Image","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"/images/objects/img.png","DateTimeValue":null},{"Member":{"Code":"Preview","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"<p>Post 3</p>","DateTimeValue":null},{"Member":{"Code":"Content","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"<p>Post 3 content</p>","DateTimeValue":null},{"Member":{"Code":"Created","PropertyDataTypeStorageDataType":"datetime"},"IntegerValue":null,"DecimalValue":null,"StringValue":null,"DateTimeValue":"2017-05-03T00:00:00"},{"Member":{"Code":"Url","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"/blog/post-3","DateTimeValue":null},{"Member":{"Code":"Title","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"Post 3","DateTimeValue":null},{"Member":{"Code":"MetaDescription","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"","DateTimeValue":null},{"Member":{"Code":"MetaKeywords","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"","DateTimeValue":null}]');
INSERT INTO `SerializedObjects` (CultureId,ObjectId,ClassId,UrlPropertyStringValue,SerializedProperties) VALUES (3,11,4,'/blog/post-3','[{"Member":{"Code":"Image","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"/images/objects/img.png","DateTimeValue":null},{"Member":{"Code":"Preview","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"<p>Пост 3</p>","DateTimeValue":null},{"Member":{"Code":"Content","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"<p>Содержимое поста 3</p>","DateTimeValue":null},{"Member":{"Code":"Created","PropertyDataTypeStorageDataType":"datetime"},"IntegerValue":null,"DecimalValue":null,"StringValue":null,"DateTimeValue":"2017-05-03T00:00:00"},{"Member":{"Code":"Url","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"/blog/post-3","DateTimeValue":null},{"Member":{"Code":"Title","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"Пост 3","DateTimeValue":null},{"Member":{"Code":"MetaDescription","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"","DateTimeValue":null},{"Member":{"Code":"MetaKeywords","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"","DateTimeValue":null}]');
INSERT INTO `SerializedObjects` (CultureId,ObjectId,ClassId,UrlPropertyStringValue,SerializedProperties) VALUES (4,11,4,'/blog/post-3','[{"Member":{"Code":"Image","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"/images/objects/img.png","DateTimeValue":null},{"Member":{"Code":"Preview","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"<p>Пост 3</p>","DateTimeValue":null},{"Member":{"Code":"Content","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"<p>Зміст посту 3</p>","DateTimeValue":null},{"Member":{"Code":"Created","PropertyDataTypeStorageDataType":"datetime"},"IntegerValue":null,"DecimalValue":null,"StringValue":null,"DateTimeValue":"2017-05-03T00:00:00"},{"Member":{"Code":"Url","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"/blog/post-3","DateTimeValue":null},{"Member":{"Code":"Title","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"Пост 3","DateTimeValue":null},{"Member":{"Code":"MetaDescription","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"","DateTimeValue":null},{"Member":{"Code":"MetaKeywords","PropertyDataTypeStorageDataType":"string"},"IntegerValue":null,"DecimalValue":null,"StringValue":"","DateTimeValue":null}]');
CREATE TABLE "SerializedMenus" (
	"CultureId" INTEGER NOT NULL,
	"MenuId" INTEGER NOT NULL,
	"Code" TEXT NOT NULL,
	"SerializedMenuItems" TEXT,
	CONSTRAINT "PK_SerializedMenu" PRIMARY KEY("CultureId","MenuId"),
	CONSTRAINT "FK_SerializedMenu_Culture_CultureId" FOREIGN KEY("CultureId") REFERENCES "Cultures"("Id"),
	CONSTRAINT "FK_SerializedMenu_Menu_MenuId" FOREIGN KEY("MenuId") REFERENCES "Menus"("Id")
);
INSERT INTO `SerializedMenus` (CultureId,MenuId,Code,SerializedMenuItems) VALUES (2,1,'Main','[{"MenuItemId":1,"Name":"Home","Url":"/","Position":1,"SerializedMenuItems":null},{"MenuItemId":2,"Name":"Features","Url":"/features","Position":2,"SerializedMenuItems":null},{"MenuItemId":3,"Name":"Blog","Url":"/blog","Position":3,"SerializedMenuItems":null},{"MenuItemId":4,"Name":"Contacts","Url":"/contacts","Position":4,"SerializedMenuItems":null}]');
INSERT INTO `SerializedMenus` (CultureId,MenuId,Code,SerializedMenuItems) VALUES (3,1,'Main','[{"MenuItemId":1,"Name":"Главная","Url":"/","Position":1,"SerializedMenuItems":null},{"MenuItemId":2,"Name":"Особенности","Url":"/features","Position":2,"SerializedMenuItems":null},{"MenuItemId":3,"Name":"Блог","Url":"/blog","Position":3,"SerializedMenuItems":null},{"MenuItemId":4,"Name":"Контакты","Url":"/contacts","Position":4,"SerializedMenuItems":null}]');
INSERT INTO `SerializedMenus` (CultureId,MenuId,Code,SerializedMenuItems) VALUES (4,1,'Main','[{"MenuItemId":1,"Name":"Головна","Url":"/","Position":1,"SerializedMenuItems":null},{"MenuItemId":2,"Name":"Особливості","Url":"/features","Position":2,"SerializedMenuItems":null},{"MenuItemId":3,"Name":"Блог","Url":"/blog","Position":3,"SerializedMenuItems":null},{"MenuItemId":4,"Name":"Контакти","Url":"/contacts","Position":4,"SerializedMenuItems":null}]');
CREATE TABLE "SerializedForms" (
	"CultureId" INTEGER NOT NULL,
	"FormId" INTEGER NOT NULL,
	"Code" TEXT NOT NULL,
	"Name" TEXT NOT NULL,
	"SerializedFields" TEXT,
	CONSTRAINT "PK_SerializedForm" PRIMARY KEY("CultureId","FormId"),
	CONSTRAINT "FK_SerializedForm_Culture_CultureId" FOREIGN KEY("CultureId") REFERENCES "Cultures"("Id"),
	CONSTRAINT "FK_SerializedForm_Form_FormId" FOREIGN KEY("FormId") REFERENCES "Forms"("Id")
);
INSERT INTO `SerializedForms` (CultureId,FormId,Code,Name,SerializedFields) VALUES (2,1,'Feedback','Feedback','[{"FieldId":1,"FieldTypeCode":"TextBox","Code":"Name","Name":"Your name","Position":1,"SerializedFieldOptions":null},{"FieldId":2,"FieldTypeCode":"TextBox","Code":"Phone","Name":"Your phone","Position":2,"SerializedFieldOptions":null},{"FieldId":3,"FieldTypeCode":"TextArea","Code":"Message","Name":"Your message","Position":3,"SerializedFieldOptions":null}]');
INSERT INTO `SerializedForms` (CultureId,FormId,Code,Name,SerializedFields) VALUES (3,1,'Feedback','Обратная связь','[{"FieldId":1,"FieldTypeCode":"TextBox","Code":"Name","Name":"Ваше имя","Position":1,"SerializedFieldOptions":null},{"FieldId":2,"FieldTypeCode":"TextBox","Code":"Phone","Name":"Ваш телефон","Position":2,"SerializedFieldOptions":null},{"FieldId":3,"FieldTypeCode":"TextArea","Code":"Message","Name":"Ваше сообщение","Position":3,"SerializedFieldOptions":null}]');
INSERT INTO `SerializedForms` (CultureId,FormId,Code,Name,SerializedFields) VALUES (4,1,'Feedback','Зворотний зв’язок','[{"FieldId":1,"FieldTypeCode":"TextBox","Code":"Name","Name":"Ваше ім’я","Position":1,"SerializedFieldOptions":null},{"FieldId":2,"FieldTypeCode":"TextBox","Code":"Phone","Name":"Ваш телефон","Position":2,"SerializedFieldOptions":null},{"FieldId":3,"FieldTypeCode":"TextArea","Code":"Message","Name":"Ваше повідомлення","Position":3,"SerializedFieldOptions":null}]');
CREATE TABLE "Roles" (
	"Id" INTEGER NOT NULL CONSTRAINT "PK_Role" PRIMARY KEY AUTOINCREMENT,
	"Code" TEXT NOT NULL,
	"Name" TEXT NOT NULL,
	"Position" INTEGER
);
INSERT INTO `Roles` (Id,Code,Name,Position) VALUES (1,'Administrator','Administrator',100);
INSERT INTO `Roles` (Id,Code,Name,Position) VALUES (2,'ApplicationOwner','Application owner',200);
INSERT INTO `Roles` (Id,Code,Name,Position) VALUES (3,'ContentManager','Content manager',300);
CREATE TABLE "RolePermissions" (
	"RoleId" INTEGER NOT NULL,
	"PermissionId" INTEGER NOT NULL,
	CONSTRAINT "PK_RolePermission" PRIMARY KEY ("RoleId", "PermissionId"),
	CONSTRAINT "FK_RolePermission_Role_RoleId" FOREIGN KEY ("RoleId") REFERENCES "Roles" ("Id"),
	CONSTRAINT "FK_RolePermission_Permission_PermissionId" FOREIGN KEY ("PermissionId") REFERENCES "Permissions" ("Id")
);
INSERT INTO `RolePermissions` (RoleId,PermissionId) VALUES (1,1);
INSERT INTO `RolePermissions` (RoleId,PermissionId) VALUES (2,2);
INSERT INTO `RolePermissions` (RoleId,PermissionId) VALUES (3,7);
INSERT INTO `RolePermissions` (RoleId,PermissionId) VALUES (3,9);
INSERT INTO `RolePermissions` (RoleId,PermissionId) VALUES (3,13);
INSERT INTO `RolePermissions` (RoleId,PermissionId) VALUES (3,14);
CREATE TABLE "Relations" (
	"Id" INTEGER NOT NULL CONSTRAINT "PK_Relation" PRIMARY KEY AUTOINCREMENT,
	"MemberId" INTEGER NOT NULL,
	"PrimaryId" INTEGER NOT NULL,
	"ForeignId" INTEGER NOT NULL,
	CONSTRAINT "FK_Relation_Member_MemberId" FOREIGN KEY ("MemberId") REFERENCES "Members" ("Id"),
	CONSTRAINT "FK_Relation_Object_PrimaryId" FOREIGN KEY ("PrimaryId") REFERENCES "Objects" ("Id"),
	CONSTRAINT "FK_Relation_Object_ForeignId" FOREIGN KEY ("ForeignId") REFERENCES "Objects" ("Id")
);
INSERT INTO `Relations` (Id,MemberId,PrimaryId,ForeignId) VALUES (1,11,4,8);
INSERT INTO `Relations` (Id,MemberId,PrimaryId,ForeignId) VALUES (2,11,5,8);
INSERT INTO `Relations` (Id,MemberId,PrimaryId,ForeignId) VALUES (3,11,6,8);
INSERT INTO `Relations` (Id,MemberId,PrimaryId,ForeignId) VALUES (4,11,7,8);
CREATE TABLE "Properties" (
	"Id" INTEGER NOT NULL CONSTRAINT "PK_Property" PRIMARY KEY AUTOINCREMENT,
	"ObjectId" INTEGER NOT NULL,
	"MemberId" INTEGER NOT NULL,
	"IntegerValue" INTEGER,
	"DecimalValue" REAL,
	"StringValueId" INTEGER,
	"DateTimeValue" TEXT,
	CONSTRAINT "FK_Property_Object_ObjectId" FOREIGN KEY("ObjectId") REFERENCES "Objects"("Id"),
	CONSTRAINT "FK_Property_Member_MemberId" FOREIGN KEY("MemberId") REFERENCES "Members"("Id"),
	CONSTRAINT "FK_Property_Dictionary_StringValueId" FOREIGN KEY("StringValueId") REFERENCES "Dictionaries"("Id")
);
INSERT INTO `Properties` (Id,ObjectId,MemberId,IntegerValue,DecimalValue,StringValueId,DateTimeValue) VALUES (1,1,1,NULL,NULL,10,NULL);
INSERT INTO `Properties` (Id,ObjectId,MemberId,IntegerValue,DecimalValue,StringValueId,DateTimeValue) VALUES (2,1,2,NULL,NULL,11,NULL);
INSERT INTO `Properties` (Id,ObjectId,MemberId,IntegerValue,DecimalValue,StringValueId,DateTimeValue) VALUES (3,1,3,NULL,NULL,12,NULL);
INSERT INTO `Properties` (Id,ObjectId,MemberId,IntegerValue,DecimalValue,StringValueId,DateTimeValue) VALUES (4,1,4,NULL,NULL,13,NULL);
INSERT INTO `Properties` (Id,ObjectId,MemberId,IntegerValue,DecimalValue,StringValueId,DateTimeValue) VALUES (5,1,5,NULL,NULL,14,NULL);
INSERT INTO `Properties` (Id,ObjectId,MemberId,IntegerValue,DecimalValue,StringValueId,DateTimeValue) VALUES (6,2,1,NULL,NULL,15,NULL);
INSERT INTO `Properties` (Id,ObjectId,MemberId,IntegerValue,DecimalValue,StringValueId,DateTimeValue) VALUES (7,2,2,NULL,NULL,16,NULL);
INSERT INTO `Properties` (Id,ObjectId,MemberId,IntegerValue,DecimalValue,StringValueId,DateTimeValue) VALUES (8,2,3,NULL,NULL,17,NULL);
INSERT INTO `Properties` (Id,ObjectId,MemberId,IntegerValue,DecimalValue,StringValueId,DateTimeValue) VALUES (9,2,4,NULL,NULL,18,NULL);
INSERT INTO `Properties` (Id,ObjectId,MemberId,IntegerValue,DecimalValue,StringValueId,DateTimeValue) VALUES (10,2,5,NULL,NULL,19,NULL);
INSERT INTO `Properties` (Id,ObjectId,MemberId,IntegerValue,DecimalValue,StringValueId,DateTimeValue) VALUES (11,3,1,NULL,NULL,20,NULL);
INSERT INTO `Properties` (Id,ObjectId,MemberId,IntegerValue,DecimalValue,StringValueId,DateTimeValue) VALUES (12,3,2,NULL,NULL,21,NULL);
INSERT INTO `Properties` (Id,ObjectId,MemberId,IntegerValue,DecimalValue,StringValueId,DateTimeValue) VALUES (13,3,3,NULL,NULL,22,NULL);
INSERT INTO `Properties` (Id,ObjectId,MemberId,IntegerValue,DecimalValue,StringValueId,DateTimeValue) VALUES (14,3,4,NULL,NULL,23,NULL);
INSERT INTO `Properties` (Id,ObjectId,MemberId,IntegerValue,DecimalValue,StringValueId,DateTimeValue) VALUES (15,3,5,NULL,NULL,24,NULL);
INSERT INTO `Properties` (Id,ObjectId,MemberId,IntegerValue,DecimalValue,StringValueId,DateTimeValue) VALUES (16,4,9,NULL,NULL,25,NULL);
INSERT INTO `Properties` (Id,ObjectId,MemberId,IntegerValue,DecimalValue,StringValueId,DateTimeValue) VALUES (17,4,10,NULL,NULL,26,NULL);
INSERT INTO `Properties` (Id,ObjectId,MemberId,IntegerValue,DecimalValue,StringValueId,DateTimeValue) VALUES (18,5,9,NULL,NULL,27,NULL);
INSERT INTO `Properties` (Id,ObjectId,MemberId,IntegerValue,DecimalValue,StringValueId,DateTimeValue) VALUES (19,5,10,NULL,NULL,28,NULL);
INSERT INTO `Properties` (Id,ObjectId,MemberId,IntegerValue,DecimalValue,StringValueId,DateTimeValue) VALUES (20,6,9,NULL,NULL,29,NULL);
INSERT INTO `Properties` (Id,ObjectId,MemberId,IntegerValue,DecimalValue,StringValueId,DateTimeValue) VALUES (21,6,10,NULL,NULL,30,NULL);
INSERT INTO `Properties` (Id,ObjectId,MemberId,IntegerValue,DecimalValue,StringValueId,DateTimeValue) VALUES (22,7,9,NULL,NULL,31,NULL);
INSERT INTO `Properties` (Id,ObjectId,MemberId,IntegerValue,DecimalValue,StringValueId,DateTimeValue) VALUES (23,7,10,NULL,NULL,32,NULL);
INSERT INTO `Properties` (Id,ObjectId,MemberId,IntegerValue,DecimalValue,StringValueId,DateTimeValue) VALUES (24,8,1,NULL,NULL,33,NULL);
INSERT INTO `Properties` (Id,ObjectId,MemberId,IntegerValue,DecimalValue,StringValueId,DateTimeValue) VALUES (25,8,2,NULL,NULL,34,NULL);
INSERT INTO `Properties` (Id,ObjectId,MemberId,IntegerValue,DecimalValue,StringValueId,DateTimeValue) VALUES (26,8,3,NULL,NULL,35,NULL);
INSERT INTO `Properties` (Id,ObjectId,MemberId,IntegerValue,DecimalValue,StringValueId,DateTimeValue) VALUES (27,8,4,NULL,NULL,36,NULL);
INSERT INTO `Properties` (Id,ObjectId,MemberId,IntegerValue,DecimalValue,StringValueId,DateTimeValue) VALUES (28,8,5,NULL,NULL,37,NULL);
INSERT INTO `Properties` (Id,ObjectId,MemberId,IntegerValue,DecimalValue,StringValueId,DateTimeValue) VALUES (29,9,6,NULL,NULL,38,NULL);
INSERT INTO `Properties` (Id,ObjectId,MemberId,IntegerValue,DecimalValue,StringValueId,DateTimeValue) VALUES (30,9,7,NULL,NULL,39,NULL);
INSERT INTO `Properties` (Id,ObjectId,MemberId,IntegerValue,DecimalValue,StringValueId,DateTimeValue) VALUES (31,9,1,NULL,NULL,40,NULL);
INSERT INTO `Properties` (Id,ObjectId,MemberId,IntegerValue,DecimalValue,StringValueId,DateTimeValue) VALUES (32,9,8,NULL,NULL,NULL,'2017-05-01 00:00:00');
INSERT INTO `Properties` (Id,ObjectId,MemberId,IntegerValue,DecimalValue,StringValueId,DateTimeValue) VALUES (33,9,2,NULL,NULL,41,NULL);
INSERT INTO `Properties` (Id,ObjectId,MemberId,IntegerValue,DecimalValue,StringValueId,DateTimeValue) VALUES (34,9,3,NULL,NULL,42,NULL);
INSERT INTO `Properties` (Id,ObjectId,MemberId,IntegerValue,DecimalValue,StringValueId,DateTimeValue) VALUES (35,9,4,NULL,NULL,43,NULL);
INSERT INTO `Properties` (Id,ObjectId,MemberId,IntegerValue,DecimalValue,StringValueId,DateTimeValue) VALUES (36,9,5,NULL,NULL,44,NULL);
INSERT INTO `Properties` (Id,ObjectId,MemberId,IntegerValue,DecimalValue,StringValueId,DateTimeValue) VALUES (37,10,6,NULL,NULL,45,NULL);
INSERT INTO `Properties` (Id,ObjectId,MemberId,IntegerValue,DecimalValue,StringValueId,DateTimeValue) VALUES (38,10,7,NULL,NULL,46,NULL);
INSERT INTO `Properties` (Id,ObjectId,MemberId,IntegerValue,DecimalValue,StringValueId,DateTimeValue) VALUES (39,10,1,NULL,NULL,47,NULL);
INSERT INTO `Properties` (Id,ObjectId,MemberId,IntegerValue,DecimalValue,StringValueId,DateTimeValue) VALUES (40,10,8,NULL,NULL,NULL,'2017-05-02 00:00:00');
INSERT INTO `Properties` (Id,ObjectId,MemberId,IntegerValue,DecimalValue,StringValueId,DateTimeValue) VALUES (41,10,2,NULL,NULL,48,NULL);
INSERT INTO `Properties` (Id,ObjectId,MemberId,IntegerValue,DecimalValue,StringValueId,DateTimeValue) VALUES (42,10,3,NULL,NULL,49,NULL);
INSERT INTO `Properties` (Id,ObjectId,MemberId,IntegerValue,DecimalValue,StringValueId,DateTimeValue) VALUES (43,10,4,NULL,NULL,50,NULL);
INSERT INTO `Properties` (Id,ObjectId,MemberId,IntegerValue,DecimalValue,StringValueId,DateTimeValue) VALUES (44,10,5,NULL,NULL,51,NULL);
INSERT INTO `Properties` (Id,ObjectId,MemberId,IntegerValue,DecimalValue,StringValueId,DateTimeValue) VALUES (45,11,6,NULL,NULL,52,NULL);
INSERT INTO `Properties` (Id,ObjectId,MemberId,IntegerValue,DecimalValue,StringValueId,DateTimeValue) VALUES (46,11,7,NULL,NULL,53,NULL);
INSERT INTO `Properties` (Id,ObjectId,MemberId,IntegerValue,DecimalValue,StringValueId,DateTimeValue) VALUES (47,11,1,NULL,NULL,54,NULL);
INSERT INTO `Properties` (Id,ObjectId,MemberId,IntegerValue,DecimalValue,StringValueId,DateTimeValue) VALUES (48,11,8,NULL,NULL,NULL,'2017-05-03 00:00:00');
INSERT INTO `Properties` (Id,ObjectId,MemberId,IntegerValue,DecimalValue,StringValueId,DateTimeValue) VALUES (49,11,2,NULL,NULL,55,NULL);
INSERT INTO `Properties` (Id,ObjectId,MemberId,IntegerValue,DecimalValue,StringValueId,DateTimeValue) VALUES (50,11,3,NULL,NULL,56,NULL);
INSERT INTO `Properties` (Id,ObjectId,MemberId,IntegerValue,DecimalValue,StringValueId,DateTimeValue) VALUES (51,11,4,NULL,NULL,57,NULL);
INSERT INTO `Properties` (Id,ObjectId,MemberId,IntegerValue,DecimalValue,StringValueId,DateTimeValue) VALUES (52,11,5,NULL,NULL,58,NULL);
CREATE TABLE "Permissions" (
	"Id" INTEGER NOT NULL CONSTRAINT "PK_Permission" PRIMARY KEY AUTOINCREMENT,
	"Code" TEXT NOT NULL,
	"Name" TEXT NOT NULL,
	"Position" INTEGER
);
INSERT INTO `Permissions` (Id,Code,Name,Position) VALUES (1,'BrowseBackend','Browse backend',1);
INSERT INTO `Permissions` (Id,Code,Name,Position) VALUES (2,'DoEverything','Do everything',100);
INSERT INTO `Permissions` (Id,Code,Name,Position) VALUES (3,'BrowseConfigurations','Browse configurations',200);
INSERT INTO `Permissions` (Id,Code,Name,Position) VALUES (4,'BrowsePermissions','Browse permissions',300);
INSERT INTO `Permissions` (Id,Code,Name,Position) VALUES (5,'BrowseRoles','Browse roles',310);
INSERT INTO `Permissions` (Id,Code,Name,Position) VALUES (6,'BrowseUsers','Browse users',320);
INSERT INTO `Permissions` (Id,Code,Name,Position) VALUES (7,'BrowseFileManager','Browse file manager',400);
INSERT INTO `Permissions` (Id,Code,Name,Position) VALUES (8,'BrowseCultures','Browse cultures',500);
INSERT INTO `Permissions` (Id,Code,Name,Position) VALUES (9,'BrowseObjects','Browse objects',600);
INSERT INTO `Permissions` (Id,Code,Name,Position) VALUES (10,'BrowseDataTypes','Browse data types',610);
INSERT INTO `Permissions` (Id,Code,Name,Position) VALUES (11,'BrowseClasses','Browse classes',620);
INSERT INTO `Permissions` (Id,Code,Name,Position) VALUES (12,'BrowseEndpoints','Browse microcontrollers',630);
INSERT INTO `Permissions` (Id,Code,Name,Position) VALUES (13,'BrowseMenus','Browse menus',700);
INSERT INTO `Permissions` (Id,Code,Name,Position) VALUES (14,'BrowseForms','Browse forms',800);
INSERT INTO `Permissions` (Id,Code,Name,Position) VALUES (15,'BrowseViews','Browse views',900);
INSERT INTO `Permissions` (Id,Code,Name,Position) VALUES (16,'BrowseStyles','Browse styles',910);
INSERT INTO `Permissions` (Id,Code,Name,Position) VALUES (17,'BrowseScripts','Browse scripts',920);
INSERT INTO `Permissions` (Id,Code,Name,Position) VALUES (18,'BrowseBundles','Browse bundles',930);
CREATE TABLE "Objects" (
	"Id" INTEGER NOT NULL CONSTRAINT "PK_Object" PRIMARY KEY AUTOINCREMENT,
	"ClassId" INTEGER NOT NULL,
	CONSTRAINT "FK_Object_Class_ClassId" FOREIGN KEY("ClassId") REFERENCES "Classes" ("Id")
);
INSERT INTO `Objects` (Id,ClassId) VALUES (1,2);
INSERT INTO `Objects` (Id,ClassId) VALUES (2,2);
INSERT INTO `Objects` (Id,ClassId) VALUES (3,2);
INSERT INTO `Objects` (Id,ClassId) VALUES (4,5);
INSERT INTO `Objects` (Id,ClassId) VALUES (5,5);
INSERT INTO `Objects` (Id,ClassId) VALUES (6,5);
INSERT INTO `Objects` (Id,ClassId) VALUES (7,5);
INSERT INTO `Objects` (Id,ClassId) VALUES (8,3);
INSERT INTO `Objects` (Id,ClassId) VALUES (9,4);
INSERT INTO `Objects` (Id,ClassId) VALUES (10,4);
INSERT INTO `Objects` (Id,ClassId) VALUES (11,4);
CREATE TABLE "Endpoints" (
	"Id" INTEGER NOT NULL CONSTRAINT "PK_Endpoint" PRIMARY KEY AUTOINCREMENT,
	"Name" TEXT NOT NULL,
	"UrlTemplate" TEXT,
	"Position" INTEGER,
	"DisallowAnonymous" INTEGER NOT NULL,
	"SignInUrl" TEXT,
	"CSharpClassName" TEXT NOT NULL,
	"Parameters" TEXT
);
INSERT INTO `Endpoints` (Id,Name,UrlTemplate,Position,DisallowAnonymous,SignInUrl,CSharpClassName,Parameters) VALUES (1,'Default','{*url}',100,0,NULL,'Platformus.Domain.Frontend.DefaultEndpoint','ViewName=RegularPage;UseCaching=true');
INSERT INTO `Endpoints` (Id,Name,UrlTemplate,Position,DisallowAnonymous,SignInUrl,CSharpClassName,Parameters) VALUES (2,'Features','features',10,0,NULL,'Platformus.Domain.Frontend.DefaultEndpoint','ViewName=FeaturesPage;UseCaching=true');
INSERT INTO `Endpoints` (Id,Name,UrlTemplate,Position,DisallowAnonymous,SignInUrl,CSharpClassName,Parameters) VALUES (3,'Blog','blog',20,0,NULL,'Platformus.Domain.Frontend.DefaultEndpoint','ViewName=BlogPage;UseCaching=true');
INSERT INTO `Endpoints` (Id,Name,UrlTemplate,Position,DisallowAnonymous,SignInUrl,CSharpClassName,Parameters) VALUES (4,'Contacts','contacts',30,0,NULL,'Platformus.Domain.Frontend.DefaultEndpoint','ViewName=ContactsPage;UseCaching=true');
INSERT INTO `Endpoints` (Id,Name,UrlTemplate,Position,DisallowAnonymous,SignInUrl,CSharpClassName,Parameters) VALUES (5,'Blog post','blog/{post}',40,0,NULL,'Platformus.Domain.Frontend.DefaultEndpoint','ViewName=BlogPostPage;UseCaching=true');
CREATE TABLE "EndpointPermissions" (
	"EndpointId" INTEGER NOT NULL,
	"PermissionId" INTEGER NOT NULL,
	CONSTRAINT "PK_EndpointPermission" PRIMARY KEY ("EndpointId", "PermissionId"),
	CONSTRAINT "FK_EndpointPermission_Endpoint_EndpointId" FOREIGN KEY ("EndpointId") REFERENCES "Endpoints" ("Id"),
	CONSTRAINT "FK_EndpointPermission_Permission_PermissionId" FOREIGN KEY ("PermissionId") REFERENCES "Permissions" ("Id")
);
CREATE TABLE "Menus" (
	"Id" INTEGER NOT NULL CONSTRAINT "PK_Menu" PRIMARY KEY AUTOINCREMENT,
	"Code" TEXT NOT NULL,
	"NameId" INTEGER NOT NULL,
	CONSTRAINT "FK_Menu_Dictionary_NameId" FOREIGN KEY ("NameId") REFERENCES "Dictionaries" ("Id")
);
INSERT INTO `Menus` (Id,Code,NameId) VALUES (1,'Main',1);
CREATE TABLE "MenuItems" (
	"Id" INTEGER NOT NULL CONSTRAINT "PK_MenuItem" PRIMARY KEY AUTOINCREMENT,
	"MenuId" INTEGER,
	"MenuItemId" INTEGER,
	"NameId" INTEGER NOT NULL,
	"Url" TEXT,
	"Position" INTEGER,
	CONSTRAINT "FK_MenuItem_Menu_MenuId" FOREIGN KEY("MenuId") REFERENCES "Menus" ("Id"),
	CONSTRAINT "FK_MenuItem_MenuItem_MenuItemId" FOREIGN KEY("MenuItemId") REFERENCES "MenuItems" ("Id"),
	CONSTRAINT "FK_MenuItem_Dictionary_NameId" FOREIGN KEY("NameId") REFERENCES "Dictionaries" ("Id")
);
INSERT INTO `MenuItems` (Id,MenuId,MenuItemId,NameId,Url,Position) VALUES (1,1,NULL,2,'/',1);
INSERT INTO `MenuItems` (Id,MenuId,MenuItemId,NameId,Url,Position) VALUES (2,1,NULL,3,'/features',2);
INSERT INTO `MenuItems` (Id,MenuId,MenuItemId,NameId,Url,Position) VALUES (3,1,NULL,4,'/blog',3);
INSERT INTO `MenuItems` (Id,MenuId,MenuItemId,NameId,Url,Position) VALUES (4,1,NULL,5,'/contacts',4);
CREATE TABLE "Members" (
	"Id" INTEGER NOT NULL CONSTRAINT "PK_Member" PRIMARY KEY AUTOINCREMENT,
	"ClassId" INTEGER NOT NULL,
	"TabId" INTEGER,
	"Code" TEXT NOT NULL,
	"Name" TEXT NOT NULL,
	"Position" INTEGER,
	"PropertyDataTypeId" INTEGER,
	"IsPropertyLocalizable" INTEGER,
	"IsPropertyVisibleInList" INTEGER,
	"RelationClassId" INTEGER,
	"IsRelationSingleParent" INTEGER,
  "MinRelatedObjectsNumber" INTEGER,
  "MaxRelatedObjectsNumber" INTEGER,
	CONSTRAINT "FK_Member_Class_ClassId" FOREIGN KEY("ClassId") REFERENCES "Classes" ("Id"),
	CONSTRAINT "FK_Member_Tab_TabId" FOREIGN KEY("TabId") REFERENCES "Tabs" ("Id"),
	CONSTRAINT "FK_Member_DataType_PropertyDataTypeId" FOREIGN KEY("PropertyDataTypeId") REFERENCES "DataTypes" ("Id"),
	CONSTRAINT "FK_Member_Class_RelationClassId" FOREIGN KEY("RelationClassId") REFERENCES "Classes" ("Id")
);
INSERT INTO `Members` (Id,ClassId,TabId,Code,Name,Position,PropertyDataTypeId,IsPropertyLocalizable,IsPropertyVisibleInList,RelationClassId,IsRelationSingleParent,MinRelatedObjectsNumber,MaxRelatedObjectsNumber) VALUES (1,1,NULL,'Content','Content',100,3,1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `Members` (Id,ClassId,TabId,Code,Name,Position,PropertyDataTypeId,IsPropertyLocalizable,IsPropertyVisibleInList,RelationClassId,IsRelationSingleParent,MinRelatedObjectsNumber,MaxRelatedObjectsNumber) VALUES (2,1,1,'Url','URL',200,1,NULL,1,NULL,NULL,NULL,NULL);
INSERT INTO `Members` (Id,ClassId,TabId,Code,Name,Position,PropertyDataTypeId,IsPropertyLocalizable,IsPropertyVisibleInList,RelationClassId,IsRelationSingleParent,MinRelatedObjectsNumber,MaxRelatedObjectsNumber) VALUES (3,1,1,'Title','Title',300,1,1,1,NULL,NULL,NULL,NULL);
INSERT INTO `Members` (Id,ClassId,TabId,Code,Name,Position,PropertyDataTypeId,IsPropertyLocalizable,IsPropertyVisibleInList,RelationClassId,IsRelationSingleParent,MinRelatedObjectsNumber,MaxRelatedObjectsNumber) VALUES (4,1,1,'MetaDescription','Meta description',400,1,1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `Members` (Id,ClassId,TabId,Code,Name,Position,PropertyDataTypeId,IsPropertyLocalizable,IsPropertyVisibleInList,RelationClassId,IsRelationSingleParent,MinRelatedObjectsNumber,MaxRelatedObjectsNumber) VALUES (5,1,1,'MetaKeywords','Meta keywords',500,1,1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `Members` (Id,ClassId,TabId,Code,Name,Position,PropertyDataTypeId,IsPropertyLocalizable,IsPropertyVisibleInList,RelationClassId,IsRelationSingleParent,MinRelatedObjectsNumber,MaxRelatedObjectsNumber) VALUES (6,4,NULL,'Image','Image',10,4,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `Members` (Id,ClassId,TabId,Code,Name,Position,PropertyDataTypeId,IsPropertyLocalizable,IsPropertyVisibleInList,RelationClassId,IsRelationSingleParent,MinRelatedObjectsNumber,MaxRelatedObjectsNumber) VALUES (7,4,NULL,'Preview','Preview',20,3,1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `Members` (Id,ClassId,TabId,Code,Name,Position,PropertyDataTypeId,IsPropertyLocalizable,IsPropertyVisibleInList,RelationClassId,IsRelationSingleParent,MinRelatedObjectsNumber,MaxRelatedObjectsNumber) VALUES (8,4,NULL,'Created','Created',110,5,1,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `Members` (Id,ClassId,TabId,Code,Name,Position,PropertyDataTypeId,IsPropertyLocalizable,IsPropertyVisibleInList,RelationClassId,IsRelationSingleParent,MinRelatedObjectsNumber,MaxRelatedObjectsNumber) VALUES (9,5,NULL,'Name','Name',100,1,1,1,NULL,NULL,NULL,NULL);
INSERT INTO `Members` (Id,ClassId,TabId,Code,Name,Position,PropertyDataTypeId,IsPropertyLocalizable,IsPropertyVisibleInList,RelationClassId,IsRelationSingleParent,MinRelatedObjectsNumber,MaxRelatedObjectsNumber) VALUES (10,5,NULL,'State','State',200,1,1,1,NULL,NULL,NULL,NULL);
INSERT INTO `Members` (Id,ClassId,TabId,Code,Name,Position,PropertyDataTypeId,IsPropertyLocalizable,IsPropertyVisibleInList,RelationClassId,IsRelationSingleParent,MinRelatedObjectsNumber,MaxRelatedObjectsNumber) VALUES (11,3,2,'Features','Features',10,NULL,NULL,NULL,5,NULL,NULL,NULL);
CREATE TABLE "Localizations" (
	"Id" INTEGER NOT NULL CONSTRAINT "PK_Localization" PRIMARY KEY AUTOINCREMENT,
	"DictionaryId" INTEGER NOT NULL,
	"CultureId" INTEGER NOT NULL,
	"Value" TEXT,
	CONSTRAINT "FK_Localization_Dictionary_DictionaryId" FOREIGN KEY ("DictionaryId") REFERENCES "Dictionaries" ("Id"),
	CONSTRAINT "FK_Localization_Culture_CultureId" FOREIGN KEY ("CultureId") REFERENCES "Cultures" ("Id")
);
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (1,1,2,'Main');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (2,1,3,'Главное');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (3,1,4,'Головне');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (4,2,2,'Home');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (5,2,3,'Главная');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (6,2,4,'Головна');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (7,3,2,'Features');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (8,3,3,'Особенности');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (9,3,4,'Особливості');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (10,4,2,'Blog');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (11,4,3,'Блог');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (12,4,4,'Блог');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (13,5,2,'Contacts');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (14,5,3,'Контакты');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (15,5,4,'Контакти');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (16,6,2,'Feedback');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (17,6,3,'Обратная связь');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (18,6,4,'Зворотний зв’язок');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (19,7,2,'Your name');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (20,7,3,'Ваше имя');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (21,7,4,'Ваше ім’я');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (22,8,2,'Your phone');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (23,8,3,'Ваш телефон');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (24,8,4,'Ваш телефон');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (25,9,2,'Your message');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (26,9,3,'Ваше сообщение');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (27,9,4,'Ваше повідомлення');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (28,10,2,'<p>This is a demo website running on Platformus CMS.</p>
<p>You can manage it using the <a href="/backend/">backend</a>.</p>
<p>Email: <a href="mailto:admin@platformus.net">admin@platformus.net</a></p>
<p>Password: admin</p>');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (29,10,3,'<p>Это демонстрационный сайт, работающий на CMS Platforms.</p>
<p>Вы можете управлять им с помощью <a href="/backend/">бекенда</a>.</p>
<p>Электронная почта: <a href="mailto:admin@platformus.net">admin@platformus.net</a></p>
<p>Пароль: admin</p>');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (30,10,4,'<p>Це демонстраційний веб-сайт, що працює на CMS Platformus.</p>
<p>Ви можете&nbsp;керувати ним&nbsp;за допомогою <a href="/backend/">бекенду</a>.</p>
<p>Електронна пошта: <a href="mailto:admin@platformus.net">admin@platformus.net</a></p>
<p>Пароль: admin</p>');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (31,11,1,'/');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (32,12,2,'Platformus CMS demo website');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (33,12,3,'Демонстрационный веб-сайт на CMS Platforms');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (34,12,4,'Демонстраційний веб-сайт на CMS Platformus');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (35,13,2,'This is a demo website running on Platformus CMS.');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (36,13,3,'Это демонстрационный веб-сайт, работающий на CMS Platforms.');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (37,13,4,'Це демонстраційний веб-сайт, що працює на CMS Platformus.');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (38,14,2,'CMS, Platformus');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (39,14,3,'CMS, Platformus');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (40,14,4,'CMS, Platformus');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (41,15,2,'<p>Blog posts.</p>');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (42,15,3,'<p>Посты блога.</p>');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (43,15,4,'<p>Пости блогу:</p>');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (44,16,1,'/blog');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (45,17,2,'Blog');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (46,17,3,'Блог');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (47,17,4,'Блог');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (48,18,2,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (49,18,3,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (50,18,4,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (51,19,2,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (52,19,3,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (53,19,4,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (54,20,2,'<p>Website: <a href="http://platformus.net/">http://platformus.net/</a></p>
<p>Git: <a href="https://github.com/Platformus">https://github.com/Platformus</a></p>');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (55,20,3,'<p>Веб-сайт: <a href="http://platformus.net/">http://platformus.net/</a></p>
<p>Git: <a href="https://github.com/Platformus">https://github.com/Platformus</a></p>');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (56,20,4,'<p>Веб-сайт: <a href="http://platformus.net/">http://platformus.net/</a></p>
<p>Git: <a href="https://github.com/Platformus">https://github.com/Platformus</a></p>');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (57,21,1,'/contacts');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (58,22,2,'Contacts');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (59,22,3,'Контакты');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (60,22,4,'Контакти');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (61,23,2,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (62,23,3,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (63,23,4,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (64,24,2,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (65,24,3,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (66,24,4,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (67,25,2,'Modular structure');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (68,25,3,'Модульная структура');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (69,25,4,'Модульна структура');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (70,26,2,'yes');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (71,26,3,'да');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (72,26,4,'так');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (73,27,2,'User interface localization');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (74,27,3,'Локализация пользовательского интерфейса');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (75,27,4,'Локалізація інтерфейсу користувача');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (76,28,2,'yes');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (77,28,3,'да');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (78,28,4,'так');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (79,29,2,'Content localization');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (80,29,3,'Локализация контета');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (81,29,4,'Локалізація контенту');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (82,30,2,'yes');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (83,30,3,'да');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (84,30,4,'так');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (85,31,2,'Flexible content management');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (86,31,3,'Гибкое управление содержимым');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (87,31,4,'Гнучке управління контентом');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (88,32,2,'yes');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (89,32,3,'да');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (90,32,4,'так');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (91,33,2,'<p>The main features of the Platformus CMS:</p>');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (92,33,3,'<p>Главные особенности CMS Platformus:</p>');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (93,33,4,'<p>Основні особливості CMS Platformus:</p>');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (94,34,1,'/features');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (95,35,2,'Features');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (96,35,3,'Особенности');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (97,35,4,'Особливості');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (98,36,2,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (99,36,3,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (100,36,4,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (101,37,2,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (102,37,3,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (103,37,4,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (104,38,1,'/images/objects/img.png');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (105,39,2,'<p>Post 1</p>');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (106,39,3,'<p>Пост 1</p>');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (107,39,4,'<p>Пост 1</p>');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (108,40,2,'<p>Post 1 content</p>');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (109,40,3,'<p>Содержимое поста 1</p>');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (110,40,4,'<p>Зміст посту 1</p>');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (111,41,1,'/blog/post-1');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (112,42,2,'Post 1');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (113,42,3,'Пост 1');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (114,42,4,'Пост 1');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (115,43,2,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (116,43,3,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (117,43,4,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (118,44,2,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (119,44,3,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (120,44,4,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (121,45,1,'/images/objects/img.png');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (122,46,2,'<p>Post 2</p>');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (123,46,3,'<p>Пост 2</p>');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (124,46,4,'<p>Пост 2</p>');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (125,47,2,'<p>Post 2 content</p>');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (126,47,3,'<p>Содержимое поста 2</p>');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (127,47,4,'<p>Зміст посту 2</p>');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (128,48,1,'/blog/post-2');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (129,49,2,'Post 2');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (130,49,3,'Пост 2');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (131,49,4,'Пост 2');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (132,50,2,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (133,50,3,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (134,50,4,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (135,51,2,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (136,51,3,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (137,51,4,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (138,52,1,'/images/objects/img.png');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (139,53,2,'<p>Post 3</p>');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (140,53,3,'<p>Пост 3</p>');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (141,53,4,'<p>Пост 3</p>');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (142,54,2,'<p>Post 3 content</p>');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (143,54,3,'<p>Содержимое поста 3</p>');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (144,54,4,'<p>Зміст посту 3</p>');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (145,55,1,'/blog/post-3');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (146,56,2,'Post 3');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (147,56,3,'Пост 3');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (148,56,4,'Пост 3');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (149,57,2,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (150,57,3,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (151,57,4,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (152,58,2,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (153,58,3,'');
INSERT INTO `Localizations` (Id,DictionaryId,CultureId,Value) VALUES (154,58,4,'');
CREATE TABLE "Forms" (
	"Id" INTEGER NOT NULL CONSTRAINT "PK_Form" PRIMARY KEY AUTOINCREMENT,
	"Code" TEXT NOT NULL,
	"NameId" INTEGER NOT NULL,
	"ProduceCompletedForms" INTEGER NOT NULL,
	"CSharpClassName" TEXT NOT NULL,
	"Parameters" TEXT,
	CONSTRAINT "FK_Form_Dictionary_NameId" FOREIGN KEY ("NameId") REFERENCES "Dictionaries" ("Id")
);
INSERT INTO `Forms` (Id,Code,NameId,ProduceCompletedForms,CSharpClassName,Parameters) VALUES (1,'Feedback',6,1,'Platformus.Forms.Frontend.FormHandlers.EmailFormHandler','RecipientEmails=test@test.com;RedirectUrl=/');
CREATE TABLE "Files" (
	"Id" INTEGER NOT NULL CONSTRAINT "PK_File" PRIMARY KEY AUTOINCREMENT,
	"Name" TEXT NOT NULL,
	"Size" INTEGER NOT NULL
);
CREATE TABLE "Fields" (
	"Id" INTEGER NOT NULL CONSTRAINT "PK_Field" PRIMARY KEY AUTOINCREMENT,
	"FormId" INTEGER NOT NULL,
	"FieldTypeId" INTEGER NOT NULL,
	"Code" TEXT NOT NULL,
	"NameId" INTEGER NOT NULL,
	"IsRequired" INTEGER NOT NULL,
	"MaxLength" INTEGER,
	"Position" INTEGER,
	CONSTRAINT "FK_Field_Form_FormId" FOREIGN KEY ("FormId") REFERENCES "Forms" ("Id"),
	CONSTRAINT "FK_Field_FieldType_FieldTypeId" FOREIGN KEY ("FieldTypeId") REFERENCES "FieldTypes" ("Id"),
	CONSTRAINT "FK_Field_Dictionary_NameId" FOREIGN KEY ("NameId") REFERENCES "Dictionaries" ("Id")
);
INSERT INTO `Fields` (Id,FormId,FieldTypeId,Code,NameId,IsRequired,MaxLength,Position) VALUES (1,1,1,'Name',7,1,128,1);
INSERT INTO `Fields` (Id,FormId,FieldTypeId,Code,NameId,IsRequired,MaxLength,Position) VALUES (2,1,1,'Phone',8,1,128,2);
INSERT INTO `Fields` (Id,FormId,FieldTypeId,Code,NameId,IsRequired,MaxLength,Position) VALUES (3,1,2,'Message',9,1,512,3);
CREATE TABLE "FieldTypes" (
	"Id" INTEGER NOT NULL CONSTRAINT "PK_FieldType" PRIMARY KEY AUTOINCREMENT,
	"Code" TEXT NOT NULL,
	"Name" TEXT NOT NULL,
	"Position" INTEGER
);
INSERT INTO `FieldTypes` (Id,Code,Name,Position) VALUES (1,'TextBox','Text box',1);
INSERT INTO `FieldTypes` (Id,Code,Name,Position) VALUES (2,'TextArea','Text area',2);
INSERT INTO `FieldTypes` (Id,Code,Name,Position) VALUES (3,'Checkbox','Checkbox',3);
INSERT INTO `FieldTypes` (Id,Code,Name,Position) VALUES (4,'RadioButtonList','Radio button list',4);
INSERT INTO `FieldTypes` (Id,Code,Name,Position) VALUES (5,'DropDownList','Drop down list',5);
INSERT INTO `FieldTypes` (Id,Code,Name,Position) VALUES (6,'FileUpload','File upload',6);
CREATE TABLE "FieldOptions" (
	"Id" INTEGER NOT NULL CONSTRAINT "PK_FieldOption" PRIMARY KEY AUTOINCREMENT,
	"FieldId" INTEGER NOT NULL,
	"ValueId" INTEGER NOT NULL,
	"Position" INTEGER,
	CONSTRAINT "FK_FieldOption_Field_FieldId" FOREIGN KEY ("FieldId") REFERENCES "Fields" ("Id"),
	CONSTRAINT "FK_FieldOption_Dictionary_ValueId" FOREIGN KEY ("ValueId") REFERENCES "Dictionaries" ("Id")
);
CREATE TABLE "Dictionaries" (
	"Id" INTEGER NOT NULL CONSTRAINT "PK_Dictionary" PRIMARY KEY AUTOINCREMENT
);
INSERT INTO `Dictionaries` (Id) VALUES (1);
INSERT INTO `Dictionaries` (Id) VALUES (2);
INSERT INTO `Dictionaries` (Id) VALUES (3);
INSERT INTO `Dictionaries` (Id) VALUES (4);
INSERT INTO `Dictionaries` (Id) VALUES (5);
INSERT INTO `Dictionaries` (Id) VALUES (6);
INSERT INTO `Dictionaries` (Id) VALUES (7);
INSERT INTO `Dictionaries` (Id) VALUES (8);
INSERT INTO `Dictionaries` (Id) VALUES (9);
INSERT INTO `Dictionaries` (Id) VALUES (10);
INSERT INTO `Dictionaries` (Id) VALUES (11);
INSERT INTO `Dictionaries` (Id) VALUES (12);
INSERT INTO `Dictionaries` (Id) VALUES (13);
INSERT INTO `Dictionaries` (Id) VALUES (14);
INSERT INTO `Dictionaries` (Id) VALUES (15);
INSERT INTO `Dictionaries` (Id) VALUES (16);
INSERT INTO `Dictionaries` (Id) VALUES (17);
INSERT INTO `Dictionaries` (Id) VALUES (18);
INSERT INTO `Dictionaries` (Id) VALUES (19);
INSERT INTO `Dictionaries` (Id) VALUES (20);
INSERT INTO `Dictionaries` (Id) VALUES (21);
INSERT INTO `Dictionaries` (Id) VALUES (22);
INSERT INTO `Dictionaries` (Id) VALUES (23);
INSERT INTO `Dictionaries` (Id) VALUES (24);
INSERT INTO `Dictionaries` (Id) VALUES (25);
INSERT INTO `Dictionaries` (Id) VALUES (26);
INSERT INTO `Dictionaries` (Id) VALUES (27);
INSERT INTO `Dictionaries` (Id) VALUES (28);
INSERT INTO `Dictionaries` (Id) VALUES (29);
INSERT INTO `Dictionaries` (Id) VALUES (30);
INSERT INTO `Dictionaries` (Id) VALUES (31);
INSERT INTO `Dictionaries` (Id) VALUES (32);
INSERT INTO `Dictionaries` (Id) VALUES (33);
INSERT INTO `Dictionaries` (Id) VALUES (34);
INSERT INTO `Dictionaries` (Id) VALUES (35);
INSERT INTO `Dictionaries` (Id) VALUES (36);
INSERT INTO `Dictionaries` (Id) VALUES (37);
INSERT INTO `Dictionaries` (Id) VALUES (38);
INSERT INTO `Dictionaries` (Id) VALUES (39);
INSERT INTO `Dictionaries` (Id) VALUES (40);
INSERT INTO `Dictionaries` (Id) VALUES (41);
INSERT INTO `Dictionaries` (Id) VALUES (42);
INSERT INTO `Dictionaries` (Id) VALUES (43);
INSERT INTO `Dictionaries` (Id) VALUES (44);
INSERT INTO `Dictionaries` (Id) VALUES (45);
INSERT INTO `Dictionaries` (Id) VALUES (46);
INSERT INTO `Dictionaries` (Id) VALUES (47);
INSERT INTO `Dictionaries` (Id) VALUES (48);
INSERT INTO `Dictionaries` (Id) VALUES (49);
INSERT INTO `Dictionaries` (Id) VALUES (50);
INSERT INTO `Dictionaries` (Id) VALUES (51);
INSERT INTO `Dictionaries` (Id) VALUES (52);
INSERT INTO `Dictionaries` (Id) VALUES (53);
INSERT INTO `Dictionaries` (Id) VALUES (54);
INSERT INTO `Dictionaries` (Id) VALUES (55);
INSERT INTO `Dictionaries` (Id) VALUES (56);
INSERT INTO `Dictionaries` (Id) VALUES (57);
INSERT INTO `Dictionaries` (Id) VALUES (58);
CREATE TABLE `DataTypeParameters` (
	"Id" INTEGER NOT NULL CONSTRAINT "PK_DataTypeParameter" PRIMARY KEY AUTOINCREMENT,
	"DataTypeId" INT NOT NULL,
	"JavaScriptEditorClassName" TEXT NOT NULL,
	"Code" TEXT NOT NULL,
	"Name" TEXT NOT NULL,
	CONSTRAINT "FK_DataTypeParameter_DataType_DataTypeId" FOREIGN KEY("DataTypeId") REFERENCES "DataTypes" ("Id")
);
INSERT INTO `DataTypeParameters` (Id,DataTypeId,JavaScriptEditorClassName,Code,Name) VALUES (1,1,'checkbox','IsRequired','Is required');
INSERT INTO `DataTypeParameters` (Id,DataTypeId,JavaScriptEditorClassName,Code,Name) VALUES (2,1,'numericTextBox','MaxLength','Max length');
INSERT INTO `DataTypeParameters` (Id,DataTypeId,JavaScriptEditorClassName,Code,Name) VALUES (3,2,'checkbox','IsRequired','Is required');
INSERT INTO `DataTypeParameters` (Id,DataTypeId,JavaScriptEditorClassName,Code,Name) VALUES (4,2,'numericTextBox','MaxLength','Max length');
INSERT INTO `DataTypeParameters` (Id,DataTypeId,JavaScriptEditorClassName,Code,Name) VALUES (5,7,'numericTextBox','Width','Width');
INSERT INTO `DataTypeParameters` (Id,DataTypeId,JavaScriptEditorClassName,Code,Name) VALUES (6,7,'numericTextBox','Height','Height');
INSERT INTO `DataTypeParameters` (Id,DataTypeId,JavaScriptEditorClassName,Code,Name) VALUES (7,8,'checkbox','IsRequired','Is required');
CREATE TABLE "DataTypeParameterValues" (
	"Id" INTEGER NOT NULL CONSTRAINT "PK_DataTypeParameterValue" PRIMARY KEY AUTOINCREMENT,
	"DataTypeParameterId" INT NOT NULL,
	"MemberId" INT NOT NULL,
	"Value" TEXT NOT NULL,
	CONSTRAINT "FK_DataTypeParameterValue_DataTypeParameter_DataTypeParameterId" FOREIGN KEY("DataTypeParameterId") REFERENCES `DataTypeParameters` ("Id"),
	CONSTRAINT "FK_DataTypeParameterValue_Member_MemberId" FOREIGN KEY("MemberId") REFERENCES "Members" ("Id")
);
CREATE TABLE "DataTypes" (
	"Id" INTEGER NOT NULL CONSTRAINT "PK_DataType" PRIMARY KEY AUTOINCREMENT,
	"StorageDataType" TEXT NOT NULL,
	"JavaScriptEditorClassName" TEXT NOT NULL,
	"Name" TEXT NOT NULL,
	"Position" INTEGER
);
INSERT INTO `DataTypes` (Id,StorageDataType,JavaScriptEditorClassName,Name,Position) VALUES (1,'string','singleLinePlainText','Single line plain text',1);
INSERT INTO `DataTypes` (Id,StorageDataType,JavaScriptEditorClassName,Name,Position) VALUES (2,'string','multilinePlainText','Multiline plain text',2);
INSERT INTO `DataTypes` (Id,StorageDataType,JavaScriptEditorClassName,Name,Position) VALUES (3,'string','html','Html',3);
INSERT INTO `DataTypes` (Id,StorageDataType,JavaScriptEditorClassName,Name,Position) VALUES (4,'integer','integerNumber','Integer number',4);
INSERT INTO `DataTypes` (Id,StorageDataType,JavaScriptEditorClassName,Name,Position) VALUES (5,'decimal','decimalNumber','Decimal number',5);
INSERT INTO `DataTypes` (Id,StorageDataType,JavaScriptEditorClassName,Name,Position) VALUES (6,'integer','booleanFlag','Boolean flag',6);
INSERT INTO `DataTypes` (Id,StorageDataType,JavaScriptEditorClassName,Name,Position) VALUES (7,'string','image','Image',7);
INSERT INTO `DataTypes` (Id,StorageDataType,JavaScriptEditorClassName,Name,Position) VALUES (8,'datetime','date','Date',8);
CREATE TABLE "DataSources" (
	"Id" INTEGER NOT NULL CONSTRAINT "PK_DataSource" PRIMARY KEY AUTOINCREMENT,
	"EndpointId" INTEGER NOT NULL,
	"Code" TEXT NOT NULL,
	"CSharpClassName" TEXT NOT NULL,
	"Parameters" TEXT,
	CONSTRAINT "FK_DataSource_Endpoint_EndpointId" FOREIGN KEY("EndpointId") REFERENCES "Endpoints"("Id")
);
INSERT INTO `DataSources` (Id,EndpointId,Code,CSharpClassName,Parameters) VALUES (1,1,'Page','Platformus.Domain.DataSources.PageDataSource',NULL);
INSERT INTO `DataSources` (Id,EndpointId,Code,CSharpClassName,Parameters) VALUES (2,2,'Page','Platformus.Domain.DataSources.PageDataSource',NULL);
INSERT INTO `DataSources` (Id,EndpointId,Code,CSharpClassName,Parameters) VALUES (3,2,'Features','Platformus.Domain.DataSources.PrimaryObjectsDataSource',NULL);
INSERT INTO `DataSources` (Id,EndpointId,Code,CSharpClassName,Parameters) VALUES (4,3,'Page','Platformus.Domain.DataSources.PageDataSource',NULL);
INSERT INTO `DataSources` (Id,EndpointId,Code,CSharpClassName,Parameters) VALUES (5,3,'BlogPosts','Platformus.Domain.DataSources.ObjectsDataSource','ClassId=4');
INSERT INTO `DataSources` (Id,EndpointId,Code,CSharpClassName,Parameters) VALUES (6,4,'Page','Platformus.Domain.DataSources.PageDataSource',NULL);
INSERT INTO `DataSources` (Id,EndpointId,Code,CSharpClassName,Parameters) VALUES (7,5,'Page','Platformus.Domain.DataSources.PageDataSource',NULL);
CREATE TABLE "Cultures" (
	"Id" INTEGER NOT NULL CONSTRAINT "PK_Culture" PRIMARY KEY AUTOINCREMENT,
	"Code" TEXT NOT NULL,
	"Name" TEXT NOT NULL,
	"IsNeutral" INTEGER NOT NULL,
	"IsDefault" INTEGER NOT NULL,
	"IsBackendUi" INTEGER NOT NULL
);
INSERT INTO `Cultures` (Id,Code,Name,IsNeutral,IsDefault,IsBackendUi) VALUES (1,'__','Neutral',1,0,0);
INSERT INTO `Cultures` (Id,Code,Name,IsNeutral,IsDefault,IsBackendUi) VALUES (2,'en','English',0,1,1);
INSERT INTO `Cultures` (Id,Code,Name,IsNeutral,IsDefault,IsBackendUi) VALUES (3,'ru','Русский',0,0,0);
INSERT INTO `Cultures` (Id,Code,Name,IsNeutral,IsDefault,IsBackendUi) VALUES (4,'uk','Українська',0,0,0);
CREATE TABLE "Credentials" (
	"Id" INTEGER NOT NULL CONSTRAINT "PK_Credential" PRIMARY KEY AUTOINCREMENT,
	"UserId" INTEGER NOT NULL,
	"CredentialTypeId" INTEGER NOT NULL,
	"Identifier" TEXT NOT NULL,
	"Secret" TEXT,
	CONSTRAINT "FK_Credential_User_UserId" FOREIGN KEY ("UserId") REFERENCES "Users" ("Id"),
	CONSTRAINT "FK_Credential_CredentialType_CredentialTypeId" FOREIGN KEY ("CredentialTypeId") REFERENCES "CredentialTypes" ("Id")
);
INSERT INTO `Credentials` (Id,UserId,CredentialTypeId,Identifier,Secret) VALUES (1,1,1,'admin@platformus.net','21-23-2F-29-7A-57-A5-A7-43-89-4A-0E-4A-80-1F-C3');
CREATE TABLE "CredentialTypes" (
	"Id" INTEGER NOT NULL CONSTRAINT "PK_CredentialType" PRIMARY KEY AUTOINCREMENT,
	"Code" TEXT NOT NULL,
	"Name" TEXT NOT NULL,
	"Position" INTEGER
);
INSERT INTO `CredentialTypes` (Id,Code,Name,Position) VALUES (1,'Email','Email',1);
CREATE TABLE "Configurations" (
	"Id" INTEGER NOT NULL CONSTRAINT "PK_Configuration" PRIMARY KEY AUTOINCREMENT,
	"Code" TEXT NOT NULL,
	"Name" TEXT NOT NULL
);
INSERT INTO `Configurations` (Id,Code,Name) VALUES (1,'Email','Email');
INSERT INTO `Configurations` (Id,Code,Name) VALUES (2,'Globalization','Globalization');
CREATE TABLE "CompletedForms" (
	"Id" INTEGER NOT NULL CONSTRAINT "PK_CompletedForm" PRIMARY KEY AUTOINCREMENT,
	"FormId" INTEGER NOT NULL,
	"Created" TEXT NOT NULL,
	CONSTRAINT "FK_CompletedForm_Form_FormId" FOREIGN KEY ("FormId") REFERENCES "Forms" ("Id")
);
CREATE TABLE "CompletedFields" (
	"Id" INTEGER NOT NULL CONSTRAINT "PK_CompletedField" PRIMARY KEY AUTOINCREMENT,
	"CompletedFormId" INTEGER NOT NULL,
	"FieldId" INTEGER NOT NULL,
	"Value" TEXT,
	CONSTRAINT "FK_CompletedField_CompletedForm_CompletedFormId" FOREIGN KEY ("CompletedFormId") REFERENCES "CompletedForms" ("Id")
	CONSTRAINT "FK_CompletedField_Field_FieldId" FOREIGN KEY ("FieldId") REFERENCES "Fields" ("Id")
);
CREATE TABLE "Classes" (
	"Id" INTEGER NOT NULL CONSTRAINT "PK_Class" PRIMARY KEY AUTOINCREMENT,
	"ClassId" INTEGER,
	"Code" TEXT NOT NULL,
	"Name" TEXT NOT NULL,
	"PluralizedName" TEXT NOT NULL,
	"IsAbstract" INTEGER NOT NULL,
	CONSTRAINT "FK_Class_Class_ClassId" FOREIGN KEY("ClassId") REFERENCES "Classes"("Id")
);
INSERT INTO `Classes` (Id,ClassId,Code,Name,PluralizedName,IsAbstract) VALUES (1,NULL,'Page','Page','Pages',1);
INSERT INTO `Classes` (Id,ClassId,Code,Name,PluralizedName,IsAbstract) VALUES (2,1,'RegularPage','Regular Page','Regular Pages',0);
INSERT INTO `Classes` (Id,ClassId,Code,Name,PluralizedName,IsAbstract) VALUES (3,1,'FeaturesPage','Features Page','Features Pages',0);
INSERT INTO `Classes` (Id,ClassId,Code,Name,PluralizedName,IsAbstract) VALUES (4,1,'BlogPostPage','Blog Post Page','Blog Post Pages',0);
INSERT INTO `Classes` (Id,ClassId,Code,Name,PluralizedName,IsAbstract) VALUES (5,NULL,'Feature','Feature','Features',0);
COMMIT;
