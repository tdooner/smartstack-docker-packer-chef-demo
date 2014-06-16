package 'ruby'

gem_package 'sinatra'

directory '/home/tom'

user 'tom' do
  home '/home/tom'
end

group 'tom' do
  members ['tom']
  append true
end
