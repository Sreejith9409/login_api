require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
  end

  test "should get index" do
    get users_url
    assert_response :success
  end

  test "should get new" do
    get new_user_url
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post users_url, params: { user: { address: @user.address, age: @user.age, auth_token: @user.auth_token, city: @user.city, country: @user.country, crypted_password: @user.crypted_password, email: @user.email, fax_number: @user.fax_number, first_name: @user.first_name, gender: @user.gender, home_number: @user.home_number, last_name: @user.last_name, login: @user.login, mobile_number: @user.mobile_number, other_number: @user.other_number, pincode: @user.pincode, state: @user.state, work_number: @user.work_number } }
    end

    assert_redirected_to user_url(User.last)
  end

  test "should show user" do
    get user_url(@user)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_url(@user)
    assert_response :success
  end

  test "should update user" do
    patch user_url(@user), params: { user: { address: @user.address, age: @user.age, auth_token: @user.auth_token, city: @user.city, country: @user.country, crypted_password: @user.crypted_password, email: @user.email, fax_number: @user.fax_number, first_name: @user.first_name, gender: @user.gender, home_number: @user.home_number, last_name: @user.last_name, login: @user.login, mobile_number: @user.mobile_number, other_number: @user.other_number, pincode: @user.pincode, state: @user.state, work_number: @user.work_number } }
    assert_redirected_to user_url(@user)
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete user_url(@user)
    end

    assert_redirected_to users_url
  end
end
