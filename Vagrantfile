ENV["LC_ALL"] = "en_US.UTF-8"

$script = <<-EOF
export LC_ALL=en_US.UTF-8
#sudo yum -y update
sudo yum -y install wget
sudo yum -y install java-1.8.0-openjdk
sudo mkdir /etc/yum.repo.d
sudo cp /vagrant/nginx.repo /etc/yum.repo.d/nginx.repo
sudo wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat-stable/jenkins.repo
sudo wget -O /etc/yum.repos.d/nginx.repo https://raw.githubusercontent.com/zulus911/lectures/master/lecture2/nginx.repo
sudo rpm --import https://jenkins-ci.org/redhat/jenkins-ci.org.key
sudo yum -y install jenkins nginx net-tools policycoreutils-python
sudo wget -O /etc/sysconfig/jenkins https://raw.githubusercontent.com/zulus911/lectures/master/lecture2/jenkins
sudo cp /vagrant/default.conf /etc/nginx/conf.d/default.conf

sudo semanage port -a -t http_port_t -p tcp 22222

sudo service jenkins start
sudo service nginx start
EOF

Vagrant.configure("2") do |config|
  config.vm.define "test-vagrant" do |test|
    test.vm.box = "centos/7"
    test.vm.hostname = "stan.box"
    test.vm.network "public_network", bridge: "enp0s7"

    test.vm.provision "shell", inline: $script
  end
end

