extends Node2D

var itemsData: Dictionary

func _ready() -> void:
	itemsData = loadJSONData('res://data/ItemsData.json')

func loadJSONData(filePath: String):
	var jsonData
	var fileData = File.new()
	fileData.open(filePath, File.READ)
	jsonData = JSON.parse(fileData.get_as_text())
	fileData.close()

	return jsonData.result