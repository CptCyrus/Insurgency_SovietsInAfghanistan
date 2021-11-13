call compile preprocessFile "staticData.sqf";
if(isServer) then {

    // -------------------------------------------------------------------------------------------------------------
    // override default data 
    // see script/staticData.sqf
    ["MISSION INIT - Waiting"] call ALIVE_fnc_dump;

    waitUntil {!isNil "ALiVE_STATIC_DATA_LOADED"};

    ["MISSION INIT - Continue"] call ALIVE_fnc_dump;

    // override static data settings
 
            // Mil logistics convoy transport vehicles per faction

           [ALIVE_factionDefaultTransport, "UK3CB_CW_SOV_O_EARLY", ["UK3CB_CW_SOV_O_EARLY_Zil131_Covered","UK3CB_CW_SOV_O_EARLY_Ural","UK3CB_CW_SOV_O_EARLY_Kraz255_Open"]] call ALIVE_fnc_hashSet;

           // Mil logistics air transport vehicles per faction

           [ALIVE_factionDefaultAirTransport, "UK3CB_CW_SOV_O_EARLY", ["UK3CB_CW_SOV_O_EARLY_Mi8AMT","UK3CB_CW_SOV_O_EARLY_Mi8"]] call ALIVE_fnc_hashSet;

           // Mil logistics airdrop containers per faction

           [ALIVE_factionDefaultContainers, "UK3CB_CW_SOV_O_EARLY", ["UK3CB_AK47_Equipbox_Opfor","CargoNet_01_box_F"]] call ALIVE_fnc_hashSet;

    ["MISSION INIT - Static data override loaded"] call ALIVE_fnc_dump;
    // -------------------------------------------------------------------------------------------------------------
_result = [] call ALIVE_fnc_markUnits;
};