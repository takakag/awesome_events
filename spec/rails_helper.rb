# This file is copied to spec/ when you run 'rails generate rspec:install'
require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'rspec/rails'
# Add additional requires below this line. Rails is not loaded until this point!
require 'devise'
require File.expand_path("spec/support/controller_macros.rb")
require 'capybara/rails'
require 'capybara/rspec'
require 'capybara/poltergeist'

Capybara.javascript_driver = :poltergeist

# Requires supporting ruby files with custom matchers and macros, etc, in
# spec/support/ and its subdirectories. Files matching `spec/**/*_spec.rb` are
# run as spec files by default. This means that files in spec/support that end
# in _spec.rb will both be required and run as specs, causing the specs to be
# run twice. It is recommended that you do not name files matching this glob to
# end with _spec.rb. You can configure this pattern with the --pattern
 # option on the command line or in ~/.rspec, .rspec or `.rspec-local`.
#
# The following line is provided for convenience purposes. It has the downside
# of increasing the boot-up time by auto-requiring all files in the support
# directory. Alternatively, in the individual `*_spec.rb` files, manually
# require only the support files necessary.
#
 Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

# Checks for pending migrations and applies them before tests are run.
# If you are not using ActiveRecord, you can remove this line.
ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
    config.include Devise::Test::ControllerHelpers, :type => :controller
    config.include Devise::Test::ControllerHelpers, type: :view

  
  config.include Devise::TestHelpers, :type => :controller
  config.extend ControllerMacros, :type => :controller
  
  config.include FactoryBot::Syntax::Methods
  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = false
#  config.infer_base_calss_for_anonymous_controllers = false
#  config.order = "random" 
    config.include Rails.application.routes.url_helpers
  config.include Capybara::DSL

  # RSpec Rails can automatically mix in different behaviours to your tests
  # based on their file location, for example enabling you to call `get` and
  # `post` in specs under `spec/controllers`.
  #
  # You can disable this behaviour by removing the line below, and instead
  # explicitly tag your specs with their type, e.g.:
  #
  #     RSpec.describe UsersController, :type => :controller do
  #       # ...
  #     end
  #
  # The different available types are documented in the features, such as in
  # https://relishapp.com/rspec/rspec-rails/docs
  config.infer_spec_type_from_file_location!

  # Filter lines from Rails gems in backtraces.
  config.filter_rails_from_backtrace!
  # arbitrary gems may also be filtered via:
  # config.filter_gems_from_backtrace("gem name")

=begin
  config.before(:all, type: :feature) do
      OmniAuth.config.test_mode = true
      OmniAuth.config.mock_auth[:twitter] = OmniAuth::AuthHash.new({
         provider: 'twitter',
         uid: '',
         info: {
            nickname: 'LlkRy38',
            image: 'http://pbs.twimg.com/profile_images/95228884878393...'
         }
      })
  end
=end
  config.include Warden::Test::Helpers
  config.before(:suite) do
	Warden.test_mode!
	DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
	DatabaseCleaner.strategy = :transaction
  end

  config.before(:each, type: :fewture) do
	driver_shares_db_connetion_with_specs = Capybara.current_driver == :rack_test
	unless driver_shares_db_connection_with_specs
    	  DatabaseCleaner.strategy = :truncation
	end  
  end

  config.before(:each) do
	DatabaseCleaner.start
  end
  config.after :each do
	Warden.test_reset!
  end

  config.append_after(:each) do
	DatabaseCleaner.clean
  end
  
end
