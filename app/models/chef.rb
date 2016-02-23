class Chef < ActiveRecord::Base
  has_many :recipes
  has_many :likes
  before_save { self.email = email.downcase }
  validates :chefname, presence: true,  length: {minimum: 3, maximum: 39}
  validates :email, presence: true, uniqueness: {case_sensitve: false}, format: {with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i,
          message: "not a valid email address"}          
end