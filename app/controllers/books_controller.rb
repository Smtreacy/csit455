class BooksController < ApplicationController
  layout false

  def new
    @book = Book.new
    @book.media.build
  end

  def create
    @book = Book.new(book_params)
    @book.courses << Course.find(params[:course_id])
    flash[:success] = "New book: #{@book.pretty_print_inspect}"

    if @book.valid? && @book.save
      redirect_back(fallback_location: '/index')
    else
      if @book.invalid?
        flash[:fail] = "Unable to create book: #{@book.errors.full_messages}"
      else
        flash[:fail] = "Unable to create course for unknown reason. Try again!"
      end
      redirect_back(fallback_location: '/index')
    end
  end

  def edit

  end

  def delete

  end

  private
    def book_params
      params.require(:book).permit(:title, :author, :edition, :isbn,
        media_attributes: [:name, :author, :edition, :isbn, :website])
    end
end
