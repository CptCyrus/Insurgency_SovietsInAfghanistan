//-- KiloSwiss
params [ ["_player", player, [objNull]], ["_oldUnit", objNull, [objNull]] ];

if
(
	hasInterface &&
	{ isMultiplayer } &&
	{ getNumber( missionConfigFile >> "respawnCampMode" ) > 0 }
)
then
{
	{
		private _ehID = _x getVariable ["EHID_tentAssembled", -1];
		
		if ( _ehID > -1 ) then
		{
			_x removeEventHandler ["WeaponAssembled", _ehID];
			_x setVariable ["EHID_tentAssembled", nil];
		};
		
		if ( isPlayer _x ) then
		{
			_ehID = _x addEventHandler ["WeaponAssembled",
			{
				_this call KS_fnc_onCampPlaced;
			}];
			_x setVariable ["EHID_tentAssembled", _ehID];
		};	
	} forEach ( _this -[objNull] );
};