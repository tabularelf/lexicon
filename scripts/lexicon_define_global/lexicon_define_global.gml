// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function lexicon_define_global(_name, _func) {
	static _global = __lexicon_init();
	_global.dynamicMap[$ _name] = _func;
}