/* 
 Whether hot reloading should be enabled or not. 
 This will attempt to hot reload files every time they have been changed.
 If sandbox is disabled, an error will be thrown. Unless it's exported or ran on a non-desktop platform.
 Default: true
*/
#macro __LEXICON_HOT_RELOAD_ENABLED true
/* 
 Whether hot reloading should be allowed on export. This mainly applies to desktop applications.
 Default: false
*/
#macro __LEXICON_HOT_RELOAD_ALLOW_ON_EXPORT false
/* 
 How many seconds before Lexicon will scan existing files and attempt to soft reload language entries.
 Default: 2
*/
#macro __LEXICON_HOT_RELOAD_FILE_WATCH_UPDATE_SECONDS 2
/* 
 How many frames should Lexicon sleep for before firing off the garbage collector.
 As each and every text element is stored as a weak reference elsewhere for refreshing, Lexicon needs
 to periodically clear these out.
 Default: 1
*/
#macro __LEXICON_HOT_RELOAD_GC_FRAMES 1
/* 
 The max amount of time in milliseconds Lexicon should spend on processing 
 the garbage collector for dead text element references.
 Default: 200
*/
#macro __LEXICON_HOT_RELOAD_GC_MAX_TIME_MS 200