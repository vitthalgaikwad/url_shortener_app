# URL Shortener

You can shorten a long URLs using this application like bitly and tinyURL.

## Getting Started

Follow below instruction they will get you a copy of the project up and running on your local machine for development and testing purposes. This app is already deployed on heroku check * [https://l2s.herokuapp.com](https://l2s.herokuapp.com) 

### Prerequisites

```
Ruby 2.2.1
Rails 4.2.3
Postgresql database and don't forget to change the database username in database.yml

```

### Installation

Follow below steps sequentially:

```
git clone https://github.com/vitthalgaikwad/url_shortener_app.git
```

```
cd url_shortener_app
```

```
bundle install
```

```
rails db:create
rails db:migrate
rails s 
```

Now you can see the app running here [http://localhost:3000/](http://localhost:3000/) 
