require "application_system_test_case"

class ContactInfosTest < ApplicationSystemTestCase
  setup do
    @contact_info = contact_infos(:one)
  end

  test "visiting the index" do
    visit contact_infos_url
    assert_selector "h1", text: "Contact infos"
  end

  test "should create contact info" do
    visit contact_infos_url
    click_on "New contact info"

    fill_in "Contact", with: @contact_info.contact_id
    fill_in "Number", with: @contact_info.number
    fill_in "Type", with: @contact_info.type
    click_on "Create Contact info"

    assert_text "Contact info was successfully created"
    click_on "Back"
  end

  test "should update Contact info" do
    visit contact_info_url(@contact_info)
    click_on "Edit this contact info", match: :first

    fill_in "Contact", with: @contact_info.contact_id
    fill_in "Number", with: @contact_info.number
    fill_in "Type", with: @contact_info.type
    click_on "Update Contact info"

    assert_text "Contact info was successfully updated"
    click_on "Back"
  end

  test "should destroy Contact info" do
    visit contact_info_url(@contact_info)
    click_on "Destroy this contact info", match: :first

    assert_text "Contact info was successfully destroyed"
  end
end
