 /*
 =============================== INFORMATION ===========================
  
 -- recoverCRRC.sqf - This function recovers a CRRC. Declared as function in config.cpp (fatLurch_fnc_recoverCRRC)
  
 -- By Fat_Lurch (fat.lurch@gmail.com) for ARMA 3
 -- Created: 2019-02-23
 -- Last Edit: 2020-01-01
 -- Parameters: [_helo, _caller] - the helo to configure for helocasting, the caller who initiated the action (e.g. player)
 -- Returns: Nothing

 -- Usage:
 
[_helo, _caller] call fatLurch_fnc_recoverCRRC;

 ================================== START ==============================
*/
params["_helo", "_caller"];
_boat = vehicle (_caller);
_boatIndex = count(_helo getVariable "boatCoords");	//This is always the count of positions defined in the AC recovery will happen in the aft-most position (indexes increment moving aft)

_tmpBoat = _helo getVariable "boat";
_tmpBoat set[_boatIndex, _boat];
_helo setvariable ["boat",_tmpBoat, true];

[_boat, _helo] remoteExec ["disableCollisionWith", owner _boat];	
[_boat, _helo] remoteExec ["disableCollisionWith", owner _helo];	//Needs to run on the owner of boat and helo

_coords = _helo getVariable["boatCoords", [0,0,0] select _boatIndex];

[_boat,  [_helo,_coords]] remoteExec ["attachto", owner _boat];

sleep 1;

{
	moveOut _x;
	_x setPos [0,0,0];	
	sleep 0.05;	//TODO: this is likely not needed/vestigial from troubleshooting
	[_x,  _helo] remoteExec ["moveInCargo", owner _x, true];
	_x moveInCargo _helo;	
	_x assignAsCargo _helo;
	sleep 0.4;
	
} forEach crew _boat;

[_boat, false] remoteExec ["engineOn", owner _boat, true];

_altitude = _helo getVariable["altitude", 50];
[_helo, _altitude] remoteExec ["flyInHeight", owner _helo, true];

[_helo, "close"] call fatLurch_fnc_rampDoor;

