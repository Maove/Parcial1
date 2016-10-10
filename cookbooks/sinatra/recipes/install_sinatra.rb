=begin
execute 'instalar1' do
  command 'yum groupinstall -y "Development Tools"'
end
=end

yum_package "wget" do
  action :install
end

bash "descargar ruby" do
  user "root"
  code <<-EOH
  wget http://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.2.tar.gz
  tar xvfvz ruby-2.1.2.tar.gz
  EOH
end

bash "install ruby" do
  user "root"
  code <<-EOH
  cd ruby-2.1.2
  ./configure
  EOH
end

bash "terminar instalacion" do
  user "root"
  code <<-EOH
  cd ruby-2.1.2
  make
  make install
  EOH
end

yum_package "postgresql-devel" do
  action :install
end

bash "instalar gemas" do
  user "root"
  code <<-EOH
  gem update --system
  gem install bundler --no-ri --no-rdoc
  gem install foreman --no-ri --no-rdoc
  gem install pg
  EOH
end

bash "open port" do
  user "root"
  code <<-EOH
  iptables -I INPUT 5 -p tcp -m state --state NEW -m tcp --dport 5000 -j ACCEPT
  service iptables save
  EOH
end


cookbook_file "/home/vagrant/main.rb" do
  source 'main.rb'
  mode 0644
  owner "root"
  group "wheel"
end

cookbook_file "/home/vagrant/Gemfile" do
  source 'Gemfile'
  mode 0644
  owner "root"
  group "wheel"
end

cookbook_file "/home/vagrant/Procfile" do
  source 'Procfile'
  mode 0644
  owner "root"
  group "wheel"
end

bash "instalar bundler" do
  user "root"
  code <<-EOH
  cd /home/vagrant/
  bundle install
  EOH
end

bash "iniciar foreman" do
  user "root"
  code <<-EOH
  cd /home/vagrant/
  foreman start &
  EOH
end
