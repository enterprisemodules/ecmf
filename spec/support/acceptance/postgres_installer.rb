shared_examples "a postgres installer" do | settings|
  klass   = settings.fetch(:klass)
  version = settings.fetch(:version)

  before do
    hiera_values_on_sut({
      'easy_type::generate_password_mode'     => 'development',
      'ecmf::roles::database::implementation' => 'ecmf::profile::database::postgres'
    })
  end

  after(:all) do
    # Cleanup all
    # run_shell('rm -rf /u01 /u02 /u03 /home/oracle || true')
  end

  manifest = <<-MANIFEST
    contain #{klass}
  MANIFEST

  it 'installs the postgres software' do
    apply_manifest(manifest, :expect_changes => true)
  end

  describe package('postgresql') do
    it { should be_installed }
  end
  
  describe service('postgresql') do
    it { should be_enabled }
    it { should be_running }
  end

  describe user('postgres') do
    it { should exist }
  end

  describe group('postgres') do
    it { should exist }
  end

  #
  # The database directory should be made
  #
  describe file('/var/lib/pgsql/data') do
    it { should be_directory }
    it { should be_owned_by('postgres') }
    it { should be_grouped_into('postgres') }
  end

  #
  # The postgres user and its profile should be set
  #
  describe file('/var/lib/pgsql/.bash_profile') do
    it { should be_file }
    it { should be_owned_by('postgres') }
    it { should be_mode(644) }
    it { should be_grouped_into('postgres') }
    it { should contain('PGDATA=/var/lib/pgsql/data') }
  end

  it 'is idempotent on next run' do
    apply_manifest(manifest, :expect_changes => false)
  end
end
