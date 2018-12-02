require "application_system_test_case"

class ScrapingHtmlElementsTest < ApplicationSystemTestCase
  setup do
    @scraping_html_element = scraping_html_elements(:one)
  end

  test "visiting the index" do
    visit scraping_html_elements_url
    assert_selector "h1", text: "Scraping Html Elements"
  end

  test "creating a Scraping html element" do
    visit scraping_html_elements_url
    click_on "New Scraping Html Element"

    fill_in "Scraping Page", with: @scraping_html_element.scraping_page_id
    fill_in "Target Element", with: @scraping_html_element.target_element
    click_on "Create Scraping html element"

    assert_text "Scraping html element was successfully created"
    click_on "Back"
  end

  test "updating a Scraping html element" do
    visit scraping_html_elements_url
    click_on "Edit", match: :first

    fill_in "Scraping Page", with: @scraping_html_element.scraping_page_id
    fill_in "Target Element", with: @scraping_html_element.target_element
    click_on "Update Scraping html element"

    assert_text "Scraping html element was successfully updated"
    click_on "Back"
  end

  test "destroying a Scraping html element" do
    visit scraping_html_elements_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Scraping html element was successfully destroyed"
  end
end
