class ChangeColumnName < ActiveRecord::Migration[7.0]
  def change
    rename_column :users, :frist_name_kanji, :first_name_kanji
  end
end
