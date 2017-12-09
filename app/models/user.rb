class User < ApplicationRecord

  before_save {self.email=email.downcase}
  
  EMAIL_FORMAT= /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  validates :name,presence: true,length:{maximum: 10},uniqueness: true
  validates :email,presence: true,length:{maximum:50},format:{with: EMAIL_FORMAT},uniqueness:{case_sensitive:false}
  validates :nickname,length:{maximum: 20}
  validates :password,presence: true,length:{minimum:6,maximum:16},:on=>:create

  # 如果密码为空代表不修改密码,只有修改密码时才会验证密码
  validates :password,presence:true,length:{minimum:6,maximum:16},:on=>:update, if: :password_not_blank?
  has_secure_password

  has_many :topics, dependent: :destroy
  has_many :friend_links,:comments
  has_one :setting

  def password_not_blank?
     !password.blank?
  end
end
