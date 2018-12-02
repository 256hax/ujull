class ScrapingHtmlElementsController < ApplicationController
  before_action :set_scraping_html_element, only: [:show, :edit, :update, :destroy]

  # GET /scraping_html_elements
  # GET /scraping_html_elements.json
  def index
    @scraping_html_elements = ScrapingHtmlElement.all
  end

  # GET /scraping_html_elements/1
  # GET /scraping_html_elements/1.json
  def show
  end

  # GET /scraping_html_elements/new
  def new
    @scraping_page_id = params[:id]
    
    @scraping_html_element = ScrapingHtmlElement.new
    @scraping_html_element.scraping_page_id = @scraping_page_id
  end

  # GET /scraping_html_elements/1/edit
  def edit
  end

  # POST /scraping_html_elements
  # POST /scraping_html_elements.json
  def create
    @scraping_html_element = ScrapingHtmlElement.new(scraping_html_element_params)

    respond_to do |format|
      if @scraping_html_element.save
        format.html { redirect_to @scraping_html_element, notice: 'Scraping html element was successfully created.' }
        format.json { render :show, status: :created, location: @scraping_html_element }
      else
        format.html { render :new }
        format.json { render json: @scraping_html_element.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /scraping_html_elements/1
  # PATCH/PUT /scraping_html_elements/1.json
  def update
    respond_to do |format|
      if @scraping_html_element.update(scraping_html_element_params)
        format.html { redirect_to @scraping_html_element, notice: 'Scraping html element was successfully updated.' }
        format.json { render :show, status: :ok, location: @scraping_html_element }
      else
        format.html { render :edit }
        format.json { render json: @scraping_html_element.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /scraping_html_elements/1
  # DELETE /scraping_html_elements/1.json
  def destroy
    @scraping_html_element.destroy
    respond_to do |format|
      format.html { redirect_to scraping_html_elements_url, notice: 'Scraping html element was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_scraping_html_element
      @scraping_html_element = ScrapingHtmlElement.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def scraping_html_element_params
      params.require(:scraping_html_element).permit(:target_element, :scraping_page_id)
    end
end
