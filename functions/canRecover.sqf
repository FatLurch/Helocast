 /*
 =============================== INFORMATION ===========================
  
 -- canRecover.sqf - This function tests to see conditions are suitable for a recovery operation in an addAction. Declared as function in config.cpp (fatLurch_fnc_canRecover)
  
 -- By Fat_Lurch (fat.lurch@gmail.com) for ARMA 3
 -- Created: 2019-12-25
 -- Last Edit: 2019-12-26
 -- Parameters: [_target, _this]
 	_target: addAction target (aka the helo)
 	_this: addAction caller (aka the player)
 -- Returns: Boolean

 -- Usage:
 
[_target, _this] call fatLurch_fnc_canRecover;

 ================================== START ==============================
*/

_helo = _this select 0;
_user = _this select 1;
_veh = vehicle _user;

([_veh] call fatLurch_fnc_isBoat) && (isNil {_helo getVariable 'boat'}) && ({_helo getVariable 'recover'})
