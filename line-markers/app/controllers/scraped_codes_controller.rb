class ScrapedCodesController < ApplicationController
  include Scrapable
  
  before_action :set_scraped_code, only: [:show, :edit, :update, :destroy]

  # GET /scraped_codes
  # GET /scraped_codes.json
  def index
    @scraped_codes = ScrapedCode.all
  end

  # GET /scraped_codes/1
  # GET /scraped_codes/1.json
  def show
  end

  # GET /scraped_codes/new
  def new
    @scraping_page_id = params[:id]

    url = ScrapingPage.find(params[:id]).page_url
    element = ScrapingPage.find(params[:id]).target_element

    page = get_page_code(url)
    scraped_code = page.search(element)

    @scraped_code = ScrapedCode.new
    @scraped_code.html = scraped_code
    @scraped_code.text ||= ''
    scraped_code.each do |s|
      @scraped_code.text = @scraped_code.text + s.inner_text + "\n"
    end

    @scraped_code.scraping_page_id = @scraping_page_id
  end

  # GET /scraped_codes/1/edit
  def edit
  end

  # POST /scraped_codes
  # POST /scraped_codes.json
  def create
    @scraped_code = ScrapedCode.new(scraped_code_params)

    respond_to do |format|
      if @scraped_code.save
        format.html { redirect_to @scraped_code, notice: 'Scraped code was successfully created.' }
        format.json { render :show, status: :created, location: @scraped_code }
      else
        format.html { render :new }
        format.json { render json: @scraped_code.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /scraped_codes/1
  # PATCH/PUT /scraped_codes/1.json
  def update
    respond_to do |format|
      if @scraped_code.update(scraped_code_params)
        format.html { redirect_to @scraped_code, notice: 'Scraped code was successfully updated.' }
        format.json { render :show, status: :ok, location: @scraped_code }
      else
        format.html { render :edit }
        format.json { render json: @scraped_code.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /scraped_codes/1
  # DELETE /scraped_codes/1.json
  def destroy
    @scraped_code.destroy
    respond_to do |format|
      format.html { redirect_to scraped_codes_url, notice: 'Scraped code was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_scraped_code
      @scraped_code = ScrapedCode.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def scraped_code_params
      params.require(:scraped_code).permit(:html, :text, :scraping_page_id)
    end
end
