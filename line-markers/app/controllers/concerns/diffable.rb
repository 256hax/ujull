module Diffable
  extend ActiveSupport::Concern

  # args: DiffCode obj, retrun: @diff_code obj
  def diff_with_trimming(master_code, previous_code)
    unless previous_code == nil
      @diff_code.html = Diffy::Diff.new(previous_code.html, master_code.html).to_s(:html_simple)
      @diff_code.text = Diffy::Diff.new(previous_code.text, master_code.text).to_s(:html_simple)

      @diff_code.scraping_html_element_id = master_code.scraping_html_element_id
      @diff_code.scraped_code_id = master_code.id
      @diff_code.scraped_code_created_at = master_code.created_at
    end
  end

  private

  # make it easy to see for diff
  def trimming_for_diff_text(code)
    # gsub(/^\s*$/, '') means remove empty lines
    code.strip.gsub(/^\s*$/, '')
  end
end
