#
# Cookbook Name:: shellchecker
# Recipe:: default
#

unless ::File.exists?("/usr/local/bin/shellcheck")

  package "cabal-install"

  include_recipe 'cabal::default'

  cabal_install "shellcheck" do
    github "koalaman/shellcheck"
    user Etc.getpwuid(Process.uid).name
    cabal_update true
    global_install true
  end

end

