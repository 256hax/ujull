module Scrapable
  extend ActiveSupport::Concern
  include FileSavable # concerns/file_savable.rb

  def set_charset(body) # args: html body
    Mechanize::Util.detect_charset(body) # return: charset
  end

  def scraping_pages_html(urls) # args: array(url)
    hydra = Typhoeus::Hydra.new

    requests = urls.map do |url|
      request = Typhoeus::Request.new(url)
      hydra.queue(request) # Get into queues. Typhoeus runs HTTP requests in parallel.
      request # return: scraping result(obj)
    end

    hydra.run
    requests
  end

  def get_my_domain_and_port()
    port = ":#{request.port}" if (request.port)
    "#{request.protocol}#{request.domain}#{port}" # => "http://localhost:3000"
  end
end
