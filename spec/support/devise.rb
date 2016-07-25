# https://github.com/plataformatec/devise/wiki/How-To:-Test-controllers-with-Rails-3-and-4-(and-RSpec)
RSpec.configure do |config|
  config.include Devise::TestHelpers, :type => :controller
  config.extend ControllerMacros, :type => :controller

  # For request spec
  # https://github.com/plataformatec/devise/wiki/How-To:-Test-with-Capybara
  # http://qiita.com/gakkie/items/40e5678af7b63afc14df
  config.include Warden::Test::Helpers, :type => :request
  config.before :suite do
    Warden.test_mode!
  end
end