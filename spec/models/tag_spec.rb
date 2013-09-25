require 'spec_helper'

describe Tag do
  it 'does not allow duplicate names' do
    existing_tag = FactoryGirl.create :tag
    new_tag = FactoryGirl.build_stubbed :tag, name: existing_tag.name
    new_tag.valid?.should eql(false)
  end
end
