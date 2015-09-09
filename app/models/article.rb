require 'article_type_validator'

class Article < ActiveRecord::Base
  belongs_to :issue
  validates_presence_of :title, :article_type, :content

  validates_with ArticleTypeValidator

  scope :regular, -> { where(article_type: "regular") }
  scope :news, -> { where(article_type: "news") }

  extend Enumerize
  enumerize :article_type, in: [:issue_theme, :news, :regular], predicates: true

  def self.issue_theme
    self.find_by(article_type: "issue_theme")
  end
end
