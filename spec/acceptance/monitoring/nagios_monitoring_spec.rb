require_relative '../../spec_helper_acceptance'


describe 'ecmf::roles::monitoring with nagios' do

  context 'when applying nagios x' do
    it_should_behave_like "a nagios installer",
      version: 'x',
      klass: 'ecmf::roles::monitoring'
  end

end
