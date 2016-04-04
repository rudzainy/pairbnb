#Pairbnb
This is an Airbnb clone built on Ruby on Rails

###Getting Started
---
    # Install the required gems
    bundle install

    # Update username in database.yml
    username: <your_username>
    
    # Create and migrate the database
    rake db:create && rake db:migrate

###Seeding Fake Data
---
Run this command if you want to seed random data to the app. It's not mandatory though, you can still manually insert the data from the app.

    # Seed data
    rake db:seed

This will create an admin user, a random number of dummy users and a random number of listings. All the passwords are set to `123456`. The admin user does not have any special privilages for now.  

###Fix List
---
1. Reservations does not have any validations yet
2. Login with FB does not save the user's avatar
3. Move user's listings and reservations to user's profile page
4. User's avatar not saved when seeding
5. Pagination on index page 
6. Confirm password bug for user sign in

###Future Feature
---
1. Online payment
2. More comprehensive search feature
3. Full responsive layout

###Author
---
[Rudzainy](http://www.rudzainy.com)