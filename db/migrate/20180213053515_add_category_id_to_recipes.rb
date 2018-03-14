class AddCategoryIdToRecipes < ActiveRecord::Migration
  def change
    add_reference :recipes, :category, index: true, foreign_key: true
  end
end
