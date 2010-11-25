require 'spec_helper'

describe Project do
  it "should belong to client" do
    should belong_to(:client)
  end

  it "should have many tickets" do
    should have_many(:tickets)
  end

  it "should have many work_units through tickets" do
    should have_many(:work_units).through(:tickets)
  end

  it "should validate presence of name" do
    should validate_presence_of(:name)
  end
end
