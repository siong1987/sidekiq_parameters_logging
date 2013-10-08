require 'sidekiq/parameters/logging'
require 'sidekiq/parameters/logger'

Sidekiq.configure_server do |config|
  config.server_middleware do |chain|
    chain.remove Sidekiq::Middleware::Server::Logging
    chain.add Sidekiq::Parameters::Logging
  end
end
