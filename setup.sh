# install dependencies
sudo apt upgrade
sudo apt install mingw-w64
python -m pip install scons

# clone godot source
git clone --branch 4.1.1-stable https://github.com/godotengine/godot.git