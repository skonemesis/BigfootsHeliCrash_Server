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
