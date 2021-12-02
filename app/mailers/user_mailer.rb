class UserMailer < ActionMailer::Base
  default :from => "noreply@mydomain.com"

  def registration_confirmation(user)
    @user = user
    mail(:to => "#{user.username} <#{user.email}>", :subject => "Please confirm your registration", cc: "artiman224@gmail.com")
  end
  def stat_conf(user)
    @user = user
    mail(:to => "#{user.username} <#{user.email}>", :subject => "Statistics for this week",cc: "artiman224@gmail.com")
  end

end
