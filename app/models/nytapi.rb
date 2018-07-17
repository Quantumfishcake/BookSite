class Nytapi < ApplicationRecord
  def self.get_fiction_info
    require "open-uri"
    apod = "https://api.nytimes.com/svc/books/v3/lists.json?list-name=hardcover-fiction&api-key=d9c2b6550bd744238172ada8a8753fcf"
    request = JSON.parse(open(URI(apod)).read)
end
def self.get_nonfiction_info
  require "open-uri"
  apod = "https://api.nytimes.com/svc/books/v3/lists.json?list-name=hardcover-nonfiction&api-key=d9c2b6550bd744238172ada8a8753fcf"
  request = JSON.parse(open(URI(apod)).read)
end
end
