class NytBestSellingController < ApplicationController
def index
  @authors = Author.all
  @nyt_fiction = Nytapi.get_fiction_info
  @nyt_nonfiction = Nytapi.get_nonfiction_info

  @fictiontitles = @nyt_fiction["results"].map do |x|
    x["book_details"][0]["title"]
  end
  @nonfictiontitles = @nyt_nonfiction["results"].map do |x|
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

  @coverarray= ["http://books.google.com/books/content?id=Vu5MDwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=none&source=gbs_api", "http://books.google.com/books/content?id=M2__BgAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=none&source=gbs_api", "http://books.google.com/books/content?id=q_zWDgAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=none&source=gbs_api", "http://books.google.com/books/content?id=7jBADwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=none&source=gbs_api", "http://books.google.com/books/content?id=hx5DDQAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=none&source=gbs_api", "http://books.google.com/books/content?id=9vBLDwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=none&source=gbs_api", "http://books.google.com/books/content?id=d_nENw_XPdMC&printsec=frontcover&img=1&zoom=1&edge=none&source=gbs_api", "http://books.google.com/books/content?id=UccvDwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=none&source=gbs_api", "http://books.google.com/books/content?id=dJ4_DwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=none&source=gbs_api", "http://books.google.com/books/content?id=JNdFDwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=none&source=gbs_api", "http://books.google.com/books/content?id=aSZHDwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=none&source=gbs_api", "http://books.google.com/books/content?id=F8hdDwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=none&source=gbs_api", "http://books.google.com/books/content?id=o9EzDwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=none&source=gbs_api", "http://books.google.com/books/content?id=Qr1BDwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=none&source=gbs_api", "http://books.google.com/books/content?id=GKMrDwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=none&source=gbs_api"]
  end

  def show

    if params[:name].present?
      @nameparams = params[:title]

      @authorparams = params[:name]
      @descriptionparams = params[:description]
      @ratingparams = params[:book_review_link]
      @publisherparams = params[:publisher]
      @imageparams = params[:image]

    end
    @book = GoogleBooks.search(@nameparams, {:count => 1, :api_key => 'AIzaSyCvHRg928eqZSfqLNbIK5VjTODyM1ewTIQ' })
    @book2 = @book.first
  end

  def create
    book_title = params[:title]

    @book = GoogleBooks.search(book_title, {:count => 1, :api_key => 'AIzaSyCvHRg928eqZSfqLNbIK5VjTODyM1ewTIQ' })
    @book2 = @book.first
    local_author = Author.where(name: @book2.authors)
    author = Author.new
    author.name = @book2.authors
    author.save
    local_author_id = author.id
    newbook = Book.new
    newbook.title = @book2.title
    newbook.description = @book2.description
    newbook.author_id = local_author_id
    newbook.save
    redirect_to author
  end


  def new

  end

  private
  def nyt_best_selling_params
    params.require(:nyt_best_selling).permit(:title, :image, :year, :plot)
  end

end
