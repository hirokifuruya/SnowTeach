require "application_system_test_case"

class RecruitsTest < ApplicationSystemTestCase
  setup do
    @recruit = recruits(:one)
  end

  test "visiting the index" do
    visit recruits_url
    assert_selector "h1", text: "Recruits"
  end

  test "creating a Recruit" do
    visit recruits_url
    click_on "New Recruit"

    fill_in "Detail", with: @recruit.detail
    fill_in "Money", with: @recruit.money
    fill_in "Name", with: @recruit.name
    click_on "Create Recruit"

    assert_text "Recruit was successfully created"
    click_on "Back"
  end

  test "updating a Recruit" do
    visit recruits_url
    click_on "Edit", match: :first

    fill_in "Detail", with: @recruit.detail
    fill_in "Money", with: @recruit.money
    fill_in "Name", with: @recruit.name
    click_on "Update Recruit"

    assert_text "Recruit was successfully updated"
    click_on "Back"
  end

  test "destroying a Recruit" do
    visit recruits_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Recruit was successfully destroyed"
  end
end
