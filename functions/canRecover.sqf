 /*
 =============================== INFORMATION ===========================
  
 -- canRecover.sqf - This function tests to see conditions are suitable for a recovery operation in an addAction. Declared as function in config.cpp (fatLurch_fnc_canRecover)
  
 -- By Fat_Lurch (fat.lurch@gmail.com) for ARMA 3
 -- Created: 2019-12-25
 -- Last Edit: 2020-01-06
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
_boatArray = _helo getVariable ["boatArray", []];
_boatCoords  = _helo getVariable ["boatCoords", [nil, nil]];
_recover = _helo getVariable ["recover", false];

_boatCount = [_helo] call fatLurch_fnc_countBoats;

([_veh] call fatLurch_fnc_isBoat) && (_boatCount < count _boatCoords) && (_recover) &&(isNil{_boatArray select (count _boatArray)})                                               