execute "download jdk" do
  command "curl -LOs -b \"oraclelicense=accept-securebackup-cookie\" \"http://download.oracle.com/otn-pub/java/jdk/8u77-b03/jdk-8u77-linux-x64.rpm\""
  cwd "/usr/local/src"
  not_if "test -e /usr/local/src/jdk-8u77-linux-x64.rpm"
end

execute "install jdk" do
  command "yum localinstall jdk-8u77-linux-x64.rpm -y"
  cwd "/usr/local/src"
  not_if "which java"
end
