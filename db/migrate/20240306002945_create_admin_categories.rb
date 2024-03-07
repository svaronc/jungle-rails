class CreateAdminCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :admin_categories do |t|

      t.timestamps
    end
  end
end
