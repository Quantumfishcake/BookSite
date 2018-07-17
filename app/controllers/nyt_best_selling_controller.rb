class NytBestSellingController < ApplicationController
def index
@nyt_fiction = Nytapi.get_fiction_info
@nyt_nonfiction = Nytapi.get_nonfiction_info
end
end
