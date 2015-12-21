class MeasurePeriodsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_measure_period, only: [:show, :edit, :update, :destroy]

  # GET /measure_periods
  # GET /measure_periods.json
  def index
    @measure_periods = MeasurePeriod.all
  end

  # GET /measure_periods/1
  # GET /measure_periods/1.json
  def show
  end

  # GET /measure_periods/new
  def new
    @measure_period = MeasurePeriod.new
  end

  # GET /measure_periods/1/edit
  def edit
  end

  # POST /measure_periods
  # POST /measure_periods.json
  def create
    @measure_period = current_user.measure_periods.build(measure_period_params)

    respond_to do |format|
      if @measure_period.save
        format.html { redirect_to action: :index, notice: 'Measure period was successfully created.' }
        format.json { render :show, status: :created, location: @measure_period }
      else
        format.html { render :new }
        format.json { render json: @measure_period.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /measure_periods/1
  # PATCH/PUT /measure_periods/1.json
  def update
    respond_to do |format|
      if @measure_period.update(measure_period_params)
        format.html { redirect_to @measure_period, notice: 'Measure period was successfully updated.' }
        format.json { render :show, status: :ok, location: @measure_period }
      else
        format.html { render :edit }
        format.json { render json: @measure_period.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /measure_periods/1
  # DELETE /measure_periods/1.json
  def destroy
    @measure_period.destroy
    respond_to do |format|
      format.html { redirect_to measure_periods_url, notice: 'Measure period was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_measure_period
      @measure_period = MeasurePeriod.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def measure_period_params
      params.require(:measure_period).permit(:starting_day, :number_of_days)
    end
end
