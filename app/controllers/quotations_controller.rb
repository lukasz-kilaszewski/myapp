class QuotationsController < ApplicationController

  # GET /quotations
  # GET /quotations.json
  def index
    @quotations = Quotation.all
  end

  # GET /quotations/new
  def new
    @quotation = Quotation.new
  end
  # POST /quotations
  # POST /quotations.json
  def create
    @quotation = Quotation.new(quotation_params)

    respond_to do |format|
      if @quotation.save
        format.html { redirect_to root_path, notice: 'Quotation was successfully created.' }
        format.json { render :nil, status: :created, location: root_path }
      else
        format.html { render :new }
        format.json { render json: @quotation.errors, status: :unprocessable_entity }
      end
    end
  end



  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def quotation_params
      params.require(:quotation).permit(:quote)
    end
end
