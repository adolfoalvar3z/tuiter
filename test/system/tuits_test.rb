require "application_system_test_case"

class TuitsTest < ApplicationSystemTestCase
  setup do
    @tuit = tuits(:one)
  end

  test "visiting the index" do
    visit tuits_url
    assert_selector "h1", text: "Tuits"
  end

  test "should create tuit" do
    visit tuits_url
    click_on "New tuit"

    fill_in "Description", with: @tuit.description
    fill_in "Username", with: @tuit.username
    click_on "Create Tuit"

    assert_text "Tuit was successfully created"
    click_on "Back"
  end

  test "should update Tuit" do
    visit tuit_url(@tuit)
    click_on "Edit this tuit", match: :first

    fill_in "Description", with: @tuit.description
    fill_in "Username", with: @tuit.username
    click_on "Update Tuit"

    assert_text "Tuit was successfully updated"
    click_on "Back"
  end

  test "should destroy Tuit" do
    visit tuit_url(@tuit)
    click_on "Destroy this tuit", match: :first

    assert_text "Tuit was successfully destroyed"
  end
end
