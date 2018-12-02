require 'test_helper'

class ScrapingPages::HtmlsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @scraping_page = scraping_pages(:one)
  end

  test "should get create" do
    post scraping_pages_create_htmls_url(@scraping_page.id)
    assert_response :success
  end

end
