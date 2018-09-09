require 'test_helper'

class ScrapedCodesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @scraped_code = scraped_codes(:one)
  end

  test "should get index" do
    get scraped_codes_url
    assert_response :success
  end

  test "should get new" do
    get new_scraped_codes_url(@scraped_code.scraping_page_id)
    assert_response :success
  end

  test "should create scraped_code" do
    assert_difference('ScrapedCode.count') do
      post scraped_codes_url, params: { scraped_code: { html: @scraped_code.html, scraping_page_id: @scraped_code.scraping_page_id, text: @scraped_code.text } }
    end

    assert_redirected_to scraped_code_url(ScrapedCode.last)
  end

  test "should show scraped_code" do
    get scraped_code_url(@scraped_code)
    assert_response :success
  end

  test "should get edit" do
    get edit_scraped_code_url(@scraped_code)
    assert_response :success
  end

  test "should update scraped_code" do
    patch scraped_code_url(@scraped_code), params: { scraped_code: { html: @scraped_code.html, scraping_page_id: @scraped_code.scraping_page_id, text: @scraped_code.text } }
    assert_redirected_to scraped_code_url(@scraped_code)
  end

  test "should destroy scraped_code" do
    assert_difference('ScrapedCode.count', -1) do
      delete scraped_code_url(@scraped_code)
    end

    assert_redirected_to scraped_codes_url
  end
end
