# Version: v1
# Date: 22/3/2025
#####################

echo "Started the download of Tomcat.............."

echo "Installing Java....."
######################################
sudo yum install java -y

echo "Java Installed successfully"
######################################

echo "Installing Tomcat..."

# Install unzip if not present
sudo yum install unzip -y

# Download Tomcat
wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.102/bin/apache-tomcat-9.0.102.zip

# Unzip Tomcat
unzip apache-tomcat-9.0.102.zip

echo "Tomcat Installed successfully"
######################################

echo "Starting the Tomcat server........"

cd apache-tomcat-9.0.102/bin/

# Make sure the startup.sh script is executable
chmod +x startup.sh

# Start Tomcat
./startup.sh

echo "Tomcat server started successfully."

