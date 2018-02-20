class Subscription < ActiveRecord::Base
	belongs_to :course
	belongs_to :student
	validates :student, presence: true
  validates :course, presence: true
  validates :grade, presence: true
end
