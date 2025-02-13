/*
 * This file is subject to the terms and conditions defined in
 * file 'LICENSE.txt', which is part of this source code package.
 */
 
private["_code"];

{
    _code = compileFinal (preprocessFileLineNumbers (_x select 1));
    missionNamespace setVariable [(_x select 0), _code];
}
forEach
[
    ['ExileServer_BigfootsHeliCrash_addItemsToCrateCommand', 
        'BigfootsHeliCrash_Server\code\ExileServer_BigfootsHeliCrash_addItemsToCrateCommand.sqf'],
    ['ExileServer_BigfootsHeliCrash_addMoneyToCrateCommand', 
        'BigfootsHeliCrash_Server\code\ExileServer_BigfootsHeliCrash_addMoneyToCrateCommand.sqf'],
    ['ExileServer_BigfootsHeliCrash_createHeliCrashMarkerCommand', 
        'BigfootsHeliCrash_Server\code\ExileServer_BigfootsHeliCrash_createHeliCrashMarkerCommand.sqf'],
    ['ExileServer_BigfootsHeliCrash_getWreckIdForSpawnCountIndexQuery', 
        'BigfootsHeliCrash_Server\code\ExileServer_BigfootsHeliCrash_getWreckIdForSpawnCountIndexQuery.sqf'],
    ['ExileServer_BigfootsHeliCrash_initialize', 
        'BigfootsHeliCrash_Server\code\ExileServer_BigfootsHeliCrash_initialize.sqf'],
    ['ExileServer_BigfootsHeliCrash_maintainHeliCrashCommand', 
        'BigfootsHeliCrash_Server\code\ExileServer_BigfootsHeliCrash_maintainHeliCrashCommand.sqf'],
    ['ExileServer_BigfootsHeliCrash_sendClientNotificationCommand', 
        'BigfootsHeliCrash_Server\code\ExileServer_BigfootsHeliCrash_sendClientNotificationCommand.sqf'],
    ['ExileServer_BigfootsHeliCrash_setupCrateCommand',
        'BigfootsHeliCrash_Server\code\ExileServer_BigfootsHeliCrash_setupCrateCommand.sqf'],
    ['ExileServer_BigfootsHeliCrash_spawnHeliCrashCommand', 
        'BigfootsHeliCrash_Server\code\ExileServer_BigfootsHeliCrash_spawnHeliCrashCommand.sqf'],
    ['ExileServer_BigfootsHeliCrash_util_logCommand', 
        'BigfootsHeliCrash_Server\code\ExileServer_BigfootsHeliCrash_util_logCommand.sqf']
];

"PreInit finished" call ExileServer_BigfootsHeliCrash_util_logCommand;
