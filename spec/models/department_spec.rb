require 'spec_helper'

describe Department do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:college) }
  it { should belong_to(:college).of_type(College) }
end
