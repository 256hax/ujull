class ScrapingPages::HtmlsController < ApplicationController
  include Scrapable
  include FileSavable

  # $ rails g controller ScrapingPages::Htmls create
  def create
    #--- Set page url ---#
    set_scraping_page # private method
    urls = Array.new
    urls[0] = @scraping_page.page_url # Runs multiple HTTP requests in parallel. If only one request, use url[0].

    #--- Set HTTP request ---#
    requests = scraping_pages_html(urls) # concerns/scrapable.rb
    charset = @scraping_page.charset

    # Scraping loop action
    requests.map { |request|
      directory_path = @scraping_page.directory_path
      file_name = get_file_name(@scraping_page.id)
      body = request.response.body

      save_html(directory_path, file_name, body, charset) # concerns/file_savable.rb

      # Save scraping latest date
      @scraping_page.scraping_latest_date = DateTime.now
      @scraping_page.save
    }
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_scraping_page
      @scraping_page = ScrapingPage.find(params[:id])
    end
end
