# user data for bastion

#!/bin/bash
sudo yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-9.noarch.rpm
sudo yum install -y dnf-utils http://rpms.remirepo.net/enterprise/remi-release-9.rpm
sudo yum install -y mysql-server wget vim telnet htop git python3 net-tools zip chrony
sudo systemctl start chronyd
sudo systemctl enable chronyd


#installing java 11
sudo yum install -y java-11-openjdk-devel
sudo echo "export JAVA_HOME=$(dirname $(dirname $(readlink $(readlink $(which javac)))))" >> ~/.bash_profile
sudo echo "export PATH=$PATH:$JAVA_HOME/bin" >> ~/.bash_profile
sudo echo "export CLASSPATH=.:$JAVA_HOME/jre/lib:$JAVA_HOME/lib:$JAVA_HOME/lib/tools.jar" >> ~/.bash_profile
source ~/.bash_profile

# Update package lists
sudo yum update -y

# Install necessary development packages
sudo yum install -y gcc python3-devel postgresql-devel

# Create and activate a virtual environment
python3 -m venv /home/ec2-user/venv
source /home/ec2-user/venv/bin/activate

# Upgrade pip
pip install --upgrade pip

# Install required Python packages
pip install boto boto3 PyMySQL mysql-connector-python psycopg2==2.9.6

# Deactivate the virtual environment
deactivate

echo "Setup complete. Virtual environment is located at /home/ec2-user/venv"

## install botocore, ansible and awscli
# sudo python3 -m pip install boto
# sudo python3 -m pip install boto3
# sudo python3 -m pip install PyMySQL
# sudo python3 -m pip install mysql-connector-python
# sudo python3 -m pip install --upgrade setuptools
# sudo python3 -m pip install --upgrade pip
# sudo python3 -m pip install psycopg2==2.7.5 --ignore-installed

sudo curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
sudo unzip awscliv2.zip
sudo ./aws/install
sudo yum install ansible -y
sudo yum install -y policycoreutils-python-utils
ansible-galaxy collection install amazon.aws
ansible-galaxy collection install community.general
ansible-galaxy collection install community.mysql
ansible-galaxy collection install community.postgresql