 /*
 =============================== INFORMATION ===========================
  
 -- canRecover.sqf - This function tests to see conditions are suitable for a recovery operation in an addAction. Declared as function in config.cpp (fatLurch_fnc_canRecover)
  
 -- By Fat_Lurch (fat.lurch@gmail.com) for ARMA 3
 -- Created: 2019-12-25
 -- Last Edit: 2020-01-01
 -- Parameters: [_target, _this]
 	_target: addAction target (aka the helo)
 	_this: addAction caller (aka the player)
 -- Returns: Boolean

 -- Usage:
 
[_target, _this] call fatLurch_fnc_canRecover;

 ================================== START ==============================
*/
params["_helo", "_user"];
_veh = vehicle _user;

//([_veh] call fatLurch_fnc_isBoat) && (isNil {_helo getVariable 'boat'}) && ({_helo getVariable 'recover'})
([_veh] call fatLurch_fnc_isBoat) && (count (_helo getVariable "_boat")<count (_helo getVariable "_boatCoords")) && ({_helo getVariable 'recover'})
