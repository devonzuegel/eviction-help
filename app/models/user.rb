class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, 
         :rememberable, :trackable, :validatable

  has_many :clients,   dependent: :destroy
  has_many :attorneys, dependent: :destroy

  validates :name, :email, presence: true


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