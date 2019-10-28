require 'test_helper'

class AgencyControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get agency_index_url
    assert_response :success
  end

  test "should get new" do
    get agency_new_url
    assert_response :success
  end

  test "should get edit" do
    get agency_edit_url
    assert_response :success
  end

  test "should get show" do
    get agency_show_url
    assert_response :success
  end

end
