class_name GalleryPageUI extends CanvasLayer

const MAX_PHOTOS = 12

@onready var gallery_sprite: TextureRect = $LogPage/GridContainer/PhotoPanel/PhotoTexture
@onready var photo_grid: GridContainer = $LogPage/GridContainer
@onready var log_page: Control = $LogPage
@onready var cover_page: Control = $CoverPage


var photo_panel_scene = preload("res://photo_panel.tscn") 
var photo_index = 0
var photo_count = 0


func _ready():
	show_cover()

func show_cover():
	cover_page.visible = true
	log_page.visible = false

func show_log():
	cover_page.visible = false
	log_page.visible = true

func cover_page_to_01() -> void:
	show_log()

func _01_to_cover_page() -> void:
	show_cover()

func update_gallery(texture: Texture2D) -> void:
	if photo_count >= MAX_PHOTOS:
		print("Gallery is full!")
		return
	
	var photo_panel = photo_panel_scene.instantiate()
	var texture_rect = photo_panel.get_node("PhotoTexture") as TextureRect
	texture_rect.texture = texture
	photo_grid.add_child(photo_panel)
	
	photo_count += 1
