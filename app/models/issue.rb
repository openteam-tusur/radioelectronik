class Issue < ActiveRecord::Base
  has_many :articles, dependent: :destroy

  validates_presence_of :number, :global_id, :release_at
  validates_uniqueness_of :global_id

  extend Enumerize
  enumerize :state, in: [:draft, :publsihed], predicate: true
end
