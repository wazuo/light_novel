class ContactMailer < ApplicationMailer
  # お問い合わせ機能送信先と件名
  def send_mail(contact)
    @contact = contact
    mail to: ENV['TOMAIL'],subject: '【お問い合わせ】' + @contact.subject_i18n
  end
end
