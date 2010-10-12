class Quiz < ActiveRecord::Base
validates_presence_of     :question, :answer_a, :answer_b, :answer_c, :answer_d, :answer, :user_id
validates_length_of       :answer_a, :within => 1..40
validates_length_of       :answer_b, :within => 1..40
validates_length_of       :answer_c, :within => 1..40
validates_length_of       :answer_d, :within => 1..40
end
