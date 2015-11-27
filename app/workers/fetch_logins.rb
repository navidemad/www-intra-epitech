class FetchLoginsWorker

  include Sidekiq::Worker

  sidekiq_options retry: 0

  def perform
    ::Crawlers::Epitech.new.authenticate!(ENV['AUTO_AUTH_URL']).fetchLogins!
  end

end