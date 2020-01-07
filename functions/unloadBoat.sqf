 /*
 =============================== INFORMATION ===========================
  
 -- unloadBoat.sqf - This function logistically unloads a boat from a helo. Declared as function in config.cpp (fatLurch_fnc_unloadBoat)
  
 -- By Fat_Lurch (fat.lurch@gmail.com) for ARMA 3
 -- Created: 2019-12-26
 -- Last Edit: 2020-01-05
 -- Parameters: [helo, boat, unloadCoords[distance, relative heading]] - helo to unload boat from, boat to unload, distance from helo to unload, relative heading from aircraft to unload
 -- Returns: Nothing

 -- Usage:
 
[helo, boat, unloadCoords[distance, relative heading]] call fatLurch_fnc_unloadBoat;

 ================================== START ==============================
*/

params["_helo", "_boat", ["_unloadCoords", [7, -90]]];

_boatPos = _helo getpos [_unloadCoords select 0, (getDir _helo) + (_unloadCoords select 1)];

[_boat, false] remoteExec ["allowDamage",0, true];
detach _boat;
[_boat, false] remoteExec ["lock", owner _boat, true];	
_boat setVariable ["inHelo", false, true];

_boatCount = _helo getVariable "boatCount";
_boatCount = _boatCount-1;
_helo setVariable["boatCount", _boatCount, true];

_boat setPosASL [_boatPos select 0, _boatPos select 1, ((getPosASL _helo) select 2)+0.15];

playSound3D ["a3\sounds_f\vehicles\boat\noises\light_metal_boat_crash_armor_02.wss", _boat, false, getPosASL _boat, 3];

_boatArray = _helo getVariable["boatArray", [nil, nil]];
_boatIndex = [_helo, _boat]call fatLurch_fnc_boatIndex;
_boatArray set [_boatIndex, nil];

_tmpBoat = _helo getVariable "boat";
_tmpBoat set[_boatIndex, nil];
_helo setvariable ["boat",_tmpBoat, true];
[_boat, true] remoteExec ["allowDamage",0];