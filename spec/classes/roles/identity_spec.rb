# frozen_string_literal: true

require 'spec_helper'

describe 'ecmf::roles::identity' do
  on_supported_os.each do |os, os_facts|
    next if os =~ /windows/
    context "on #{os}" do
      let(:facts) { os_facts }

      it { is_expected.to compile.and_raise_error(%r{Specify an implementation in your hiera data with key: 'ecmf::profile::identity::implementation'}) }
    end
  end
end
