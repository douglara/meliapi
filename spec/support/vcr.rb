require "vcr"

VCR.configure do |config|
  config.allow_http_connections_when_no_cassette = false
  config.cassette_library_dir = File.expand_path("../../cassettes", __FILE__)
  config.hook_into :webmock
  config.configure_rspec_metadata!
  config.filter_sensitive_data('<APP_KEY>') { ENV['APP_KEY'] }
  config.filter_sensitive_data('<APP_SECRET>') { ENV['APP_SECRET'] }
  config.filter_sensitive_data('<CALLBACK_URL>') { ENV['CALLBACK_URL'] }
  config.filter_sensitive_data('<ACCESS_TOKEN>') { ENV['ACCESS_TOKEN'] }
end