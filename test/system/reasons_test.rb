require "application_system_test_case"

class ReasonsTest < ApplicationSystemTestCase
  setup do
    @reason = reasons(:one)
  end

  test "visiting the index" do
    visit reasons_url
    assert_selector "h1", text: "Reasons"
  end

  test "creating a Reason" do
    visit reasons_url
    click_on "New Reason"

    click_on "Create Reason"

    assert_text "Reason was successfully created"
    click_on "Back"
  end

  test "updating a Reason" do
    visit reasons_url
    click_on "Edit", match: :first

    click_on "Update Reason"

    assert_text "Reason was successfully updated"
    click_on "Back"
  end

  test "destroying a Reason" do
    visit reasons_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Reason was successfully destroyed"
  end
end
