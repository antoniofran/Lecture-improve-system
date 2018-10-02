
USE `lecture_improve`;

#####################################

DELIMITER //

CREATE PROCEDURE application_user_check_initial ()
	BEGIN
    
		SELECT EXISTS
		(
			SELECT
				`user_id`
			FROM
				`application_user`
			WHERE
				`role_id` = 1
		) AS `admin_exist`;
        
	END;
//

DELIMITER ;

#####################################

DELIMITER //

CREATE PROCEDURE application_user_check_login (IN name_sent VARCHAR(128))
	BEGIN
    
		SELECT
			IH.`human_id` AS `user_human_id`
        ,	IFNULL(IH.`name`,AU.`name`) AS `user_human_name`
		,	AU.`pass_hash` AS `user_pass_hash`
		,	AUR.`name` AS `user_role_name`
		,	AU.`active` AS `user_is_active`
		FROM
			`application_user` AS AU
			JOIN `application_user_role` AS AUR
				ON AU.`role_id` = AUR.`role_id`
			LEFT JOIN `institution_human` AS IH
				ON AU.`human_id` = IH.`human_id`
		WHERE
			AU.`name` = name_sent;
        
	END;
//

DELIMITER ;

#####################################

DELIMITER //

CREATE PROCEDURE application_user_role_query ()
	BEGIN
    
		SELECT
			`role_id`
		,	`name`
		,	`description`
        FROM
			`application_user_role`;
            
	END;
//

DELIMITER ;

#####################################

DELIMITER //

CREATE PROCEDURE application_user_create (IN name_sent VARCHAR(128), IN pass_hash_sent VARCHAR(255), IN role_id_sent INT, IN human_id_sent INT)
	BEGIN
		
        INSERT INTO `application_user`
		(
			`name`
		,	`pass_hash`
		,	`role_id`
        ,	`human_id`
		)
		VALUES
		(
			name_sent
		,	pass_hash_sent
		,	role_id_sent
        ,	human_id_sent
		);
	
	END;
//

DELIMITER ;

#####################################

DELIMITER //

CREATE PROCEDURE application_user_query (IN human_id_sent INT)
	BEGIN
        
        SELECT
			AU.`user_id`
		,	AU.`name`
		,	AUR.`name` AS `role_name`
        ,	AU.`active`
		FROM
			`application_user` AS AU
			JOIN `application_user_role` AS AUR
				ON AU.`role_id` = AUR.`role_id`
        WHERE
			AU.`human_id` = human_id_sent;

	END;
//

DELIMITER ;

#####################################

DELIMITER //

CREATE PROCEDURE survey_span_open ()
	BEGIN
		
        INSERT INTO `survey_span`()
		VALUES ();
        
	END;
//

DELIMITER ;

#####################################

DELIMITER //

CREATE PROCEDURE survey_span_open_check_exist ()
	BEGIN
    
		DECLARE span_id_open INT;
        DECLARE span_id_max INT;

		/**************/
        
        SELECT
			`span_id`
		INTO
			span_id_open
		FROM
			`survey_span`
		WHERE
			`date_finished` IS NULL;
            
		/**************/
        
        SELECT
			MAX(`span_id`)
		INTO
			span_id_max
		FROM
			`survey_span`;
            
		/**************/
    
		IF (span_id_open IS NULL) THEN
        
			SELECT
				0 AS `span_open_exist`
			,	span_id_max AS `span_id_max`;
        
        ELSE
        
			SELECT
				1 AS `span_open_exist`
			,	span_id_max AS `span_id_max`;
        
        END IF;
        
	END;
//

DELIMITER ;

#####################################

DELIMITER //

CREATE PROCEDURE survey_span_close ()
	BEGIN
		
        UPDATE
			`survey_span`
		SET
			`date_finished` = NOW()
		WHERE
			`date_finished` IS NULL;
        
	END;
//

DELIMITER ;

#####################################

DELIMITER //

CREATE PROCEDURE survey_span_query ()
	BEGIN
    
		SELECT
			`span_id`
		,	`date_started`
        ,	`date_finished`
		FROM
			`survey_span`
		ORDER BY
			`date_started` DESC;
        
	END;
