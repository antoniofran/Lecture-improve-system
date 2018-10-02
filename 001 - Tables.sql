
USE `lecture_improve`;

#####################################

CREATE TABLE `institution_course`
(
	`course_id`		INT			NOT NULL	AUTO_INCREMENT
,	`active`		TINYINT		NOT NULL	DEFAULT 1
,	`name`		VARCHAR(255)	NOT NULL
,	`description`	VARCHAR(600)	NULL
,	PRIMARY KEY (`course_id`)
);

CREATE TABLE `institution_human`
(
	`human_id`		INT			NOT NULL	AUTO_INCREMENT
,	`active`		TINYINT		NOT NULL	DEFAULT 1
,	`name`		VARCHAR(255)	NOT NULL
,	`description`	VARCHAR(600)	NULL
,	PRIMARY KEY (`human_id`)
);

/**************************/

CREATE TABLE `institution_mapper`
(
	`mapper_id`		INT			NOT NULL	AUTO_INCREMENT
,	`active`		TINYINT		NOT NULL	DEFAULT 1
,	`human_id`		INT			NOT NULL
,	`course_id`		INT			NOT NULL
,	PRIMARY KEY (`mapper_id`)
,	FOREIGN KEY (`human_id`) REFERENCES `institution_human` (`human_id`)
,	FOREIGN KEY (`course_id`) REFERENCES `institution_course` (`course_id`)
,	UNIQUE KEY `ix_human_id_course_id` (`human_id`, `course_id`)
);

#####################################

CREATE TABLE `survey_span`
(
	`span_id`		INT			NOT NULL	AUTO_INCREMENT
,	`date_started`	DATETIME		NOT NULL	DEFAULT NOW()
,	`date_finished`	DATETIME		NULL
,	PRIMARY KEY (`span_id`)
);

/**************************/

CREATE TABLE `survey_element_type` /* prostori, izvođaći, sadržaji */
(
	`type_id`		INT			NOT NULL	AUTO_INCREMENT
,	`input_title`	VARCHAR(255)	NOT NULL
,	`output_title`	VARCHAR(255)	NOT NULL
,	`description`	VARCHAR(600)	NULL
,	`order`		INT			NOT NULL
,	PRIMARY KEY (`type_id`)
);

CREATE TABLE `survey_element`
(
	`element_id`	INT			NOT NULL	AUTO_INCREMENT
,	`type_id`		INT			NOT NULL
,	`input_text`	TEXT			NOT NULL
,	`output_text`	TEXT			NOT NULL
,	`order_in_type`	INT			NOT NULL
,	PRIMARY KEY (`element_id`)
,	FOREIGN KEY (`type_id`) REFERENCES `survey_element_type` (`type_id`)
);

/**************************/

CREATE TABLE `survey_feedback_type` /* comment, question */
(
	`type_id`		INT			NOT NULL	AUTO_INCREMENT
,	`input_title`	VARCHAR(255)	NOT NULL
,	`output_title`	VARCHAR(255)	NOT NULL
,	`description`	VARCHAR(600)	NULL	
,	PRIMARY KEY (`type_id`)
);

CREATE TABLE `survey_feedback`
(
	`feedback_id`	INT			NOT NULL	AUTO_INCREMENT
,	`type_id`		INT			NOT NULL
,	`course_id`		INT			NOT NULL
,	`input_text`	TEXT			NOT NULL
,	`span_id`		INT			NOT NULL
,	PRIMARY KEY (`feedback_id`)
,	FOREIGN KEY (`type_id`) REFERENCES `survey_feedback_type` (`type_id`)
,	FOREIGN KEY (`course_id`) REFERENCES `institution_course` (`course_id`)
,	FOREIGN KEY (`span_id`) REFERENCES `survey_span` (`span_id`)
);

CREATE TABLE `survey_feedback_respond`
(
	`respond_id`		INT			NOT NULL	AUTO_INCREMENT
,	`feedback_id`		INT			NOT NULL
,	`output_text`	TEXT			NULL
,	PRIMARY KEY (`respond_id`)
,	FOREIGN KEY (`feedback_id`) REFERENCES `survey_feedback` (`feedback_id`)
);

/**************************/

CREATE TABLE `survey_result`
(
	`result_id`		INT			NOT NULL	AUTO_INCREMENT
,	`course_id`		INT			NOT NULL
,	`element_id`	INT			NOT NULL
,	`grade_sum`		BIGINT		NOT NULL	DEFAULT 0
,	`grade_count`	BIGINT		NOT NULL	DEFAULT 0
,	`span_id`		INT			NOT NULL
,	PRIMARY KEY (`result_id`)
,	FOREIGN KEY (`course_id`) REFERENCES `institution_course` (`course_id`)
,	FOREIGN KEY (`element_id`) REFERENCES `survey_element` (`element_id`)
,	FOREIGN KEY (`span_id`) REFERENCES `survey_span` (`span_id`)
,	UNIQUE KEY `ix_course_id_element_id_span_id` (`course_id`, `element_id`, `span_id`)
);

CREATE TABLE `survey_result_check`
(
	`check_id`		INT			NOT NULL	AUTO_INCREMENT
,	`course_id`		INT			NOT NULL
,	`human_id`		INT			NOT NULL
,	`span_id`		INT			NOT NULL
,	PRIMARY KEY (`check_id`)
,	FOREIGN KEY (`course_id`) REFERENCES `institution_course` (`course_id`)
,	FOREIGN KEY (`human_id`) REFERENCES `institution_human` (`human_id`)
,	FOREIGN KEY (`span_id`) REFERENCES `survey_span` (`span_id`)
,	UNIQUE KEY `ix_course_id_human_id_span_id` (`course_id`, `human_id`, `span_id`)
);

#####################################

CREATE TABLE `application_user_role` /* admin, teacher, student, preview */
(
	`role_id`		INT			NOT NULL	AUTO_INCREMENT
,	`name`		VARCHAR(255)	NOT NULL
,	`description`	VARCHAR(600)	NULL	
,	PRIMARY KEY (`role_id`)
,	UNIQUE KEY `ix_name` (`name`)
);

CREATE TABLE `application_user`
(
	`user_id`		INT			NOT NULL	AUTO_INCREMENT
,	`active`		TINYINT		NOT NULL	DEFAULT 1
,	`name`		VARCHAR(128)	NOT NULL
,	`pass_hash`		VARCHAR(255)		NOT NULL
,	`role_id`		INT			NOT NULL
,	`human_id`		INT			NULL
,	PRIMARY KEY (`user_id`)
,	FOREIGN KEY (`role_id`) REFERENCES `application_user_role` (`role_id`)
,	FOREIGN KEY (`human_id`) REFERENCES `institution_human` (`human_id`)
,	UNIQUE KEY `ix_name` (`name`)
);

#####################################

SHOW TABLE STATUS;