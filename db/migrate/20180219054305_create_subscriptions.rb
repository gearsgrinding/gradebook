class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|

    	t.integer :user_id
      t.index :user_id
      t.integer :course_id
      t.index :course_id
      t.float :grade

      t.timestamps
    end
  end
end
