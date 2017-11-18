-- *************************************************************************************************
-- This script creates all of the database objects (tables, sequences, etc) for the database
-- *************************************************************************************************


BEGIN TRANSACTION;




DROP TABLE IF EXISTS messages_users;
DROP TABLE IF EXISTS notes_users;
DROP TABLE IF EXISTS messages;
DROP TABLE IF EXISTS notes;
DROP TABLE IF EXISTS workouts;
DROP TABLE IF EXISTS trainers;
DROP TABLE IF EXISTS clients;
DROP TABLE IF EXISTS users;




-- CREATE statements go here
CREATE TABLE users(
        user_id Serial NOT NULL,
        username VARCHAR(255) UNIQUE  NOT NULL,
        first_name VARCHAR(255),
        last_name VARCHAR(255),
        email VARCHAR(255) NOT NULL,
        age int,
        password VARCHAR(255) NOT NULL,
        salt VARCHAR(255),
        role VARCHAR(255) NOT NULL,
        CONSTRAINT pk_user_user_id PRIMARY KEY (user_id)
);

CREATE TABLE trainers(
		entry_id Serial NOT NULL,
		bio VARCHAR(255),
		philosophy VARCHAR(255),
		experience VARCHAR(255),
		hourly_price DECIMAL,
		trainer_id Serial NOT NULL,
		CONSTRAINT pk_trainers_entry_id PRIMARY KEY (entry_id),
		CONSTRAINT fk_users_trainers FOREIGN KEY (trainer_id) REFERENCES users (user_id)
);

CREATE TABLE clients(
		entry_id Serial NOT NULL,
		height int,
		goal VARCHAR(255),
		modality VARCHAR(255),
		weight int NOT NULL,
		client_id Serial NOT NULL,
		CONSTRAINT pk_clients_entry_id PRIMARY KEY (entry_id),
		CONSTRAINT fk_users_clients FOREIGN KEY (client_id) REFERENCES users (user_id)
);

CREATE TABLE workouts(
        workout_id Serial NOT NULL,
        user_id Serial NOT NULL,
        reference VARCHAR(255),
        CONSTRAINT pk_workout_workout_id PRIMARY KEY (workout_id),
        CONSTRAINT fk_workouts_users FOREIGN KEY (user_id) REFERENCES users (user_id)
);

CREATE TABLE messages(
        message_id Serial NOT NULL,
        content VARCHAR(255),
        time_stamp TIMESTAMP NOT NULL DEFAULT now(),
        CONSTRAINT pk_message_message_id PRIMARY KEY (message_id)
);

CREATE TABLE notes(
        note_id Serial NOT NULL,
        content VARCHAR(255),
        time_stamp TIMESTAMP NOT NULL DEFAULT now(),
        CONSTRAINT pk_note_note_id PRIMARY KEY (note_id)
);

CREATE TABLE messages_users(
        message_creator_id Serial NOT NULL,
        message_receiver_id Serial NOT NULL,
        user_id Serial NOT NULL,
        message_id Serial NOT NULL,
        CONSTRAINT pk_messages_message_creator_id PRIMARY KEY (message_creator_id),
        CONSTRAINT fk_messages_users_users FOREIGN KEY (user_id) REFERENCES users (user_id),
        CONSTRAINT fk_messages_users_messages FOREIGN KEY (message_id) REFERENCES messages (message_id)        
);

CREATE TABLE notes_users(
        user_id Serial NOT NULL,
        note_id Serial NOT NULL,
        note_creator_id Serial NOT NULL,
        note_receiver_id Serial NOT NULL,
        CONSTRAINT pk_notes_note_creator_id PRIMARY KEY (note_creator_id),
        CONSTRAINT fk_users_notes_users FOREIGN KEY (user_id) REFERENCES users (user_id),
        CONSTRAINT fk_notes_notes_users FOREIGN KEY (note_id) REFERENCES notes (note_id)
);                               


COMMIT;



ROLLBACK;