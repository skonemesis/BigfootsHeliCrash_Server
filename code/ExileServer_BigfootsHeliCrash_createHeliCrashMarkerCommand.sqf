/*
 * This file is subject to the terms and conditions defined in
 * file 'APL-SA LICENSE.txt', which is part of this source code package.
 */

private ["_marker", "_markerId", "_markerPosition", "_markerText"];

// Extract parameters passed to the script
_markerId = _this select 0;
_markerPosition = _this select 1;
_markerText = _this select 2;

// Debugging: Show the values of the passed parameters in a hint box
hint format ["Debug - Marker ID: %1\nPosition: %2\nText: %3", _markerId, _markerPosition, _markerText];

// Create the marker at the specified position
_marker = createMarker [_markerId, _markerPosition];

// Set the marker properties
_marker setMarkerShape "ICON";
_marker setMarkerType "c_air";        // Type of marker (e.g., air)
_marker setMarkerColor "ColorGreen";  // Marker color (could also be "ColorOrange", "ColorRed", etc.)
_marker setMarkerText _markerText;  	// Set the text for the marker
