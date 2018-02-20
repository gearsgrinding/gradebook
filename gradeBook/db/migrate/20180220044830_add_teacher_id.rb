class AddTeacherId < ActiveRecord::Migration
  def change
  	add_reference :courses, :teacher, index: true
  	add_column :courses, :average_grade, :float, default: 0.0
  end
end
