class MessagesController < ApplicationController

  #@roomには、paramsに含まれているroom_idを代入
  #ルーティングをネストしているため、/rooms/:room:id/messagesというパスになる
  #パスにroom_idが含まれているため、paramsのハッシュオブジェクトの中にroom_idという値がある
  #そのため、params[:room_id]と書ける
  def index
    @message = Message.new
    @room = Room.find(params[:room_id])
    
    #チャットルームに紐づいている全てのメッセージ(@room.messages)を@messagesと定義する
    @messages = @room.messages.includes(:user)
  end
  #`room.message.newで、チャットルームに紐づいたメッセージのインスタンスを生成、
  #message_paramsを引数にしてparamsメソッドを呼び出す
  #その値を@messageに代入し、saveでメッセージの内容をmessageテーブルに保存する
  def create
    @room = Room.find(params[:room_id])
    @message = @room.messages.new(message_params)
    if @message.save
      redirect_to room_messages_path(@room)
    else
      #投稿に失敗したとき、@messageの情報を保持しつつindex.html.erbを参照することができる
      #その際、@messageを定義していないとエラーが出る
      @messages = @room.messages.includes(:user)
      render :index
    end
  end

  private

  def message_params
    params.require(:message).permit(:content).merge(user_id: current_user.id)
  end
end

