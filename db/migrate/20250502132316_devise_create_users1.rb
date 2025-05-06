class DeviseCreateUsers1 < ActiveRecord::Migration[6.1]
  def change
    ## Trackable
    add_column :users, :sign_in_count, :integer, default: 0, null: false
    add_column :users, :current_sign_in_at, :datetime
    add_column :users, :last_sign_in_at, :datetime
    add_column :users, :current_sign_in_ip, :string
    add_column :users, :last_sign_in_ip, :string

    ## Lockable
    add_column :users, :failed_attempts, :integer, default: 0, null: false
    add_column :users, :unlock_token, :string
    add_column :users, :locked_at, :datetime

    ## Timestamps（created_at, updated_at を追加）
    # add_timestamps :users, null: false

    ## Indexes
    # add_index :users, :email, unique: true
    # add_index :users, :reset_password_token, unique: true
    # add_index :users, :confirmation_token, unique: true
    add_index :users, :unlock_token, unique: true
  end
end
