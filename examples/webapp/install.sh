mkdir webapp
cp app.py webapp
cp requirements.txt webapp
sudo apt install python-pip -y
sudo pip install flask
python app.py