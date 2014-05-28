class Maestrano::Auth::SamlController < Maestrano::Rails::SamlBaseController
  
  #== POST '/maestrano/auth/saml/consume'
  # Final phase of the Single Sign-On handshake. Find or create
  # the required resources (user and group) and sign the user
  # in
  #
  def consume
    user = User.find_or_create_for_maestrano(user_auth_hash)
    organization = Organization.find_or_create_for_maestrano(group_auth_hash)

    unless user.member_of?(organization)
      organization.add_member(user, user_group_rel_hash[:role])
    end
  
    sign_in(user)
    #render text: user_auth_hash
    redirect_to root_path
  end
end