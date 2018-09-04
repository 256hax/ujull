require 'mechanize'

agent = Mechanize.new
page = agent.get("http://qiita.com")
elements = page.search('title')
puts elements
