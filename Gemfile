source "https://rubygems.org"

ruby "3.2.2"

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rails", "~> 7.1.5"

# The original asset pipeline for Rails [https://github.com/rails/sprockets-rails]
gem "sprockets-rails"

# Use the Puma web server [https://github.com/puma/puma]
gem "puma", ">= 5.0"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[ windows jruby ]

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: %i[ mri windows ]
  # RSpec behavioral testing framework for Rails.
  gem "rspec-rails", "~> 7.0.1"
end

group :test do
  # Test using browsers.
  gem "capybara", "~> 3.40"
  # Interface capybara to chrome headless
  gem "cuprite"
end

group :development do
  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"
end
