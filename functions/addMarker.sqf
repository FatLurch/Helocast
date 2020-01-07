 /*
 =============================== INFORMATION ===========================

  -- addMarker.sqf - This function adds a marker to a boat. The type of marker can be controlled by the markerType variable on the boat. Declared as function in config.cpp (fatLurch_fnc_addMarker)
  
 -- By Fat_Lurch (fat.lurch@gmail.com) for ARMA 3
 -- Created: 2020-01-01
 -- Last Edit: 2020-01-05
 -- Returns: Nothing
 -- Parameters: _boat

 -- Usage:
 
[_boat]call fatLurch_fnc_addMarker;

 ================================== START ==============================
*/
params["_boat"];
_markerType = _boat getVariable["markerType", "chemlight_green"];

_marker = createSimpleObject [_markerType, [0,0,0]]; 
_marker attachTo [_boat, [0,0.1,1.21], "drivingwheel"];
_marker setVectorDirAndUp [[0,0.5,0.1],[0,0,1]];
_boat setVariable ["marker", _marker, true];
