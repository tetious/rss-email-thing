require 'json'
require './rss2email.rb'

def get_feed_output(url)
    feed = RSS::Parser.parse(url)
    articles = feed.items.map { |o| Article.new(o) }
    DigestView.new(articles).render
end

def lambda_handler(event:, context:)
    { 
      statusCode: 200, 
      floridaCalendar: get_feed_output('https://insuranceagencybuilder.com/events/feed/'),
      iabArticles: get_feed_output('https://insuranceagencybuilder.com/feed/')
    }
end
