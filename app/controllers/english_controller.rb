class EnglishController < ApplicationController
  include AuthenticatedSystem
  before_filter :login_required
 
  def study
    @login = current_user[:login]
    @quiz = Quiz.find(:first, :order => 'RANDOM()')
    @quiz.answer = nil
    @number_three_score_users = UserQuiz.find_by_sql(
        "select 
          u.login, 
          count(*) as cnt 
        from 
          user_quizzes uq, 
          users u 
        where 
          uq.result = 't' AND 
          u.id = uq.user_id 
        group by 
          uq.user_id, u.login  
        order by 
          cnt desc 
        limit 3"
        ) 
  end

  def answer
    @login = current_user[:login]
    @quiz = Quiz.find(params[:quiz][:id])
    result = false
    result = true if params[:quiz][:answer] == @quiz.answer
    @user_quiz = UserQuiz.new(:user_id => current_user[:id], :quiz_id => params[:quiz][:id], :result => result)
    @user_quiz.save
  end
 
  def help
    render :action => 'help'
  end

  def revenge
    @login = current_user[:login]
    @quiz = Quiz.find(params[:id]);
    @number_three_score_users = UserQuiz.find_by_sql(
        "select 
          u.login, 
          count(*) as cnt 
        from 
          user_quizzes uq, 
          users u 
        where 
          uq.result = 't' AND 
          u.id = uq.user_id 
        group by 
          uq.user_id,u.login  
        order by 
          cnt desc 
        limit 3"
        )
     render :action => 'study'
  end
 
end
