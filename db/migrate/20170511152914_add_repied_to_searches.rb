class AddRepiedToSearches < ActiveRecord::Migration[5.0]
  def change
    add_column :searches, :replied, :boolean
  end
end
