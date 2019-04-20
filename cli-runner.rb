require './rss2email.rb'

feeds = [
  'https://insuranceagencybuilder.com/events/feed/',
  'https://insuranceagencybuilder.com/feed/'
]

puts "Type 0 for Florida Calendar feed or 1 for IAB Article feed"
option = gets.chomp

feed = RSS::Parser.parse(feeds[option.to_i])

articles = feed.items.map { |o| Article.new(o) } #.select { |a| a.category_names.include?("How To") }
printf DigestView.new(articles).render