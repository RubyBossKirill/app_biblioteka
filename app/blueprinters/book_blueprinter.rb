class BookBlueprint < Blueprinter::Base
  identifier :id

  view :base do
    fields :title, :author, :published_year
  end

  view :extend do
    include_view :base
    fields :create_at, :updated_at, :id
  end
end
