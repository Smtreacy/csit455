class BooksController < ApplicationController
  layout false

  def new
    @book = Book.new
    # create a blank media object within the book object
    # this is so we can display the fields for media related to the book
    @book.media.build
  end

  def create
    # create the book object
    @book = Book.new(book_params)
    # Associate the book with the course id passed in the URL
    @book.courses << Course.find(params[:course_id])
    # success message, will eventually remove
    flash[:success] = "New book: #{@book.pretty_print_inspect}"

    # check if rails can save the book based on the given params
    # TODO: add validations to the book and meida models
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
