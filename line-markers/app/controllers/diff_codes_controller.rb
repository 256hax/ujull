class DiffCodesController < ApplicationController
  before_action :set_diff_code, only: [:show, :edit, :update, :destroy]

  # GET /diff_codes
  # GET /diff_codes.json
  def index
    @diff_codes = DiffCode.all
  end

  # GET /diff_codes/1
  # GET /diff_codes/1.json
  def show
  end

  # GET /diff_codes/new
  def new
    @diff_code = DiffCode.new
  end

  # GET /diff_codes/1/edit
  def edit
  end

  # POST /diff_codes
  # POST /diff_codes.json
  def create
    @diff_code = DiffCode.new(diff_code_params)

    respond_to do |format|
      if @diff_code.save
        format.html { redirect_to @diff_code, notice: 'Diff code was successfully created.' }
        format.json { render :show, status: :created, location: @diff_code }
      else
        format.html { render :new }
        format.json { render json: @diff_code.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /diff_codes/1
  # PATCH/PUT /diff_codes/1.json
  def update
    respond_to do |format|
      if @diff_code.update(diff_code_params)
        format.html { redirect_to @diff_code, notice: 'Diff code was successfully updated.' }
        format.json { render :show, status: :ok, location: @diff_code }
      else
        format.html { render :edit }
        format.json { render json: @diff_code.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /diff_codes/1
  # DELETE /diff_codes/1.json
  def destroy
    @diff_code.destroy
    respond_to do |format|
      format.html { redirect_to diff_codes_url, notice: 'Diff code was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_diff_code
      @diff_code = DiffCode.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def diff_code_params
      params.require(:diff_code).permit(:html, :text, :scraped_code_created_at, :scraping_page_id, :scraped_code_id)
    end
end
