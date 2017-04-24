class BooksController < ApplicationController
  layout false

  def new
    @book = Book.new
    # create a blank media object within the book object
    # this is so we can display the fields for media related to the book
    @book.media.build

    # allows for us to add the quantity, does not yet save any associations
    # @book.books_for_classes.build
  end

  def create
    # create the book object
    @book = Book.new(book_params)
    # Associate the book with the course id passed in the URL
    @book.courses << Course.find(params[:course_id])

    # @book.books_for_classes.destroy_all
    # @book.books_for_classes << BooksForClass.new(
    #     {course_id: @book.courses[0].id, book_id: @book.id,
    #      quantity: params[:book][:books_for_classes][:quantity] })
    # @book.books_for_classes.collect {|c| c.quantity = params[:quantity]}

    @book.books_for_classes[0].quantity = params[:book][:books_for_classes][:quantity]
    # success message, will eventually remove
    flash[:success] = "New book: #{@book.pretty_print_inspect}"

    # DEBUG
    # raise

    # check if rails can save the book based on the given params
    # TODO: add validations to the book and meida models
    if @book.valid? && @book.save
      redirect_back(fallback_location: '/index')
    else
      if @book.invalid?
        flash[:fail] = "Unable to create book: #{@book.errors.full_messages}"
        raise "error"
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
         #books_for_classes_attributes: [:quantity],
         media_attributes: [:name, :author, :edition, :isbn, :website])
    end
end
