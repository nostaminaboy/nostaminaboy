class CreatePapers < ActiveRecord::Migration[6.1]
  def change
    create_table :papers do |t|
      t.string :name
      t.string :title
      t.string :author
      t.string :year
      t.string :journal
      t.string :subject
      t.text :purpose
      t.text :method
      t.text :result

      t.timestamps
    end
  end
end
