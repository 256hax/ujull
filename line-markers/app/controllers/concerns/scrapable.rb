module Scrapable
  extend ActiveSupport::Concern

  def get_page_code(url)
    agent = Mechanize.new
    agent.get(url)
  end

  # return http status code. ex) status code 200 ok -> return 200
  def get_http_status(url)
    Net::HTTP.get_response(URI.parse(url)).code
  end
end
