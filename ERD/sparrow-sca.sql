
/* Drop Views */

DROP VIEW IF EXISTS sca_project_tree_view;



/* Drop Tables */

DROP TABLE IF EXISTS sca_project_user;
DROP TABLE IF EXISTS sca_user_config;
DROP TABLE IF EXISTS sca_user_group_relation;
DROP TABLE IF EXISTS sca_user_password_history;
DROP TABLE IF EXISTS sca_user_token_password;
DROP TABLE IF EXISTS sca_user;
DROP TABLE IF EXISTS sca_auth_server;
DROP TABLE IF EXISTS sca_config;
DROP TABLE IF EXISTS sca_engine_server;
DROP TABLE IF EXISTS sca_issue;
DROP TABLE IF EXISTS sca_log_access;
DROP TABLE IF EXISTS sca_log_resource_usage;
DROP TABLE IF EXISTS sca_project_user_group;
DROP TABLE IF EXISTS sca_scan_file;
DROP TABLE IF EXISTS sca_scan;
DROP TABLE IF EXISTS sca_project;
DROP TABLE IF EXISTS sca_user_authority_role;
DROP TABLE IF EXISTS sca_user_authority;
DROP TABLE IF EXISTS sca_user_group;
DROP TABLE IF EXISTS sca_user_role;




/* Create Tables */

CREATE TABLE sca_auth_server
(
	auth_server_id serial NOT NULL,
	auth_server_name varchar(100) NOT NULL UNIQUE,
	type_code varchar(5) NOT NULL,
	url varchar(100) NOT NULL UNIQUE,
	account_name varchar(30),
	account_password varchar(64),
	connect_timeout int,
	auto_add_user_yn varchar(1) DEFAULT 'Y' NOT NULL,
	auto_login_yn varchar(1) DEFAULT 'Y' NOT NULL,
	conf_json varchar(300),
	PRIMARY KEY (auth_server_id)
) WITHOUT OIDS;


CREATE TABLE sca_config
(
	user_config_id serial NOT NULL,
	config_key varchar(100) NOT NULL UNIQUE,
	config_value text NOT NULL,
	PRIMARY KEY (user_config_id)
) WITHOUT OIDS;


CREATE TABLE sca_engine_server
(
	engine_server_id serial NOT NULL,
	url varchar(100) NOT NULL UNIQUE,
	engine_server_comment varchar(600),
	PRIMARY KEY (engine_server_id)
) WITHOUT OIDS;


CREATE TABLE sca_issue
(
	id serial NOT NULL,
	scan_id int NOT NULL,
	determinant varchar(40) NOT NULL,
	insert_date_time timestamp DEFAULT CURRENT_TIMESTAMP,
	vuln_version_id int,
	scan_file_id int,
	PRIMARY KEY (id)
) WITHOUT OIDS;


CREATE TABLE sca_log_access
(
	log_access_id serial NOT NULL,
	user_id varchar(40),
	url varchar(100) NOT NULL,
	http_method varchar(6) NOT NULL,
	http_status_code int NOT NULL,
	insert_date_time timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL,
	PRIMARY KEY (log_access_id)
) WITHOUT OIDS;


CREATE TABLE sca_log_resource_usage
(
	log_resource_usage_id serial NOT NULL,
	cpu float NOT NULL,
	memory float NOT NULL,
	db float NOT NULL,
	hdd float NOT NULL,
	insert_date_time timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL,
	PRIMARY KEY (log_resource_usage_id)
) WITHOUT OIDS;


CREATE TABLE sca_project
(
	id serial NOT NULL,
	parent_id int,
	project_name varchar(50) NOT NULL,
	project_key varchar(50) NOT NULL UNIQUE,
	project_comment varchar(500),
	max_scans int,
	management_only_yn varchar(1) DEFAULT 'N' NOT NULL,
	user_parent_project_yn varchar(1) DEFAULT 'Y' NOT NULL,
	exclude_files text,
	exclude_paths text,
	ihub_project_uid int,
	insert_user_id varchar(40),
	insert_date_time timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL,
	update_date_time timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL,
	PRIMARY KEY (id)
) WITHOUT OIDS;


CREATE TABLE sca_project_user
(
	id serial NOT NULL,
	project_id int NOT NULL,
	user_id varchar(40) NOT NULL,
	project_role_code varchar(1) NOT NULL CHECK ( project_role_code = 'M' OR project_role_code = 'A' OR project_role_code = 'V'),
	PRIMARY KEY (id),
	UNIQUE (project_id, user_id)
) WITHOUT OIDS;


