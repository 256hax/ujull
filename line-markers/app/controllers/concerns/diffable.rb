module Diffable
  extend ActiveSupport::Concern

  def trimming_for_diff_text(code)
    # gsub(/^\s*$/, '') means remove empty lines
    code.strip.gsub(/^\s*$/, '')
  end
end
