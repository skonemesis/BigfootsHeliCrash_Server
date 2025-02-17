/*
 * Bigfoot's Heli Wrecks - Spawn Water Helicopter Wrecks Command
 * Updated by: sko & Ghost PGM DEV TEAM (Modified by AI Commander Support)
 * 
 * This script spawns helicopter wrecks in water at random locations within set configuration ranges.
 *
 * Key Features:
 * - Spawns only in water (using `surfaceIsWater`).
 * - Uses helicopter wreck models.
 * - Logs process for debugging.
 *
 * Configurable Variables (Defined in config.sqf):
 * - BS_count_heliwrecks: Number of helicopter wrecks to spawn.
 * - BS_locations_center: Center position for wreck spawn area.
 * - BS_locations_distance_min: Minimum spawn distance from the center.
 * - BS_locations_distance_max: Maximum spawn distance from the center.
 * - BS_class_heli_wreckage: List of possible helicopter wreck types.
 */

if (!isServer) exitWith {};

private ["_wreckagePosition", "_wreck", "_wreckType"];

// Log function start
["Starting Water Helicopter Wreck Spawn Process..."] call ExileServer_BigfootsShipwrecks_util_logCommand;

// Ensure the wreck count variable is defined correctly
private _wreckCount = BS_count_heliwrecks;

// Validate wreck count before proceeding
if (isNil "_wreckCount" || { _wreckCount <= 0 }) exitWith 
{
    ["ERROR: Invalid wreck count! Check `BS_count_heliwrecks` in config.sqf"] call ExileServer_BigfootsShipwrecks_util_logCommand;
};

// Loop to spawn wrecks
for "_i" from 1 to _wreckCount do
{
    private _isValidPos = false;
    
    while { !_isValidPos } do {
        _wreckagePosition = [BS_locations_center, BS_locations_distance_min, BS_locations_distance_max, 0, 0, 10, 0] call BIS_fnc_findSafePos;

        // Validate spawn position (ensure it is in water)
        if (count _wreckagePosition > 0 && { surfaceIsWater _wreckagePosition }) then {
            _isValidPos = true;
        };
    };

    _wreckType = selectRandom BS_class_heli_wreckage;
    _wreck = createVehicle [_wreckType, _wreckagePosition, [], 0, "NONE"];
    _wreck setVectorUp surfaceNormal _wreckagePosition;

    ["Spawned helicopter wreck: " + str _wreckType + " at " + str _wreckagePosition] call ExileServer_BigfootsShipwrecks_util_logCommand;

    // Optional: Add Divers Around the Wreck
    for "_j" from 1 to 3 do {
        private _diverPos = _wreckagePosition getPos [random 20, random 360];
        private _diver = createGroup west createUnit ["B_diver_F", _diverPos, [], 0, "FORM"];
        _diver setUnitPos "MIDDLE";
    };
};

["Finished spawning Water Helicopter Wrecks."] call ExileServer_BigfootsShipwrecks_util_logCommand;
