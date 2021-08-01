# Volunteer Tracker App

## [https://github.com/dqveha/volunteer-tracker](https://github.com/dqveha/volunteer-tracker)

#### By Dave Lindqvist

---

## Description

This is the ninth independent project (Ruby, Week 3) assigned by Epicodus to assess the ability of setting up a database with a one-to-many relationship, and providing CRUD functionality within Sinatra. The app is designed for volunteer coordinators to track volunteers working on projects.

For a visual relationship representation of the database:
![volunteer tracker database](https://github.com/dqveha/volunteer-tracker/blob/main/database-visual.png?raw=true)

Additional features outside of the standard Epicodus objectives:

1. Reassign volunteers to another project
2. Remove volunteer from project, yet can still assign
3. Search function within navbar

## Technologies Used

1. Docker Hub
2. Ruby
3. RSpec & Capybara
4. Sinatra
5. PostgreSQL

## Installation Instructions

1. Open your terminal
2. Clone this repo to your desktop:

```
https://github.com/dqveha/volunteer-tracker.git
```

3. Open the `volunteer-tracker` directory using Visual Studio Code
4. Run command `docker-compose up --build` in your terminal
5. Find out your container ID within docker by typing in the terminal:

```
docker ps
```

6. (a): Copy the container ID related to the database and load the database_backup.sql within the folder by typing in:

```
docker exec [container_ID] pg_dump -U postgres volunteer_tracker < database_backup.sql
```

6. (b): If step 6(a) does not work, replace 'volunteer_tracker' with 'postgres' and try again.

7. (c): If step 6(a) and 6(b) does not work through Docker, follow these steps here within the terminal to create the database yourself:

```
docker exec -it -u postgres [container_ID] psql
CREATE DATABASE volunteer_tracker;
\c volunteer_tracker
CREATE TABLE projects (title varchar, id serial PRIMARY KEY);
CREATE TABLE volunteers (name varchar, project_id int, id serial PRIMARY KEY);
```

7. The user can open the webpage by visiting this URL in the browser:

```
http://localhost:4567/
```

## Known Issues:

1. When loading the database_backup.sql file into PostgreSQL within Docker, it might not register that the name of the database implemented is "volunteer_tracker" thus there are steps 6(b) and 6(c) in case the first option does not work.
2. Please open a pull request if you have any issues!

---

### License is GPLv3 and I make no claim to copyright.
