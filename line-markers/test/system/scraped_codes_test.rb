require "application_system_test_case"

class ScrapedCodesTest < ApplicationSystemTestCase
  setup do
    @scraped_code = scraped_codes(:one)
  end

  test "visiting the index" do
    visit scraped_codes_url
    assert_selector "h1", text: "Scraped Codes"
  end

  test "creating a Scraped code" do
    visit scraped_codes_url
    click_on "New Scraped Code"

    fill_in "Html", with: @scraped_code.html
    fill_in "Scraping Html Element", with: @scraped_code.scraping_html_element_id
    fill_in "Text", with: @scraped_code.text
    click_on "Create Scraped code"

    assert_text "Scraped code was successfully created"
    click_on "Back"
  end

  test "updating a Scraped code" do
    visit scraped_codes_url
    click_on "Edit", match: :first

    fill_in "Html", with: @scraped_code.html
    fill_in "Scraping Html Element", with: @scraped_code.scraping_html_element_id
    fill_in "Text", with: @scraped_code.text
    click_on "Update Scraped code"

    assert_text "Scraped code was successfully updated"
    click_on "Back"
  end

  test "destroying a Scraped code" do
    visit scraped_codes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Scraped code was successfully destroyed"
  end
end
