class State < ApplicationRecord
  has_many :parks
  validates :name, :presence => true

  scope :search_by_name, -> (name){ where "name = ?", name}
end
