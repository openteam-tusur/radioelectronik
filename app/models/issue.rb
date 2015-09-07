class Issue < ActiveRecord::Base
  validates_presence_of :number, :global_id, :release_at
end
