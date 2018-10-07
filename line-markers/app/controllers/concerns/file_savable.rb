module FileSavable
  extend ActiveSupport::Concern

  def create_directory(url)
    uri = URI.parse(url) # => https://example.com/./../list.html?category=1

    uri_first_char = uri.host[0, 1] # => e
    uri_host = uri.host.gsub(/\/|\.\./, '_') # for security
    dir_path = "#{Rails.public_path}/scraped_html/#{uri_first_char}/#{uri_host}"

    Dir.mkdir(dir_path) unless ( FileTest.exist?(dir_path) )
    dir_path
  end

  def get_file_name(url)
    uri = URI.parse(url) # uri => https://example.com/./../list.html?category=1
    uri_sanitize = uri.path.gsub(/\/|\.\./, '_') # replace "slash" and "double dots" to "underscore"
    uri_query = "?#{uri.query}" if(uri.query)
    file_name = "#{uri_sanitize}#{uri_query}.txt" # => "_.___list.html?category=1.txt"
  end

  def save_html(dir_path, file_name, request)
    if FileTest.exist?(dir_path)
      dir_full_path = "#{dir_path}/#{file_name}"

      File.open(dir_full_path, "w") do |f|
        request.response.body.force_encoding("utf-8") # for 2 byte char
        f.puts( request.response.body.gsub(/\r\n|\r|\n|\t/, '') ) #get response data with deleted empty lines)
      end
    end
  end
end
