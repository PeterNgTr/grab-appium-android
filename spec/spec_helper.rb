require 'rubygems'
require 'rspec'
require 'rspec/expectations'
require 'appium_lib'
require 'byebug'
require 'faker'

RSpec.configure do |config|
  config.color_enabled = true
  config.before(:all) do
    options = {
        caps: {
            platformName: 'Android',
            deviceName: 'android_emulator',
            app: "./grab.apk"
        },
        launchTimeout: 20000
    }

    driver = Appium::Driver.new(options).start_driver
    driver.manage.timeouts.implicit_wait = 3
    Appium.promote_appium_methods Object
    require_all_pages
  end

  config.after(:all) do
    driver_quit
  end

  def require_all_pages
    require_relative '../pages/login_page'
    require_relative '../pages/register_page'
    require_relative '../pages/verification_code_page'
  end

end