 /*
 =============================== INFORMATION ===========================

  -- addCRRC.sqf - This function adds a boat to a helo if conditions are suitable. Declared as function in config.cpp (fatLurch_fnc_addCRRC)
  
 -- By Fat_Lurch (fat.lurch@gmail.com) for ARMA 3
 -- Created: 2019-12-24
 -- Last Edit: 2020-01-03
 -- Parameters: [helo, boatType, _boatIndex] - the helo to add the boat to, the classname of the boat to be spawned (Optional)
 -- Returns: Nothing

 -- Usage:
 
[helo, boatType, _boatIndex] call fatLurch_fnc_addCRRC;

 ================================== START ==============================
*/

params["_helo", ["_boatType", "B_Boat_Transport_01_F"], ["_boatIndex",0]];

_boatCoords=_helo getVariable "boatCoords";
_boatArray = _helo getVariable ["boatArray", [nil,nil]];

if ((isNil{_boatArray select _boatIndex})&&(!isNil{_boatCoords select _boatIndex})) then
{
	boat = _boatType createVehicle [0,0,0];
	boat attachTo [_helo, _boatCoords select _boatIndex]; 
	_boatArray set[_boatIndex, boat];
	_helo setVariable ["boatArray", _boatArray];
	[boat, true] remoteExec ["lock", owner boat, true];	
};

[boat, _helo] remoteExecCall ["disableCollisionWith", 0, boat];
[_helo, boat] remoteExecCall ["disableCollisionWith", 0, _helo];