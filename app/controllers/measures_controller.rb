class MeasuresController < ApplicationController
  before_action :authenticate_user!
  before_action :set_measure, only: [:destroy]

  # GET /measures
  # GET /measures.json
  def index
    @measures = current_user.measures
  end

  # GET /measures/new
  def new
    @measure = Measure.new
  end

  # POST /measures
  # POST /measures.json
  def create
    @measure = current_user.measures.build(measure_params)

    respond_to do |format|
      if @measure.save
        format.html { redirect_to action: :index, notice: 'Measure was successfully created.' }
        format.json { render :show, status: :created, location: @measure }
      else
        format.html { render :new }
        format.json { render json: @measure.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /measures/1
  # DELETE /measures/1.json
  def destroy
    @measure.destroy
    respond_to do |format|
      format.html { redirect_to measures_url, notice: 'Measure was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_measure
      @measure = Measure.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def measure_params
      params.require(:measure).permit(:systolic, :diastolic, :pulse)
    end
end
