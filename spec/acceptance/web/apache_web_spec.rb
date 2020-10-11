require_relative '../../spec_helper_acceptance'


describe 'ecmf::roles::web with appache' do

  context 'when applying appache x' do
    it_should_behave_like "an apache installer",
      version: 'x',
      klass: 'ecmf::roles::web'
  end

end
