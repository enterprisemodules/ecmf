# frozen_string_literal: true

require 'spec_helper'

describe 'ecmf::profile::jee::weblogic' do
  on_supported_os.each do |os, os_facts|
    next if os =~ /windows/
    context "on #{os}" do
      let(:facts) { os_facts }

      xit { is_expected.to compile }
    end
  end
end
