class BooksController < ApplicationController
  before_action :set_book, only: %i[ show edit update destroy ]

  # GET /books or /books.json
  def index

    @q = Book.ransack(params[:q])
    @books = @q.result(distinct: true)
    if params[:q] && params[:q][:genre_cont].present? 
      excluded_word = 'nonfiction'
      @books = @books.where.not(Book.arel_table[:genre].matches("%#{excluded_word}%"))
    end
    @breadcrumbs = [
      {content: "Books", href: books_path}
      
    ]
  end

  # GET /books/1 or /books/1.json
  def show
    @breadcrumbs = [
      {content: "book", href: books_path},
      {content: @book.to_s, href: books_path(@title)},
    ]
    @q = Comment.ransack(params[:q])
    @results = @q.result.includes(:user_id, :commentable_id)
  end

  # GET /books/new
  def new
    @book = Book.new
  end

  # GET /books/1/edit
  def edit
  end

  # POST /books or /books.json
  def create
    @book = current_user.books.new(book_params)

    respond_to do |format|
      if @book.save
        format.html { redirect_to book_url(@book), notice: "Book was successfully created." }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /books/1 or /books/1.json
  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to book_url(@book), notice: "Book was successfully updated." }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1 or /books/1.json
  def destroy
    @book.destroy

    respond_to do |format|
      format.html { redirect_to books_url, notice: "Book was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def book_params
      params.require(:book).permit(:title, :author, :summary, :genre, :publish_date, :photo)
    end
end
