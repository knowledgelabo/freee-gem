require 'spec_helper'

describe Freee::Journal do

  let(:company_id) { -1 }

  before do
    Freee::Base.config(get_client_id, get_secret_key, get_token)
    @client = Freee::Journal
  end

  describe 'journal' do
    context '#request_url' do
      before do
        stub_get('/api/1/journals').to_return(body: fixture('journals.json'), headers: {content_type: 'application/json; charset=utf-8'} )
        @responses = @client.request_url(company_id)
      end
      after { WebMock.reset! }

      it 'requests the correct resource' do
        assert_request_requested a_get('/api/1/journals')
      end

      it 'should can be able to create instance' do
        expect(@responses).to include('journals')
      end

      describe 'should can be able to create instance' do
        subject { @responses }
        it { is_expected.not_to be_nil }
        it { is_expected.to be_instance_of(Freee::Response::Journal) }
      end
    end
  end
end
