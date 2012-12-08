require 'spec_helper'

describe College do
  it { should validate_presence_of(:name) }
end
