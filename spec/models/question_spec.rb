require 'rails_helper'

RSpec.describe Question, type: :model do
  it { should belong_to(:survey) }
  it { should belong_to(:category) }
end
