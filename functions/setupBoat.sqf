 /*
 =============================== INFORMATION ===========================
  
 -- recoverCRRC.sqf - This function creates an addAction on boats allowing users to remove an attached marker. Declared as function in config.cpp (fatLurch_fnc_setupBoat)
  
 -- By Fat_Lurch (fat.lurch@gmail.com) for ARMA 3
 -- Created: 2019-12-25
 -- Last Edit: 2019-12-25
 -- Parameters: [boat] - the boat to create the addAction for
 -- Returns: Nothing

 -- Usage:
 
[boat] call fatLurch_fnc_setupBoat;

 ================================== START ==============================
*/

if (!isDedicated && !isServer) exitwith {};

_boat = _this;

[_boat, ["Remove marker", "call fatlurch_fnc_removeMarker",nil,10, false, false, "","(!isNil {_target getVariable 'marker'})", 2]] remoteExec ["addAction",0, true];
