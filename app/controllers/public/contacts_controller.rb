class Public::ContactsController < ApplicationController

  def new
    @contact = Contact.new
  end

  def confirm
    @contact = Contact.new(contact_params)
    if @contact.invalid?
      render :new
    elsif
      flash[:danger] = 'こちらの内容でよろしいでしょうか（※まだ送信されてません）'
    end
  end

  def back
    @contact = Contact.new(contact_params)
    render :new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      ContactMailer.send_mail(@contact).deliver_now
      redirect_to done_path,notice: '送信されました！'
    else
      render :new
    end
  end
  # 送信完了画面
  def done
  end

  private

  def contact_params
    params.require(:contact).permit(:email, :name, :phone_number, :subject, :message)
  end

end
