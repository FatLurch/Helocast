 /*
 =============================== INFORMATION ===========================
  
 -- unloadBoat.sqf - This function logistically unloads a boat from a helo. Declared as function in config.cpp (fatLurch_fnc_unloadBoat)
  
 -- By Fat_Lurch (fat.lurch@gmail.com) for ARMA 3
 -- Created: 2019-12-26
 -- Last Edit: 2019-12-26
 -- Parameters: [helo] - helo to unload boat from
 -- Returns: Nothing

 -- Usage:
 
[helo] call fatLurch_fnc_unloadBoat;

 ================================== START ==============================
*/

_helo = _this select 0;

_boat = _helo getVariable "boat";
_boatPos = _helo getpos [7, getDir _helo -90];

[_boat, false] remoteExec ["allowDamage",0, true];
detach _boat;
[_boat, false] remoteExec ["lock", owner _boat, true];	

_boat setPosASL [_boatPos select 0, _boatPos select 1, ((getPosASL _helo) select 2)+0.15];

playSound3D ["a3\sounds_f\vehicles\boat\noises\light_metal_boat_crash_armor_02.wss", _boat, false, getPosASL _boat, 3];

_helo setvariable ["boat",nil, true];
sleep 0.5;
[_boat, true] remoteExec ["allowDamage",0];