# == Schema Information
#
# Table name: questions
#
#  id         :bigint(8)        not null, primary key
#  text       :text             not null
#  poll_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Question < ApplicationRecord
  validates :text, :poll_id, presence: true

  belongs_to :poll,
  primary_key: :id,
  foreign_key: :poll_id,
  class_name: :Poll
  
  has_many :answer_choices,
  primary_key: :id,
  foreign_key: :question_id,
  class_name: :AnswerChoice
  
  has_many :responses,
  through: :answer_choices,
  source: :responses
  
  def results_bad_way 
    results = {} 
    answer_choices = self.answer_choices
  
    answer_choices.each do |ans|
      results[ans.text] = ans.responses.count
    end
  
    results
  end
  
  def results_better 
    results = {} 
    answer_choices = self.answer_choices.includes(:responses)
  
    answer_choices.each do |ans|
      results[ans.text] = ans.responses.length
    end
  
    results
  end
end 
