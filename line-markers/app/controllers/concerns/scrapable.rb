module Scrapable
  extend ActiveSupport::Concern
  include FileSavable # concerns/file_savable.rb

  def get_page_code(url)
    agent = Mechanize.new
    agent.get(url)
  end

  ### args: array(url)  return: scraping result
  def scraping_pages_html(urls)
    hydra = Typhoeus::Hydra.new

    requests = urls.map do |url|
      request = Typhoeus::Request.new(url)
      hydra.queue(request) # get into queues. Typhoeus runs HTTP requests in parallel.
      request # scraping result
    end

    hydra.run
    requests
  end
end
