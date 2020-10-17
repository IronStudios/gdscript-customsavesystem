extends Node
# Beta 2.0.0

export var customSaveSystem = false
export var mainDir = "user://"
export var userEraseSaves = true
export var userStartSaves = true
export var userResetSaves = true
export var maxSaves = -1
export var minSaves = 0

var loaded = false

var currentSystem = {
	saves=[
		{},
	],
	settings=[
	]
}
var currentSave = 0

func _ready():
	if !customSaveSystem:
		if minSaves > 0:
			for i in minSaves:
				if loadFile("save"+str(i+1),true):
					var newSave = loadFile("save"+str(i+1))
					if newSave != null:
						if currentSystem.saves.size() <= i:
							currentSystem.saves.append(newSave)
						else:
							currentSystem.saves[i] = newSave
					elif currentSystem.saves.size() <= i:
						currentSystem.saves.append({})
	elif customSaveSystem:
		pass # "Your Custom Save-System" goes here <
	loaded = true

func changeSave(saveID,saveContents=null,remove=false):
	if saveContents != null:
		if currentSystem.saves.size() >= saveID:
			currentSystem.saves[saveID] = saveContents
		else:
			currentSystem.saves.insert(currentSystem.saves.size(),saveContents)
	elif currentSystem.saves.size() >= saveID:
		var i = currentSystem.saves[saveID]
		if remove && currentSystem.saves.size() > minSaves:
			currentSystem.saves.remove(saveID)
		return i

func loadFile(dir,exists=false):
	var newFile = File.new()
	if !exists:
		if newFile.file_exists(dir):
			newFile.open(dir,File.READ)
			return newFile.get_var()
			newFile.close()
		else:
			return null
	elif exists:
		if newFile.file_exists(dir):
			return true
		else:
			return false

func saveFile(saveType=0,dir="user://customSave",contents=null):
	var newFile = File.new()
	if saveType == 0:
		newFile.open("user://_save"+str(currentSave+1),File.WRITE)
		newFile.store_var(currentSystem.saves[currentSave])
	elif saveType == 1:
		newFile.open(dir,File.WRITE)
		newFile.store_var(contents)
	elif saveType == 2:
		newFile.open("user://_settings")
	else:
		return "saveFile: 101"
	newFile.close()
