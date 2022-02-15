class Public::MembersController < ApplicationController
  before_action :authenticate_member!
  # 会員の情報関連（マイページ）

  def index
    @members = Member.all
  end

  def show
    @member = Member.find(params[:id])
  end
  def edit
    @member = Member.find(params[:id])
  end
  def update
    @member = Member.find(params[:id])
    @member.update(member_params)
    redirect_to member_path(@member)
  end
  # フォロー一覧
  def following
    @member = Member.find(params[:id])
    @followings = @member.followings.all
  end
  # フォロワー一覧
  def followers
    @member = Member.find(params[:id])
    @followers = @member.followers.all
  end

  private

    def member_params
      params.require(:member).permit(:profile_image, :first_name, :last_name, :first_name_kana,:last_name_kana, :nickname, :introduction, :email)
    end

end
