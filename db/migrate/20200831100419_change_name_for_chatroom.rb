class ChangeNameForChatroom < ActiveRecord::Migration[6.0]
  def change
    rename_column :chatrooms, :chat, :name
  end
end
