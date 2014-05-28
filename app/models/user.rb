class User < ActiveRecord::Base
  # Enable Maestrano for this user
  maestrano_user_via :provider, :uid do |user,maestrano|
    user.name = maestrano.first_name
    user.surname = maestrano.last_name
    user.email = maestrano.email
    #user.company = maestrano.company_name
    #user.country_alpha2 = maestrano.country
    #user.some_required_field = 'some-appropriate-default-value'
  end

  # Setup protected attributes for your model
  attr_protected :provider, :uid
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body
  
  has_many :user_orga_rels
  has_many :organizations, through: :user_orga_rels
  
  def member_of?(organization)
    self.organizations.include?(organization)
  end
end
