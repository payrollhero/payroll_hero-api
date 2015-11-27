require 'test_helper'

describe "APi Test" do
  it "that_it_has_a_version_number" do
    expect(::PayrollHero::Api::VERSION).wont_be :nil?
  end
end

