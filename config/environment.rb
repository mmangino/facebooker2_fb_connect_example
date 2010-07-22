# Be sure to restart your server when you modify this file

# Uncomment below to force Rails into production mode when
# you don't control web/app server and can't set it the proper way
# ENV['RAILS_ENV'] ||= 'production'

# Specifies gem version of Rails to use when vendor/rails is not present
RAILS_GEM_VERSION = '2.3.5' unless defined? RAILS_GEM_VERSION

# Bootstrap the Rails environment, frameworks, and default configuration
require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|

  config.gem "facebooker2"

  config.time_zone = 'UTC'
  config.action_controller.session = {
    :session_key => '_fb_connect_example_session',
    :secret      => 'bf1102b121134db0442594576d4f85adf684c22d23589eeb835cd8323aec1a92e0c5cacf08627632a477d3e9e96693ff9f035394e6638ff9d4b5e38ca964154f'
  }
end
