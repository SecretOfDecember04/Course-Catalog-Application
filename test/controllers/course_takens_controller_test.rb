require "test_helper"

class CourseTakensControllerTest < ActionDispatch::IntegrationTest
  setup do
    @course_taken = course_takens(:one)
  end

  test "should get index" do
    get course_takens_url
    assert_response :success
  end

  test "should get new" do
    get new_course_taken_url
    assert_response :success
  end

  test "should create course_taken" do
    assert_difference("CourseTaken.count") do
      post course_takens_url, params: { course_taken: { course: @course_taken.course, grader: @course_taken.grader } }
    end

    assert_redirected_to course_taken_url(CourseTaken.last)
  end

  test "should show course_taken" do
    get course_taken_url(@course_taken)
    assert_response :success
  end

  test "should get edit" do
    get edit_course_taken_url(@course_taken)
    assert_response :success
  end

  test "should update course_taken" do
    patch course_taken_url(@course_taken), params: { course_taken: { course: @course_taken.course, grader: @course_taken.grader } }
    assert_redirected_to course_taken_url(@course_taken)
  end

  test "should destroy course_taken" do
    assert_difference("CourseTaken.count", -1) do
      delete course_taken_url(@course_taken)
    end

    assert_redirected_to course_takens_url
  end
end
