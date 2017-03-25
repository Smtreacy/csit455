module BooksHelper
  # a helper class to add media to the book in the associated model structure
  def setup_book(book)
    # this adds a blank medium object to the book object
    # if one does not exist already (||=)
    book.media ||= Medium.new
    # return book with associated medium
    book
  end
end
