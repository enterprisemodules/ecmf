require_relative '../../spec_helper_acceptance'


describe 'ecmf::roles::identity with ldap' do

  context 'when applying ldap x' do
    it_should_behave_like "a ldap installer",
      version: 'x',
      klass: 'ecmf::roles::identity'
  end

end
