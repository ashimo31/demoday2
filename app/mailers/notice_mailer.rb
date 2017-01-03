class NoticeMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notice_mailer.sendmail_task.subject
  #
  def sendmail_task(task)
    @task = task
    @greeting = "Hi"

    mail to: "nobuom@gmail.com",
      subject: '【Agribook】リクエストが投稿されました'
  end
end
