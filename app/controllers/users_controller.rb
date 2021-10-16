class UsersController < ApplicationController
  
  def index
    @user = User.all
    @userinfo = current_user
    @booknew = Book.new
  end
  
  def show
    @user = User.find(params[:id])
    @books = @user.books
    @userinfo = User.find(params[:id])
    @booknew = Book.new
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end
  
  def create
    @booknew = Book.new(book_params)
    @booknew.user_id = current_user.id
    @booknew.save
    redirect_to book_path(@booknew.id)
  end
    private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
  def book_params
    params.require(:book).permit(:title,:body)
  end

end