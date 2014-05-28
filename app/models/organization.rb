class Organization < ActiveRecord::Base
  # Enable Maestrano for this group
  maestrano_group_via :provider, :uid do |group, maestrano|
    group.name = (maestrano.company_name || "Default Group name")
    #group.country_alpha2 = maestrano.country
    #group.free_trial_end_at = maestrano.free_trial_end_at
    #group.some_required_field = 'some-appropriate-default-value'
  end

  # Setup protected attributes for your model
  attr_protected :provider, :uid
  attr_accessible :name
  
  has_many :user_orga_rels
  has_many :users, through: :user_orga_rels
  
  def add_member(user,role)
    self.user_orga_rels.create(user: user, role: role)
  end
end
