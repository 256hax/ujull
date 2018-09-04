require 'test_helper'

class ScrapingTextsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @scraping_text = scraping_texts(:one)
  end

  test "should get index" do
    get scraping_texts_url
    assert_response :success
  end

  test "should get new" do
    get new_scraping_text_url
    assert_response :success
  end

  test "should create scraping_text" do
    assert_difference('ScrapingText.count') do
      post scraping_texts_url, params: { scraping_text: { body: @scraping_text.body, scraping_page_id: @scraping_text.scraping_page_id } }
    end

    assert_redirected_to scraping_text_url(ScrapingText.last)
  end

  test "should show scraping_text" do
    get scraping_text_url(@scraping_text)
    assert_response :success
  end

  test "should get edit" do
    get edit_scraping_text_url(@scraping_text)
    assert_response :success
  end

  test "should update scraping_text" do
    patch scraping_text_url(@scraping_text), params: { scraping_text: { body: @scraping_text.body, scraping_page_id: @scraping_text.scraping_page_id } }
    assert_redirected_to scraping_text_url(@scraping_text)
  end

  test "should destroy scraping_text" do
    assert_difference('ScrapingText.count', -1) do
      delete scraping_text_url(@scraping_text)
    end

    assert_redirected_to scraping_texts_url
  end
end
