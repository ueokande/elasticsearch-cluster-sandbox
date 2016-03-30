service "firewalld" do
  action [:disable, :stop]
end

package "vim" do
  action :install
end

package "git" do
  action :install
end
