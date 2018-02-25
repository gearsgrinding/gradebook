class Course < ActiveRecord::Base
	belongs_to :user
	has_many :subscriptions
	has_many :users, through: :subscriptions
	validates :name, presence: true, uniqueness: true, length: {maximum: 40}
	validates :description, presence: true
	validates :user, presence: true

	def subscription_count
		subscriptions.size
	end

	def average_grade
		self.average_grade = subscriptions.average(:grade)
	end


end
