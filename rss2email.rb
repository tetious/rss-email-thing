require 'rss'
require 'delegate'
require 'erb'

class Article < SimpleDelegator
  def category_names
    categories.map &:content
  end
end

class DigestView
  attr_accessor :articles

  def initialize(articles)
    @articles = articles
  end

  def render
    ERB.new(template, 0, '>').result(binding)
  end

  def template
%{<p style="font-size:9pt"><span style="font-size:9pt !important;">
<% for article in @articles %>
  * <a style="font-size:9pt" href="<%= article.link %>"> <%= article.title %> on <%= article.pubDate.strftime("%A, %B %d, %Y") %> </a> <br/>
<% end %>
</p>
<% for article in @articles %>
    <h3><a href="<%= article.link %>"> <%= article.title %> </a></h3>
    <span style="font-style: italic;"><%= article.pubDate.strftime("%A, %B %d, %Y") %></span>
</span>
<br/>
    <%= article.description %>
<% end %>}
  end
end