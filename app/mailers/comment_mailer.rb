class CommentMailer < ApplicationMailer
  def send_when_admin_reply(user, comment) #メソッドに対して引数を設定
    @user = user #ユーザー情報
    @answer = comment.reply_text #返信内容
    mail to: user.email, subject: 'mailテスト'
  end
  
  def sendmail_confirm
    @greeting = "Hi"

    mail to: "to@example.org"
  end

  def notice_comment blog, entry, comment
    mail(
      subject: "新しいコメントが投稿されました。",
      to: "admin@example.com"
    ) do |format|
      format.text
    end
  end
end
