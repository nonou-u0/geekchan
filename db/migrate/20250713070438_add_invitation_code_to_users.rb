class AddInvitationCodeToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :invitation_code, :string
    add_index :users, :invitation_code, unique: true
  end
end
