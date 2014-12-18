#
# Cookbook Name:: shellchecker
# Recipe:: default
#

user = node['shellchecker']['user']
home = Etc.getpwnam(user).dir

package "cabal-install"

include_recipe 'cabal'

cabal_update user

cabal_install "shellcheck" do
  github "koalaman/shellcheck"
  user user
  cabal_update true
  install_binary :from => "#{home}/.cabal/bin/shellcheck", :to => '/usr/bin/shellcheck'
end

