user 'tom' do
  home '/home/tom'
end

group 'tom' do
  members ['tom']
  append true
end

cookbook_file 'app.rb' do
  path '/home/tom/app.rb'
  user 'tom'
  group 'tom'
end
