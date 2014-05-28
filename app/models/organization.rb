class Organization < ActiveRecord::Base
  attr_accessible :name
  
  has_many :user_orga_rels
  has_many :users, through: :user_orga_rels
  
  def add_member(user,role)
    self.user_orga_rels.create(user: user, role: role)
  end
end
