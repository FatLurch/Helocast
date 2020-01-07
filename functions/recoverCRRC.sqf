 /*
 =============================== INFORMATION ===========================
  
 -- recoverCRRC.sqf - This function recovers a CRRC. Declared as function in config.cpp (fatLurch_fnc_recoverCRRC)
  
 -- By Fat_Lurch (fat.lurch@gmail.com) for ARMA 3
 -- Created: 2019-02-23
 -- Last Edit: 2020-01-06
 -- Parameters: [_helo, _caller] - the helo to configure for helocasting, the caller who initiated the action (e.g. player)
 -- Returns: Nothing

 -- Usage:
 
[_helo, _caller] call fatLurch_fnc_recoverCRRC;

 ================================== START ==============================
*/
params["_helo", "_caller"];
_boat = vehicle (_caller);
_boatArray = _helo getVariable ["boatArray", [nil,nil]];
_boatCoords = _helo getVariable "boatCoords";
_aftPositionIndex = (count _boatCoords) -1;

[_boat, _helo] remoteExec ["disableCollisionWith", _boat];	
[_boat, _helo] remoteExec ["disableCollisionWith", _helo];	//Needs to run on the owner of boat and helo

_pos = _boatCoords select _aftPositionIndex;

_boat attachTo [_helo, _pos]; 

sleep 1;

{
	moveOut _x;
	_x setPos [0,0,0];	
	[_x,  _helo] remoteExec ["moveInCargo", owner _x, true];
	_x moveInCargo _helo;	
	_x assignAsCargo _helo;
	sleep 0.3 + random 0.2;
	
} forEach crew _boat;

[_boat, false] remoteExec ["engineOn", owner _boat, true];

_altitude = _helo getVariable["altitude", 50];
[_helo, _altitude] remoteExec ["flyInHeight", owner _helo, true];


[_helo, "close"] call fatLurch_fnc_rampDoor;
[_helo] remoteExec ["fatLurch_fnc_lightOff", 0, true];

if (_aftPositionIndex ==1 && isNil{_boatArray select 0}) then 
{
	//Boat was recovered aft and there's room to slide it up
	[_helo, _boat] call fatLurch_fnc_moveBoat;
	_boatArray set[0, _boat];	//Note the boat was stored forward
};

if (_aftPositionIndex ==1 && !isNil{_boatArray select 0}) then 
{
	//Boat was recovered aft and there's NO room to slide it up
	_boatArray set[1, _boat];	//Note the boat was stored aft
};

if (_aftPositionIndex ==0) then 
{
	//Single position aircraft
	_boatArray set[0, _boat];	//Note the boat was stored forward
};


	_helo setvariable ["boatArray",_boatArray, true];

