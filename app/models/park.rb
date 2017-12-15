class Park < ApplicationRecord
  belongs_to :state
  validates :name, :presence => true

  scope :by_name, -> (name){ where "name = ?", name}
  scope :parks, -> (state_id){ where "state_id = ?", state_id }
end
