# Load the Rails application.
require File.expand_path('../application', __FILE__)

Mime::Type.register "image/svg+xml", :svg
# Initialize the Rails application.
Rails.application.initialize!
