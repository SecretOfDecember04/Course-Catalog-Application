class CoursesController < ApplicationController
  before_action :set_course, only: %i[ show edit update destroy ]
  before_action :require_admin, only: %i[ edit update destroy ]

  # GET /courses or /courses.json
  def index
    @terms = Course.distinct.pluck(:term)

    sort = params[:sort] || 'course_number'
    direction = params[:direction] || 'asc'

    @courses = Course.order(sort => direction)

    if params[:term].present?
      @courses = @courses.where(term: params[:term])
    end

    if params[:search].present?
      @pagy, @courses = pagy(
        @courses.where("course_number LIKE :search OR subject LIKE :search OR name LIKE :search OR description LIKE :search OR level LIKE :search",
                       search: "%#{params[:search]}%")
      )
    else
      @pagy, @courses = pagy(@courses)
    end
  end

  # GET /courses/1 or /courses/1.json
  def show; end

  # GET /courses/new
  def new
    @course = Course.new
  end

  # GET /courses/1/edit
  def edit; end

  # POST /courses or /courses.json
  def create
    @course = Course.new(course_params)

    respond_to do |format|
      if @course.save
        format.html { redirect_to(course_url(@course), notice: "Course was successfully created.") }
        format.json { render(:show, status: :created, location: @course) }
      else
        format.html { render(:new, status: :unprocessable_entity) }
        format.json { render(json: @course.errors, status: :unprocessable_entity) }
      end
    end
  end

  # PATCH/PUT /courses/1 or /courses/1.json
  def update
    respond_to do |format|
      if @course.update(course_params)
        format.html { redirect_to(course_url(@course), notice: "Course was successfully updated.") }
        format.json { render(:show, status: :ok, location: @course) }
      else
        format.html { render(:edit, status: :unprocessable_entity) }
        format.json { render(json: @course.errors, status: :unprocessable_entity) }
      end
    end
  end

  # DELETE /courses/1 or /courses/1.json
  def destroy
    @course.destroy

    respond_to do |format|
      format.html { redirect_to(courses_url, notice: "Course was successfully destroyed.") }
      format.json { head(:no_content) }
    end
  end

  # Reload courses.
  def reload
    system("rake db:populate")
    redirect_to(courses_path, notice: 'Courses reloaded.')
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_course
    @course = Course.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def course_params
    params.require(:course).permit(:course_number, :subject, :name, :description, :short_description, :level)
  end

  # Only allow admin to take specific action
  def require_admin
    unless current_user.role == 'Admin' && current_user.is_approved == true
      flash[:alert] = "You must be an admin to access this action."
      redirect_back(fallback_location: root_path)
    end
  end
end
