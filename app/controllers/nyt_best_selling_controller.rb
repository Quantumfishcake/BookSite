class NytBestSellingController < ApplicationController
def index
  @authors = Author.all
  @nyt_fiction = Nytapi.get_fiction_info


  @fictiontitles = @nyt_fiction["results"].map do |x|
    x["book_details"][0]["title"]
  end

  # @coverarray = []
  # @nonfictioncovers = @nonfictiontitles.map do |x|
  #  book = GoogleBooks.search(x, {:count => 1, :api_key => 'AIzaSyCvHRg928eqZSfqLNbIK5VjTODyM1ewTIQ' })
  #  @coverarray.push(book.first.image_link)
  # end

  # @fictioncovers= @fictiontitles.map do |x|
  #  book = GoogleBooks.search(x, {:count => 1, :api_key => 'AIzaSyCvHRg928eqZSfqLNbIK5VjTODyM1ewTIQ' })
  #  book.first.image_link
  # end

  @coverarray= ["http://books.google.com/books/content?id=Vu5MDwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=none&source=gbs_api", "http://books.google.com/books/content?id=M2__BgAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=none&source=gbs_api", "http://books.google.com/books/content?id=q_zWDgAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=none&source=gbs_api", "http://books.google.com/books/content?id=7jBADwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=none&source=gbs_api", "http://books.google.com/books/content?id=hx5DDQAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=none&source=gbs_api", "http://books.google.com/books/content?id=9vBLDwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=none&source=gbs_api", "http://books.google.com/books/content?id=d_nENw_XPdMC&printsec=frontcover&img=1&zoom=1&edge=none&source=gbs_api", "http://books.google.com/books/content?id=UccvDwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=none&source=gbs_api", "http://books.google.com/books/content?id=dJ4_DwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=none&source=gbs_api", "http://books.google.com/books/content?id=JNdFDwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=none&source=gbs_api", "http://books.google.com/books/content?id=aSZHDwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=none&source=gbs_api", "http://books.google.com/books/content?id=F8hdDwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=none&source=gbs_api", "http://books.google.com/books/content?id=o9EzDwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=none&source=gbs_api", "http://books.google.com/books/content?id=Qr1BDwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=none&source=gbs_api", "http://books.google.com/books/content?id=GKMrDwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=none&source=gbs_api", "http://books.google.com/books/content?id=GKMrDwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=none&source=gbs_api", "http://books.google.com/books/content?id=GKMrDwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=none&source=gbs_api", "http://books.google.com/books/content?id=GKMrDwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=none&source=gbs_api", "http://books.google.com/books/content?id=GKMrDwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=none&source=gbs_api", "http://books.google.com/books/content?id=GKMrDwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=none&source=gbs_api", "http://books.google.com/books/content?id=GKMrDwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=none&source=gbs_api",  "http://books.google.com/books/content?id=GKMrDwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=none&source=gbs_api"]
  end

  def show
    @books = Book.all
    @author = Author.all

      @nameparams = params[:title]
      @categoryparams = params[:categories]

      @authorparams = params[:name]
      @descriptionparams = params[:description]
      @ratingparams = params[:book_review_link]
      @publisherparams = params[:publisher]
      @imageparams = params[:image]


    @book = GoogleBooks.search(@nameparams, {:count => 1, :api_key => 'AIzaSyCvHRg928eqZSfqLNbIK5VjTODyM1ewTIQ' })
    @book2 = @book.first
  end

  def create
    book_title = params[:title]
    @book = GoogleBooks.search(book_title, {:count => 1, :api_key => 'AIzaSyCvHRg928eqZSfqLNbIK5VjTODyM1ewTIQ' })
    @book2 = @book.first
    temp_author = Author.where(name: @book2.authors)
    temp_book = Book.where(name: @book2.title)

    if temp_author.empty?
    author = Author.new
    author.name = @book2.authors

    author.save
    temp_author_id = author.id
    end
    temp_author_id = temp_author.first.id
    newbook = current_user.books.build
    newbook.title = @book2.title

    newbook.description = @book2.description
    newbook.author_id = temp_author_id
    newbook.image = @book2.image_link
    newbook.publisher = @book2.publisher
    newbook.rating = @book2.average_rating
    newbook.save
    redirect_to newbook

  end

  def search
    @books = Book.all
    details = params[:searchquery]
    author = Author.where(name: details)
    title = Book.where(title: details)

    if title.present?
title_id = title[0].id
      redirect_to "/books/#{title_id}"
    else

    @book = GoogleBooks.search(details, {:count => 5, :api_key => 'AIzaSyCvHRg928eqZSfqLNbIK5VjTODyM1ewTIQ' })

  end
end

def random
  @coverarray= []

  @book = GoogleBooks.search(@nameparams, {:count => 1, :api_key => 'AIzaSyCvHRg928eqZSfqLNbIK5VjTODyM1ewTIQ' })
  @random_year = rand(2010..2018)

  @authors = Author.all
  @nyt_fiction = Nytapi.get_random

  @nonfictiontitles = @nyt_fiction["results"].map do |x|
    x["book_details"][0]["title"]
  end

  @nonfictioncovers = @nonfictiontitles.take(2).map do |x|
   book = GoogleBooks.search(x, {:count => 1, :api_key => 'AIzaSyCvHRg928eqZSfqLNbIK5VjTODyM1ewTIQ' })
   @coverarray.push(book.first.image_link(:zoom => 2))


  end


  end





  def new

  end

  private
  def nyt_best_selling_params
    params.require(:nyt_best_selling).permit(:title)
  end

end
