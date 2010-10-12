class UserQuizzesController < ApplicationController
  include AuthenticatedSystem
  before_filter :login_required

  def list
    #@user_quiz_pages, @user_quizzes = 
    @user_quizzes = 
        UserQuiz.paginate(:page => params[:page], 
               :per_page => 10, 
               :order => 'id desc', 
               :conditions => "user_id = " + current_user[:id].to_s)
    @user_quizzes_counts = UserQuiz.count(:conditions => "user_id = " + current_user[:id].to_s)
    @user_quizzes_true_counts = UserQuiz.count(:conditions => "user_id = " + current_user[:id].to_s + " AND Result = 't'")
    @user_quizzes_false_counts = UserQuiz.count(:conditions => "user_id = " + current_user[:id].to_s + " AND Result = 'f'")
  end

end
