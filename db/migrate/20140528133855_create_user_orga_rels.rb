class CreateUserOrgaRels < ActiveRecord::Migration
  def change
    create_table :user_orga_rels do |t|
      t.integer :user_id
      t.integer :organization_id

      t.timestamps
    end
  end
end
