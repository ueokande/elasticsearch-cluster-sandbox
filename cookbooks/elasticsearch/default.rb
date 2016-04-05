execute "import pgp key" do
  command "sudo rpm --import https://packages.elastic.co/GPG-KEY-elasticsearch"
end

remote_file "/etc/yum.repos.d/elasticsearch.repo" do
  action :create
  not_if "test -e /etc/yum.repos.d/elasticsearch.repo"
end

package "elasticsearch" do
  action :install
end

remote_file "/etc/elasticsearch/elasticsearch.yml" do
  action :create
  owner "root"
  group "elasticsearch"
  mode "750"
  notifies :restart, "service[elasticsearch]"
end

service "elasticsearch" do
  action [:enable, :start]
end

execute "plugin install analysis-kuromoji" do
  command "sudo /usr/share/elasticsearch/bin/plugin install analysis-kuromoji"
  notifies :restart, "service[elasticsearch]"
  not_if "test -e /usr/share/elasticsearch/plugins/analysis-kuromoji"
end

execute "plugin install kopf" do
  command "sudo /usr/share/elasticsearch/bin/plugin install lmenezes/elasticsearch-kopf/v2.1.2"
  notifies :restart, "service[elasticsearch]"
  not_if "test -e /usr/share/elasticsearch/plugins/kopf"
end

execute "plugin install head" do
  command "sudo /usr/share/elasticsearch/bin/plugin install mobz/elasticsearch-head"
  notifies :restart, "service[elasticsearch]"
  not_if "test -e /usr/share/elasticsearch/plugins/head"
end
