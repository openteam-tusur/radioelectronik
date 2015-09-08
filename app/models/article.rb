require 'article_type_validator'

class Article < ActiveRecord::Base
  belongs_to :issue
  validates_presence_of :title, :article_type, :content

  validates_with ArticleTypeValidator

  extend Enumerize
  enumerize :article_type, in: [:issue_theme, :news, :regular], predicate: true
end
