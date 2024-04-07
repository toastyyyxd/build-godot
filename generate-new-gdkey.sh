if [ -f godot.gdkey ]; then
    echo "a gdkey already exists!"
    exit 1
fi

openssl rand -hex 32 > godot.gdkey > godot.gdkey
