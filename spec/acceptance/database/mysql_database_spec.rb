require_relative '../../spec_helper_acceptance'


describe 'ecmf::roles::database with mysql' do

  context 'when applying mysql x' do
    it_should_behave_like "a mysql installer",
      version: 'x',
      klass: 'ecmf::roles::database'
  end

end
