class UsersController < ApplicationController
    def create
        @book = Book.new(books_params)
        @book.user_id = current_user.id
        @book.save
        redirect_to book_path
    end

    def index
        @users = User.all
        @book = Book.new
        @user = current_user
    end

    def show
        @user = User.find(params[:id])
        @books = Book.all
    end

    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        if  @user.update(user_params)
            flash[:notice] = "successfully"
            redirect_to user_path(@user.id)
        else
            render :edit
        end
    end

    private

    def user_params
        params.require(:user).permit(:mame,:introduction,:profile_image)
    end
end