//

DELIMITER ;

#####################################

DELIMITER //

CREATE PROCEDURE survey_span_nav_query (IN human_id_sent INT, IN span_id_sent INT, IN is_archive INT)
	BEGIN
    
		IF (is_archive = 0) THEN
        
			SELECT
				IC.`course_id`
			,	IC.`name`
            ,	IC.`description`
            ,	SRC.`check_id`
			FROM
				`institution_course` AS IC
                JOIN `institution_mapper` AS IM
					ON IC.`course_id` = IM.`course_id`
				LEFT JOIN `survey_result_check` AS SRC
					ON IC.`course_id` = SRC.`course_id`
                    AND SRC.`human_id` = human_id_sent
                    AND SRC.`span_id` = span_id_sent
			WHERE
				IM.`human_id` = human_id_sent
                AND IC.`active` = 1
                AND IM.`active` = 1;
                
		ELSE

            SELECT DISTINCT
				IC.`course_id`
			,	IC.`name`
            ,	IC.`description`
            ,	SRC.`check_id`
            FROM
				`institution_course` AS IC
                JOIN `institution_mapper` AS IM
					ON IC.`course_id` = IM.`course_id`
				JOIN `survey_result` AS SR
					ON IM.`course_id` = SR.`course_id`
				LEFT JOIN `survey_result_check` AS SRC
					ON IC.`course_id` = SRC.`course_id`
                    AND SRC.`human_id` = human_id_sent
                    AND SRC.`span_id` = span_id_sent
			WHERE
				IM.`human_id` = human_id_sent
                AND SR.`span_id` = span_id_sent;
            
        END IF;
        
	END;
//

DELIMITER ;

#####################################

DELIMITER //

CREATE PROCEDURE survey_result_query (IN course_id_sent INT, IN span_id_sent INT)
	BEGIN
    
        IF (
			NOT EXISTS
			(
				SELECT
					`result_id`
				FROM
					`survey_result`
				WHERE
					`course_id` = course_id_sent
					AND `span_id` = span_id_sent
			)
		) THEN
			
            INSERT INTO `survey_result`
            (
				`course_id`
			,	`element_id`
            ,	`span_id`
            )
            SELECT
				course_id_sent
			,	`element_id`
            ,	span_id_sent
            FROM
				`survey_element`;
            
		END IF;
        
        /*******************/
        
        SELECT
			SR.`result_id`
		,	SETy.`type_id`
		,	SE.`element_id`
		,	SETy.`input_title`
		,	SE.`input_text`
		,	SETy.`output_title`
		,	SE.`output_text`
        ,	SR.`grade_sum`
        ,	SR.`grade_count`
        FROM
			`survey_element_type` AS SETy
			JOIN `survey_element` AS SE
				ON SETy.`type_id` = SE.`type_id`
			JOIN `survey_result` AS SR
				ON SE.`element_id` = SR.`element_id`
		WHERE
			SR.`course_id` = course_id_sent
            AND SR.`span_id` = span_id_sent
        ORDER BY
			SETy.`order` ASC
		,	SE.`order_in_type` ASC;
            
	END;
//

DELIMITER ;

#####################################

DELIMITER //

CREATE PROCEDURE survey_feedback_respond_create (IN output_text_sent VARCHAR(255), IN feedback_id_sent INT)
	BEGIN
		
        INSERT INTO `survey_feedback_respond`
		(
			`output_text`
        ,	`feedback_id`
        )
		VALUES
		(
			output_text_sent
		,	feedback_id_sent
        );
        
	END;
//

DELIMITER ;

#####################################

DELIMITER //

CREATE PROCEDURE survey_feedback_create (IN input_text_sent VARCHAR(255), IN type_id_sent INT, IN course_id_sent INT, IN span_id_sent INT)
	BEGIN
		
        INSERT INTO `survey_feedback`
		(
			`input_text`
        ,	`type_id`
        ,	`course_id`
        ,	`span_id`
        )
		VALUES
		(
			input_text_sent
		,	type_id_sent
        ,	course_id_sent
        ,	span_id_sent
        );
        
	END;
