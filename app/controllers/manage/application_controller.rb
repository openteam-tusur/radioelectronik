class Manage::ApplicationController < ApplicationController
  protect_from_forgery with: :null_session

  layout "manage"
end
