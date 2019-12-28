 /*
 =============================== INFORMATION ===========================
  
 -- lightOn.sqf - This function attempts to switch on the cabin lights in an RHS helo. Declared as function in config.cpp (fatLurch_fnc_lightOn)
  
 -- By Fat_Lurch (fat.lurch@gmail.com) for ARMA 3
 -- Created: 2019-12-26
 -- Last Edit: 2019-12-26
 -- Parameters: [helo] - helo to switch lights on
 -- Returns: Nothing

 -- Usage:
 
[helo] call fatLurch_fnc_lightOn;

 ================================== START ==============================
*/

_veh = _this select 0;

_veh animateSource ["cargolights_hide",0,true];
(_veh turretUnit [0]) action ["searchlightOn",_veh];