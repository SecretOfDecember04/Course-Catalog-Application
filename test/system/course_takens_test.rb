require "application_system_test_case"

class CourseTakensTest < ApplicationSystemTestCase
  setup do
    @course_taken = course_takens(:one)
  end

  test "visiting the index" do
    visit course_takens_url
    assert_selector "h1", text: "Course takens"
  end

  test "should create course taken" do
    visit course_takens_url
    click_on "New course taken"

    fill_in "Course", with: @course_taken.course
    fill_in "Grader", with: @course_taken.grader
    click_on "Create Course taken"

    assert_text "Course taken was successfully created"
    click_on "Back"
  end

  test "should update Course taken" do
    visit course_taken_url(@course_taken)
    click_on "Edit this course taken", match: :first

    fill_in "Course", with: @course_taken.course
    fill_in "Grader", with: @course_taken.grader
    click_on "Update Course taken"

    assert_text "Course taken was successfully updated"
    click_on "Back"
  end

  test "should destroy Course taken" do
    visit course_taken_url(@course_taken)
    click_on "Destroy this course taken", match: :first

    assert_text "Course taken was successfully destroyed"
  end
end
