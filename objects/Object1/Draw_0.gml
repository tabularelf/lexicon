var _globals = LexiconGlobalStructGet();
_globals.num += 0.01;
//_globals.playerName = choose("Juju", "nik", "TabularElf");

var _str = "";
_str += (LexiconUnique("foo.bar").Get()) + "\n";
_str += (LexiconUnique("rawr.uwu").Get()) + "\n";
_str += (LexiconUnique("rawr.uwu").Get()) + "\n";
_str += (LexiconUnique("rawr.uwu0").Get()) + "\n";
_str += (LexiconUnique("rawr.uwu1").Get()) + "\n";
_str += (LexiconUnique("rawr.uwu2").Get()) + "\n";
_str += (LexiconUnique("npc.alice.name").Get()) + "\n";
_str += (LexiconUnique("test.from.txt").Get()) + "\n";
_str += (LexiconUnique("testEntry").Get()) + "\n";
_str += (LexiconUnique("the.big.one2 {bar}", {bar: 69}).Get()) + "\n";
_str += $"Group: {group.GetStatic("start").Get()}" + "\n";
_str += $"Group: {group.GetStatic("unsure").Get()}" + "\n";

var _t = get_timer();
_str += (LexiconUnique("text.test").Get()) + "\n";
draw_text(200, 100, (get_timer() - _t) / 1000);

_str += LexiconEntryGetText("text.test");

draw_text(8, 24, _str);

draw_set_font(LexiconFontGet("default", undefined, function(_font) {
	return font_get_name(_font) == "fnt_japanese";	
}));

//LexiconFontCacheFlush();

draw_sprite(LexiconGetAsset(spr_a), 0, 100, 100);