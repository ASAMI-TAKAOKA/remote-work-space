class AddDetailsToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :body, :string
    add_column :posts, :address, :string
    add_column :posts, :lat, :float
    add_column :posts, :lng, :float
  end
end
