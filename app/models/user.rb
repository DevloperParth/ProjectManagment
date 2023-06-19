class User < ApplicationRecord
  #rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

    

  enum role: [:admin, :employe, :employer]
  
  has_one :employer

  has_many :employees

  after_initialize :set_default_role , :if => :new_record?
  
  def set_default_role
    self.role ||= :user
  end  

  # after_create :assign_default_role

  # def assign_default_role
  #   self.add_role(:newuser) if self.roles.blank?
  # end

  # user = User.find(1)
  # user.add_role :admin

  # user = User.find(2)
  # user.add_role :user 
end
