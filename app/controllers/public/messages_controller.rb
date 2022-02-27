class Public::MessagesController < ApplicationController
  before_action :authenticate_member!

  def show
    # メッセージを送る会員の情報を習得
    @member = Member.find(params[:id])
    # entriesテーブルのmember_idさんがcurrent_memberのレコードのroom_idを配列で習得
    rooms = current_member.entries.pluck(:room_id)
    # member_idが(@member)で,room_idがcurrent_memberの属するroom_id(配列)となるentriesテーブルののレコードを取得して、
    # entry変数に格納これによって、current_memberと@memberに共通のroom_idが存在していれば
    # その共通のroom_idと@memberのmember_idがentrie変数に格納される（1レコード）。存在しなければ、nillになる。
    entry = Entry.find_by(member_id: @member.id, room_id: rooms)

    # entryでルームを取得できなかった（current_memberと@memberのチャットがまだ存在しない）場合の処理
    room = nil
    if entry.nil?
      # roomのidを割り当てる
      room = Room.new
      room.save
      # 割り当てたroomのidを使って、entryのレコードを2人分（current_member、@member）作る。(current_memberと@memberに共通のroom_idを作成)
      # @memberの@member.idをmember_idとして、room_idをroom.idとして、Entryモデルのカラムに保存（1レコード）
      Entry.create(member_id: @member.id, room_id: room.id)
      # current_memberのcurrent_member.idをmember_idとして、room.idをroom_idとして、Entryモデルのカラムに保存（1レコード）
      Entry.create(member_id: current_member.id, room_id: room.id)
    else
      # entryに紐づくroomテーブルのroomに格納
      room = entry.room
    end
    # roomに紐づくmessagesテーブルのレコードを@messagesに格納
    # ここでroom.idを@messageに代入しておかないと、form_withで記述するroom_idに値が渡らない
    @messages = room.messages
    @message = Message.new(room_id: room.id)
  end

  def create
    @message = current_member.messages.new(message_params)
    @message.save
  end

  private

  def message_params
    params.require(:message).permit(:message, :room_id)
  end
end
