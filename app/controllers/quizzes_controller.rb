class QuizzesController < ApplicationController
  include AuthenticatedSystem
  before_filter :login_required

  verify :method => :post, :only => [ :create ]
  
  def new
    @quiz = Quiz.new(:user_id => current_user[:id])
    @number_three_make_users = UserQuiz.find_by_sql(
        "select 
          u.login, 
          count(*) as cnt 
        from 
          quizzes q, 
          users u 
        where 
          u.id = q.user_id 
        group by 
          q.user_id, u.login  
        order by 
          cnt desc 
        limit 3"
        ) 
  end

  def create
    @quiz = Quiz.new(params[:quiz])
    if @quiz.save
      redirect_to :action => 'new'
      flash[:notice] = '問題が追加されました'
    else
      render :action => 'new'
    end
  end

end
