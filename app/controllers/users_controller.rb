class UsersController < ApplicationController

  def index
  	@users = User.all
  	@book = Book.new
    @user = User.find(current_user.id)
  end

  def show
  @book = Book.new
  @user = User.find(params[:id])
  @books = @user.books.page(params[:page]).reverse_order
  end

  def edit
    @user = User.find(params[:id])
     if @user.id != current_user.id
     redirect_to users_path(@user.id)
   end
  end

  def new
  end

  def create
    book = Book.find(params[:id])
    book.save
    redirect_to books_path
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = 'successfully profiel update..'
    redirect_to user_path(@user.id)
    else
      render :edit
    end
    def top
      @user = User.find(current_user.id)
    end


    
  end

 private
 def user_params
 	params.require(:user).permit(:name, :profile_image, :introdaction)
 end


end


