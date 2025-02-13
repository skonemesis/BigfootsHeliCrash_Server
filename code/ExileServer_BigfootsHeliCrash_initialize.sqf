/*
 * This file is subject to the terms and conditions defined in
 * file 'LICENSE.txt', which is part of this source code package.
 */

if (!isServer) exitWith {};

"Starting initialization..." call ExileServer_BigfootsHeliCrash_util_logCommand;

// Spawns shipwrecks with loot crates at server start
[
    BH_count_HeliCrash, // Wreck count
    [ // Positioning (center, min, max)
        BH_locations_center,
        BH_locations_distance_min,
        BH_locations_distance_max
    ], 
    BH_class_wreckage, // Wreckage class
    BH_class_crate, // Crate class
    BH_loot_itemCargo, // Crate cargo
    BH_loot_count_poptabs_seed, // Crate poptabs seed (generated random poptab amount)
    BH_debug_logCrateFill // Enable logging of items added to crate (true/false)
] call ExileServer_BigfootsHeliCrash_spawnHeliCrashCommand;

// Handles marker cleanup and player detection
uiSleep 15; // TODO: is this needed?
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