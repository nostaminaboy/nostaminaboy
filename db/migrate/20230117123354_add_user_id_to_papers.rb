class AddUserIdToPapers < ActiveRecord::Migration[6.1]
  def change
    add_column :papers, :user_id, :integer
  end
end
