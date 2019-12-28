 /*
 =============================== INFORMATION ===========================
  
 -- removeMarker.sqf - This function removes a marker on a boat as part of a user addAction configured in setupBoat. Declared as function in config.cpp (fatLurch_fnc_removeMarker)
  
 -- By Fat_Lurch (fat.lurch@gmail.com) for ARMA 3
 -- Created: 2019-12-25
 -- Last Edit: 2019-12-25
 -- Parameters: [boat] - the boat to remove the marker from
 -- Returns: Nothing

 -- Usage:
 
[boat] call fatLurch_fnc_removeMarker;

 ================================== START ==============================
*/

_boat = _this select 0;

if(!isNil {_boat getVariable "marker"}) then 
{
	_marker = _boat getVariable ["marker", nil];
	deleteVehicle _marker;
	_boat setVariable ["marker", nil, true];
};
