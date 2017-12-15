class Park < ApplicationRecord
  belongs_to :state
  validates :name, :presence => true

  scope :search_by_name, -> (name){ where "name = ?", name}
  scope :parks, -> (state_id){ where "state_id = ?", state_id }

  def self.get_random_park
    Park.limit(1).order("RANDOM()")
  end
end
