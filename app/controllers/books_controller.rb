class BooksController < ApplicationController

    def create
        @book = Book.new(params)
        @book.user_id = current_user.id
        @book.save
      
    end

    def index
        @books =  Book.all
        @book = Book.new
       
    end

    def show
        @book = Book.find(params[:id])
    end

    def edit
    end

    def destroy
    end


    private

    def books_params
        params.require(:book).permit(:title,:body)
    end
end
