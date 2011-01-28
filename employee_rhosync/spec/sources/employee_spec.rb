require File.join(File.dirname(__FILE__),'..','spec_helper')

describe "Employee" do
  it_should_behave_like "SpecHelper"
  
  before(:each) do
    setup_test_for Employee,'testuser'
  end
  
  it "should process Employee query" do
    pending
  end
  
  it "should process Employee create" do
    pending
  end
  
  it "should process Employee update" do
    pending
  end
  
  it "should process Employee delete" do
    pending
  end
end