//

DELIMITER ;

#####################################

DELIMITER //

CREATE PROCEDURE survey_feedback_query (IN course_id_sent INT, IN span_id_sent INT)
	BEGIN

		IF (
			NOT EXISTS
			(
				SELECT
					`result_id`
				FROM
					`survey_result`
				WHERE
					`course_id` = course_id_sent
					AND `span_id` = span_id_sent
			)
		) THEN
			
            INSERT INTO `survey_result`
            (
				`course_id`
			,	`element_id`
            ,	`span_id`
            )
            SELECT
				course_id_sent
			,	`element_id`
            ,	span_id_sent
            FROM
				`survey_element`;
            
		END IF;

		/****************/

		CREATE TEMPORARY TABLE temp_data_tbl AS
        (
			SELECT
				SFR.`respond_id`
			,	SFTy.`type_id`
			,	SF.`feedback_id`
			,	SFTy.`input_title`
			,	SF.`input_text`
			,	SFTy.`output_title`
			,	SFR.`output_text`
			FROM
				`survey_feedback_type` AS SFTy
				LEFT JOIN `survey_feedback` AS SF
					ON SFTy.`type_id` = SF.`type_id`
					AND SF.`course_id` = course_id_sent
					AND SF.`span_id` = span_id_sent
				LEFT JOIN `survey_feedback_respond` AS SFR
					ON SF.`feedback_id` = SFR.`feedback_id`
			ORDER BY
				SFTy.`type_id` ASC
			,	SF.`feedback_id` ASC
			,	SFR.`respond_id` ASC
        );

        /****************/
        
        CREATE TEMPORARY TABLE temp_count_fdbck_tbl AS
        (
			SELECT
				`type_id`
            ,	COUNT(DISTINCT `feedback_id`) AS `count_fdbck`
            FROM
				temp_data_tbl
			GROUP BY
				`type_id`
        );
        
        /****************/
        
        CREATE TEMPORARY TABLE temp_count_rspnd_tbl AS
        (
			SELECT
				`type_id`
			,	`feedback_id`
            ,	COUNT(DISTINCT `respond_id`) AS `count_rspnd`
            FROM
				temp_data_tbl
			GROUP BY
				`type_id`
			,	`feedback_id`
        );
        
        /****************/
        
        SELECT
			TDT.`respond_id`
		,	TDT.`type_id`
		,	TDT.`feedback_id`
		,	TDT.`input_title`
		,	TDT.`input_text`
		,	TDT.`output_title`
		,	TDT.`output_text`
        ,	IFNULL(TCFT.`count_fdbck`,0) AS `count_fdbck`
        ,	IFNULL(TCRT.`count_rspnd`,0) AS `count_rspnd`
        FROM
			temp_data_tbl AS TDT
            LEFT JOIN temp_count_fdbck_tbl AS TCFT
				ON TDT.`type_id` = TCFT.`type_id`
			LEFT JOIN temp_count_rspnd_tbl AS TCRT
				ON TDT.`type_id` = TCRT.`type_id`
                AND TDT.`feedback_id` = TCRT.`feedback_id`
		ORDER BY
			TDT.`type_id` ASC
		,	TDT.`feedback_id` ASC
		,	TDT.`respond_id` ASC;
        
        /****************/
        
        DROP TEMPORARY TABLE IF EXISTS temp_data_tbl;
        
        DROP TEMPORARY TABLE IF EXISTS temp_count_fdbck_tbl;
        
        DROP TEMPORARY TABLE IF EXISTS temp_count_rspnd_tbl;
            
	END;
//

DELIMITER ;

#####################################

DELIMITER //

CREATE PROCEDURE institution_course_create (IN name_sent VARCHAR(255), IN description_sent VARCHAR(600))
	BEGIN
		
        INSERT INTO `institution_course`
		(
			`name`
        ,	`description`
        )
		VALUES
		(
			name_sent
		,	description_sent
        );

        
	END;
//

DELIMITER ;

#####################################

DELIMITER //

