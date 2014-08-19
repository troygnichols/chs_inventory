require 'spec_helper'

describe Tag, :type => :model do
  it 'does not allow duplicate names' do
    existing_tag = FactoryGirl.create :tag
    new_tag = FactoryGirl.build_stubbed :tag, name: existing_tag.name
    expect(new_tag.valid?).to eql(false)
  end
end
