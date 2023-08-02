class SectionsController < ApplicationController
  before_action :set_section, only: %i[ show edit update destroy ]
  before_action :require_admin, only: %i[ new edit update destroy ]

  # GET /sections or /sections.json
  def index
    @pagy, @sections = pagy(Section.all)
  end

  # GET /sections/1 or /sections/1.json
  def show; end

  # GET /sections/new
  def new
    @section = Section.new
  end

  # GET /sections/1/edit
  def edit; end

  # POST /sections or /sections.json
  def create
    @section = Section.new(section_params)

    respond_to do |format|
      if @section.save
        format.html { redirect_to(section_url(@section), notice: "Section was successfully created.") }
        format.json { render(:show, status: :created, location: @section) }
      else
        format.html { render(:new, status: :unprocessable_entity) }
        format.json { render(json: @section.errors, status: :unprocessable_entity) }
      end
    end
  end

  # PATCH/PUT /sections/1 or /sections/1.json
  def update
    respond_to do |format|
      if @section.update(section_params)
        format.html { redirect_to(section_url(@section), notice: "Section was successfully updated.") }
        format.json { render(:show, status: :ok, location: @section) }
      else
        format.html { render(:edit, status: :unprocessable_entity) }
        format.json { render(json: @section.errors, status: :unprocessable_entity) }
      end
    end
  end

  # DELETE /sections/1 or /sections/1.json
  def destroy
    @section.destroy

    respond_to do |format|
      format.html { redirect_to(sections_url, notice: "Section was successfully destroyed.") }
      format.json { head(:no_content) }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_section
    @section = Section.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def section_params
    params.require(:section).permit(:section_number, :course_id, :student_id, :term, :instructor, :days, :start_time,
                                    :end_time, :instruction_mode)
  end

  # Only allow admin to take specific action
  def require_admin
    unless current_user.role == 'Admin' && current_user.is_approved == true
      flash[:alert] = "You must be an admin to access this action."
      redirect_back(fallback_location: root_path)
    end
  end
end
