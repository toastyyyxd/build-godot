# godot-doubles
## Usage
Clone this repo and run `setup.sh` to setup, works fine inside codespaces.

Edit `compile.editor.sh` and `compile.templates.sh` to fit your requirements and run those.

## Notes
`setup.sh` uses Godot from v4.1.1-stable.

`compile.editor.sh` and `compile.templates.sh` will only compile the editor, template_debug and template_release for windows x86_64, edit those to fit your requirements.

Set `SCRIPT_AES256_ENCRYPTION_KEY` enviroment variable to your pck key if you'd like.