require 'test_helper'

class GymsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get gyms_index_url
    assert_response :success
  end

  test "should get show" do
    get gyms_show_url
    assert_response :success
  end

  test "should get new" do
    get gyms_new_url
    assert_response :success
  end

  test "should get edit" do
    get gyms_edit_url
    assert_response :success
  end

end
