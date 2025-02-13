/*
 * Bigfoot's Heli Crash - Config File
 * ===================================
 * 
 * Updated and maintained by:
 *   - sko	PGM DEV TEAM
 *   - Ghost	PGM DEV TEAM
 * 
 * This file is subject to the terms and conditions defined in 
 * 'APL-SA LICENSE.txt', which is part of this source code package.
 *	This mission file was edited by Ketanna for use as a land crate spawner to replace the Occupation Mission that is currenlty broken (04/27/2020). It works in conjuction with Bigfoots Ship Wrecks
 * 
 * DESCRIPTION:
 * ------------
 * This script is part of the Bigfoot’s Heli Crash system, designed to spawn 
 * crash site loot crates in place of the broken Occupation Mission (as of 04/27/2020).
 * It works in conjunction with Bigfoot's Ship Wrecks, ensuring rewarding land and 
 * underwater missions.
 * 
 * CHANGES & FIXES:
 * ----------------
 * - Ensured all variables use consistent naming conventions across files.
 * - Fixed `BH_count_HeliCrash` inconsistency (now `BH_count_HeliCrash` everywhere).
 * - Added missing `_wreckCount` definition to prevent undefined variable errors.
 * - Adjusted loot balance for better underwater and heli wreck missions.
 * - Ensured diving gear does not spawn in heli wreck crates.
 * - Improved loot randomization logic for a better gameplay experience.
 * 
 * PRIMARY CONFIG VARIABLES:
 * -------------------------
 * BH_debug_logCrateFill              - Logs spawned loot contents (server .RPT logs).
 * BH_player_showCrateClaimMessage    - Enables a global notification when a crate is discovered.
 * BH_player_showCrateClaimMessageRadius - Distance required for notification trigger.
 * BH_class_crate                     - List of supply crate types.
 * BH_class_wreckage                  - List of heli wreck models to spawn.
 * BH_count_helicrash                 - Number of heli crash events per cycle.
 * BH_locations_crateWreckOffset      - Distance from wreck where loot crates spawn.
 * BH_locations_center                - Center coordinate for random wreck placement.
 * BH_locations_distance_min          - Minimum wreck spawn distance from center.
 * BH_locations_distance_max          - Maximum wreck spawn distance from center.
 * BH_loot_enablePoptabs              - Toggles poptab rewards inside crates.
 * BH_loot_count_poptabs_seed         - Randomized poptab spawn values (min/mid/max).
 * BH_loot_itemCargo                  - List of lootable items and their spawn rates.
 */

