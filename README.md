***
# UW Waitlisters - Fall 2025

## What is UW Waitlisters?
UW Waitlisters is a web application designed to streamline student-professor question sessions, often known as Office Hours. Office Hours offer students the ability to consult with the teaching faculty individually for help with a variety of issues: homework, lecture concepts, grading, test review, and more. UW Waitlisters offers a variety of features to better facilitate Office Hours events so students can recieve help in a timely manner while reducing management overhead for professors.  

## Features
- #### Create an account with UW Waitlisters. 
- #### Professors can create a course with an invite code for students.
- #### Users can view an estimated wait time for their course.
- #### Students can enter/exit the waitlist online for maximum flexibility.
- #### Students can provide their question topic while waiting for help.
- #### Professors can post Office Hour meeting details visibile to all       members of the course.
- #### Multiple professors can service the waitlist simultaneously
- #### Professors have the ability to change the waitlist for a variety of administrative purposes.

## Further Notes on Design
UW Waitlisters was a semester-long software project that I worked on with a team of colleagues in CS506 at UW-Madison, Spring 2023. This project was designed using the following tools...

- ### Front-End: React JS
- ### Back-End: Node JS
- ### Databse: MYSQL 

This application also utilized docker containers for better project distribution and management.

## Contributors
- ### Mayank Nayak
- ### Kanishk Saxena
- ### Connor Flint
- ### Jacob Larget
- ### Eric Dubberstein
- ### Michael Brudos*

*My personal contributions are mainly [StudentView.js](https://github.com/ClassicMike48/UWWaitlisters/blob/b4cf6ad7cd8559c89638d5818a488d8b51d583e2/waitlist-frontend/src/pages/StudentView.js)
and [InstructorView.js](https://github.com/ClassicMike48/UWWaitlisters/blob/main/waitlist-frontend/src/pages/InstructorView.js) in designing the waitlist view along with corresponding [Student API](https://github.com/ClassicMike48/UWWaitlisters/blob/main/waitlist-backend/routes/studentRoutes.js) | [Instructor API](https://github.com/ClassicMike48/UWWaitlisters/blob/main/waitlist-backend/routes/instructorRoutes.js) calls required to relay info between the Front-End and Database. 

