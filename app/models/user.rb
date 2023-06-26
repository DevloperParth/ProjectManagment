class User < ApplicationRecord
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

    

  enum role: [:admin, :employee, :employer, :user]
  
  has_many :employers

  has_many :employees

  after_initialize :set_default_role , :if => :new_record?
  
  def set_default_role
    self.role ||= :user
  end

end
