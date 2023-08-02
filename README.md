# OSU CSE Course Catalog Application

## Overview

This project is a web-based system developed with Ruby and Rails that aims to automate and streamline the process of hiring qualified undergraduate students as graders at the CSE department. This application facilitates the seamless matching of students to course sections, thereby improving the consistency and efficiency of information gathering.

The program utilizes an API to fetch and process publicly available course and section information from the OSU course catalog, limiting retrieval to the CSE department courses. The application supports sign-up, log-in, and log-out functionality for Student, Instructor, and Admin users. The system also provides a view for reloading the database only accessible to an Admin user and a view for displaying the available courses and sections accessible to all users.

The application offers three key user functionalities:

1. **Student Functionality:** Students can log in and browse the course catalog.
2. **Instructor Functionality:** Similar to students, instructors can log in and explore the course catalog.
3. **Admin Functionality:** An Administrator can perform various tasks like browsing, editing, reloading the course catalog, and approving Instructor or Admin requests.

The application is extended with additional functionalities like application submission for grading positions, an administrator interface for hiring and assignment decisions, management of available courses or sections, and a standard form for instructor recommendations. The application is developed using gems like 'devise' (for login/logout functionality) and 'pagy' (for pagination).

While this system significantly reduces administrative efforts, it also empowers students and instructors, offering them a platform to view, apply, or recommend grader positions in a more organized and efficient manner.

## Installation Steps

### Prerequisites
Make sure that you have set up the developenvironment and have the following requests installed:
* Ruby v3.2.0
* Rails v7.0

### Configuration
1. Clone https://github.com/cse-3901-sharkey/2023-SU-Team-6-lab-2
2. Navigate to the application folder
   ```bash
   cd 2023-SU-Team-6-lab-2
   ```
3. Install the necessary gems
    ```bash
    bundle install
    ```
4. Create and initialize the database
    ```bash
    rails db:create db:migrate
    ```
5. Populate the database with the first pre-existing admin. This command will also generate courses from OSU API
    ```bash
    rails db:populate
    ```
6. Run the following command to launch the server
   ```bash
   rails server
   ```
   You can then visit [http://localhost:3000](http://localhost:3000) on your browser to see the application.
   At the same time, you will receive the following prompt in the console: 
   ```
   Default admin user created! 
   Email: admin@osu.edu, Password: password
   ```
    Use this default admin user to log in to the website.

### Load Course Data

After the user logs in as an administrator, click on the "Reload Courses" button located on the right side of the course search bar.

Click "Reload Courses". This will load all courses from the OSU API.

## Database Schema

![Database Schema](/media/schema.png)

Our database schema is created in Ruby on Rails using Active Record Migrations. The schema structures the data we store in our SQL database, defining each table's fields and data types. 

The database consists of eight tables:

1. **applications:** Stores the applications from students who want to be considered for grading positions. 

Fields include:
- `created_at`: Timestamps of when the application was created.
- `updated_at`: Timestamp of the last update of the application.
- `user_id`: The user's id. Foreign key related to 'users' table.
- `course_id`: The course's id for which the application is made. Foreign key related to 'courses' table.
- `approved`: Boolean value indicating whether the application is approved.

2. **availabilities:** Stores the available hours of the users.

Fields include:
- `created_at`: Timestamp when the record was created.
- `updated_at`: Timestamp when the data was last updated.
- `user_id`: Foreign key related to the 'users' table.
- `start_time`: The time at which the user's availability begins.
- `end_time`: The time at which the user's availability ends.
- `day`: Day of the week when the user is available.

3. **courses:** Contains data related to all the courses.

4. **enrollments:** Contains data related to the course enrolment of each user.

5. **recommendations:** Stores the recommendations given by instructors for students.

6. **sections:** Contains data related to the sections of each course.

7. **users:** Contains data for each user. All users have a role which is either Student, Instructor, or Admin, depending on the role

Each table has relationships defined with other tables in the system using foreign keys, enabling more complex queries and join operations. For example, the `sections` table has relationships with both `courses` and `users`. 

## User Guide

### Sign up

If you’re not already an admin, you’ll need to sign up for the app. Just hit the “Sign Up” button on the login page to get to the registration form. Fill in your details and specify your role as Admin, Student, or Instructor, then click “Sign Up” to create your account.

![Sign up](/media/Sign%20up%20page.png)

Only users with Ohio State University emails in the format `name.#@osu.edu` can sign up for the app. You must input an email and password to sign up successfully. Otherwise, you’ll receive an error. You can adjust these details later in the “Edit Account” section. New Admins and Instructors will initially have the same privileges as Students - solely browsing the database - because they must receive approval from an existing admin after signup.

### Login

![Login in](/media/Login%20Page.png)

You can log in from the landing page if you have an existing account. If the app detects a pre-existing session, it will auto-authenticate and direct you to the user's home page. If this isn’t the case, sign in using your email and password. Select “Remember Me” if your browser wishes to save your credentials.

### Admin Home Page

![Course catalog ](/media/Course%20catalog.png)

---
## Template

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...