class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, 
         :rememberable, :trackable, :validatable

  has_one :client,   dependent: :destroy
  accepts_nested_attributes_for :client
  
  has_one :attorney, dependent: :destroy
  accepts_nested_attributes_for :attorney

  has_and_belongs_to_many :defenses

  validates :name, :email, presence: true

  # before_save :set_defaults

  def init
    self.god_mode |= false
  end


  def user_type
    if Attorney.find_by(user_id: self.id) != nil
      "attorney"
    elsif Client.find_by(user_id: self.id) != nil
      "client"
    else
      nil
    end
  end

end