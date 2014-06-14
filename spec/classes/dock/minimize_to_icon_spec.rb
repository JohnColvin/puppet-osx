require 'spec_helper'

describe 'osx::dock::minimize_to_icon' do
  let(:facts) { {:boxen_user => 'ilikebees'} }

  it do
    should contain_boxen__osx_defaults('minimize_to_icon').with({
      :key    => 'minimize_to_icon',
      :domain => 'com.apple.dock',
      :value  => true,
      :user   => facts[:boxen_user]
    })
  end

  context 'given false' do
    let(:params) { { :minimize_to_icon => false } }
    it do
      should contain_boxen__osx_defaults('minimize_to_icon').with({
        :key    => 'minimize_to_icon',
        :domain => 'com.apple.dock',
        :value  => false,
        :user   => facts[:boxen_user]
      })
    end
  end

end
