require 'rails_helper'

RSpec.describe Search, type: :model do
  it { should validate_presence_of(:keyword) }
  it { should validate_presence_of(:num_times) }

  it { should validate_uniqueness_of(:keyword) }
end
