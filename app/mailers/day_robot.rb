class DayRobot < ActionMailer::Base
  default :from => "bot@dayrobot.org"
  
  def welcome_email(user)
  	@user = user
  	@url = "http://dayrobot.heroku.com/login"
  	mail(:to => user.email, :subject => "welcome to dayrobot.")
  end
  
  def bot_email(user)
  	@user = user
  	@url = "http://dayrobot.heroku.com/login"
  	mail(:to => user.email, :subject => "welcome to dayrobot.")
  end
  
  
end
