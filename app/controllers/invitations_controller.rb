class InvitationsController < Devise::InvitationsController
  authorize_resource class: false
end
