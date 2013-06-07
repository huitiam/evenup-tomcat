require 'spec_helper'

describe 'tomcat::service', :type => :class do
  let(:facts) { { :disposition => 'prod', :concat_basedir => '/var/lib/puppet/concat' } }
  let(:params) { { :monitoring => '' } }

  it { should create_class('tomcat::service') }
  it { should contain_service('tomcat').with(
    'ensure'  => 'running',
    'enable'  => true
  ) }

  context 'sensu monitoring' do
    let(:params) { { :monitoring => 'sensu' } }

    it { should contain_class('tomcat::monitoring::sensu') }
  end
end
