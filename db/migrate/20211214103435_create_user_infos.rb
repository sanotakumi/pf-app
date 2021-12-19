class CreateUserInfos < ActiveRecord::Migration[5.2]
  def change
    create_table :user_infos do |t|
      t.integer :user_id
      t.integer :age
      t.float :hight
      t.float :wight
      t.float :bmi
      t.date :day

      t.timestamps
    end
  end
end
