class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :username, presence: true, null: false
      t.string :password_digest, presence: true, null: false
      t.string :session_token, null: false
      t.timestamps
    end
  end
end
