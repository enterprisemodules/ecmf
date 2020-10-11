shared_examples "a ldap installer" do | settings|
  klass   = settings.fetch(:klass)
  version = settings.fetch(:version)

  before do
    hiera_values_on_sut({
      'easy_type::generate_password_mode'     => 'development',
      'ecmf::roles::identity::implementation' => 'ecmf::profile::identity::ldap'
    })
  end

  after(:all) do
    # Cleanup all
    # run_shell('rm -rf /u01 /u02 /u03 /home/oracle || true')
  end

  manifest = <<-MANIFEST
    contain #{klass}
  MANIFEST

  it 'installs the ldap software' do
    apply_manifest(manifest, :expect_changes => true)
  end

  #
  # The identity directory should be made
  #
  # describe file('/u01/app/oracle') do
  #   it { should be_directory }
  #   it { should be_owned_by('oracle') }
  #   it { should be_grouped_into('oinstall') }
  # end

  #
  # The oracle user and its profile should be set
  #
  # describe file('/home/oracle/.bash_profile') do
  #   it { should be_file }
  #   it { should be_owned_by('oracle') }
  #   it { should be_mode(775) }
  #   it { should be_grouped_into('dba') }
  #   it { should contain('ORACLE_BASE=/u01/app/oracle') }
  #   it { should contain("ORACLE_HOME=/u01/app/oracle/product/#{version}/db_home1") }
  #   it { should contain("SQLPLUS_HOME=/u01/app/oracle/product/#{version}/db_home1") }
  # end

  it 'is idempotent on next run' do
    apply_manifest(manifest, :expect_changes => false)
  end
end
