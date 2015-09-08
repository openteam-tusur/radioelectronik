class Article < ActiveRecord::Base
  belongs_to :issue
  validates_presence_of :title, :type, :content
end
