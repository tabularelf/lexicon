# Google Sheets

Want to host your localisation as a Google Sheet for better collaboration, while syncing it up with your game files? Here is the plug-in for you!
Lexicon Google Sheets will out of the box periodically update localisation files by default, provided that `LexiconGSDeclare(...)` has been called at least once to said provided files. You can configure both how often and whether they should periodically update or not.

!> Google Sheets from the IDE requires the sandbox to be disabled, and requires hot reloading!

## Setup

0. Ensure that sandbox is disabled, if testing via desktop!
1. Ensure that your google sheet is viewable from the public.
2. Look at your URL `https://docs.google.com/spreadsheets/d/1asf3f4fqaf34f34/edit?gid=6009008#gid=6009008` and look for the sheet id (`1asf3f4fqaf34f34` for example) and sheet page id (`6009008` for example).
3. Call `LexiconGSDeclare(filename, sheetId, sheetPage);` where you normally load in your files.


## Functions
### `LexiconGSDeclare(filename, sheetId, sheetPage)`

<!-- tabs:start -->

#### **Description**
Returns: `N/A`.

| Name| Datatype| Purpose |
| ------------- | ------------- |------------- |
|`filename`|`String`|The name of the file to save & load as (in IDE), or to load only (in production).|
|`sheetId`|`String`|The sheet id to load from publicly.|
|`sheetPage`|`String`|The sheet page id to load from publicly.|

If this function is called while being ran from IDE, this will download to your projects datafiles & declare the file contents directly. And additionally, if `__LEXICON_GOOGLE_SHEETS_PERIODIC_UPDATE` is enabled, it will redownload the files to update them.

If this function is called while in production, it will just declare the file contents directly.

?> If this cannot be downloaded to the project files, it will instead be downloaded to a temporary location. On other platforms this may be `temp_directory + "./lexicon"`. Or in some rarer cases, just `".lexicon"`.

#### **Example**
```gml
LexiconGSDeclare("translations.csv", "1asf3f4fqaf34f34", "6009008");
```

<!-- tabs:end -->

## Functions
### `LexiconGSUpdate()`

<!-- tabs:start -->

#### **Description**
Returns: `N/A`.

| Name| Datatype| Purpose |
| ------------- | ------------- |------------- |
|`N/A`|||

Fetches all of the declared Google Sheet documents online and downloads them.

#### **Example**
```gml
if (keyboard_check_released(vk_space)) {
    LexiconGSUpdate();
}
```

<!-- tabs:end -->


## Config
|Name|Default Value|Purpose|
|---|---|---|
|`__LEXICON_GOOGLE_SHEETS_PERIODIC_UPDATE `|`true`| Whether periodic file updates should occur every so often. Note: You may manually call `LexiconGSUpdate()` if you prefer instead.|
|`__LEXICON_GOOGLE_SHEETS_PERIODIC_UPDATE_TIME_SECONDS `|`10`|If periodic file updates are enabled, how long between updates.|
|`__LEXICON_GOOGLE_SHEETS_ALLOW_IN_PRODUCTION`|`false`|Whether Lexicon Google Sheets should behave as if it were being tested from the IDE. Note: `LexiconGSDeclare(filename, sheetId, sheetPage)` will call `LexiconIndexDeclareFromFile(filename)` if disabled in production builds.|