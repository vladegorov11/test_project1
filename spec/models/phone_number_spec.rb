require 'rails_helper'
RSpec.describe PhoneNumber, type: :model do

  context "validations tests" do
    it {should validate_presence_of(:number)}
    it {should allow_value('3111111111').for(:number)}
    it {should_not allow_value('234333').for(:number)}
  end

end
