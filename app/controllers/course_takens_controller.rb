class CourseTakensController < ApplicationController
  before_action :set_course_taken, only: %i[ show edit update destroy ]

  # GET /course_takens or /course_takens.json
  def index
    @course_takens = CourseTaken.all
  end

  # GET /course_takens/1 or /course_takens/1.json
  def show
  end

  # GET /course_takens/new
  def new
    @course_taken = CourseTaken.new
  end

  # GET /course_takens/1/edit
  def edit
  end

  # POST /course_takens or /course_takens.json
  def create
    @course_taken = CourseTaken.new(course_taken_params)

    respond_to do |format|
      if @course_taken.save
        format.html { redirect_to course_taken_url(@course_taken), notice: "Course taken was successfully created." }
        format.json { render :show, status: :created, location: @course_taken }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @course_taken.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /course_takens/1 or /course_takens/1.json
  def update
    respond_to do |format|
      if @course_taken.update(course_taken_params)
        format.html { redirect_to course_taken_url(@course_taken), notice: "Course taken was successfully updated." }
        format.json { render :show, status: :ok, location: @course_taken }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @course_taken.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /course_takens/1 or /course_takens/1.json
  def destroy
    @course_taken.destroy

    respond_to do |format|
      format.html { redirect_to course_takens_url, notice: "Course taken was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course_taken
      @course_taken = CourseTaken.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def course_taken_params
      params.require(:course_taken).permit(:grader, :course)
    end
end
