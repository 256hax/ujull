require "application_system_test_case"

class ScrapingTextsTest < ApplicationSystemTestCase
  setup do
    @scraping_text = scraping_texts(:one)
  end

  test "visiting the index" do
    visit scraping_texts_url
    assert_selector "h1", text: "Scraping Texts"
  end

  test "creating a Scraping text" do
    visit scraping_texts_url
    click_on "New Scraping Text"

    fill_in "Body", with: @scraping_text.body
    fill_in "Scraping Page", with: @scraping_text.scraping_page_id
    click_on "Create Scraping text"

    assert_text "Scraping text was successfully created"
    click_on "Back"
  end

  test "updating a Scraping text" do
    visit scraping_texts_url
    click_on "Edit", match: :first

    fill_in "Body", with: @scraping_text.body
    fill_in "Scraping Page", with: @scraping_text.scraping_page_id
    click_on "Update Scraping text"

    assert_text "Scraping text was successfully updated"
    click_on "Back"
  end

  test "destroying a Scraping text" do
    visit scraping_texts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Scraping text was successfully destroyed"
  end
end
