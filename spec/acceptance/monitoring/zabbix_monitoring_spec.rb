require_relative '../../spec_helper_acceptance'


describe 'ecmf::roles::monitoring with zabbix' do

  context 'when applying zabbix x' do
    it_should_behave_like "a zabbix installer",
      version: 'x',
      klass: 'ecmf::roles::monitoring'
  end

end
