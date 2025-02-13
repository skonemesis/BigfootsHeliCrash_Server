/*
 * This file is subject to the terms and conditions defined in
 * file 'APL-SA LICENSE.txt', which is part of this source code package.
 */

"PostInit started..." call ExileServer_BigfootsHeliCrash_util_logCommand;

call compile preprocessFileLineNumbers "BigfootsHeliCrash_Server\config.sqf";

[] call ExileServer_BigfootsHeliCrash_initialize;

"PostInit finished" call ExileServer_BigfootsHeliCrash_util_logCommand;