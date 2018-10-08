module FileSavable
  extend ActiveSupport::Concern

  ### return: directory_path
  def create_directory(url)
    uri = URI.parse(url) # => "https://example.com/?list.html&category=1"

    uri_first_char = uri.host[0, 1] # => e
    uri_host = uri.host.gsub(/\/|\.\./, '_') # for security
    directory_path = "scraped_html/#{uri_first_char}/#{uri_host}"
    directory_full_path = "#{Rails.public_path}/scraped_html/#{uri_first_char}/#{uri_host}" # starting directory path must public path for security

    Dir.mkdir(directory_full_path) unless ( FileTest.exist?(directory_full_path) )
    directory_path # => "scraped_html/e/example.com"
  end

  def get_file_name(id)
    "#{id}.html" # scraping need ".html"
  end

  ### save file under public directory
  def save_html(directory_path, file_name, request)
    # starting directory path must public path(Rails.public_path) for security
    public_and_under_directory_path = "#{Rails.public_path}/#{directory_path}"
    directory_full_path = "#{Rails.public_path}/#{directory_path}/#{file_name}"

    if FileTest.exist?(public_and_under_directory_path)
      File.open(directory_full_path, "w") do |f|
        request.response.body.force_encoding("utf-8") # for 2 byte chars
        f.puts( request.response.body.gsub(/\r\n|\r|\n|\t/, '') ) # get response data with deleted empty lines)
      end
    end
  end
end
