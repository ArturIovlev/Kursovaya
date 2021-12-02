class StatisticMailer < ActionMailer::Base
  default :from => "lifeup.end.lifeup@gmail.com"

  def sending(user)
    @user = user
    mail(:to => "#{user.username} <#{user.email}>")
  end

end
