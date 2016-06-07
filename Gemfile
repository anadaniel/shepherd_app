source "https://rubygems.org"

ruby "2.2.2"

gem "versionist"
gem "active_model_serializers", github: "rails-api/active_model_serializers", branch: "0-8-stable"
gem "rails", "4.2.1"
gem "pg"
gem "puma"
gem "rack-cors", :require => "rack/cors"
gem "redis", "3.3.0"

group :development do
  gem "spring"
  gem "spring-commands-rspec"
  gem "web-console"
end

group :development, :test do
  gem "awesome_print"
  gem "pry-rails"
  gem "factory_girl_rails"
  gem "rspec-rails", "3.4.2"
  gem "ffaker"
end

# Test gems
group :test do
  gem "shoulda-matchers", "~> 3.1"
  gem "database_cleaner"
end

# Production and staging gems
group :production, :staging do
  gem "rails_12factor"
  gem "exception_notification"
end