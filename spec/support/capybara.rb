Capybara.asset_host = 'http://localhost:3000'

Capybara.register_driver :selenium do |app|
   profile = Selenium::WebDriver::Firefox::Profile.from_name 'Testy'
   Capybara::Selenium::Driver.new(app, :profile => profile)
end