# DUNGEONBALL
Welcome to DUNGEONBALL! This is a front-end/UI portion of 2-part application deisigned with a separate *[API backend](https://github.com/B-gann21/dungeonball-be)*. This frontend application is responsile for retrieving search and player data from our backend application, and displaying those data to both users and visitors. Users may additionally save players to a personal party, which they can view at any time through a convenient navigation bar.

## Implementation

### Installation and Setup

1. Clone and implement the *[API backend](https://github.com/B-gann21/dungeonball-be)*
2. In a separate repository, clone this repo
3. Run the following commands to install gem dependencies and create a database:
```bash
bundle install
rails db:{create:migrate}
```
![database](https://user-images.githubusercontent.com/70451678/172773800-1dd7a55b-8a41-4544-b830-999585354071.png)

4. This build uses OmniAuth to manage oauth login, which requires the use of sensitive infomations that should not be compromised. We use the Figaro gem to provide access to `ENV` variables in development and testing, and implement a production strategy unique to our host. To properly implement this application, set the following environment variables:
  ```ruby
  BE_AUTH_KEY: value # Recommended strong password, same as backend
  BASE_URL: url # Should reflect the base url of the backend server's deployment in testing/development.
  twitter_api_key: value # Obtained through Twitter
  twitter_api_secret: value # Obtained through Twitter
  ```
5. Run `rails s` on your front end and back end applications to ensure both are running simultaniously.
6. You're up and running! We recommend you run `bundle exec rspec` and ensure all tests pass before deploying this software.

### Dependencies

This appliation was written for
* rails 5.2.8
* ruby 2.7.2

## Features

### Navigation and Authorization

![code_flow.png](https://user-images.githubusercontent.com/70451678/172932144-ed4f02be-e43e-404e-8bc7-b609b13125be.png)

### Welcome Page

<img width="1033" alt="welcome user" src="https://user-images.githubusercontent.com/70451678/172777297-aafc637a-bf46-4584-acbd-f9c40e3adf57.png">


The landing page renders a search bar that lets both users and visitors search for NFL players by name. If the user is logged in, they will see a link to `My Party` or to `Logout`. Otherwise, a visitor will see a link to `Sign in with Twitter`

<img width="1033" alt="welcome visitor" src="https://user-images.githubusercontent.com/70451678/172777029-e219be3b-e492-4c89-a313-c97152ae1b0e.png">

### Signing in with Twitter

This process is handled through the `omniauth Twitter` gem. If the process is successful, the logged-in user is redirected back to the landing page. IF UNSUCCESSFUL...

### Searching for players

<img width="1033" alt="search results" src="https://user-images.githubusercontent.com/70451678/172923816-5a0b51e5-c071-4fb3-982e-7aaefafc649e.png">


When a user searches for players from the navigation bar, They are returned a list of players whos names at least partially match the text entered. These names are themselves each a link to that player's show page where a user can see details about a player's Dungeons and Dragons stats.

### Players show page

<img width="1033" alt="player show user" src="https://user-images.githubusercontent.com/70451678/172923899-a33fe745-b556-4b99-8348-c3b3f655cbd4.png">
<img width="1033" alt="player show visitor" src="https://user-images.githubusercontent.com/70451678/172923926-f98b4f49-03a0-48ba-877f-e3ac8c8694e5.png">


Here a user or visitor can see the base stats of this football player's character sheet. If a user is logged in, they will see a link to `Add Player to My Party`, and clicking this ilnk will bring them to their party show page, where they will see that player is added to their party. If not logged in, a visitor will see a link to `Sign in with Twitter to add this player to your party`

### Party show page

<img width="1033" alt="party show" src="https://user-images.githubusercontent.com/70451678/172923975-e4c9d995-30d5-45c9-9c5c-38bd3ee51f5a.png">


Access to this page is restricted to only logged in users. Here a user can see the members of their party, if there are any. Each player listed includes a link back to their show page.

## Contact

### Contributors

Alex Psitos     | [Github](https://github.com/psitosam) | [LinkedIn](https://www.linkedin.com/in/alex-psitos-5429a1232/)
Brylan Gannon   | [Github](https://github.com/B-gann21) | [LinkedIn](https://www.linkedin.com/in/brylan-gannon-81986b232/)
Drew Proebstel  | [Github](https://github.com/DrewProebstel) | [LinkedIn](https://www.linkedin.com/in/drew-proebstel/)
Joseph Senecal  | [Github](https://github.com/Josenecal) | [LinkedIn](https://www.linkedin.com/in/joseph-senecal-3947a9232/)
Tyler Ross      | [Github](https://github.com/Tross0208) | [LinkedIn](http://www.linkedin.com/in/tyler-ross-0b206122b)
Zel Imbriaco    | [Github](https://github.com/zel-imbriaco) | [LinkedIn](https://www.linkedin.com/in/zimbriaco/)

### To Contribute

Pull Requests can be made to the `staging` branch of this repository and will be merged on a case-by-case basis.

### Further Questions

Please reach out to the owner of this repository with any additional questions.
