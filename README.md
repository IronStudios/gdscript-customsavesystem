# IronStudio's Custom Save-System in GDScript (gdscript-customsavesystem)
My own custom Save-System for the Godot Engine, simply place it in your game files and add it as AutoLoad.
The system is very early at the moment and may have many bugs, my goal for this project is to make the most user friendly save-system humanly possible, however, at the moment it is everything BUT that, I do not suggest using the current iterration of the project at the moment while it's still in beta.

***

## Setup
1. Copy the 'saveSystem.gd' and paste it anywhere inside of your game's folder, preferably in an easy to remember place, (e.g res://scripts/ or another folder for scripts)
2. Go to "Project > Project Settings > AutoLoad (tab) > Folder Icon" Now select the saveSystem.gd script, now press the 'Add' button on the right
Note: If the Singleton isn't enabled on the script (listed under AutoLoad) than turn it on as it will make things much simpler
3. Now you can use the 'SaveSystem' in any script just by typing SaveSystem.functionName()

#### Side Notes
I will be using this system in a lot of my games myself, check them out [here](https://ironstudios.itch.io/).

I will continue work on this whenever I can, however, I may be too busy to work on it at the moment as I am getting into the indie game dev world so sorry if I can't always be here to help out
