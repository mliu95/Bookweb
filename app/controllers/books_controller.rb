class BooksController < ApplicationController
  def about
  end

  def search
  end

  def index
    @book = Book.new
    @univ = params[:school_id]
    @search = params[:search]
    results = Book.search(@search, @univ)
    if params[:sort] == "high"
       @books = results.paginate(:page => params[:page], :per_page => 1, :order => "asking_price DESC")
    elsif params[:sort] == "asc"
       @books = results.paginate(:page => params[:page], :per_page => 1, :order => "asking_price ASC")
    elsif params[:sort] == "desc"
       @books = results.paginate(:page => params[:page], :per_page => 1, :order => "condition DESC")
    else
       @books = results.paginate(:page => params[:page], :per_page => 1, :order => "condition ASC")
    end
  
    #@books = Book.all
  end

  def create
    @book = Book.new(book_params)
    if @book.save!
      flash[:success] = "You have listed your textbook!"
      redirect_to root_path
    else
      redirect_to sell1_path
    end
  end

  def new
    @book = Book.new
    @isbn = params[:book][:isbn].gsub("-","")
    @google_book = GoogleBooks.search('isbn:' + @isbn)
    @first_book = @google_book.first
    if @first_book.nil? or @first_book.image_link(:zoom => 4).nil?
      flash[:error] = "No such book exists with ISBN " + @isbn
      redirect_to sell1_path
    end
  end

  def sell1
    @book = Book.new
    #render 'show'
  end

  def email_user
    UserMailer.email_user(params[:from], params[:to], params[:subject], params[:message]).deliver
    redirect_to :back
  end

  private
    def book_params
      params.require(:book).permit(:school_id, :isbn, :course, :title, :condition, :asking_price, :email, :img_url)
    end
end
