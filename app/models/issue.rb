class Issue < ActiveRecord::Base
  has_many :articles

  validates_presence_of :number, :global_id, :release_at

  extend Enumerize
  enumerize :state, in: [:draft, :publsihed], predicate: true
end
