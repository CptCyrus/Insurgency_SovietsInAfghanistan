params ["_player", "_didJIP"];

if ( getNumber( missionConfigFile >> "respawnOnStart" ) isEqualTo -1 ) then
{
	[_player] call KS_fnc_campPlacedEH;
};



