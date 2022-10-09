# == Schema Information
#
# Table name: choices
#
#  id                     :bigint           not null, primary key
#  content(選択肢)        :string(255)
#  is_correct(正解フラグ) :boolean
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  question_id            :bigint           not null
#
# Indexes
#
#  index_choices_on_question_id  (question_id)
#
# Foreign Keys
#
#  fk_rails_...  (question_id => questions.id)
#
FactoryBot.define do
  factory :choice do
    sequence(:content, 'choice content 1')
    is_correct { true }
  end
end
