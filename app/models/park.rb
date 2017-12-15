class Park < ApplicationRecord
  belongs_to :state
  validates :name, :presence => true
end
