# Social Media Project

> This project is was built on top of our knowledge of ActiveRecord associations and tests.

## What it does

Its a social media app similar to Facebook.

*As a guest user:*

- You will be able to create account/log in.
- You can see only “Sign in” and “Sign out” page.

*As a logged-in user:*

- You will be able to see all users list.
- You will be able to see selected user page with their user name and all posts written by them (the most recent posts on the top).
- You will be able to send a friendship invitation.
- You will see a button “Invite to friendship” next to the name of user who is not your friend yet - on both users’ list and single user page.
- You will be able to see pending friendship invitations sent to you from other users.
- You will be able to accept or reject friendships invitation.
- You will be able to create new posts (text only).
- You will be able to like/dislike posts (but you can like single post only once).
- You will be able to add comments to posts.
- You will be able to see “Timeline” page with posts (with number of likes and comments) written by you and all your friends (the most recent posts on the top).
- Timeline page is the root page of the app.

## Built With

- Ruby v2.6.5
- Ruby on Rails v5.2.4

*Gems used:*

- Devise (for user authentication)
- Gravatar image tag (for accessing gravatar images of users)
- Gems used for testing:
  - Capybara
  - Selenium webdriver
  - Chromedriver helper
  - Database cleaner
  - Rspec-rails
  - Shoulda matchers

- Rubocop

## Live Demo

[Live Demo Link](https://protected-meadow-84976.herokuapp.com/users/sign_in)

## Getting Started

To get a local copy up and running follow these simple example steps.

### Prerequisites

- Ruby: 2.6.5
- Rails: 5.2.3
- Postgres: >= 9.5

### Setup

Install gems with:

``` bash
bundle install
```

Setup database with:

``` bash
   rails db:create
   rails db:migrate
```

Create users with:

``` bash
   rails db:seed
   Login with email: 'example-{add a number between 1-16}@microverse.org', and password:'password'
```

### Usage

Start server with:

``` bash
    rails server
```

Open `http://localhost:3000/` in your browser.

### Run tests

``` bash
    rpsec
```

### Deployment

[Live Demo Link](https://protected-meadow-84976.herokuapp.com/users/sign_in)

## Authors

👤 **Tirthajyoti Ghosh**

- Github: [@Tirthajyoti Ghosh](https://github.com/tirthajyoti-ghosh)
- Twitter: [@terrific_ghosh](https://twitter.com/terrific_ghosh)
- Linkedin: [Tirthajyoti Ghosh](https://www.linkedin.com/in/tirthajyoti-ghosh-370544199/)

👤 **Javier Oriol Correas Sanchez Cuesta**

- Github: [@javitocor](https://github.com/javitocor)
- Twitter: [@JavierCorreas4](https://twitter.com/JavierCorreas4)
- Linkedin: [Javier Oriol Correas Sanchez Cuesta](https://www.linkedin.com/in/javier-correas-sanchez-cuesta-15289482/)

## 🤝 Contributing

Contributions, issues and feature requests are welcome! Start by:

- Forking the project.
- Cloning the project to your local machine.
- cd into the project directory.
- Run git checkout -b your-branch-name.
- Make your contributions.
- Push your branch up to your forked repository.
- Open a Pull Request with a detailed description to the development branch of the original project for a review.

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgments

- Microverse
- Stackoverflow
- The Odin Project

## 📝 License

MIT License

