require 'test_helper'

class DiffCodesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @scraped_code = scraped_codes(:one)
    @scraped_code_two = scraped_codes(:two)
    @diff_code = diff_codes(:one)
  end

  test "should get index" do
    get diff_codes_url
    assert_response :success
  end

  test "should get new" do
    get new_diff_codes_url(@scraped_code_two.id)
    assert_response :success
  end

  # test "should create diff_code" do
  #   assert_difference('DiffCode.count') do
  #     post diff_codes_url, params: { diff_code: { html: @diff_code.html, scraped_code_created_at: @diff_code.scraped_code_created_at, scraped_code_id: @diff_code.scraped_code_id, scraping_html_element_id: @diff_code.scraping_html_element_id, text: @diff_code.text } }
  #   end
  #
  #   assert_redirected_to diff_codes_url(DiffCode.last)
  # end

  test "should show diff_code" do
    get diff_codes_url(@diff_code)
    assert_response :success
  end

  test "should get edit" do
    get edit_diff_code_url(@diff_code)
    assert_response :success
  end

  # test "should update diff_code" do
  #   patch diff_codes_url(@diff_code), params: { diff_code: { html: @diff_code.html, scraped_code_created_at: @diff_code.scraped_code_created_at, scraped_code_id: @diff_code.scraped_code_id, scraping_html_element_id: @diff_code.scraping_html_element_id, text: @diff_code.text } }
  #
  #   assert_redirected_to diff_codes_url(@diff_code)
  # end

  test "should destroy diff_code" do
    assert_difference('DiffCode.count', -1) do
      delete diff_code_url(@diff_code)
    end

    assert_redirected_to diff_codes_url
  end
end
