module Scrapable
  extend ActiveSupport::Concern

  def get_page_code(url)
    agent = Mechanize.new
    agent.get(url)
  end
end
