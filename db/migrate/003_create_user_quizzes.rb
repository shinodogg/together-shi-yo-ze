class CreateUserQuizzes < ActiveRecord::Migration
  def self.up
    create_table "user_quizzes", :force => true do |t|
      t.column :user_id,                   :integer
      t.column :quiz_id,                   :integer
      t.column :result,                    :boolean
    end
  end

  def self.down
    drop_table "user_quizzes"
  end
end
