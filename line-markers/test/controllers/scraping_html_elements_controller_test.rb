require 'test_helper'

class ScrapingHtmlElementsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @scraping_html_element = scraping_html_elements(:one)
  end

  test "should get index" do
    get scraping_html_elements_url
    assert_response :success
  end

  test "should get new" do
    get new_scraping_html_element_url(@scraping_html_element.scraping_page_id)
    assert_response :success
  end

  test "should create scraping_html_element" do
    assert_difference('ScrapingHtmlElement.count') do
      post scraping_html_elements_url, params: { scraping_html_element: { scraping_page_id: @scraping_html_element.scraping_page_id, target_element: @scraping_html_element.target_element } }
    end

    assert_redirected_to scraping_html_element_url(ScrapingHtmlElement.last)
  end

  test "should show scraping_html_element" do
    get scraping_html_element_url(@scraping_html_element)
    assert_response :success
  end

  test "should get edit" do
    get edit_scraping_html_element_url(@scraping_html_element)
    assert_response :success
  end

  test "should update scraping_html_element" do
    patch scraping_html_element_url(@scraping_html_element), params: { scraping_html_element: { scraping_page_id: @scraping_html_element.scraping_page_id, target_element: @scraping_html_element.target_element } }
    assert_redirected_to scraping_html_element_url(@scraping_html_element)
  end

  test "should destroy scraping_html_element" do
    assert_difference('ScrapingHtmlElement.count', -1) do
      delete scraping_html_element_url(@scraping_html_element)
    end

    assert_redirected_to scraping_html_elements_url
  end
end
