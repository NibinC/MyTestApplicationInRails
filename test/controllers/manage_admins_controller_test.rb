require 'test_helper'

class ManageAdminsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get manage_admins_index_url
    assert_response :success
  end

  test "should get show" do
    get manage_admins_show_url
    assert_response :success
  end

  test "should get new" do
    get manage_admins_new_url
    assert_response :success
  end

  test "should get edit" do
    get manage_admins_edit_url
    assert_response :success
  end

  test "should get delete" do
    get manage_admins_delete_url
    assert_response :success
  end

end
