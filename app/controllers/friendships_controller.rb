class FriendshipsController < ApplicationController
  def destroy
    friend = current_user.friendships.where(friend_id: params[:id]).first
    friend_user = User.find params[:id]
    name = friend_user.first_name
    friend.destroy
    respond_to do |format|
      format.html { redirect_to my_friends_path, notice: "#{name} was removed successfully" }
    end
  end
end
