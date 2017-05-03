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

    @book.books_for_classes[0].quantity = params[:book][:books_for_classes][:quantity]
    # success message, will eventually remove

    # DEBUG
    # raise

    # check if rails can save the book based on the given params
    # TODO: add validations to the book and meida models
    if @book.valid? && @book.save
      flash[:success] = "Successfully added #{@book.title}!"
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
    @teacher = Teacher.find_by_email(session[:email])
    @book = Book.find(params[:id])
    @book.quantity = @book.books_for_classes[0].quantity

    unless @book.media.exists?
      @book.media.build
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update_attributes(book_params)
      if params[:book][:books_for_classes][:quantity]!= 0 \
        && params[:book][:books_for_classes][:quantity] != @book.books_for_classes[0].quantity
        #this is still not working
        @book.books_for_classes[0].quantity = params[:book][:books_for_classes][:quantity]
      end
      flash[:success] = "Succesfully updated #{@book.title}!"
    else
      flash[:fail] = "Unable to update #{@book.title}: #{@book.errors.pretty_print_inspect}"
    end
    redirect_to('/index')
  end

  def destroy
    book = Book.find(params[:id])
    if book.destroy
      flash[:success] = "#{book.title} successfully deleted"
    else
      flash[:fail] = "Unable to delete #{book.title}, try again"
    end
    redirect_back('/')
  end

  private
    def book_params
      params.require(:book).permit(
        :title, :author, :edition, :isbn, media_attributes: [:name, :author, :edition, :isbn, :website]
      )
    end
end
