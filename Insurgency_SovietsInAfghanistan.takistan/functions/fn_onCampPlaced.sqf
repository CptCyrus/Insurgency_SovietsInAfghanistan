//-- KiloSwiss
params ["_unit", "_object"];

if
(
	hasInterface &&
	{ isMultiplayer } &&
	{ local _unit } &&
	{ _object isKindOf "Camping_base_F" }
)
then
{
	[_unit, _object] remoteExec ["KS_fnc_updateCampUsers", 2];
};