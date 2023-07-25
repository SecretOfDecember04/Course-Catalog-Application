source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.2.0"

gem "bootsnap", require: false
gem "cssbundling-rails"
gem "jbuilder"
gem "jsbundling-rails"
gem "puma", "~> 5.0"
gem "rails", "~> 7.0.4"
gem "sassc-rails"
gem "sprockets-rails"
gem "sqlite3", "~> 1.4"
gem "stimulus-rails"
gem "turbo-rails"
gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]
gem "mechanize"

group :development, :test do
  gem "debug", platforms: %i[mri mingw x64_mingw]
  gem 'rubocop', '~> 1.52', '>= 1.52.1'
  gem 'rubocop-minitest', '~> 0.31.0'
  gem 'rubocop-rails', '~> 2.20', '>= 2.20.1'
end

group :development do
  gem "rails_live_reload"
  gem "web-console"
end

group :test do
  gem "capybara",                 "3.37.1"
  gem "guard",                    "2.18.0"
  gem "guard-minitest",           "2.4.6"
  gem "minitest",                 "5.15.0"
  gem "minitest-reporters",       "1.5.0"
  gem "rails-controller-testing", "1.0.5"
  gem "selenium-webdriver",       "4.2.0"
  gem "webdrivers",               "5.0.0"
end

gem 'bootstrap', '~> 4.0.0'
gem 'bootstrap_form', '~> 5.1'

gem "devise", "~> 4.9"

gem 'pagy'