require 'test_helper'

class CoursesControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end

  setup do
  	@student = @course.subscriptions.first.student
  	@teacher = @course.teacher
  	@admin = Admin.first
  	@course = Course.first
  end

  test "index for student" do
    sign_in(@student)
    get :index
    assert_response :success
    assert_not_nil assigns(:courses)
  end
  
  test "index for admin" do
    sign_in(@admin)
    get :index
    assert_response :success
    assert_not_nil assigns(:courses)
  end
  
  test "index for teacher" do
    sign_in(@teacher)
    get :index
    assert_response :success
    assert_not_nil assigns(:courses)
  end
end
