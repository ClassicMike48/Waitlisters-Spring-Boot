
CREATE TABLE Courses (
 course_id INT AUTO_INCREMENT PRIMARY KEY,
 course_name VARCHAR(255) NOT NULL UNIQUE,
 course_description VARCHAR(255),
 course_student_join_code VARCHAR(255),
 course_instructor_join_code VARCHAR(255)
);


-- ============================================================
-- Table: Users
-- Description: Stores user account information for the app users
-- Columns:
--   user_id        : INT, Primary Key, Auto-incremented unique identifier for each user
--   user_name      : VARCHAR(255), Required, Name of the user
--   user_email     : VARCHAR(255), Required, Unique, Email address of the user
--   user_password  : VARCHAR(255), Required, Hashed password of the user TODO
--   user_location  : VARCHAR(255), Optional, Location of the user (nullable)
-- ============================================================
CREATE TABLE Users (
 user_id INT AUTO_INCREMENT PRIMARY KEY,
 user_name VARCHAR(255) NOT NULL,
 user_email VARCHAR(255) NOT NULL UNIQUE,
 user_password VARCHAR(255) NOT NULL,
 user_location VARCHAR(255) DEFAULT NULL
);

-- The Queues table tracks student requests for help in courses, linking each request to a course and user.
-- It includes estimated wait time, request status, topic description, timestamp, and optionally the instructor handling the request.
-- The queue_instructor_user_id field is nullable, indicating that an instructor may not be assigned to a request.
-- Relationships: course_id references Courses, user_id references Users.

-- ============================================================================
-- Table: Queues
-- ----------------------------------------------------------------------------
-- Purpose:
--   Stores information about user waitlist requests for courses, including
--   estimated wait time, request status, topic description, and timestamps.
--
-- Columns:
--   queue_id                  : Primary key. Unique identifier for each queue entry.
--   course_id                 : Foreign key. References Courses(course_id).
--                               Identifies the course for which the waitlist is requested.
--   user_id                   : Foreign key. References Users(user_id).
--                               Identifies the user who made the waitlist request.
--   queue_estimated_time      : Estimated wait time (in minutes).
--   queue_request_status      : Status of the waitlist request.
--                               Possible values: 'WAITING', 'IN_PROGRESS', 'DONE', 'CANCELED'.
--   queue_topic_description   : Optional description of the topic or reason for the request.
--   queue_timestamp           : Timestamp when the waitlist request was created.
--   queue_instructor_user_id  : Foreign key (nullable). References Users(user_id).
--                               Identifies the instructor handling the request, if assigned.
--
-- Constraints:
--   - course_id:      References Courses table. Cascade on delete/update.
--   - user_id:        References Users table. Cascade on delete/update.
--   - queue_instructor_user_id: References Users table. Set NULL on delete, cascade on update.
-- ============================================================================

CREATE TABLE Queues (
 queue_id INT PRIMARY KEY AUTO_INCREMENT,
 course_id INT NOT NULL,
 user_id INT NOT NULL,
 queue_estimated_time INT NOT NULL,
 queue_request_status ENUM("WAITING","IN_PROGRESS","DONE","CANCELED") NOT NULL,
 queue_topic_description VARCHAR(255),
 queue_timestamp timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
 queue_instructor_user_id INT DEFAULT NULL,
 FOREIGN KEY (course_id) REFERENCES Courses(course_id)
 ON DELETE CASCADE ON UPDATE CASCADE,
 FOREIGN KEY (user_id) REFERENCES Users(user_id)
 ON DELETE CASCADE ON UPDATE CASCADE,
 FOREIGN KEY (queue_instructor_user_id) REFERENCES Users(user_id)
 ON DELETE SET NULL ON UPDATE CASCADE
);

-- update Permissions table to better reflect security best practices. i.e security roles
CREATE TABLE Permissions (
 permission_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
 course_id INT,
 user_id INT,
 permission_type ENUM("INSTRUCTOR","STUDENT"),
 permission_location VARCHAR(255),
 FOREIGN KEY (course_id) REFERENCES Courses(course_id)
 ON DELETE CASCADE ON UPDATE CASCADE,
 FOREIGN KEY (user_id) REFERENCES Users(user_id)
 ON DELETE CASCADE ON UPDATE CASCADE
);

