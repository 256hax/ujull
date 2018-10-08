module Scrapable
  extend ActiveSupport::Concern
  include FileSavable # concerns/file_savable.rb

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

  def get_my_domain_and_port()
    port = ":#{request.port}" if (request.port)
    "#{request.protocol}#{request.domain}#{port}" # => "http://localhost:3000"
  end
end
