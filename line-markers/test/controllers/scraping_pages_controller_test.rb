require 'test_helper'

class ScrapingPagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @scraping_page = scraping_pages(:one)
  end

  test "should get index" do
    get scraping_pages_url
    assert_response :success
  end

  test "should get new" do
    get new_scraping_page_url
    assert_response :success
  end

  test "should create scraping_page" do
    assert_difference('ScrapingPage.count') do
      post scraping_pages_url, params: { scraping_page: { active: @scraping_page.active, page_url: @scraping_page.page_url, scraping_frequency: @scraping_page.scraping_frequency, target_element: @scraping_page.target_element } }
    end

    assert_redirected_to scraping_page_url(ScrapingPage.last)
  end

  test "should show scraping_page" do
    get scraping_page_url(@scraping_page)
    assert_response :success
  end

  test "should get edit" do
    get edit_scraping_page_url(@scraping_page)
    assert_response :success
  end

  test "should update scraping_page" do
    patch scraping_page_url(@scraping_page), params: { scraping_page: { active: @scraping_page.active, page_url: @scraping_page.page_url, scraping_frequency: @scraping_page.scraping_frequency, target_element: @scraping_page.target_element } }
    assert_redirected_to scraping_page_url(@scraping_page)
  end

  test "should destroy scraping_page" do
    assert_difference('ScrapingPage.count', -1) do
      delete scraping_page_url(@scraping_page)
    end

    assert_redirected_to scraping_pages_url
  end
end
