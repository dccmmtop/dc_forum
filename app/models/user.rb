class User < ApplicationRecord

  before_save {self.email=email.downcase}
  
  EMAIL_FORMAT= /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  validates :name,presence: true,length:{maximum: 10},uniqueness: true
  validates :email,presence: true,length:{maximum:50},format:{with: EMAIL_FORMAT},uniqueness:{case_sensitive:false}
  validates :password,presence: true,length:{minimum:6,maximum:16}
  has_secure_password

  has_many :topics, dependent: :destroy

end
