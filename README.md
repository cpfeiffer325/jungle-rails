# Jungle

A mini e-commerce application built with Rails 4.2 for purposes of teaching Rails by example.


## Setup

1. Fork & Clone
2. Run `bundle install` to install dependencies
3. Create `config/database.yml` by copying `config/database.example.yml`
4. Create `config/secrets.yml` by copying `config/secrets.example.yml`
5. Run `bin/rake db:reset` to create, load and seed db
6. Create .env file based on .env.example
7. Sign up for a Stripe account
8. Put Stripe (test) keys into appropriate .env vars
9. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe
* Rails, 4.2.6
* pg
* Sass-rails, ~> 5.0
* Uglifier, >= 1.3.0
* Jquery-rails
* Turbolinks
* Jbuilder, ~> 2.0
* Sdoc, ~> 0.4.0, group: :doc
* Bcrypt, ~> 3.1.7
* Puma
* Bootstrap-sass, ~> 3.3.6
* Font-awesome-rails
* Money-rails
* Carrierwave
* Rmagick
* Faker

##Screenshots

Main Page
<img src=app/assets/images/main-page.png>
Admin Products page
<img src=app/assets/images/admin-products.png>
Cart
<img src=app/assets/images/cart.png>
Order Summary
<img src=app/assets/images/order-summary.png>
