require File.dirname(__FILE__) + '/../spec_helper'

describe "Plain" do
  examples_from_yaml do |doc|
    RedCloth.new(doc['in']).to_plain
  end
end
