# Rails Final Project

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

1. Make sure that you have set up the developenvironment and have the following requests installed
    * Ruby v3.2.0
    * Rails v7.0

https://github.com/cse-3901-sharkey/2023-SU-Team-6-lab-2

2. Check the 'Gemfile' for required project dependencies and install them using

    ```bash
    bundle install
    ```

3. Migrate the database and using

    ```bash
    rails db:migrate
    ```

4. Populate the database with initial data from OSU API (https://content.osu.edu/v2/classes/searchLinks), run
    
    ```bash
    rake db:populate
    ```

5. Start the rails server by running

    ```bash
    rails server
    ```
    You can then visit [http://localhost:3000](http://localhost:3000) on your browser to see the result.

## Database Schema

![Database Schema](/media/schema.png)


------
### Template

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