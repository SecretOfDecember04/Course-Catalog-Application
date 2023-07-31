class AvailabilitiesController < ApplicationController
  before_action :set_availability, only: %i[show edit update destroy]

  # GET /availabilities or /availabilities.json
  def index
    @availabilities = Availability.all
    @terms = { '1232' => 'Spring 2023', '1234' => 'Summer 2023', '1238' => 'Autumn 2023' }
  end

  # GET /availabilities/1 or /availabilities/1.json
  def show; end

  # GET /availabilities/new
  def new
    @availability = Availability.new
    @terms = { '1232' => 'Spring 2023', '1234' => 'Summer 2023', '1238' => 'Autumn 2023' }
    @availability.user_id = current_user.id
  end

  # GET /availabilities/1/edit
  def edit
    @terms = { '1232' => 'Spring 2023', '1234' => 'Summer 2023', '1238' => 'Autumn 2023' }
    @availability.user_id = current_user.id
  end

  # POST /availabilities or /availabilities.json
  def create
    @terms = { '1232' => 'Spring 2023', '1234' => 'Summer 2023', '1238' => 'Autumn 2023' }
    @availability = Availability.new(availability_params)
    @availability.user_id = current_user.id

    respond_to do |format|
      if @availability.save
        format.html { redirect_to(availability_url(@availability), notice: "Availability was successfully created.") }
        format.json { render(:show, status: :created, location: @availability) }
      else
        format.html { render(:new, status: :unprocessable_entity) }
        format.json { render(json: @availability.errors, status: :unprocessable_entity) }
      end
    end
  end

  # PATCH/PUT /availabilities/1 or /availabilities/1.json
  def update
    respond_to do |format|
      if @availability.update(availability_params)
        format.html { redirect_to(availability_url(@availability), notice: "Availability was successfully updated.") }
        format.json { render(:show, status: :ok, location: @availability) }
      else
        format.html { render(:edit, status: :unprocessable_entity) }
        format.json { render(json: @availability.errors, status: :unprocessable_entity) }
      end
    end
  end

  # DELETE /availabilities/1 or /availabilities/1.json
  def destroy
    @availability.destroy

    respond_to do |format|
      format.html { redirect_to(availabilities_url, notice: "Availability was successfully destroyed.") }
      format.json { head(:no_content) }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_availability
    @availability = Availability.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def availability_params
    params.require(:availability).permit(:student, :day, :start_time, :end_time, :user_id)
  end
end
