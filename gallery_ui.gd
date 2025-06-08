extends CanvasLayer

@onready var gallery_sprite: Sprite2D = $Control/Panel/Sprite2D


func get_viewport_texture() -> Texture2D:
	return get_viewport().get_texture()


func update_gallery( texture: Texture2D ) -> void:
	gallery_sprite.texture = texture
