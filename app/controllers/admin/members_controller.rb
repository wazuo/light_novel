class Admin::MembersController < ApplicationController
  before_action :authenticate_admin!
  # 会員の情報関連（マイページ）：管理者側

  def index
    @members = Member.all
  end

  def show
    @member = Member.find(params[:id])
  end

  def detail
    @member = Member.find(params[:id])
    @mangas = @member.mangas.page(params[:page]).per(8)
  end

  def edit
    @member = Member.find(params[:id])
  end

  def update
    @member = Member.find(params[:id])
    @member.update(member_params)
    redirect_to admin_member_path(@member)
  end

  private

  def member_params
    params.require(:member).permit(:profile_image, :first_name, :last_name, :first_name_kana, :last_name_kana,
                                   :nickname, :introduction, :email, :is_deleted)
  end
end
