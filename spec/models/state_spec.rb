require 'rails_helper'

describe State do
   it { should have_many :parks }
   it { should validate_presence_of :name }
end
