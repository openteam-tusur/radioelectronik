class Article < ActiveRecord::Base
  belongs_to :issue
  validates_presence_of :title, :article_type, :content

  extend Enumerize
  enumerize :article_type, in: [:issue_theme, :news, :regular], predicate: true
end
