

source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.0'

#local db
group :development do
  gem 'mysql2', "~>0.3.11"
end

group :production do
  gem 'mysql2', "~>0.3.11"
end

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
gem 'jquery-turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

#foundation gems
gem 'compass-rails', github: "milgner/compass-rails", ref: "1749c06f15dc4b058427e7969810457213647fb8" # you need this or you get an err
gem 'zurb-foundation', '~> 4.0.0'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'meta_request'
end

gem 'activemerchant'


#admin page with active_admin
gem 'devise',              github: 'plataformatec/devise'
gem 'responders',          github: 'plataformatec/responders'
gem 'inherited_resources', github: 'josevalim/inherited_resources'
gem 'ransack',             github: 'ernie/ransack', branch: 'rails-4'
gem 'activeadmin',         github: 'gregbell/active_admin', branch: 'rails4'
gem 'formtastic',          github: 'justinfrench/formtastic'

# Use ActiveModel has_secure_password
 gem 'bcrypt-ruby', '~> 3.0.0'

#for pagination
gem 'will_paginate'

#for env variables
gem 'figaro'

#for instant popup animations
gem 'gritter'

# Use unicorn as the app server
#gem 'unicorn'
group :production do # linux
  gem 'unicorn'
end
# Use Capistrano for deployment
 gem 'capistrano'

# Use debugger
# gem 'debugger', group: [:development, :test]
