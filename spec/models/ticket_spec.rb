require 'spec_helper'

describe Ticket do
  it "should belong to project" do
    should belong_to(:project)
  end

  it "should have many work_units" do
    should have_many(:work_units)
  end

  it "should validate presence of name" do
    should validate_presence_of(:name)
  end
end
