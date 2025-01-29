class Books::Create < ActiveInteraction::Base
  string :title, :author, :published_year

  def execute
    book = Book.new(inputs.to_h.compact)
    return errors.merge!(book.errors) unless book.save

    book
  end
end
