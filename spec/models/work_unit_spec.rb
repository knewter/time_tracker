require 'spec_helper'

describe WorkUnit do
  it "should belong to ticket" do
    should belong_to(:ticket)
  end

  it "should validate presence of description" do
    should validate_presence_of(:description)
  end

  it "should validate presence of hours" do
    should validate_presence_of(:hours)
  end
end
