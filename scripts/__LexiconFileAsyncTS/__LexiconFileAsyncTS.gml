// feather ignore all
/// @ignore
function __LexiconFileAsyncTS() {
	static _global = __LexiconSystem();
	static _list = __LexiconFileAsyncList();

	if (_global.__gameRestarted) {
		__LexiconTrace("game_restart() was called. This may have consequences on loading languages.");
		_global.__gameRestarted = false;
	}

	if (!instance_exists(__LexiconManager)) {
		// Try activating
		instance_activate_object(__LexiconManager) {
			if (instance_exists(__LexiconManager)) {
				__LexiconError($"{nameof(__LexiconManager)} was deactivated by accident!\nPlease ensure to call \"instance_activate_object({nameof(__LexiconManager)})\" immmediately after deactivating all objects!");
				return;
			} else {
				if (!_global.__gameRestarted) {
					__LexiconError($"{nameof(__LexiconManager)} was destroyed by accident.\nDid you call \"instance_destroy(number)\" or \"instance_destroy(all)\" by mistake?");
					return;
				}
			}
		}
	}
}