/*
 * Bigfoot's Heli Crash - Initialization Script
 * 
 * Updated & Maintained by: sko & Ghost PGM DEV TEAM
 * 
 * This script initializes the heli crash spawner and sets up recurring maintenance tasks.
 * 
 * 1. Spawns heli wrecks with loot crates based on defined settings.
 * 2. Handles marker cleanup and player detection for notifications.
 * 3. Uses configurable parameters from `config.sqf`.
 *
 * Configurable Variables:
 * - BH_count_HeliCrash              // Number of wrecks to spawn
 * - BH_locations_center             // Map center for wreck spawning
 * - BH_locations_distance_min       // Minimum spawn distance from center
 * - BH_locations_distance_max       // Maximum spawn distance from center
 * - BH_class_wreckage               // List of possible wreck models
 * - BH_class_crate                  // List of possible crate types
 * - BH_loot_itemCargo               // Loot items configuration
 * - BH_loot_count_poptabs_seed      // Pop-tab reward configuration
 * - BH_debug_logCrateFill           // Enable/disable logging of crate loot
 * - BH_player_showCrateClaimMessage // Enable/disable global crate claim messages
 * - BH_player_showCrateClaimMessageRadius // Player proximity required for claim message
 */

if (!isServer) exitWith {};

"Starting initialization..." call ExileServer_BigfootsHeliCrash_util_logCommand;

// Spawns helicopter wrecks with loot crates at server start
[
    BH_count_HeliCrash,             // Number of wrecks to spawn
    [ 
        BH_locations_center,         // Center position for spawn selection
        BH_locations_distance_min,   // Minimum distance from center
        BH_locations_distance_max    // Maximum distance from center
    ], 
    BH_class_wreckage,              // Wreckage object class names
    BH_class_crate,                 // Crate object class names
    BH_loot_itemCargo,              // Loot contents for crates
    BH_loot_count_poptabs_seed,     // Pop-tabs reward settings
    BH_debug_logCrateFill           // Enable logging of loot crate contents (true/false)
] call ExileServer_BigfootsHeliCrash_spawnHeliCrashCommand;

// Handles marker cleanup and player detection for claim messages
uiSleep 5; // TODO: 15 - Is a longer delay needed here?
[
    10, 
    ExileServer_BigfootsHeliCrash_maintainHeliCrashCommand, 
    [
        BH_count_HeliCrash, 
        BH_player_showCrateClaimMessageRadius,
        BH_player_showCrateClaimMessage
    ], 
    true
] call ExileServer_system_thread_addTask;

"Finished initialization." call ExileServer_BigfootsHeliCrash_util_logCommand;

// Broadcast a system message to all players that the heli crash system is initialized
["systemChatRequest", ["Bigfoot's Heli Crash Initialized"]] call ExileServer_system_network_send_broadcast;

true;


/*
 * This file is subject to the terms and conditions defined in
 * file 'LICENSE.txt', which is part of this source code package.


if (!isServer) exitWith {};

"Starting initialization..." call ExileServer_BigfootsHeliCrash_util_logCommand;

// Spawns shipwrecks with loot crates at server start
[
    BH_count_HeliCrash,             // Wreck count
    [ // Positioning (center, min, max)
        BH_locations_center,
        BH_locations_distance_min,
        BH_locations_distance_max
    ], 
    BH_class_wreckage,             // Wreckage class
    BH_class_crate,                // Crate class
    BH_loot_itemCargo,             // Crate cargo
    BH_loot_count_poptabs_seed,    // Crate poptabs seed (generated random poptab amount)
    BH_debug_logCrateFill          // Enable logging of items added to crate (true/false)
] call ExileServer_BigfootsHeliCrash_spawnHeliCrashCommand;

// Handles marker cleanup and player detection
uiSleep 5;                         // TODO: 15 is this needed?
[
    10, 
    ExileServer_BigfootsHeliCrash_maintainHeliCrashCommand, 
    [
        BH_count_HeliCrash, 
        BH_player_showCrateClaimMessageRadius,
        BH_player_showCrateClaimMessage
    ], 
    true
] call ExileServer_system_thread_addTask;

"Finished initialization." call ExileServer_BigfootsHeliCrash_util_logCommand;

["systemChatRequest", ["Bigfoot's Heli Crash Initialized"]] call ExileServer_system_network_send_broadcast;

true;
*/
