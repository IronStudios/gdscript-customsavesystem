# IronStudio's Custom Save-System in GDScript (gdscript-customsavesystem)
My own custom Save-System for the Godot Engine, simply place it in your game files and add it as AutoLoad.
The system is very early at the moment and may potentially have bugs, I do not take any responsibility for any damage caused by the code.

## Setup
1. Copy the 'saveSystem.gd' and paste it anywhere inside of your game's folder, preferably in an easy to remember place, (e.g res://scripts/ or another folder for scripts)
2. Go to "Project > Project Settings > AutoLoad (tab) > Folder Icon" Now select the saveSystem.gd script, now press the 'Add' button on the right
Note: If the Singleton isn't enabled on the script (listed under AutoLoad) than turn it on as it will make things much simpler
3. Now you can use the 'SaveSystem' in any script just by typing SaveSystem.functionName()
