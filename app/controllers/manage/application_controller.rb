class Manage::ApplicationController < ApplicationController
  load_and_authorize_resource

  layout "manage"
end
