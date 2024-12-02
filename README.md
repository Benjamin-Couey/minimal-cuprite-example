## README

This is a minimal example of a Rails app with a test ran using [Cuprite](https://github.com/rubycdp/cuprite), a headless Chrome driver for Capybara. The one included test can be ran with

```bundle exec rspec```

to verify that everything is working.

This example was created to help with troubleshooting the use of Cuprite driven tests in various dev environments, specifically the tests in [rubyforgood/human-essentials](https://github.com/rubyforgood/human-essentials/tree/main). Where specific versions of gems are used, it is to correspond to the versions used by that project.

### Setup

This Rails app was created with the following process.

Create a new Rails app with the bare minimum of features.
```
rails new minimal-cuprite-example --minimal --skip-active-record --skip-test
```

Move into the new Rails app's directory.

Add RSpec to the Gemfile
```
group :development, :test do
  ...
  gem "rspec-rails", "~> 7.0.1"
end
```

and install RSpec.
```
rails generate rspec:install
```

Add Capybara and Cuprite to the Gemfile
```
...
group :test do
  # Test using browsers.
  gem "capybara", "~> 3.40"
  # Interface capybara to chrome headless
  gem "cuprite"
end
```

and install Capybara and Cuprite.
```
bundle install
```

Configure RSpec to use Capybara and Cuprite by modifying `spec/rails_helper.rb`.
```
require 'rspec/rails'
# Add additional requires below this line. Rails is not loaded until this point!
require 'capybara/rails'
require 'capybara/rspec'

...

require "capybara/cuprite"
Capybara.register_driver(:local_cuprite) do |app|
  Capybara::Cuprite::Driver.new(
    app,
    window_size: [1200, 800],
    browser_options: { "no-sandbox" => nil }
  )
end
Capybara.javascript_driver = :local_cuprite

...

RSpec.configure do |config|
  ...
  config.before(:each) do
    driven_by :local_cuprite
  end
end
```

A basic test was then added to `spec/system`.

To prepare this repository to be developed and tested using Github Codespaces, the `.devcontainer` directory from [rubyforgood/human-essentials](https://github.com/rubyforgood/human-essentials/tree/main). `.devcontainer\devcontainer.json` was then modified by setting
```
...
"workspaceFolder": "/workspaces/minimal-cuprite-example ",
...
```
