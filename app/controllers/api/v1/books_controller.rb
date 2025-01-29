class Api::V1::BooksController < ApplicationController
  def create
    outcome = Books::Create.run(params)
    render_resource_errors(outcome) if outcome.errors.present?
    render json: { 'success' => true,
                   'result': BookBlueprint.render(outcome.result, view: :base) },
           status: :created
  end

  def show
  end

  def index
  end

  def update
  end

  def destroy
  end
end
