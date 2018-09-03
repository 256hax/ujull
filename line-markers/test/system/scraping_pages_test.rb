require "application_system_test_case"

class ScrapingPagesTest < ApplicationSystemTestCase
  setup do
    @scraping_page = scraping_pages(:one)
  end

  test "visiting the index" do
    visit scraping_pages_url
    assert_selector "h1", text: "Scraping Pages"
  end

  test "creating a Scraping page" do
    visit scraping_pages_url
    click_on "New Scraping Page"

    fill_in "Active", with: @scraping_page.active
    fill_in "Page Url", with: @scraping_page.page_url
    fill_in "Scraping Frequency", with: @scraping_page.scraping_frequency
    fill_in "Target Element", with: @scraping_page.target_element
    click_on "Create Scraping page"

    assert_text "Scraping page was successfully created"
    click_on "Back"
  end

  test "updating a Scraping page" do
    visit scraping_pages_url
    click_on "Edit", match: :first

    fill_in "Active", with: @scraping_page.active
    fill_in "Page Url", with: @scraping_page.page_url
    fill_in "Scraping Frequency", with: @scraping_page.scraping_frequency
    fill_in "Target Element", with: @scraping_page.target_element
    click_on "Update Scraping page"

    assert_text "Scraping page was successfully updated"
    click_on "Back"
  end

  test "destroying a Scraping page" do
    visit scraping_pages_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Scraping page was successfully destroyed"
  end
end
