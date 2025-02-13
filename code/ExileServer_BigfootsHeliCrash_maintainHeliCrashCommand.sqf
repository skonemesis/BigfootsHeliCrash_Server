/*
 * Bigfoot's Heli Crash - Spawn & Maintain Wreck Events
 * Updated by: sko & Ghost PGM DEV TEAM
 * 
 * This script checks for active heli crash sites and removes markers when players enter the area.
 * It also broadcasts notifications when a crate has been found.
 */

if (!isServer) exitWith {};

// Define private variables
private["_coords", "_countWrecks", "_crateClaimMessageRadius", "_i", "_isPlayerInRange", "_markerId", "_markerPosition", "_message", "_showCrateClaimMessage"];

// Extract parameters passed into the function
_countWrecks = _this select 0;                    // Number of heli crashes to track
_crateClaimMessageRadius = _this select 1;        // Radius in meters to check for players near a crate
_showCrateClaimMessage = _this select 2;          // Boolean: Show notification when a crate is found?

// Loop through all active heli crash sites
for "_i" from 1 to BH_count_HeliCrash do
{
    // Get marker ID associated with the current wreck index
    _markerId = _i call ExileServer_BigfootsHeliCrash_getWreckIdForSpawnCountIndexQuery;
    _markerPosition = getMarkerPos _markerId;

    // Ensure the marker position is valid before proceeding
    if (!isNil "_markerPosition") then 
    {
        // Check if any player is within the specified radius of the wreck
        _isPlayerInRange = [_markerPosition, _crateClaimMessageRadius] call ExileClient_util_world_isAlivePlayerInRange;

        if (_isPlayerInRange) then 
        {
            // Log that the crate was found
            format["Crate found by Allies at [%1].", _markerPosition] call ExileServer_BigfootsHeliCrash_util_logCommand;

            // Remove the marker to indicate the crate has been recovered
            deleteMarker _markerId;

            // If enabled, notify all players that the crate has been found
            if (_showCrateClaimMessage) then 
            {
                _coords = mapGridPosition _markerPosition;
                _message = format ["Allies have recovered the crashed crate from coordinates %1.", _coords];

                // Send notification to clients
                ["Info", "Heli Crash loot found!", _message] call ExileServer_BigfootsHeliCrash_sendClientNotificationCommand;

                // Broadcast message to all players
                ["systemChatRequest", [_message]] call ExileServer_system_network_send_broadcast;
            };  
        };
    };
};


/*
if (!isServer) exitWith {};

private["_coords", "_countWrecks", "_crateClaimMessageRadius", "_i", "_isPlayerInRange", "_markerId", "_markerPosition", "_message", "_showCrateClaimMessage"];

_countWrecks = _this select 0;
_crateClaimMessageRadius = _this select 1;
_showCrateClaimMessage = _this select 2;

// (testing below) for "_i" from 1 to _countWrecks do
for "_i" from 1 to BH_count_HeliCrash do
{
	_markerId = _i call ExileServer_BigfootsHeliCrash_getWreckIdForSpawnCountIndexQuery;
	_markerPosition = getMarkerPos _markerId;

	if(!isNil "_markerPosition") then 
	{
		_isPlayerInRange = [_markerPosition, _crateClaimMessageRadius] call ExileClient_util_world_isAlivePlayerInRange;

		if (_isPlayerInRange) then 
		{
			format["Crate found by Allies at [%1].", _markerPosition] call ExileServer_BigfootsHeliCrash_util_logCommand;

			deleteMarker _markerId;

			if (_showCrateClaimMessage) then 
			{
				_coords = mapGridPosition _markerPosition;
				_message = format ["Allies have recovered the crashed crate from coordinates %1.", _coords];

				["Info", "Heli Crash loot found!", _message] call ExileServer_BigfootsHeliCrash_sendClientNotificationCommand;
				["systemChatRequest", [_message]] call ExileServer_system_network_send_broadcast;
			};	
		};
	};
};						
*/
