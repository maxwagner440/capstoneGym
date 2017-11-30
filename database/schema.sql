-- *************************************************************************************************
-- This script creates all of the database objects (tables, sequences, etc) for the database
-- *************************************************************************************************

BEGIN TRANSACTION;




DROP TABLE IF EXISTS messages_users;
DROP TABLE IF EXISTS clients_trainers;
DROP TABLE IF EXISTS notes_users;
DROP TABLE IF EXISTS messages;
DROP TABLE IF EXISTS message_content;
DROP TABLE IF EXISTS notes;
DROP TABLE IF EXISTS trainers_requests;
DROP TABLE IF EXISTS workouts;
DROP TABLE IF EXISTS trainers;
DROP TABLE IF EXISTS clients;
DROP TABLE IF EXISTS users;




-- CREATE statements go here
CREATE TABLE users(
        user_id Serial NOT NULL,
        username VARCHAR(255) UNIQUE NOT NULL,
        first_name VARCHAR(255),
        last_name VARCHAR(255),
        email  VARCHAR(255) UNIQUE NOT NULL,
        age int,
        password VARCHAR(255) NOT NULL,
        salt VARCHAR(255),
        role VARCHAR(255) NOT NULL,
        CONSTRAINT pk_user_user_id PRIMARY KEY (user_id)
);

CREATE TABLE trainers(
		trainer_id Serial NOT NULL,
		bio VARCHAR(255),
		philosophy VARCHAR(255),
		experience VARCHAR(255),
		hourly_price DECIMAL,
		user_id int NOT NULL,
		visibility BOOLEAN NOT NULL DEFAULT false,
		CONSTRAINT pk_trainers_trainer_id PRIMARY KEY (trainer_id),
		CONSTRAINT fk_users_trainers FOREIGN KEY (user_id) REFERENCES users (user_id),
		UNIQUE (trainer_id)
);

CREATE TABLE clients(
		client_id Serial NOT NULL,
		user_id int NOT NULL,
		height int,
		goal VARCHAR(255),
		modality VARCHAR(255),
		weight int NOT NULL,
		CONSTRAINT pk_clients_client_id PRIMARY KEY (client_id),
		CONSTRAINT fk_users_clients FOREIGN KEY (user_id) REFERENCES users (user_id),
		UNIQUE (client_id)
);

CREATE TABLE clients_trainers(
                client_id Serial,
                trainer_id Serial,
                CONSTRAINT fk_clients_trainers_clients FOREIGN KEY (client_id) REFERENCES clients (client_id),
                CONSTRAINT fk_clients_trainers_trainers FOREIGN KEY (trainer_id) REFERENCES trainers (trainer_id)
                
);

CREATE TABLE trainers_requests(
        client_id Serial,
        trainer_id Serial,
        accept int NOT NULL,
       
        CONSTRAINT fk_trainers_requests_clients FOREIGN KEY (client_id) REFERENCES clients (client_id),
        CONSTRAINT fk_trainers_requests_trainers FOREIGN KEY (trainer_id) REFERENCES trainers (trainer_id)
        
);

CREATE TABLE workouts(
        workout_id Serial NOT NULL,
        user_id Serial NOT NULL,
        reference VARCHAR(255),
        CONSTRAINT pk_workout_workout_id PRIMARY KEY (workout_id),
        CONSTRAINT fk_workouts_users FOREIGN KEY (user_id) REFERENCES users (user_id)
);

CREATE TABLE message_content(
        message_content_id Serial NOT NULL,
        content VARCHAR(255),
        time_stamp TIMESTAMP NOT NULL DEFAULT now(),
        CONSTRAINT pk_message_message_id PRIMARY KEY (message_content_id)
);

CREATE TABLE notes(
        note_id Serial NOT NULL,
        content VARCHAR(255),
        time_stamp TIMESTAMP NOT NULL DEFAULT now(),
        CONSTRAINT pk_notes_notes_id PRIMARY KEY (note_id)
);

CREATE TABLE messages_users(

        message_id Serial NOT NULL, 
        message_creator_user_id int NOT NULL,
        message_receiver_user_id int NOT NULL,
        message_content_id int NOT NULL,
        CONSTRAINT pk_messages_message_creator_id PRIMARY KEY (message_id),
        CONSTRAINT fk_messages_creator_user_id FOREIGN KEY (message_creator_user_id) REFERENCES users (user_id),
        CONSTRAINT fk_message_receiver_user_id FOREIGN KEY (message_receiver_user_id) REFERENCES users (user_id),
        CONSTRAINT fk_messages_content_id FOREIGN KEY (message_content_id) REFERENCES message_content (message_content_id)
              
);
CREATE TABLE notes_users(
        client_id int NOT NULL,
        trainer_id int NOT NULL,
        note_id int NOT NULL,
        CONSTRAINT fk_users_notes_trainers FOREIGN KEY (trainer_id) REFERENCES trainers (trainer_id),
        CONSTRAINT fk_users_notes_clients FOREIGN KEY (client_id) REFERENCES clients (client_id),
        CONSTRAINT fk_notes_notes_users FOREIGN KEY (note_id) REFERENCES notes (note_id)
);                               


ALTER TABLE clients_trainers
ADD FOREIGN KEY(client_id)
REFERENCES clients(client_id);


ALTER TABLE clients_trainers
ADD FOREIGN KEY(trainer_id)
REFERENCES trainers(trainer_id);

COMMIT;

INSERT INTO clients_trainers (client_id, trainer_id) VALUES (1, 1);

SELECT DISTINCT * FROM trainers_requests tr JOIN clients c ON tr.client_id=c.client_id JOIN users u ON u.user_id=c.user_id WHERE tr.trainer_id = 3 AND tr.accept=0;
SELECT * FROM messages_users mu JOIN message_content mc ON mu.message_content_id=mc.message_content_id WHERE mu.message_receiver_user_id=1 AND mu.message_creator_user_id=3 ORDER BY time_stamp DESC LIMIT 5;
ROLLBACK;

SELECT accept FROM trainers_requests WHERE client_id = 1 AND trainer_id = 1 LIMIT 1

