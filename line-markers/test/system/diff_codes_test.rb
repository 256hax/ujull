require "application_system_test_case"

class DiffCodesTest < ApplicationSystemTestCase
  setup do
    @diff_code = diff_codes(:one)
  end

  test "visiting the index" do
    visit diff_codes_url
    assert_selector "h1", text: "Diff Codes"
  end

  test "creating a Diff code" do
    visit diff_codes_url
    click_on "New Diff Code"

    fill_in "Html", with: @diff_code.html
    fill_in "Scraped Code Created At", with: @diff_code.scraped_code_created_at
    fill_in "Scraped Code", with: @diff_code.scraped_code_id
    fill_in "Scraping Page", with: @diff_code.scraping_page_id
    fill_in "Text", with: @diff_code.text
    click_on "Create Diff code"

    assert_text "Diff code was successfully created"
    click_on "Back"
  end

  test "updating a Diff code" do
    visit diff_codes_url
    click_on "Edit", match: :first

    fill_in "Html", with: @diff_code.html
    fill_in "Scraped Code Created At", with: @diff_code.scraped_code_created_at
    fill_in "Scraped Code", with: @diff_code.scraped_code_id
    fill_in "Scraping Page", with: @diff_code.scraping_page_id
    fill_in "Text", with: @diff_code.text
    click_on "Update Diff code"

    assert_text "Diff code was successfully updated"
    click_on "Back"
  end

  test "destroying a Diff code" do
    visit diff_codes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Diff code was successfully destroyed"
  end
end
