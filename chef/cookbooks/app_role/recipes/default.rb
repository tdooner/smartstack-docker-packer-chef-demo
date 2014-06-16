chef_gem 'chef-rewind'
require 'chef/rewind'

include_recipe 'app_role::environment'
include_recipe 'smartstack::synapse'

cookbook_file 'app.rb' do
  path '/home/tom/app.rb'
  user 'tom'
  group 'tom'
end
