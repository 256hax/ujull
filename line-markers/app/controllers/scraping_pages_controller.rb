class ScrapingPagesController < ApplicationController
  include Scrapable

  before_action :set_scraping_page, only: [:show, :edit, :update, :destroy]

  # GET /scraping_pages
  # GET /scraping_pages.json
  def index
    @scraping_pages = ScrapingPage.all
  end

  # GET /scraping_pages/1
  # GET /scraping_pages/1.json
  def show
  end

  # GET /scraping_pages/new
  def new
    @scraping_page = ScrapingPage.new
    @scraping_page.active = true # default checked
  end

  # GET /scraping_pages/1/edit
  def edit
  end

  # POST /scraping_pages
  # POST /scraping_pages.json
  def create
    @scraping_page = ScrapingPage.new(scraping_page_params)

    # set title
    url = @scraping_page.page_url
    uri = URI.parse(url) # ex) https://example.com/ -> set "example.com"
    page = get_page_code(url) # call concerns/scrapable.rb
    title = page.title if page.respond_to?(:title) # for undefiend page.title method error (RSS).
    title = "#{title} #{uri.host}"
    @scraping_page.title = title

    respond_to do |format|
      if @scraping_page.save
        format.html { redirect_to @scraping_page, notice: 'Scraping page was successfully created.' }
        format.json { render :show, status: :created, location: @scraping_page }
      else
        format.html { render :new }
        format.json { render json: @scraping_page.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /scraping_pages/1
  # PATCH/PUT /scraping_pages/1.json
  def update
    respond_to do |format|
      if @scraping_page.update(scraping_page_params)
        format.html { redirect_to @scraping_page, notice: 'Scraping page was successfully updated.' }
        format.json { render :show, status: :ok, location: @scraping_page }
      else
        format.html { render :edit }
        format.json { render json: @scraping_page.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /scraping_pages/1
  # DELETE /scraping_pages/1.json
  def destroy
    @scraping_page.destroy
    respond_to do |format|
      format.html { redirect_to scraping_pages_url, notice: 'Scraping page was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_scraping_page
      @scraping_page = ScrapingPage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def scraping_page_params
      params.require(:scraping_page).permit(:page_url, :scraping_frequency, :target_element, :active)
    end
end
