class User < ActiveRecord::Base
	before_save { email.downcase! }
	validates :name,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: true
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }

  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def self.role
  	[Student, Teacher,Admin]
  end

  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
  	self.role = Student;
    def student?
    	true
    end
  end

  def student?
  	false
  end

  def teacher?
  	false
  end

  def admin?
  	false
  end

  has_many :subscriptions
  has_many :courses, :through => :subscriptions

end

class Student < User
  def student?
    true
  end
end


class Teacher < User
  def teacher?
    true
  end
end

class Admin < User
  def admin?
    true
  end
end