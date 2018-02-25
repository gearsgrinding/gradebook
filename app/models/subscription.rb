class Subscription < ActiveRecord::Base
	belongs_to :course
	belongs_to :user
	validates :user, presence: true
  validates :course, presence: true
  validates :grade, presence: true
end
