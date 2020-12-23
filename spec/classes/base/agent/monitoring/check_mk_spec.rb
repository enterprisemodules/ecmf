# frozen_string_literal: true

require 'spec_helper'

#
# Contains an error on Puppet 7. Probably a reserved variable site
# TODO: Reopen this when fixed
#
xdescribe 'ecmf::base::agent::monitoring::check_mk' do
  on_supported_os.each do |os, os_facts|
    next if os =~ /windows/
    context "on #{os}" do
      let(:facts) { os_facts }

      it { is_expected.to compile.with_all_deps }
    end
  end
end
