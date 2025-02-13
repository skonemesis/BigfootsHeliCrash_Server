/*
 * ExileServer_BigfootsHeliCrash_util_logCommand.sqf
 * 
 * This script logs information related to Bigfoot's Heli Crash spawns.
 * Ensures logging follows the setting in `BH_debug_logCrateFill`.
 *
 * Updated by: sko & Ghost PGM DEV TEAM
 */

params ["_logMessage"];

// Ensure logging is enabled before writing to the server RPT log
if (BH_debug_logCrateFill) then 
{
    diag_log format ["[BigfootsHeliCrash] %1", _logMessage];
};

/* testing above
 * This file is subject to the terms and conditions defined in
 * file 'APL-SA LICENSE.txt', which is part of this source code package.


private["_msg"];

_msg = format["Bigfoot'S Heli Crash (SERVER): %1",_this];
diag_log _msg;
*/
