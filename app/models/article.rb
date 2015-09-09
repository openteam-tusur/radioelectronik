class Article < ActiveRecord::Base
  belongs_to :issue
  validates_presence_of :title, :article_type, :content

  validates_uniqueness_of :article_type, :scope => :issue_id,
    :message => "Тема выпуска уже существует, выберите другой тип новости"

  extend Enumerize
  enumerize :article_type, in: [:issue_theme, :news, :regular], predicate: true
end
