 /*
 =============================== INFORMATION ===========================
  
 -- unloadBoat.sqf - This function logistically unloads a boat from a helo. Declared as function in config.cpp (fatLurch_fnc_unloadBoat)
  
 -- By Fat_Lurch (fat.lurch@gmail.com) for ARMA 3
 -- Created: 2019-12-26
 -- Last Edit: 2020-01-01
 -- Parameters: [helo, _boatIndex] - helo to unload boat from, index of the boat in the AC
 -- Returns: Nothing

 -- Usage:
 
[helo, _boatIndex] call fatLurch_fnc_unloadBoat;

 ================================== START ==============================
*/
params["_helo", ["_boatIndex",0]];

_boat = _helo getVariable "boat" select _boatIndex;
_boatPos = _helo getpos [7, getDir _helo -90];

[_boat, false] remoteExec ["allowDamage",0, true];
detach _boat;
[_boat, false] remoteExec ["lock", owner _boat, true];	

_boat setPosASL [_boatPos select 0, _boatPos select 1, ((getPosASL _helo) select 2)+0.15];

playSound3D ["a3\sounds_f\vehicles\boat\noises\light_metal_boat_crash_armor_02.wss", _boat, false, getPosASL _boat, 3];

_tmpBoat = _helo getVariable "boat";
_tmpBoat set[_boatIndex, nil];
_helo setvariable ["boat",_tmpBoat, true];
sleep 0.5;
[_boat, true] remoteExec ["allowDamage",0];