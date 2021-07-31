# Volunteer Tracker App

## [https://github.com/dqveha/volunteer-tracker](https://github.com/dqveha/volunteer-tracker)

#### By Dave Lindqvist

---

## Description

This is the ninth independent project (Ruby, Week 3) assigned by Epicodus to assess the ability of setting up a database with a one-to-many relationship, and providing CRUD functionality within Sinatra. The app is designed for volunteer coordinators to track volunteers working on projects.

Additional features outside of the standard Epicodus objectives:

1. Reassign volunteers to another project
2. Remove volunteer from project but still assign

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
4. Find out your container ID within docker by typing in:

```
docker ps
```

5. Copy the container ID related to the database and load the database_backup.sql within the folder by typing in:

```
docker exec [container_ID] /usr/bin/pg_dump -U postgres volunteer_tracker > database_backup.sql
```

6. The user can open the webpage through:

```
docker-compose up --build

and then visit http://localhost:4567/ in the browser
```

## Known Issues:

1. Please open a pull request if you have any issues!

---

### License is GPLv3 and I make no claim to copyright.
