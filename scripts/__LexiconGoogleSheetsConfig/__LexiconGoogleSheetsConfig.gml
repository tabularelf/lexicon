/*
	Whether periodic file updates should occur every so often.
	Note: You may manually call LexiconGSUpdate()
	Default: true
*/
#macro __LEXICON_GOOGLE_SHEETS_PERIODIC_UPDATE true
/*
	If periodic file updates are enabled, how long between updates.
	Default: 10
*/
#macro __LEXICON_GOOGLE_SHEETS_PERIODIC_UPDATE_TIME_SECONDS 10
/*
	Whether Lexicon Google Sheets is available in production. 
	Note: LexiconGSDeclare() will call LexiconIndexDeclareFromFile() if disabled in production builds.
	Default: false
*/
#macro __LEXICON_GOOGLE_SHEETS_ALLOW_IN_PRODUCTION false