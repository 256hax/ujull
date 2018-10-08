class ScrapingPages::HtmlsController < ApplicationController
  include Scrapable
  include FileSavable

  # $ rails g controller ScrapingPages::Htmls create
  def create
    set_scraping_page # private method
    urls = Array.new
    urls[0] = @scraping_page.page_url

    requests = scraping_pages_html(urls) # concerns/scrapable.rb

    requests.map { |request|
      directory_path = @scraping_page.directory_path
      file_name = get_file_name(@scraping_page.id)
      save_html(directory_path, file_name, request) # concerns/file_savable.rb
    }
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_scraping_page
      @scraping_page = ScrapingPage.find(params[:id])
    end
end
