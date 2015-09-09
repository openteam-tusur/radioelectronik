class Permission < ActiveRecord::Base
  include AuthClient::Permission

  attr_accessor :name

  validates_presence_of :name

  validates_uniqueness_of :role, :scope => :user_id,
    :message => 'У пользователя не может быть несколько одинаковых ролей'

  acts_as_auth_client_permission roles: [:admin, :editor]

  def role_text
    I18n.t("role_names.#{role}", :title => '').strip
  end
end
