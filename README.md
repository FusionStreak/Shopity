# Shopity (STILL IN DEVELOPMENT)


## System Requirements:
* Ruby 2.5.3
* Rails 5.2.2
* Written with PostgreSQL in mind, edits to Gemfile and Database.yml required for other SQL Services
* Bash terminal (Curl or Git Bash, etc)



## How to Setup

* Download this repository

* Edit Database.yml and Gemfile to work with your SQL server

* Run migrate to create tables in your database, `$ rb db:migrate`
 

* You can populate the database with:

	* JSON POST requests

	* Run: `$ rb db:seed`, to populate with random items

## How to Use

### JSON requests are used to communicate with the server:
* A software, example: [Postman](https://www.getpostman.com/)
	
* Using a bash terminal
	
* Using `localhost:3000/graphiql`, this also conatins a basic documentation on each query and mutation type defined.
	
### Possible Requests:
* Create a new product:
```Ruby
mutation {
  createProduct(title: <String>, price: <Float, inventory_count: <Integer>) {
    id
    title
    price
    inventory_count
  }
}
```
* Search Filters:
```Ruby
query{
	allProducts(filter: {in_stock: <Boolean>}) {
	title
	price
	inventory_count
	}
}
query{
	allProducts(filter: {title_contains: <String>}) {
	title
	price
	inventory_count
	}
}
```
* Create User:
```Ruby
mutation {
  createUser(name: <String>, authProvider: {email: {email: <String>, password: <String>}}) {
    id
    name
    email
  }
}
```
* Sign in:
```Ruby
mutation {
  signinUser(email: {email: <String>, password: <String>}) {
    token
    user {
      id
    }
  }
}
```

## TODO

* Add "Shopping Cart"

* Add inventory_count update function



## Resources

* [Faker](https://github.com/stympy/faker) Gem was used to create the random seed of objects to populate the database

* [bcrypt](https://github.com/codahale/bcrypt-ruby) gem was used to authenticate and encrypt login details

* A geat tutorial on[ Rails 5 REST API](https://www.youtube.com/watch?v=QojnRc7SS9o)

* [HowToGraphQL](https://www.howtographql.com/)
