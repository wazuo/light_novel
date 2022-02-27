class Public::RelationshipsController < ApplicationController
  before_action :authenticate_member!

  def create
    @follow = current_member.follow(params[:member_id])
    redirect_to request.referer
  end

  def destroy
    current_member.unfollow(params[:member_id])
    redirect_to request.referer
  end
end
