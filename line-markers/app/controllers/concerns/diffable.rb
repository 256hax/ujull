module Diffable
  extend ActiveSupport::Concern

  # args: scraped_two_latest_codes, retrun: @diff_code obj
  def diff_latest(scraped_code)
    first_latest_html = scraped_code[1].html
    second_latest_html = scraped_code[0].html
    @diff_code.html = Diffy::Diff.new(second_latest_html, first_latest_html).to_s(:html_simple)

    first_latest_text = trimming_for_diff_text(scraped_code[1].text)
    second_latest_text = trimming_for_diff_text(scraped_code[0].text)
    @diff_code.text = Diffy::Diff.new(second_latest_text, first_latest_text).to_s(:html_simple)

    @diff_code.scraping_page_id = scraped_code[1].scraping_page_id
    @diff_code.scraped_code_id = scraped_code[1].id
    @diff_code.scraped_code_created_at = scraped_code[1].created_at
  end

  private

  # make it easy to see for diff
  def trimming_for_diff_text(code)
    # gsub(/^\s*$/, '') means remove empty lines
    code.strip.gsub(/^\s*$/, '')
  end
end
