# == Schema Information
#
# Table name: responses
#
#  id          :bigint(8)        not null, primary key
#  user_id     :integer          not null
#  question_id :integer          not null
#  answer_id   :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Response < ApplicationRecord
  validates :user_id, :answer_id, presence: true 
  validate :not_duplicate_response
  validate :cant_respond_to_own_poll
  
  belongs_to :user,
  primary_key: :id,
  foreign_key: :user_id, 
  class_name: :User
  
  belongs_to :answer_choice,
  primary_key: :id, 
  foreign_key: :answer_id,
  class_name: :AnswerChoice
  
  has_one :question, 
  through: :answer_choice,
  source: :question
  
  def sibling_responses 
    self.question.responses.where.not(responses: {id: self.id})
  end 
  
  def respondent_already_answered?
    sib_responses = sibling_responses.where(responses: {user_id: self.user_id})
    return true unless sib_responses.empty?
    false
  end
  
  def not_duplicate_response
    if respondent_already_answered?
      errors[:user_id] << "Cannot have duplicate response"
    end
  end 
  
  def cant_respond_to_own_poll
    if self.question.poll.author_id == self.user_id 
      errors[:user_id] << "Can't answer own poll."
    end
  end
end










 