CREATE TABLE sca_project_user_group
(
	id serial NOT NULL,
	project_id int NOT NULL,
	user_group_id int NOT NULL,
	project_role_code varchar(1) NOT NULL CHECK ( project_role_code = 'M' OR project_role_code = 'A' OR project_role_code = 'V'),
	PRIMARY KEY (id),
	UNIQUE (project_id, user_group_id)
) WITHOUT OIDS;


CREATE TABLE sca_scan
(
	id serial NOT NULL,
	issue_id int NOT NULL,
	start_date_time timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL,
	end_date_time timestamp,
	client_ip varchar(15) NOT NULL,
	computer varchar(100),
	build_path varchar(1024),
	command_args varchar(1024),
	scan_user_id varchar(40),
	progress varchar(20) DEFAULT '0%',
	progress_percent int DEFAULT 0 NOT NULL,
	PRIMARY KEY (id)
) WITHOUT OIDS;


CREATE TABLE sca_scan_file
(
	id serial NOT NULL,
	scan_id int NOT NULL,
	file_path varchar(1024),
	file_name varchar(500) NOT NULL,
	file_extension varchar(10) NOT NULL,
	file_hash varchar(256),
	PRIMARY KEY (id),
	UNIQUE (scan_id, file_path)
) WITHOUT OIDS;


CREATE TABLE sca_user
(
	user_id varchar(40) NOT NULL,
	user_ci varchar(40) NOT NULL UNIQUE,
	user_authority_id int NOT NULL,
	auth_server_id int,
	user_name varchar(120) NOT NULL,
	user_comment varchar(500),
	email varchar(40),
	password varchar(64) NOT NULL,
	user_lang varchar(2),
	last_login_date_time timestamp,
	login_fail_count int DEFAULT 0 NOT NULL,
	login_fail_date_time timestamp,
	password_update_time timestamp DEFAULT now() NOT NULL,
	update_code varchar(1) DEFAULT 'P' NOT NULL,
	expire_date_time timestamp,
	allowed_ip varchar(15),
	use_yn varchar(1) DEFAULT 'Y' NOT NULL,
	insert_date_time timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL,
	update_date_time timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL,
	PRIMARY KEY (user_id)
) WITHOUT OIDS;


CREATE TABLE sca_user_authority
(
	user_authority_id serial NOT NULL,
	user_authority_name varchar(200) NOT NULL UNIQUE,
	type_code varchar(1) DEFAULT 'U' NOT NULL UNIQUE,
	PRIMARY KEY (user_authority_id)
) WITHOUT OIDS;


CREATE TABLE sca_user_authority_role
(
	user_authority_id int NOT NULL,
	user_role_id int NOT NULL,
	UNIQUE (user_authority_id, user_role_id)
) WITHOUT OIDS;


CREATE TABLE sca_user_config
(
	user_config_id serial NOT NULL,
	user_id varchar(40) NOT NULL,
	config_key varchar(100) NOT NULL,
	config_value text NOT NULL,
	PRIMARY KEY (user_config_id),
	UNIQUE (user_id, config_key)
) WITHOUT OIDS;


CREATE TABLE sca_user_group
(
	user_group_id serial NOT NULL,
	parent_user_group_id int DEFAULT 0,
	user_group_name varchar(50) NOT NULL,
	user_group_comment varchar(500),
	insert_date_time timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL,
	update_date_time timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL,
	PRIMARY KEY (user_group_id),
	UNIQUE (user_group_name)
) WITHOUT OIDS;


CREATE TABLE sca_user_group_relation
(
	id serial NOT NULL,
	user_id varchar(40) NOT NULL,
	user_group_id int NOT NULL,
	PRIMARY KEY (id),
	UNIQUE (user_id, user_group_id)
) WITHOUT OIDS;


CREATE TABLE sca_user_password_history
(
	user_token_password_id serial NOT NULL,
	user_id varchar(40) NOT NULL,
	password varchar(64) NOT NULL,
	PRIMARY KEY (user_token_password_id),
	UNIQUE (user_id, password)
) WITHOUT OIDS;


CREATE TABLE sca_user_role
(
	user_role_id serial NOT NULL,
	user_role_name varchar(120) NOT NULL UNIQUE,
	PRIMARY KEY (user_role_id)
) WITHOUT OIDS;


