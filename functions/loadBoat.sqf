 /*
 =============================== INFORMATION ===========================
  
 -- loadBoat.sqf - This function logistically loads the nearest suitable boat into a helo. Declared as function in config.cpp (fatLurch_fnc_loadBoat)
  
 -- By Fat_Lurch (fat.lurch@gmail.com) for ARMA 3
 -- Created: 2019-12-26
 -- Last Edit: 2020-01-01
 -- Parameters: [helo, _boatIndex] - helo to load into, index of where the boat is going (optional)
 -- Returns: Nothing

 -- Usage:
 
[helo, _boatIndex] call fatLurch_fnc_loadBoat;

 ================================== START ==============================
*/
params["_helo", ["_boatIndex", 0]];

_boat=[_helo] call fatLurch_fnc_loadableBoat select 1;

_tmpBoat = _helo getVariable "boat";
_tmpBoat set[_boatIndex, _boat];
_helo setvariable ["boat",_tmpBoat, true];

_coords = _helo getVariable["boatCoords", [0,0,0] select _boatIndex];

[_boat, _helo] remoteExec ["disableCollisionWith", owner _boat];	
[_boat, _helo] remoteExec ["disableCollisionWith", owner _helo];	//Needs to run on the owner of boat and helo

//TODO Add code to reference array of assault boats (ref array "in" command)
_helo addEventHandler ["HandleDamage", {if (_boat iskindof 'Rubber_duck_base_F') then { 0; } else { _this select 2; };}];		//disable damage from assaultboats

[_boat,  [_helo,_coords]] remoteExec ["attachto", owner _boat];
[_boat, true] remoteExec ["lock", owner _boat, true];	

playSound3D ["a3\sounds_f\vehicles\boat\noises\light_metal_boat_crash_armor_02.wss", _boat, false, getPosASL _boat, 3];