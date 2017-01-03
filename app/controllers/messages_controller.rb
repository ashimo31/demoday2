class MessagesController < ApplicationController
  def create
    # ログインユーザーに紐付けてインスタンス生成するためbuildメソッドを使用します。
    @message = current_user.messages.build(message_params)
    @task = @message.task

    # クライアント要求に応じてフォーマットを変更
    respond_to do |format|
      if @message.save
        format.html { redirect_to task_path(@task), notice: 'メッセージを投稿しました。' }
        format.json { render :show, status: :created, location: @message }
        # JS形式でレスポンスを返します。
        format.js { render :index }
      else
        format.html { render :new }
        ormat.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # ストロングパラメーター
    def message_params
      params.require(:message).permit(:task_id, :content)
   end

end
