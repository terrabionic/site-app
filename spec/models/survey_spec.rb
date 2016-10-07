require 'rails_helper'

RSpec.describe Survey, type: :model do
  it { should have_many(:questions) }
end
