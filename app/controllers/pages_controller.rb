class PagesController < ApplicationController
  def home
    if current_user && session[:mno_group_uid]
      @organization = Organization.find_by_uid(session[:mno_group_uid])
      @role = current_user.user_orga_rels.where(organization_id: @organization).first.role
    end
  end
end
