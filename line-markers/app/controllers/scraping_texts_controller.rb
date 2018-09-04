class ScrapingTextsController < ApplicationController
  before_action :set_scraping_text, only: [:show, :edit, :update, :destroy]

  # GET /scraping_texts
  # GET /scraping_texts.json
  def index
    @scraping_texts = ScrapingText.all
  end

  # GET /scraping_texts/1
  # GET /scraping_texts/1.json
  def show
  end

  # GET /scraping_texts/new
  def new
    @scraping_page_id = params[:id]

    url = ScrapingPage.find(@scraping_page_id).page_url
    element = ScrapingPage.find(@scraping_page_id).target_element

    agent = Mechanize.new
    page = agent.get(url)
    @scraping_body = page.search(element)

    @scraping_text = ScrapingText.new
  end

  # GET /scraping_texts/1/edit
  def edit
  end

  # POST /scraping_texts
  # POST /scraping_texts.json
  def create
    @scraping_text = ScrapingText.new(scraping_text_params)

    respond_to do |format|
      if @scraping_text.save
        format.html { redirect_to @scraping_text, notice: 'Scraping text was successfully created.' }
        format.json { render :show, status: :created, location: @scraping_text }
      else
        format.html { render :new }
        format.json { render json: @scraping_text.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /scraping_texts/1
  # PATCH/PUT /scraping_texts/1.json
  def update
    respond_to do |format|
      if @scraping_text.update(scraping_text_params)
        format.html { redirect_to @scraping_text, notice: 'Scraping text was successfully updated.' }
        format.json { render :show, status: :ok, location: @scraping_text }
      else
        format.html { render :edit }
        format.json { render json: @scraping_text.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /scraping_texts/1
  # DELETE /scraping_texts/1.json
  def destroy
    @scraping_text.destroy
    respond_to do |format|
      format.html { redirect_to scraping_texts_url, notice: 'Scraping text was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_scraping_text
      @scraping_text = ScrapingText.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def scraping_text_params
      params.require(:scraping_text).permit(:body, :scraping_page_id)
    end
end
