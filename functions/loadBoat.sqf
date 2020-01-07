 /*
 =============================== INFORMATION ===========================
  
 -- loadBoat.sqf - This function logistically loads the selected boat into a helo. Declared as function in config.cpp (fatLurch_fnc_loadBoat)
  
 -- By Fat_Lurch (fat.lurch@gmail.com) for ARMA 3
 -- Created: 2019-12-26
 -- Last Edit: 2020-01-06
 -- Parameters: [helo, _boat, _boatIndex] - helo to load into, index of where the boat is going (optional)
 -- Returns: Nothing

 -- Usage:
 
[helo, _boat, _boatIndex] call fatLurch_fnc_loadBoat;

 ================================== START ==============================
*/

params["_helo", "_boat", ["_boatIndex", 0]];

_boatArray = [];
_boatArray = _helo getVariable ["boatArray", [nil,nil]];

_boatArray set[_boatIndex, _boat];
_helo setvariable ["boatArray",_boatArray, true];
_boat setVariable ["inHelo", true, true];

_tmpCoords = _helo getVariable "boatCoords";
_coords = _tmpCoords select _boatIndex;

[_boat, _helo] remoteExec ["disableCollisionWith", owner _boat];	
[_boat, _helo] remoteExec ["disableCollisionWith", owner _helo];	//Needs to run on the owner of boat and helo

//TODO Add code to reference array of assault boats (ref array "in" command)
_helo addEventHandler ["HandleDamage", {if (_boat iskindof 'Rubber_duck_base_F') then { 0; } else { _this select 2; };}];		//disable damage from assaultboats

[_boat,  [_helo,_coords]] remoteExec ["attachto", owner _boat];
[_boat, true] remoteExec ["lock", owner _boat, true];	

playSound3D ["a3\sounds_f\vehicles\boat\noises\light_metal_boat_crash_armor_02.wss", _boat, false, getPosASL _boat, 3];

