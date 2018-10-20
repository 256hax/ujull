module FileSavable
  extend ActiveSupport::Concern


  def create_directory(url)
    uri = URI.parse(url) # => "https://example.com/?list.html&category=1"

    uri_first_char = uri.host[0, 1] # => e
    uri_host = uri.host.gsub(/\/|\.\./, '_') # for security
    directory_path = "scraped_html/#{uri_first_char}/#{uri_host}"
    directory_full_path = "#{Rails.public_path}/scraped_html/#{uri_first_char}/#{uri_host}" # for security, starting directory path must be public path

    Dir.mkdir(directory_full_path) unless ( FileTest.exist?(directory_full_path) )
    directory_path # return: directory_path. ex) => "scraped_html/e/example.com"
  end

  def get_file_name(id)
    "#{id}.html" # Scraping need ".html"
  end

  #--- Save file under public directory ---#
  # args: body: HTML page, charset: encode (ex: Shift_JIS)
  def save_html(directory_path, file_name, body, charset)
    # Starting directory path must public path(Rails.public_path) for security
    public_and_under_directory_path = "#{Rails.public_path}/#{directory_path}"
    directory_full_path = "#{Rails.public_path}/#{directory_path}/#{file_name}"

    if FileTest.exist?(public_and_under_directory_path)
      body.force_encoding(charset) if charset # For 2 byte chars.
      File.open(directory_full_path, "w") do |f|
        f.puts( body.gsub(/\r\n|\r|\n|\t/, '') ) # Get response data with deleted empty lines).
      end
    end
  end
end
