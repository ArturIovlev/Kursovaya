class ProgramsController < ApplicationController
  include SessionHelper
  def selection
    tr_weigh=0
    @best_id=nil
    User.all.each do |user|
      if (user.weight_change != 0) && (user.current_mass != 0) && (user.allow_the_publication == true)
        if (user.weight_change != nil) && (user.current_mass != nil)
          if user.weight_change > tr_weigh then
            @best_id = user
            tr_atti = user.weight_change
          end
        end
      end
    end

    @user ||= User.find_by(id: cookies.signed[:user_id])
    if @user.current_mass.nil? then
       @user.current_mass='0'
       @user.save!
     end
    if (@user.training_id?) then
      result = Training.find_by(id: @user.training_id)
      @test1 = result.prog
      @test2 = result.prog1
      @test3 = result.prog2
      @test4 = result.prog3
      @test5 = result.prog4
      @test6 = result.prog5
      @test7 = result.prog6
    end
  end

  def mail_stat
    @user ||= User.find_by(id: cookies.signed[:user_id])
    UserMailer.stat_conf(@user).deliver
    redirect_to state_url
  end

  def weight
    @user ||= User.find_by(id: cookies.signed[:user_id])
    if params[:chang] != @user.weight_change && params[:callor] != @user.calories then
      @user.date_of_update = Date.today
    end
      @user.date_of_update = Date.today
      @user.weight_change = params[:chang]
      @user.calories = params[:callor]
      @user.num_of_trainings= Training.find_by(id: @user.training_id).times_week+@user.num_of_trainings-@user.num_of_passes
      result = @user.current_mass-@user.weight_change
      @user.current_mass=@user.weight_change
      @user.weight_change = result
      @user.save!
      result = @user.current_mass-@user.weight_change
    redirect_to state_url
  end

  def sustain
    @user ||= User.find_by(id: cookies.signed[:user_id])
    if params[:skip] == "true" then
      @bool = true
    else
      @bool = false
    end
    if @user.date_of_change.nil? then
      @user.date_of_change=0
      @user.save!
    end
    if (@user.date_of_change == Date.today)&&(@user.skip != @bool) then
      @user.skip = @bool
      if (@user.skip == true) then
        @user.num_of_passes=@user.num_of_passes+1
      else
        @user.num_of_passes=@user.num_of_passes-1
      end
    end
    if @user.num_of_passes.nil? then
      @user.num_of_passes=0
    end
    if (@user.date_of_change != Date.today) then
      @user.date_of_change = Date.today
      @user.skip = @bool
      if @bool == true then
        @user.num_of_passes += 1
      end
    end
  @user.save!
  redirect_to home_path
  end

  def training
    all_tr=[]
    tp=params[:tp]
    style=params[:style]
    @cal=params[:cal]
    @cal2=params[:tp]
    Training.all.each do |program|
      if program.style==style && program.type_of_prog==tp
        all_tr<<[program.id,program.name,program.prog]
      end
    end
  @result = all_tr
  end

  def show
    @user ||= User.find_by(id: cookies.signed[:user_id])
    @user.training_id = params[:training_id]
    @user.calories = params[:calories]
    if @user.first_training.nil? then
      @user.first_training = Date.today
    end
    @user.save!
    @result =  @user.training_id
  end

  def state
    @user ||= User.find_by(id: cookies.signed[:user_id])
    @user.date_of_update = nil
    @current_mass=@user.current_mass
    @pass_mass=@user.current_mass+@user.weight_change
    @first_training=@user.first_training
    @calories=@user.calories
    @dif=@user.weight_change
    @num_of_trainings=@user.num_of_trainings
    @num_of_passes=@user.num_of_passes
  end

end
