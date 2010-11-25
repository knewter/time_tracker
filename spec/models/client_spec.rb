require 'spec_helper'

describe Client do
  it "should have many projects" do
    should have_many(:projects)
  end

  it "should have many tickets through projects" do
    should have_many(:tickets).through(:projects)
  end

  it "should have many work_units through tickets" do
    should have_many(:work_units).through(:tickets)
  end

  it "should validate presence of name" do
    should validate_presence_of(:name)
  end
end
