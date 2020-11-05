require_relative '../../spec_helper_acceptance'


describe 'ecmf::roles::database with postgres' do

  context 'when applying postgres 9' do
    it_should_behave_like "a postgres installer",
      version: '9',
      klass: 'ecmf::roles::database'
  end

end
