class AddDdiffDateToArticle < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :ddiff_date, :string
  end
end
