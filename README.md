# Beer Mate

I wanted to create a simple app that looked up some kind of beer database and allowed me to store beers and rate them. I wanted to make sure I implemented all key curriculum from the week

## Connects to the Brewery DB API to lookup beers

- I researched several beer databases and API's. This particular industry has lot's of bad and beta API's so I tried to rapidly evaluate and test a shortlist of API's without wasting to much time.
- I really wanted to use the Untapped API because it has a great database of user ratings. Unfortunately their API is not public and so I opted to use BreweryDB instead. BreweryDB does not have user beer ratings, only beers, so I needed to factor that into my project.
- I used HTTParty to connect to BreweryDB and quickly verified I could use the API on my project.
- I had a problem with spaces in my URL call. Spaces caused a bad URI error. So I used gsub to clean up the URL and it worked.
- I parsed the HTTParty response using JSON.parse and this removed some of the extreanous information in the JSON packet and just returned the main data, which made traversing the data simple and clear.
Store Beers as objects in the database
- When a user looks up a beer using Brewery DB API I parse the JSON object and turn that into a Beer Activerecord entry stored in the local Postgres database.
- If a user searches for a beer that has been looked up before it will use the local activerecord object instead of the API.

# Users can add beers to their favourites list

- After a user searches for and finds a beer, they may save that beer to their favourites list.
- Saving a beer creates a relationship between the user_id and beer_id in the Drinkers join table.
- Saving a beer to a users list does not create duplicate beer objects.
- If a user tries to save a beer which is already in their favourites list it will prevent the beer from being added twice and it will alert the user with a message, visually highlight the existing beer on the webpage.

# Users can rate beers and remove beers from their favourites list

- Users can rate beers, this uses Activerecord.update
- Users can remove beers from their favourites list. This does not delete the beer object. It simply destroys the associtation in the Drinkers join table.
- Beer ratings system. Users can rate leave individual beer ratings and each beer has an aggregate overall rating.

# User Authentication

- BCrypt handles password hashing and user authentication.
- User table, model, routes and views.
- My Profile area, sign up area, login page, logout button.
- Used the current_user helper for better sessions.

# Routes & Structure

- RESTful routes.
- Semantic naming and structure for controllers and views folders.
- Appropriate use of partials.

# HTML / LESS

- Clean, minimal interface design, written by hand (no framework).
- Semantic markup.
- Seperation of CSS files by component.
- Global classes for reusable messages and buttons.
- Installed Grunt to watch and compile .less files, because I love LESS.

