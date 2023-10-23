#! /bin/bash

echo "Cloning Uctronics & Install"
git clone https://github.com/bbhagan/uctronics-display.git
git clone https://github.com/UCTRONICS/U6143_ssd1306.git

echo "Compile code"
cd ./U6143_ssd1306/C
sudo make clean && sudo make 
cd ../..

echo "Copy bin to /usr/loca/bin"
sudo cp -R ./U6143_ssd1306 /usr/local/bin/

echo "Copy service to /etc/"
cd ./uctronics-display
sudo cp ./uctronics-display.service /etc/systemd/system/uctronics-display.service

echo "Making a service and starting"
sudo systemctl enable uctronics-display
sudo systemctl start uctronics-display
sleep 3 #sleep is to make sure everything is totally up before testing
sudo systemctl status uctronics-display
