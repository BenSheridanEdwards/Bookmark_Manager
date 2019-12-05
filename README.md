
### [Makers Academy](http://www.makersacademy.com) - Week 4 Pair Programming Project

Bookmark Manager Challenge 
-

[Outline](#Outline) | [Task](#Task) | [Installation Instructions](#Installation) | [Domain Model](#Domain_Model) | [User Stories](#Story) | [Feature Tests](#Feature_Tests) | [Objects & Methods](#Methods) |


## <a name="Outline">Outline</a>
 
This week, we're building a web app that stores web bookmarks in a database.

## <a name="Task">The Task</a>

We're going to build a bookmark manager. A bookmark manager is a website to maintain a collection of bookmarks (URLs). You can use it to save a webpage you found useful. You can add tags to the webpages you saved to find them later. You can browse bookmarks other users have added. You can comment on the bookmarks.

## <a name="Installation">Installation Instructions</a>

##### Clone the repository from github then change directory into it. Run bundle then rackup to initialise the server:

```
$ git clone git@github.com:BenSheridanEdwards/Bookmark_Manager.git
$ cd Bookmark_Manager
$ bundle
```

##### To run your Bookmark Manager app once you've completed the steps below, use: 
```
$ rackup -p 4567
```

To view your bookmarks, navigate to: [localhost:4567/bookmarks](localhost:4567/bookmarks)

##### To run tests:
```
rspec
```

##### To run linting: 

```
rubocop
```

#### Installing PostgreSQL & Installing your own database.

-

##### I'd reccomend using the package manager Homebrew to start the install of PostgreSQL:

```
$ brew install postgresql
```

Alternatively, you can download the PostgreSQL app, [here](https://postgresapp.com/).

##### When you have PostgreSQL installed, you can start it and keep it running in the background with the command: 

```
brew services start postgresql
```

When you're ready to start interacting with your database, you can use PostgreSQl's built-in interface (psql), a command-line tool to start using SQL, PostgreSQL's lanaguage. 

##### To get started, type psql followed by the database name. I'm quickly going to show you how to create your database below:

```
$ psql postgres
postgres=# CREATE DATABASE "your_user_name_here"; # This will usually be the same name as your computer
yourusername=# CREATE DATABASE bookmark_manager; # This will create your bookmark manager database
yourusername=# \c bookmark_manager; # This will connect you to your newly created database
```

##### To setup the table structure for your bookmark manager, run psql after you've connected to your new database. Then run the SQL scripts in the db/migrations folder in the given order:

```
psql
```

##### You can now inspect your new table with:

```
bookmark_manager=# \dt
```

You'll find all the common commands you'll need to connect to your database, create tables, select, add, update, delete, and list your tables, [here](http://www.postgresqltutorial.com/postgresql-cheat-sheet/).

## <a name="Story">User Stories</a>

```
As a user of the bookmark manager,
so I can access websites I go to regularly,
I would like to view all my bookmarks,

As a time-pressed user
So that I can save a website
I would like to add the site's address and title to bookmark manager

As a user
So I can store bookmark data for later retrieval
I want to add a bookmark to Bookmark Manager
```

## <a name="Domain_Model">Domain Model</a>

![Model](https://raw.githubusercontent.com/BenSheridanEdwards/Bookmark_Manager/master/Domain%20Model.png)
