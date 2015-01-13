#
# Cookbook Name:: shellchecker
# Recipe:: default
#

unless ::File.exists?("/usr/bin/shellcheck")

  package "cabal-install"

  include_recipe 'cabal::default'

  cabal_install "shellcheck" do
    github "koalaman/shellcheck"
    user node['shellchecker']['user']
    cabal_update true
    install_binary :from => "#{node['shellchecker']['home']}/.cabal/bin/shellcheck", :to => '/usr/bin/shellcheck'
  end

end

