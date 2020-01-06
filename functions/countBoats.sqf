 /*
 =============================== INFORMATION ===========================

  -- countBoats.sqf - This function assigns a default jump plan to a helo if one isn't already assigned. Declared as function in config.cpp (fatLurch_fnc_countBoats)
  This function assumes that if no jump plan is assigned, all boats and jumpers are jumping at once
  
 -- By Fat_Lurch (fat.lurch@gmail.com) for ARMA 3
 -- Created: 2020-01-05
 -- Last Edit: 2020-01-05
 -- Parameters: Helo to be evaluated
 -- Returns: Number of boats in the helo

 -- Usage:
 
[_helo]call fatLurch_fnc_countBoats;

 ================================== START ==============================
*/

params["_helo"];

_boatArray = _helo getVariable["boatArray", [nil,nil]];
_boatArray = _boatArray arrayIntersect _boatArray;
count _boatArray;



