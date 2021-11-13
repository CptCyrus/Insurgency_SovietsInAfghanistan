params ["_campMaster", "_campObject"];

if
(
	isServer &&
	{ isRemoteExecuted } &&
	{ isPlayer _campMaster } &&
	{ _campObject isKindOf "Camping_base_F" } &&
	{ owner _campMaster isEqualTo remoteExecutedOwner }
)
then
{
	private _respawnCampMode = getNumber( missionConfigFile >> "respawnCampMode" );
	if ( _respawnCampMode > 0 ) then
	{
		private _campUsers = _campObject getVariable ["BIS_fnc_respawnBackpack_users", []];
		if ( _campUsers isEqualTo [] ) exitWith {};

		private _cfgCamp = configFile >> "CfgVehicles" >> typeOf _campObject;
		private _campSide = side group _campMaster;
		private _marker = format ["respawn_%1%2", _campSide, _campObject];		
		
		private _allOthers = switch ( _respawnCampMode ) do
		{
			default { [] };
			case 1: { ( units group _campMaster ) -_campUsers };
			case 2: { ( allPlayers -_campUsers ) select { [side group _x, _campSide] call BIS_fnc_areFriendly } };
			//case 3: { ( allPlayers -_campUsers ) };
		};
		if ( _allOthers isEqualTo [] ) exitWith {};
		
		_campObject setVariable ["BIS_fnc_respawnBackpack_users", _campUsers +_allOthers];
		["localmarker", [_campObject, _campMaster, _marker, false]] remoteExec ["BIS_fnc_respawnBackpack", _allOthers];
	};
};