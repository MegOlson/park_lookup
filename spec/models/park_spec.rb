require 'rails_helper'

describe Park do
  it { should belong_to :state }
  it { should validate_presence_of :name }
end
