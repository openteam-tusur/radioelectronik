class Issue < ActiveRecord::Base
  has_many :articles, dependent: :destroy

  validates_presence_of :number, :global_id, :release_at
  validates_uniqueness_of :global_id

  extend Enumerize
  enumerize :state, in: [:draft, :published], predicates: true

  default_scope {order('release_at')}

  def articles_collection
    @articles_collection ||= %w(issue_theme regular news).inject({}){ |hash, key|
      article_array = articles.send(key)
      hash[key] = article_array if article_array.present?
      hash
    }
  end
end
