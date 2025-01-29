class Api::V1::BooksController < ApplicationController
  before_action :find_book, only: %i[show destroy update]
  def create
    outcome = Books::Create.run(params)
    render_resource_errors(outcome) if outcome.errors.present?
    render json: { 'success' => true,
                   'result': BookBlueprint.render(outcome.result, view: :base) },
           status: :created
  end

  def show
    render json: { 'success' => true,
                   'result': BookBlueprint.render(@book, view: :base) },
           status: :ok
  end

  def index
  end

  def update
  end

  def destroy
  end

  private

  def find_book
    outcome = Books::FindBook.run(params)
    render_resource_errors(outcome) if outcome.errors.present?

    @book = outcome.result
  end
end
