# Jungle

Jungle is a mini e-commerce application. :credit_card:

Jungle displays a list of products which can be purchased. Products are created by an administrator and placed into a category. Any user can then view the products, add them to a cart, and proceed to checkout with [Stripe](https://stripe.com/ca) using a credit card. Order confirmations are sent out to clients using [Mailgun](https://www.mailgun.com/). If users decide to register an account, they may also leave a review and rating of a given product.

This app was built using [Rails](https://rubyonrails.org/).

## Final Product

Home page

!["home"](https://github.com/quhairfoir/jungle-rails/blob/master/docs/homepage.png?raw=true)

Product page

!["product"](https://github.com/quhairfoir/jungle-rails/blob/master/docs/product-page.png?raw=true)

Cart

!["cart"](https://github.com/andreafinlay/jungle-rails/blob/master/docs/cart.png?raw=true)

Order confirmation page / Admin login

!["order"](https://github.com/quhairfoir/jungle-rails/blob/master/docs/order-page-with-admin-login.png?raw=true)

Admin - products

!["admin-products"](https://github.com/quhairfoir/jungle-rails/blob/master/docs/product-admin-page.png?raw=true)

## Getting Started

1. From the root directory, install dependencies (`bundle install`).
2. Create `config/database.yml` by copying `config/database.example.yml`.
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`.
4. Run `bin/rake db:reset` to create, load and seed the database.
5. Create `.env` file based on `.env.example`.
6. Sign up for a [Stripe](https://stripe.com/ca) account.
7. Put Stripe (test) keys into appropriate .env vars.
8. Repeat steps 7 and 8 with [Mailgun](https://www.mailgun.com/).
9. Run `bin/rails s -b 0.0.0.0` to start the server.

## Stripe Testing

Use credit card # 4111 1111 1111 1111 for testing success scenarios.

More information in Stripe's docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* [Bcrypt](https://github.com/codahale/bcrypt-ruby)
* [Mailgun](https://www.mailgun.com/)
* [PostgreSQL 9.x](https://www.postgresql.org/)
* [Rails 4.2](http://guides.rubyonrails.org/v4.2/)
* [Stripe](https://stripe.com/ca)


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
