# == Schema Information
#
# Table name: users
#
#  id         :bigint(8)        not null, primary key
#  username   :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true
  
  has_many :responses,
  primary_key: :id,
  foreign_key: :user_id,
  class_name: :Response
  
  has_many :polls, 
  primary_key: :id,
  foreign_key: :author_id,
  class_name: :Poll
  
  has_many :answers,
    through: :responses,
    source: :answer_choice
  
  
  
end
