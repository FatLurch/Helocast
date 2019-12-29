 /*
 =============================== INFORMATION ===========================

  -- prepHelocast.sqf - This function commands an AI helo to set flight parameters that are suitable for helocasting. Declared as function in config.cpp (fatLurch_fnc_prepHelocast)
  
 -- By Fat_Lurch (fat.lurch@gmail.com) for ARMA 3
 -- Created: 2019-02-23
 -- Last Edit: 2019-12-28
 -- Parameters: None
 -- Returns: Nothing

 -- Usage:
 
call fatLurch_fnc_prepHelocast;

 ================================== START ==============================
*/

_helo =_this select 0;

_altOffset = _helo getVariable["altOffset", 0];

//Add conditional here to use decel function or the commands below
[_helo, 8] remoteExec ["limitSpeed",_helo];
[_helo, 6 + _altOffset] remoteExec ["flyInHeight",_helo];	//Some of the CUP assets seem to be REALLY far from the intended altitudes

[_helo, "open"] call fatLurch_fnc_rampDoor;

_helo setVariable ["readyHelocast", true, true];

_helo setVariable ["altitude", getPosATL _helo select 2];

[_helo] call fatLurch_fnc_lightOn;
[_helo] remoteExec ["fatLurch_fnc_lightOn", 0, true];

