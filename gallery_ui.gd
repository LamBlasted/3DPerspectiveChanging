extends CanvasLayer

const MAX_PHOTOS = 20

@onready var gallery_sprite: TextureRect = $Control/GridContainer/PhotoPanel/PhotoTexture
@onready var photo_grid: GridContainer = $Control/GridContainer

var photo_panel_scene = preload("res://photo_panel.tscn") 
var photo_index = 0
var photo_count = 0


func update_gallery(texture: Texture2D) -> void:
	if photo_count >= MAX_PHOTOS:
		print("Gallery is full!")
		return
	
	var photo_panel = photo_panel_scene.instantiate()
	var texture_rect = photo_panel.get_node("PhotoTexture") as TextureRect
	texture_rect.texture = texture
	photo_grid.add_child(photo_panel)
	
	photo_count += 1
