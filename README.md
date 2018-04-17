
# About Wiki-laborate
Created by: Stacie Taylor-Cima

Wiki-laborate is a wiki app that allows users to collaborate on posts.

<hr>

# Sign up for an Wiki-laborate account:
* Access production site here: [Visit Wiki-laborate](https://infinite-crag-57784.herokuapp.com/)"
* Create account using name, email, and password (Devise)
* Confirm account via email (SendGrid)
* Upgrade account (Stripe)
* Create and edit public and private wikis - markdown supported (RedCarpet)
* Add collaborators

<hr>

# Setup & Configuration
### Languages and Frameworks:
* Ruby on Rails
  * Ruby version 2.2.1
* Bootstrap

### Databases:
* SQLite (Test, Development)
* PostgreSQL (Production)

### Development Tools and Gems include:
Devise for creating, logging in/out, updating credentials, authorizing users
SendGrid for email confirmation
Figaro for storing sensitive data
Faker to create seed data
Strip to accept payments
Redcarpet to support markdown

### To run Explorit locally:
* Clone the repository
* Run bundle install
* Create and migrate the SQLite database with `rake db:create and rake db:migrate`
* Start the server using rails server
* Run the app on localhost:3000
