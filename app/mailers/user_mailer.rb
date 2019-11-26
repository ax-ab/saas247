class UserMailer < ApplicationMailer
  def usage
    @user = params[:user] # Instance variable => available in view
    mail(to: @user.email, subject: 'Let us know your license usage')
    # This will render a view in `app/views/user_mailer`!
  end
end
