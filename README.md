### Digital insurance API

A Rails app with a Restful api to manage insurance contracts.

### How to seed the database

```
bundle exec rake db:create
bundle exec rake db:migrate
bundle exec rake db:seed
```

### How to access the endpoints

Launch the server with `bundle exec rails s`

Then go to the following endpoints:

`http://localhost:3000/api/v1/contracts`

`http://localhost:3000/api/v1/options`

If the database hasn't been seeded, the endpoints won't return anything.

### Launch tests

A few specs have been implemented to test the API requests.

```
bundle exec rspec spec/requests/get_contract_spec.rb
```

```
bundle exec rspec spec/requests/post_contract_spec.rb
```

### Dependencies

The gem `cancancan` has been implemented in order to perform the authorizations on the app. The file `ability.rb` manages the authorizations for customers and admins.

The gem `aasm` manages the state machine for contracts.

API tests depends on the `rspec` gem.
