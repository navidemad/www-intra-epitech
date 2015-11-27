class CrawlLoginWorker

  include Sidekiq::Worker

  sidekiq_options retry: 2

  # TODO:
  # - sidekiq periodic: ~day  -> crawler.fetchLogins!
  # - sidekiq periodic: ~hour -> crawler.crawlLogins!
  def perform
    crawler = ::Crawlers::Epitech.new
    crawler.authenticate!(ENV['AUTO_AUTH_URL'])
    crawler.crawlLogins!
  end

end