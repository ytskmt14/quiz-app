# == Schema Information
#
# Table name: questions
#
#  id              :bigint           not null, primary key
#  content(問題文) :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
FactoryBot.define do
  factory :question_with_correct_choices, class: Question do
    sequence(:content, 'question content 1')

    after(:build) do |question|
      question.choices << build(:choice)
      question.choices << build_list(:choice, 3, is_correct: false)
    end
  end

  factory :question_with_incorrect_choices, class: Question do
    sequence(:content, 'question content 1')

    after(:build) do |question|
      question.choices << build(:choice)
      question.choices << build_list(:choice, 4, is_correct: false)
    end
  end
end
