// feather ignore all
/// @ignore
/// @param {Any} asset
function __LexiconGetAssetName(_asset) {
	switch(asset_get_type(_asset)) {
		case asset_sprite:
			return sprite_get_name(_asset);
		case asset_object:
			return object_get_name(_asset);
		case asset_sound:
			return audio_get_name(_asset);
		case asset_font:
			return font_get_name(_asset);
		case asset_room:
			return room_get_name(_asset);
		case asset_shader:
			return shader_get_name(_asset);
		default:
			return "unknown";
	}
}