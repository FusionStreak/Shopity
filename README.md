# Shopity (STILL IN DEVELOPMENT)


## System Requirements:
* Ruby 2.5.3
* Rails 5.2.2
* Written with PostgreSQL in mind, edits to Gemfile and Database.yml required for other SQL Services
* Bash terminal (Curl or Git Bash, etc)



## How to Setup

* Download this repository

* Edit Database.yml and Gemfile to work with your SQL server

* Run migrate to create tables in your database

  ```
  $ rb db:migrate
  ```

* You can populate the database with:

	* JSON POST requests

	* Run `$ rb db:seed` to populate with random items

## How to Use

* JSON requests can be used:
	* A software, example: Postman
	
	* Using the Terminal
	
	* Using `localhost:3000/graphiql`
	
* Examples:
	* Create a new product:
	```javascript
	mutation{
 	 createProduct(
	    title: <String>,
	    price: <Float>,
	    inventory_count: <Integer>
	  ) {
	  id
	  title
	  price
	  inventory_count
  		}
	}
	```
	* Search Filters:
	```javascript
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
	
	

## TODO

* Add filter to look for Products in stock

* Add "Shopping Cart"

* Add inventory_count update function



## Resources

* Faker Gem was used to create the random seed of objects to populate the database

* A geat tutorial on Rails 5 REST API https://www.youtube.com/watch?v=QojnRc7SS9o

* [HowToGraphQL](https://www.howtographql.com/)
