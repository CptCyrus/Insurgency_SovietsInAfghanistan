if (!isServer) exitWith {};
 
waitUntil {!isNil "ALiVE_STATIC_DATA_LOADED"};
 
/*
 * Mil logistics convoy transport vehicles per faction
 */
 
[ALIVE_factionDefaultTransport, "UK3CB_CW_SOV_O_EARLY", ["UK3CB_CW_SOV_O_EARLY_Zil131_Covered","UK3CB_CW_SOV_O_EARLY_Ural","UK3CB_CW_SOV_O_EARLY_Kraz255_Open"]] call ALIVE_fnc_hashSet;

 
/*
 * Mil logistics air transport vehicles per faction
 */
 
[ALIVE_factionDefaultAirTransport, "UK3CB_CW_SOV_O_EARLY", ["UK3CB_CW_SOV_O_EARLY_Mi8AMT","UK3CB_CW_SOV_O_EARLY_Mi8"]] call ALIVE_fnc_hashSet;


/*
 * auto generated tasks
 */

ALIVE_autoGeneratedTasks = ["MilAssault","MilDefence","CivAssault","Assassination","DestroyVehicles","DestroyInfantry","SabotageBuilding","InsurgencyPatrol","InsurgencyDestroyAssets","Rescue","CSAR"];