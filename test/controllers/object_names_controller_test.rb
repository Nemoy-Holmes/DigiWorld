require 'test_helper'

class ObjectNamesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @object_name = object_names(:one)
  end

  test "should get index" do
    get object_names_url
    assert_response :success
  end

  test "should get new" do
    get new_object_name_url
    assert_response :success
  end

  test "should create object_name" do
    assert_difference('ObjectName.count') do
      post object_names_url, params: { object_name: {  } }
    end

    assert_redirected_to object_name_url(ObjectName.last)
  end

  test "should show object_name" do
    get object_name_url(@object_name)
    assert_response :success
  end

  test "should get edit" do
    get edit_object_name_url(@object_name)
    assert_response :success
  end

  test "should update object_name" do
    patch object_name_url(@object_name), params: { object_name: {  } }
    assert_redirected_to object_name_url(@object_name)
  end

  test "should destroy object_name" do
    assert_difference('ObjectName.count', -1) do
      delete object_name_url(@object_name)
    end

    assert_redirected_to object_names_url
  end
end
