class AddRoleToUserOrgaRels < ActiveRecord::Migration
  def change
    add_column :user_orga_rels, :role, :string
  end
end
