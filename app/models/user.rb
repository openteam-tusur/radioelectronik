class User
  include AuthClient::User
  include TusurHeader::MenuLinks

  def app_name
    Settings['app.name']
  end

  Permission.available_roles.each do |role|
    define_method "#{role}?" do
      has_permission? role: role
    end
  end
end
