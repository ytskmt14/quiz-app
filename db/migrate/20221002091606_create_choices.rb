class CreateChoices < ActiveRecord::Migration[6.1]
  def change
    create_table :choices do |t|
      t.string :content, comment: '選択肢'
      t.boolean :is_correct, comment: '正解フラグ'
      t.references :question, null: false, foreign_key: true

      t.timestamps
    end
  end
end
