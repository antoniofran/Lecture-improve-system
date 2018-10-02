/*
	on delete / update -> cascade / set null / restrict 
*/



CREATE TABLE `Application.Institutions`
(
	`ID`		INT		NOT NULL	AUTO_INCREMENT
,	`Active`	TINYINT		NOT NULL	DEFAULT 1
,	`DateCreated`	DATETIME	NOT NULL	DEFAULT NOW()
,	`Name`		VARCHAR(255)	NOT NULL
,	`Description`	VARCHAR(600)	NULL
,	PRIMARY KEY (`ID`)
);

CREATE TABLE `application_users_type`
(
	`ID`		INT		NOT NULL	AUTO_INCREMENT
,	`Active`	TINYINT		NOT NULL	DEFAULT 1
,	`DateCreated`	DATETIME	NOT NULL	DEFAULT NOW()
,	`Name`		VARCHAR(255)	NOT NULL
,	`Description`	VARCHAR(600)	NULL
,	PRIMARY KEY (`ID`)
);

CREATE TABLE `Application.Users`
(
	`ID`		INT		NOT NULL	AUTO_INCREMENT
,	`Active`	TINYINT		NOT NULL	DEFAULT 1
,	`DateCreated`	DATETIME	NOT NULL	DEFAULT NOW()
,	`Name`		VARCHAR(255)	NOT NULL
,	`Type`		INT		NOT NULL
,	`Password`	CHAR(56)	NOT NULL
,	PRIMARY KEY (`ID`)
,	FOREIGN KEY (`Type`) REFERENCES `application_users_type` (`ID`)
);

CREATE TABLE `Survey.Surveys.Type`
(
	`ID`		INT		NOT NULL	AUTO_INCREMENT
,	`Active`	TINYINT		NOT NULL	DEFAULT 1
,	`DateCreated`	DATETIME	NOT NULL	DEFAULT NOW()
,	`Name`		VARCHAR(255)	NOT NULL
,	`Description`	VARCHAR(600)	NULL
,	PRIMARY KEY (`ID`)
);

CREATE TABLE `Survey.Surveys`
(
	`ID`		INT		NOT NULL	AUTO_INCREMENT
,	`Active`	TINYINT		NOT NULL	DEFAULT 1
,	`DateCreated`	DATETIME	NOT NULL	DEFAULT NOW()
,	`Name`		VARCHAR(255)	NULL
,	`Type`		INT		NOT NULL
,	PRIMARY KEY (`ID`)
,	FOREIGN KEY (`Type`) REFERENCES `Survey.Surveys.Type` (`ID`)
);

CREATE TABLE `Survey.Questions.Type`
(
	`ID`		INT		NOT NULL	AUTO_INCREMENT
,	`Active`	TINYINT		NOT NULL	DEFAULT 1
,	`DateCreated`	DATETIME	NOT NULL	DEFAULT NOW()
,	`Name`		VARCHAR(255)	NOT NULL
,	`Description`	VARCHAR(600)	NULL
,	PRIMARY KEY (`ID`)
);

CREATE TABLE `Survey.Questions`
(
	`ID`		INT		NOT NULL	AUTO_INCREMENT
,	`Active`	TINYINT		NOT NULL	DEFAULT 1
,	`DateCreated`	DATETIME	NOT NULL	DEFAULT NOW()
,	`Name`		VARCHAR(255)	NULL
,	`Type`		INT		NOT NULL
,	`SurveyID`		INT		NOT NULL
,	PRIMARY KEY (`ID`)
,	FOREIGN KEY (`Type`) REFERENCES `Survey.Questions.Type` (`ID`)
,	FOREIGN KEY (`SurveyID`) REFERENCES `Survey.Surveys` (`ID`)
);

CREATE TABLE `Institution.Courses.Type`
(
	`ID`		INT		NOT NULL	AUTO_INCREMENT
,	`Active`	TINYINT		NOT NULL	DEFAULT 1
,	`DateCreated`	DATETIME	NOT NULL	DEFAULT NOW()
,	`Name`		VARCHAR(255)	NOT NULL
,	`Description`	VARCHAR(600)	NULL
,	PRIMARY KEY (`ID`)
);

CREATE TABLE `Institution.Courses`
(
	`ID`		INT		NOT NULL	AUTO_INCREMENT
,	`Active`	TINYINT		NOT NULL	DEFAULT 1
,	`DateCreated`	DATETIME	NOT NULL	DEFAULT NOW()
,	`Name`		VARCHAR(255)	NULL
,	`Type`		INT		NOT NULL
,	PRIMARY KEY (`ID`)
,	FOREIGN KEY (`Type`) REFERENCES `Institution.Courses.Type` (`ID`)
);