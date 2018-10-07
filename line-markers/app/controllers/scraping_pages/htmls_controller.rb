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
      dir_path = create_directory(request.base_url) # concerns/file_savable.rb
      file_name = get_file_name(request.base_url) # concerns/file_savable.rb
      save_html(dir_path, file_name, request) # concerns/file_savable.rb
    }
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_scraping_page
      @scraping_page = ScrapingPage.find(params[:id])
    end
end
