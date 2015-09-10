SimpleNavigation::Configuration.run do |navigation|
  navigation.selected_class = 'active'

  navigation.items do |primary|
    primary.item :manage_issues, 'Управление выпусками',  manage_issues_path, :highlights_on => /^\/manage\/issues/ if can? :manage, Issue, Article
    primary.item :manage_permissions, 'Управление правами', manage_permissions_path, :highlights_on => /^\/manage\/permissions/ if can? :manage, Permission

    if current_user.try :administrator?
      primary.item :messages,       I18n.t('page_title.messages.index'),  messages_path
      primary.item :email_property, I18n.t('page_title.emails.index'),  property_emails_path
      primary.item :sms_property,   I18n.t('page_title.smses.index'),  property_smses_path
    end
  end
end

SimpleNavigation.register_renderer :first_renderer  => FirstRenderer
SimpleNavigation.register_renderer :second_renderer => SecondRenderer
SimpleNavigation.register_renderer :mobile_menu_renderer => MobileMenuRenderer
