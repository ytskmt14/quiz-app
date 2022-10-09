# == Schema Information
#
# Table name: questions
#
#  id              :bigint           not null, primary key
#  content(問題文) :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
require 'rails_helper'

RSpec.describe Question do
  describe 'validate' do
    describe 'select_choices_within_max_counts' do
      context '選択肢が４つ設定されている場合' do
        let!(:question) { build(:question_with_correct_choices) }
        it '有効である' do
          expect(question).to be_valid
        end
      end
      context '選択肢が５つ設定されている場合' do
        let!(:question) { build(:question_with_incorrect_choices) }
        it '無効である' do
          expect(question).to be_invalid
        end
      end
    end

    describe 'select_choices_within_max_counts'
  end
end
