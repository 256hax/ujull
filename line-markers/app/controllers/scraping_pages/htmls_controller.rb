class ScrapingPages::HtmlsController < ApplicationController
  # $ rails g controller ScrapingPages::Htmls create
  def create
    @scraping_page = ScrapingPage.new(scraping_page_params)

    respond_to do |format|
      if @scraping_page.save
        format.html { redirect_to @scraping_page, notice: 'Scraping page HTML was successfully created.' }
        format.json { render :show, status: :created, location: @scraping_page }
      else
        format.html { render :new }
        format.json { render json: @scraping_page.errors, status: :unprocessable_entity }
      end
    end
  end
end
