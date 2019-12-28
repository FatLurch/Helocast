 /*
 =============================== INFORMATION ===========================
  
 -- loadBoat.sqf - This function logistically loads the nearest suitable boat into a helo. Declared as function in config.cpp (fatLurch_fnc_loadBoat)
  
 -- By Fat_Lurch (fat.lurch@gmail.com) for ARMA 3
 -- Created: 2019-12-26
 -- Last Edit: 2019-12-26
 -- Parameters: [helo] - helo to load into 
 -- Returns: Nothing

 -- Usage:
 
[helo] call fatLurch_fnc_loadBoat;

 ================================== START ==============================
*/

_helo = _this select 0;

_boat=[_helo] call fatLurch_fnc_loadableBoat select 1;

_helo setvariable ["boat",_boat, true];

_coords = _helo getVariable["boatCoords", [0,0,0]];

[_boat, _helo] remoteExec ["disableCollisionWith", owner _boat];	
[_boat, _helo] remoteExec ["disableCollisionWith", owner _helo];	//Needs to run on the owner of boat and helo

//Add code to reference array of assault boats (ref array "in" command)
_helo addEventHandler ["HandleDamage", {if (_boat iskindof 'Rubber_duck_base_F') then { 0; } else { _this select 2; };}];		//disable damage from assaultboats

[_boat,  [_helo,_coords]] remoteExec ["attachto", owner _boat];
[_boat, true] remoteExec ["lock", owner _boat, true];	

playSound3D ["a3\sounds_f\vehicles\boat\noises\light_metal_boat_crash_armor_02.wss", _boat, false, getPosASL _boat, 3];