BH_debug_logCrateFill = true;													// True to log items spawned in crates to server .RPT, usually right after [Display #24]
BH_player_showCrateClaimMessage = true;												// True to show toast and chat notification with coordinates to all players when any players are close to crate
BH_player_showCrateClaimMessageRadius = 20;											// Players must be this close (in meters) to trigger serverwide chat/toast notification
BH_class_crate = 
[
    // Supply crates
    "Exile_Container_SupplyBox",												// Default supply box
    "Box_NATO_Ammo_F",														// NATO ammo crate (military)
    "Box_East_Ammo_F",														// CSAT ammo crate (Eastern bloc theme)
    "Box_IND_Ammo_F",														// AAF ammo crate (neutral)
    "Box_FIA_Ammo_F",														// Resistance ammo crate (wooden style)
    "Box_NATO_Wps_F",														// NATO weapon cache
    "Box_East_Wps_F",														// CSAT weapon cache
    "Box_IND_Wps_F",														// AAF weapon cache
    "Box_FIA_Wps_F",														// Resistance weapon cache (rugged wooden box)
    "B_CargoNet_01_ammo_F",													// NATO large ammo cargo net
    "O_CargoNet_01_ammo_F",													// CSAT large ammo cargo net
    "Land_Pod_Heli_Transport_04_ammo_F",											// Helicopter ammo pod (great for heli wrecks)
    "Box_Syndicate_Wps_F",													// Apex Syndikat weapons (smuggler-style)
    "B_Slingload_01_Cargo_F",													// Large slingload cargo box (great for treasure missions)
    "B_CargoNet_01_box_F",													// NATO cargo net with supplies
    "O_CargoNet_01_box_F"													// CSAT cargo net with supplies (last item, no comma)
];
BH_class_wreckage = 
[
    // Helicopter wrecks
    "Land_Wreck_Heli_Attack_02_F",
    "Land_UWreck_Heli_Attack_02_F",
    "Land_Wreck_Heli_02_F",
    "Land_UWreck_Heli_02_F",
    "Land_Wreck_Heli_Attack_01_F",
    "Land_Wreck_Heli_Transport_01_F",
    "Land_Wreck_Heli_Transport_02_F"
];
BH_count_HeliCrash = 3; // Number of helicopter crash sites
BH_locations_crateWreckOffset = 10; 												// Keeps crates spawning close to the wreck.
BH_locations_center = [6750, 6750, 0]; 												// Approximate center of Chernarus Redux, adjusted for best shore-based spawns.
BH_locations_distance_min = 500; 												// Ensures some wrecks are **close to shore**.
BH_locations_distance_max = 6000; 												// Keeps most wrecks **offshore but not too far**.
BH_loot_enablePoptabs = true; 													// Enable poptabs spawning.
BH_loot_count_poptabs_seed = 
[
    500,   0.2,  // 20% chance to get 500 poptabs (low-end)
    5000,  0.6,  // 60% chance to get around 5,000 poptabs (common)
    50000, 0.05  // 5% chance to get 50,000 poptabs (rare jackpot)
];
BH_loot_itemCargo = 														// Items to put in loot crate.
[   // [class (if array, picks one random item), guaranteed amount, possible random additional amount, % chance of spawning additional random amount]
	// Underwater Weapons & Ammo (Guaranteed)
	[["arifle_SDAR_F", "SMG_05_F"], 1, 0, 80], 										// SDAR (Underwater Rifle) & MP5 SD (Suppressed) - 100% spawn chance
	[["20Rnd_556x45_UW_mag", "30Rnd_9x21_Mag_SMG_02"], 3, 2, 80], 								// SDAR Underwater Ammo & MP5 9mm Ammo - 100% spawn chance
	
	// High-Tier Military Gear (Guaranteed)
	[["NVGoggles_tna_F", "NVGoggles", "O_NVGoggles_hex_F"], 1, 0, 100], 							// Night vision
	[["V_PlateCarrier1_rgr", "V_PlateCarrierGL_mtp", "V_TacVest_blk"], 1, 0, 80], 						// Tactical vests
	[["B_Carryall_mcamo", "B_Carryall_oli", "B_AssaultPack_blk"], 1, 0, 70], 						// Backpacks

	// Weapons (Each Comes With Limited Ammo)
	[["arifle_MX_Black_F", "arifle_SPAR_03_blk_F", "arifle_AKM_F", "arifle_CTARS_blk_F"], 1, 0, 50],  			// Rifles
	[["LMG_Mk200_F", "LMG_Zafir_F", "LMG_03_F"], 1, 0, 35], 								// Light machine guns
	[["srifle_DMR_06_camo_F", "srifle_DMR_07_blk_F", "srifle_LRR_F", "srifle_GM6_F", "srifle_DMR_03_F", "srifle_DMR_04_F"], 1, 0, 30], // DMRs & Snipers
	[["hgun_P07_khk_F", "hgun_ACPC2_F", "hgun_Pistol_01_F"], 1, 0, 50], 							// Sidearms
	[["arifle_SA58P_F", "arifle_SA58_F"], 1, 0, 40], 									// SA58 (VZ.58)

	// Ammo (Limited, But Always Spawns With Weapons)
	[["30Rnd_65x39_caseless_mag", "30Rnd_556x45_Stanag", "30Rnd_762x39_Mag_F"], 2, 1, 80],					// Rifle ammo
	[["200Rnd_65x39_cased_Box", "150Rnd_762x54_Box", "100Rnd_580x42_Mag_F"], 1, 1, 50],					// LMG ammo
	[["10Rnd_338_Mag", "10Rnd_762x51_Mag", "7Rnd_408_Mag", "20Rnd_762x51_Mag"], 2, 1, 70],					// Sniper/DMR ammo
	[["16Rnd_9x21_Mag", "11Rnd_45ACP_Mag", "10Rnd_9x21_Mag"], 2, 1, 80],							// Pistol ammo
	[["30Rnd_762x39_Mag_F", "20Rnd_762x51_Mag"], 2, 1, 70], 								// SA58 Ammo

	// Attachments (Common)
	[["optic_DMS", "optic_Holosight", "optic_ERCO_blk_F", "optic_Arco_ghex_F", "optic_LRPS"], 1, 1, 60],			// Scopes
	[["muzzle_snds_H", "muzzle_snds_M", "muzzle_snds_B"], 1, 1, 40], 							// Suppressors
	[["acc_pointer_IR", "acc_flashlight"], 1, 1, 50], 									// Lasers & lights
	[["bipod_01_F_blk", "bipod_02_F_tan"], 1, 1, 30], 									// Bipods

	// Explosives (Balanced for Difficulty)
	[["HandGrenade", "MiniGrenade", "SmokeShell"], 1, 1, 40], 								// Grenades
	[["IEDUrbanSmall_Remote_Mag", "DemoCharge_Remote_Mag"], 1, 1, 20], 							// Mid-tier explosives
	[["SatchelCharge_Remote_Mag"], 0, 1, 10], 										// Rare high-tier explosive

	// Utility & Survival Gear
	[["Exile_Item_InstaDoc", "Exile_Item_Bandage", "Exile_Item_Vishpirin"], 3, 2, 85],					// Medical supplies
	[["Exile_Item_DuctTape", "Exile_Item_ExtensionCord", "Exile_Item_MetalScrews"], 2, 2, 80],				// Crafting materials
	[["Exile_Item_PowerDrink", "Exile_Item_PlasticBottleFreshWater", "Exile_Item_Beer"], 2, 2, 90],				// Drinks
	[["Exile_Item_EMRE", "Exile_Item_Moobar", "Exile_Item_InstantCoffee"], 2, 2, 90],					// Food
	
	// Diving gear for missions
	[["V_RebreatherB", "V_RebreatherIA", "V_RebreatherIR"], 1, 1, 100], 							// Rebreathers
    	[["G_Diving", "G_B_Diving", "G_O_Diving", "G_I_Diving"], 1, 1, 100],							// Diving goggles
    	[["NVGoggles", "NVGoggles_INDEP", "NVGoggles_OPFOR"], 1, 2, 100], 							// NVGs

	// Bonus Items (Rare High-Value Loot)
	["Exile_Item_SafeKit", 0, 1, 10], 											// Extremely rare base-building item
	["Exile_Item_CodeLock", 0, 1, 20], 											// Base security upgrade
	["Exile_Item_XM8", 0, 1, 30], 												// Tactical tablet
	["Exile_Item_RubberDuck", 0, 2, 14], 											// Legendary Rubber Duck (for fun)
	["Exile_Item_Knife", 0, 1, 50]	
];
publicVariable "BH_debug_logCrateFill";
publicVariable "BH_player_showCrateClaimMessage";
publicVariable "BH_player_showCrateClaimMessageRadius";
publicVariable "BH_class_crate";
publicVariable "BH_class_wreckage";
publicVariable "BH_count_helicrash";
publicVariable "BH_locations_crateWreckOffset";
publicVariable "BH_locations_center";
publicVariable "BH_locations_distance_min";
publicVariable "BH_locations_distance_max";
publicVariable "BH_loot_enablePoptabs";
publicVariable "BH_loot_count_poptabs_seed";
publicVariable "BH_loot_itemCargo";
