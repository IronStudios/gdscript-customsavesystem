extends Node

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
var currentSave = -1

func _ready():
	if !customSaveSystem:
		if loadFile(mainDir+"main",true):
			currentSystem = loadFile(mainDir+"main")
		else:
			saveFile(currentSystem,mainDir+"main")
	elif customSaveSystem:
		pass # "Custom Save System" goes here <
	loaded = true

# [ Types ]
# 0. Variable (get_var)
# 1. Text (get_as_text)

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

func loadFile(dir,exists=false,type=0):
	var newFile = File.new()
	if !exists:
		if newFile.file_exists(dir):
			newFile.open(dir,File.READ)
			if type == 0:
				return newFile.get_var()
			if type == 1:
				return newFile.get_as_text()
			newFile.close()
		else:
			return null
	if exists:
		if newFile.file_exists(dir):
			return true
		else:
			return false

func saveFile(contents,dir,type=0):
	var newFile = File.new()
	newFile.open(dir,File.WRITE)
	newFile.store_var(contents)
	newFile.close()
