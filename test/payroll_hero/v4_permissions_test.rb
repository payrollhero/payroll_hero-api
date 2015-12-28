require 'test_helper'

describe 'V4 Permissions' do
  let(:token) { "lubzxi08vai2sb42rgkcn5e2py2uq12" } # this is only really used to generate the vcr entry
  let(:client) { PayrollHero::Api.new(token) }

  describe "list" do
    let(:expected_response) do
      {
        "features" => {
          "leave_management" => true
        },
        "permissions" => {
          "leave_management" => {
            "own_leaves" => "create",
            "subordinate_leave_banks" => "edit",
            "self_leave_banks" => "read",
            "subordinate_leaves" => "none"
          }
        }
      }
    end

    it do
      VCR.use_cassette('v4_permissions_list') do
        response = client.v4.permissions.list

        expect(response).must_equal(expected_response)
      end
    end
  end
end
