 /*
 =============================== INFORMATION ===========================

  -- boatIndex.sqf - This function returns the boat index of a boat in a helo. Declared as function in config.cpp (fatLurch_fnc_boatIndex)
  
 -- By Fat_Lurch (fat.lurch@gmail.com) for ARMA 3
 -- Created: 2020-01-02
 -- Last Edit: 2020-01-03
 -- Parameters: helo the boat is in, boat being evaluated
 -- Returns: Index of the boat in the helo

 -- Usage:
 
[helo, boat]call fatLurch_fnc_boatIndex;


 ================================== START ==============================
*/

params["_helo", "_boat"];

_boatArray = _helo getVariable ["boatArray", [nil,nil]];

_boatIndex=-1;

if(_boatArray select 0 == _boat) then {_boatIndex = 0;};
if(_boatArray select 1 == _boat) then {_boatIndex = 1;};

_boatIndex