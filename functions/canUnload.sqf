 /*
 =============================== INFORMATION ===========================
  
 -- canUnload.sqf - This function performs a logical check to see if a boat can be unloaded. Declared as function in config.cpp (fatLurch_fnc_canUnload)
  
 -- By Fat_Lurch (fat.lurch@gmail.com) for ARMA 3
 -- Created: 2019-12-26
 -- Last Edit: 2020-01-05
 -- Parameters: [_target, _this] _target is the helo and _this is the caller in an addAction
 -- Returns: boolean (TRUE = OK to unload)

 -- Usage:
 
[_target, _this] call fatLurch_fnc_canUnload;
//Where _target is the helo and _this is the caller in an addAction

 -- Conditions Evaluated:
 	-helo has a boat
 	-caller isn't in the helo
 	-helo engine is off

 ================================== START ==============================
*/
_helo = _this select 0;
_caller = _this select 1;

_boatCount = _helo getVariable["boatCount", 0];

((_boatCount > 0) && (vehicle _caller == _caller) && (!isEngineOn _helo))