CREATE TABLE sca_user_token_password
(
	user_token_password_id serial NOT NULL,
	user_id varchar(40) NOT NULL,
	auth_category_code varchar(2) NOT NULL,
	token_password varchar(64) NOT NULL,
	PRIMARY KEY (user_token_password_id),
	UNIQUE (user_id, auth_category_code)
) WITHOUT OIDS;



/* Create Foreign Keys */

ALTER TABLE sca_user
	ADD FOREIGN KEY (auth_server_id)
	REFERENCES sca_auth_server (auth_server_id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE sca_project
	ADD FOREIGN KEY (parent_id)
	REFERENCES sca_project (id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE sca_project_user
	ADD FOREIGN KEY (project_id)
	REFERENCES sca_project (id)
	ON UPDATE RESTRICT
	ON DELETE CASCADE
;


ALTER TABLE sca_project_user_group
	ADD FOREIGN KEY (project_id)
	REFERENCES sca_project (id)
	ON UPDATE RESTRICT
	ON DELETE CASCADE
;


ALTER TABLE sca_scan
	ADD FOREIGN KEY (issue_id)
	REFERENCES sca_project (id)
	ON UPDATE NO ACTION
	ON DELETE CASCADE
;


ALTER TABLE sca_issue
	ADD FOREIGN KEY (scan_id)
	REFERENCES sca_scan (id)
	ON UPDATE RESTRICT
	ON DELETE CASCADE
;


ALTER TABLE sca_scan_file
	ADD FOREIGN KEY (scan_id)
	REFERENCES sca_scan (id)
	ON UPDATE RESTRICT
	ON DELETE CASCADE
;


ALTER TABLE sca_project_user
	ADD FOREIGN KEY (user_id)
	REFERENCES sca_user (user_id)
	ON UPDATE RESTRICT
	ON DELETE CASCADE
;


ALTER TABLE sca_user_config
	ADD FOREIGN KEY (user_id)
	REFERENCES sca_user (user_id)
	ON UPDATE RESTRICT
	ON DELETE CASCADE
;


ALTER TABLE sca_user_group_relation
	ADD FOREIGN KEY (user_id)
	REFERENCES sca_user (user_id)
	ON UPDATE RESTRICT
	ON DELETE CASCADE
;


ALTER TABLE sca_user_password_history
	ADD FOREIGN KEY (user_id)
	REFERENCES sca_user (user_id)
	ON UPDATE RESTRICT
	ON DELETE CASCADE
;


ALTER TABLE sca_user_token_password
	ADD FOREIGN KEY (user_id)
	REFERENCES sca_user (user_id)
	ON UPDATE RESTRICT
	ON DELETE CASCADE
;


ALTER TABLE sca_user
	ADD FOREIGN KEY (user_authority_id)
	REFERENCES sca_user_authority (user_authority_id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE sca_user_authority_role
	ADD FOREIGN KEY (user_authority_id)
	REFERENCES sca_user_authority (user_authority_id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE sca_project_user_group
	ADD FOREIGN KEY (user_group_id)
	REFERENCES sca_user_group (user_group_id)
	ON UPDATE RESTRICT
	ON DELETE CASCADE
;


ALTER TABLE sca_user_group_relation
	ADD FOREIGN KEY (user_group_id)
	REFERENCES sca_user_group (user_group_id)
	ON UPDATE RESTRICT
	ON DELETE CASCADE
;


ALTER TABLE sca_user_authority_role
	ADD FOREIGN KEY (user_role_id)
	REFERENCES sca_user_role (user_role_id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;



/* Create Views */

CREATE VIEW sca_project_tree_view AS WITH RECURSIVE project_tree (project_id, project_key, project_name, parent_id, parent_project_key, parent_project_name, depth, project_tree_key_path, project_tree_name_path) AS (
  SELECT project_id
       , project_key
       , project_name
       , parent_id
       , null::VARCHAR
       , null::VARCHAR
       , 1
       , NULL
       , NULL
    FROM sa_project
   WHERE parent_id IS NULL
  UNION ALL
  SELECT P.project_id
       , P.project_key
       , P.project_name
       , P.parent_id
       , PT.project_key
       , PT.project_name
       , PT.depth + 1
       , (CASE WHEN PT.project_tree_key_path IS NULL THEN '' ELSE PT.project_tree_key_path || ' > ' END) || PT.project_key
       , (CASE WHEN PT.project_tree_name_path IS NULL THEN '' ELSE PT.project_tree_name_path || ' > ' END) || PT.project_name
    FROM sa_project P
         JOIN project_tree PT ON P.parent_id = PT.project_id
) SELECT *
    FROM project_tree;



