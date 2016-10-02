source 'https://rubygems.org'

ruby '2.3.1'

# Infrastructure/Core-Related
gem 'rails', '4.2.7'
gem 'pg'

# Model/Functionality-Related
gem 'gastropod'
gem 'acts_as_list'

# Admin-Related
gem 'devise'
gem 'activeadmin', '1.0.0.pre4'
gem 'active_material', github: 'vigetlabs/active_material', branch: 'nh-responsive-redesign'
gem 'activeadmin_reorderable'
gem 'pundit'

# View/Asset-Related
gem 'jquery-rails'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'jbuilder', '~> 2.0'
gem 'coffee-rails', '~> 4.1.0'

group :development, :test do
  gem 'pry-rails'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'
  gem 'spring'
end

group :test do
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'simplecov', require: false
  gem 'capybara'
  gem 'shoulda-matchers'
  gem 'pundit-matchers'
end
