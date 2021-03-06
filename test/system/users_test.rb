require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
  setup do
    @user = users(:one)
  end

  test "visiting the index" do
    visit users_url
    assert_selector "h1", text: "Users"
  end

  test "creating a User" do
    visit users_url
    click_on "New User"

    fill_in "Address", with: @user.address
    fill_in "Age", with: @user.age
    fill_in "Auth token", with: @user.auth_token
    fill_in "City", with: @user.city
    fill_in "Country", with: @user.country
    fill_in "Crypted password", with: @user.crypted_password
    fill_in "Email", with: @user.email
    fill_in "Fax number", with: @user.fax_number
    fill_in "First name", with: @user.first_name
    fill_in "Gender", with: @user.gender
    fill_in "Home number", with: @user.home_number
    fill_in "Last name", with: @user.last_name
    fill_in "Login", with: @user.login
    fill_in "Mobile number", with: @user.mobile_number
    fill_in "Other number", with: @user.other_number
    fill_in "Pincode", with: @user.pincode
    fill_in "State", with: @user.state
    fill_in "Work number", with: @user.work_number
    click_on "Create User"

    assert_text "User was successfully created"
    click_on "Back"
  end

  test "updating a User" do
    visit users_url
    click_on "Edit", match: :first

    fill_in "Address", with: @user.address
    fill_in "Age", with: @user.age
    fill_in "Auth token", with: @user.auth_token
    fill_in "City", with: @user.city
    fill_in "Country", with: @user.country
    fill_in "Crypted password", with: @user.crypted_password
    fill_in "Email", with: @user.email
    fill_in "Fax number", with: @user.fax_number
    fill_in "First name", with: @user.first_name
    fill_in "Gender", with: @user.gender
    fill_in "Home number", with: @user.home_number
    fill_in "Last name", with: @user.last_name
    fill_in "Login", with: @user.login
    fill_in "Mobile number", with: @user.mobile_number
    fill_in "Other number", with: @user.other_number
    fill_in "Pincode", with: @user.pincode
    fill_in "State", with: @user.state
    fill_in "Work number", with: @user.work_number
    click_on "Update User"

    assert_text "User was successfully updated"
    click_on "Back"
  end

  test "destroying a User" do
    visit users_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "User was successfully destroyed"
  end
end
