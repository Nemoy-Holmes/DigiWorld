class CreateObjectNames < ActiveRecord::Migration[5.1]
  def change
    create_table :object_names do |t|

      t.timestamps
    end
  end
end
