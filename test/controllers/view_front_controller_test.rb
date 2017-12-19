require 'test_helper'

class ViewFrontControllerTest < ActionDispatch::IntegrationTest
  test "should get recipe_by_category" do
    get view_front_recipe_by_category_url
    assert_response :success
  end

  test "should get recipe_by_user" do
    get view_front_recipe_by_user_url
    assert_response :success
  end

end