-- initialize dummy values (test case driven)
INSERT INTO Users (user_name, user_email, user_password, user_location) VALUES
  -- this should make authentication better
  ("Kanishk Saxena", "ksaxena@wisc.edu", "ksaxena", "Location1"),
  ("Mayank Nayak", "mnayak@wisc.edu", "mnayak", "Location2"),
  ("Eric Dubberstein", "edubberstein@wisc.edu", "edubberstein", "Location3"),
  ("Connor Flint", "cflint@wisc.edu", "cflint", "Location4"),
  ("Michael Brudos", "mbrudos@wisc.edu", "mbrudos", "Location5"),
  ("Jacob Larget", "jlarget@wisc.edu", "jlarget", "Location6"),
  ("User7", "user7@email.com", "password7", "Location7"),
  ("User8", "user8@email.com", "password8", "Location8"),
  ("User9", "user9@email.com", "password9", "Location9"),
  ("User10", "user10@email.com", "password10", "Location10");

INSERT INTO Courses (course_name, course_description, course_student_join_code, course_instructor_join_code) VALUES 
    ('Course 1', 'Description for Course 1', 'S1', 'I1'),
    ('Course 2', 'Description for Course 2', 'S2', 'I2'),
    ('Course 3', 'Description for Course 3', 'S3', 'I3'),
    ('Course 4', 'Description for Course 4', 'S4', 'I4'),
    ('Course 5', 'Description for Course 5', 'S5', 'I5');

INSERT INTO Permissions (course_id, user_id, permission_type, permission_location) VALUES 
    (1, 1, 'INSTRUCTOR', 'Room 101'), (1, 2, 'INSTRUCTOR', 'Room 102'), 
    (1, 3, 'STUDENT', 'Room 103'), (1, 4, 'STUDENT', 'Room 104'), (1, 5, 'STUDENT', 'Room 105'),
    (1, 6, 'STUDENT', 'Room 106'), (1, 7, 'STUDENT', 'Room 107'),

    (2, 2, 'INSTRUCTOR', 'Room 201'), (2, 3, 'INSTRUCTOR', 'Room 202'),
    (2, 4, 'STUDENT', 'Room 203'), (2, 5, 'STUDENT', 'Room 204'), (2, 6, 'STUDENT', 'Room 205'),
    (2, 7, 'STUDENT', 'Room 206'), (2, 8, 'STUDENT', 'Room 207'),

    (3, 3, 'INSTRUCTOR', 'Room 301'), (3, 4, 'INSTRUCTOR', 'Room 302'),
    (3, 5, 'STUDENT', 'Room 303'), (3, 6, 'STUDENT', 'Room 304'), (3, 7, 'STUDENT', 'Room 305'),
    (3, 8, 'STUDENT', 'Room 306'), (3, 9, 'STUDENT', 'Room 307'),

    (4, 4, 'INSTRUCTOR', 'Room 401'), (4, 5, 'INSTRUCTOR', 'Room 402'),
    (4, 6, 'STUDENT', 'Room 403'), (4, 7, 'STUDENT', 'Room 404'), (4, 8, 'STUDENT', 'Room 405'),
    (4, 9, 'STUDENT', 'Room 406'), (4, 10, 'STUDENT', 'Room 407'),

    (5, 5, 'INSTRUCTOR', 'Room 501'), (5, 6, 'INSTRUCTOR', 'Room 502'),
    (5, 7, 'STUDENT', 'Room 503'), (5, 8, 'STUDENT', 'Room 504'), (5, 9, 'STUDENT', 'Room 505'),
    (5, 10, 'STUDENT', 'Room 506'), (5, 1, 'STUDENT', 'Room 507');

INSERT INTO Queues (course_id, user_id, queue_estimated_time, queue_request_status, queue_topic_description, queue_instructor_user_id) VALUES
    (1, 3, 30, 'WAITING', 'Homework Help Problem 1', NULL), (1, 4, 15, 'IN_PROGRESS','Homework Help Problem 2', 1), (1, 5, 30, 'IN_PROGRESS', 'Homework Help Problem 3', 2),
    (1, 6, 30, 'DONE', NULL, NULL), (1, 7, 30, 'CANCELED',  NULL, NULL);

INSERT INTO Queues (course_id, user_id, queue_estimated_time, queue_request_status) VALUES
    (2, 4, 30, 'WAITING'), (2, 5, 15, 'WAITING'), (2, 6, 30, 'WAITING'),
    (2, 7, 30, 'DONE'), (2, 8, 30, 'CANCELED'),

    (3, 5, 30, 'WAITING'), (3, 6, 15, 'WAITING'), (3, 7,  30, 'WAITING'),
    (3, 8, 30, 'DONE'), (3, 9, 30, 'CANCELED'),

    (4, 6, 30, 'WAITING'), (4, 7, 15, 'WAITING'), (4, 8, 30, 'WAITING'),
    (4, 9, 30, 'DONE'), (4, 10, 30, 'CANCELED'),

    (5, 7, 30, 'WAITING'), (5, 8, 30, 'WAITING'), (5, 9, 30, 'WAITING'),
    (5, 10, 30, 'DONE'), (5, 1, 30, 'CANCELED');