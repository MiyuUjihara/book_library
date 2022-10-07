class NoticeMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notice_mailer.sendmail_confirm.subject
  #
  def sendmail_confirm(blog, entry, comment)
    @blog = blog
    @entry = entry
    @comment = comment
    mail(
      subject: "新しいコメントが投稿されました。",
      to: "admin@example.com"
    )
  end

  def notice_comment(blog, entry, comment)
    @blog = blog
    @entry = entry
    @comment = comment
    mail(
      subject: "新しいコメントが投稿されました。",
      to: "admin@example.com"
    )
  end
end
