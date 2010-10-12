class CreateQuizzes < ActiveRecord::Migration
  def self.up
    create_table "quizzes", :force => true do |t|
      t.column :question,                  :text
      t.column :answer_a,                  :string
      t.column :answer_b,                  :string
      t.column :answer_c,                  :string
      t.column :answer_d,                  :string
      t.column :answer,                    :string, :limit => 1
    end
  end

  def self.down
    drop_table "quizzes"
  end
end
