# == Schema Information
#
# Table name: questions
#
#  id              :bigint           not null, primary key
#  content(問題文) :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class Question < ApplicationRecord
  MAX_CHOICE_COUNTS = 4
  private_constant :MAX_CHOICE_COUNTS

  has_many :choices
  accepts_nested_attributes_for :choices, allow_destroy: true

  validate :select_choices_within_max_counts
  validate :include_only_one_correct

  private

  def select_choices_within_max_counts
    puts "choices.size: #{choices.size}"
    errors.add(:base, "Choiceは、#{MAX_CHOICE_COUNTS}つまで設定可能です。") if choices.size > MAX_CHOICE_COUNTS
  end

  def include_only_one_correct
    errors.add(:base, '正解となる選択肢はひとつのみ設定可能です。') unless only_one_correct?
  end

  def only_one_correct?
    choices.target.select { |choice| choice.is_correct }.count == 1
  end
end
