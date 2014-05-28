class UserOrgaRel < ActiveRecord::Base
  attr_accessible :organization_id, :user_id, :role
  
  belongs_to :organization
  belongs_to :user
end
