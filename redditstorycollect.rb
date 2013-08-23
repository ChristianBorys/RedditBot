require 'nokogiri'
require 'open-uri'

def reddit
	google = Nokogiri::HTML(open('http://www.reddit.com/r/worldnews/'))
	reddit_stories = hot_stories(google)
	reddit_stories
end

def hot_stories(parsed_web_page)
	stories = []
	5.times do |count|
		stories << parsed_web_page.css("p.title a.title")[count]["href"]
	end
	return stories
end

