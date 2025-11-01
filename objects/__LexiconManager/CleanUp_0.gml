if (!__canDestroy) {
	__LexiconError($"\"{object_get_name(object_index)}\" was destroyed by accident!\nPlease make sure to avoid \"instance_destroy(number)\" and \"instance_destroy(all)\".\nAlso avoid turning off persistence on random instances!");
}