require 'test_helper'

class ScrapingPages::HtmlsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get scraping_pages_htmls_create_url
    assert_response :success
  end

end
