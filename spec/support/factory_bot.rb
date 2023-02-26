require 'factory_bot_rails'

RSpec.configure do |config|
  # Include FactoryBot syntax methods
  config.include FactoryBot::Syntax::Methods

  # Load factories
  # config.before(:suite) do
  #   FactoryBot.find_definitions
  # end
end