class Books::FindBook < ActiveInteraction::Base
  string :id
  def execute
    book = Book.find_by(id:)
    return errors.add(:id, 'Book not found') unless book

    book
  end
end
