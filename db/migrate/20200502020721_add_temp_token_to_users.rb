# frozen_string_literal: true

class AddTempTokenToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :session_token, :string
    add_index :users, :session_token
  end
end