CREATE PROCEDURE institution_course_update (IN name_sent VARCHAR(255), IN description_sent VARCHAR(600), IN course_id_sent INT)
	BEGIN
		
        UPDATE
			`institution_course`
		SET
			`name` = name_sent
		,	`description` = description_sent
        WHERE
			`course_id` = course_id_sent;

	END;
//

DELIMITER ;

#####################################

DELIMITER //

CREATE PROCEDURE institution_course_select (IN course_id_sent INT)
	BEGIN
		
        SELECT
			`name`
		,	`description`
        FROM
			`institution_course`
        WHERE
			`course_id` = course_id_sent;

	END;
//

DELIMITER ;

#####################################

DELIMITER //

CREATE PROCEDURE institution_course_query ()
	BEGIN
    
		SELECT
			`course_id`
		,	`name`
		,	`description`
		,	`active`
        FROM
			`institution_course`;
            
	END;
//

DELIMITER ;

#####################################

DELIMITER //

CREATE PROCEDURE institution_human_create (IN name_sent VARCHAR(255), IN description_sent VARCHAR(600))
	BEGIN
		
        INSERT INTO `institution_human`
		(
			`name`
        ,	`description`
        )
		VALUES
		(
			name_sent
		,	description_sent
        );

        
	END;
//

DELIMITER ;

#####################################

DELIMITER //

CREATE PROCEDURE institution_human_update (IN name_sent VARCHAR(255), IN description_sent VARCHAR(600), IN human_id_sent INT)
	BEGIN
		
        UPDATE
			`institution_human`
		SET
			`name` = name_sent
		,	`description` = description_sent
        WHERE
			`human_id` = human_id_sent;

	END;
//

DELIMITER ;

#####################################

DELIMITER //

CREATE PROCEDURE institution_human_select (IN human_id_sent INT)
	BEGIN
		
        SELECT
			`name`
		,	`description`
        FROM
			`institution_human`
        WHERE
			`human_id` = human_id_sent;

	END;
//

DELIMITER ;

#####################################

DELIMITER //

CREATE PROCEDURE institution_human_query ()
	BEGIN
    
		SELECT
			`human_id`
		,	`name`
		,	`description`
		,	`active`
        FROM
			`institution_human`;
            
	END;
//

DELIMITER ;

#####################################

DELIMITER //

CREATE PROCEDURE institution_mapper_create (IN human_id_sent INT, IN course_id_sent INT)
	BEGIN
		
        INSERT INTO `institution_mapper`
		(
			`human_id`
        ,	`course_id`
        )
		VALUES
		(
			human_id_sent
		,	course_id_sent
        );

	END;
//

DELIMITER ;

#####################################

DELIMITER //

CREATE PROCEDURE institution_mapper_select (IN human_id_sent INT)
	BEGIN
    
		CREATE TEMPORARY TABLE institution_human_list_courses(`course_id` INT);
        
        /**************/
        
		INSERT INTO institution_human_list_courses
		(
			`course_id`
        )
		SELECT
			IC.`course_id`
        FROM
			`institution_mapper` AS IM
            JOIN `institution_course` AS IC
				ON IM.`course_id` = IC.`course_id`
        WHERE
			IM.`human_id` = human_id_sent;
        
        /**************/
        
        SELECT
			IC.`course_id`
		,	IC.`name`
		,	IC.`description`
        FROM
			`institution_course` AS IC
            LEFT JOIN `institution_human_list_courses` AS IHLC
				ON IC.`course_id` = IHLC.`course_id`
		WHERE
			IHLC.`course_id` IS NULL;
        
        /**************/
        
        DROP TEMPORARY TABLE IF EXISTS institution_human_list_courses;
        
	END;
//

DELIMITER ;

#####################################

DELIMITER //

CREATE PROCEDURE institution_mapper_query (IN human_id_sent INT)
	BEGIN
		
        SELECT
			IC.`course_id`
		,	IC.`name`
		,	IC.`description`
        ,	IM.`active`
        FROM
			`institution_mapper` AS IM
            JOIN `institution_course` AS IC
				ON IM.`course_id` = IC.`course_id`
        WHERE
			IM.`human_id` = human_id_sent;

	END;
//

DELIMITER ;