class Manage::ApplicationController < ApplicationController
  protect_from_forgery with: :null_session

  load_and_authorize_resource

  layout "manage"
end
