# Bookmark Manager

This is a bookmark manager for people

# Installing the database

- Connect to psql
- Create the database using the psql command `CREATE DATABASE bookmark_manager;`
- Connect to the database using the pqsl command `\c bookmark_manager;`
- Run the query we have saved in the file 01_create_bookmarks_table.sql

# Installing the test database
- Connect to psql
- Create the database using the psql command `CREATE DATABASE bookmark_manager_test;`
- Connect to the database using the pqsl command `\c bookmark_manager_test;`
- run the command `CREATE TABLE bookmarks(id SERIAL PRIMARY KEY, url VARCHAR(60));` to create a table
- Run the query we have saved in the file 01_create_bookmarks_table.sql

## Installation
----------------------
Install gems with [bundler](https://bundler.io/ "bundler") 
~~~~
bundle install 
~~~~
To install code from the latest source
~~~~
Add link here
~~~~
## Testing
-----------------------
To run rspec tests
~~~~
rspec
~~~~
from the root directory of the installation 

## Running the webserver locally
-----------------------
To run a locally hosted server of the site
~~~~
rackup
~~~~
from the root directory of the installation

Navigate to http://localhost:9292/


## User Stories
Stakeholder, Motivation and Task

as a user
so I can keep track of my reading
I want to see a list of bookmarks

as a user
so I can keep track of my favourite places to visit
I want to add a bookmark

https://github.com/makersacademy/course/blob/main/bookmark_manager/walkthroughs/01.md

## Domain Model

![](images/domainModel.png)