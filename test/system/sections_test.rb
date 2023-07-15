require "application_system_test_case"

class SectionsTest < ApplicationSystemTestCase
  setup do
    @section = sections(:one)
  end

  test "visiting the index" do
    visit sections_url
    assert_selector "h1", text: "Sections"
  end

  test "should create section" do
    visit sections_url
    click_on "New section"

    fill_in "Campus", with: @section.campus
    fill_in "Course", with: @section.course
    fill_in "Days times", with: @section.days_times
    fill_in "Graders", with: @section.graders
    fill_in "Graders required", with: @section.graders_required
    fill_in "Instruction mode", with: @section.instruction_mode
    fill_in "Instructor", with: @section.instructor
    fill_in "Section number", with: @section.section_number
    fill_in "Term", with: @section.term
    click_on "Create Section"

    assert_text "Section was successfully created"
    click_on "Back"
  end

  test "should update Section" do
    visit section_url(@section)
    click_on "Edit this section", match: :first

    fill_in "Campus", with: @section.campus
    fill_in "Course", with: @section.course
    fill_in "Days times", with: @section.days_times
    fill_in "Graders", with: @section.graders
    fill_in "Graders required", with: @section.graders_required
    fill_in "Instruction mode", with: @section.instruction_mode
    fill_in "Instructor", with: @section.instructor
    fill_in "Section number", with: @section.section_number
    fill_in "Term", with: @section.term
    click_on "Update Section"

    assert_text "Section was successfully updated"
    click_on "Back"
  end

  test "should destroy Section" do
    visit section_url(@section)
    click_on "Destroy this section", match: :first

    assert_text "Section was successfully destroyed"
  end
end
