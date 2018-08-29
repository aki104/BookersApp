class BooksController < ApplicationController


  def create
  	@book = Book.new(post_params)
  	@book.user_id = current_user.id
  	if @book.save
      flash[:success] = 'Book was successfully created..'
      redirect_to book_path(@book)
    else 
      @user = User.find(current_user.id)
      @books = Book.all
      render :index
    end
  end


  def index
    @book = Book.new
    @books = Book.all.order(created_at: :desc)
    @user = User.find(current_user.id)
    # @bookf = Book.find(params[:id])
    # @users = User.all.order(created_at: :desc)
  end

  def edit
   @book = Book.find(params[:id])
   if @book.user.id != current_user.id
     redirect_to users_path(@book.id)

   end
  end

  def update
    book = Book.find(params[:id])
    if book.update(post_params)
      flash[:success] = 'Book was successfully update..'
    end
    redirect_to book_path(book)
  end


  def show
    @bookf = Book.find(params[:id])
    @book = Book.new
    @user = @bookf.user
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

 private

 def post_params
 	params.require(:book).permit(:title, :opinion)
 end

end
