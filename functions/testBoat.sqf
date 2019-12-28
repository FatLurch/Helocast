 /*
 =============================== INFORMATION ===========================

  -- testBoat.sqf - This function is used for testing the placement of CRRCs inside helicopters. It is not intended to work in MP. It assumes the cursorTarget of the player is the target helicopter. Declared as function in config.cpp (fatLurch_fnc_testBoat)
  
 -- By Fat_Lurch (fat.lurch@gmail.com) for ARMA 3
 -- Created: 2019-12-27
 -- Last Edit: 2019-12-27
 -- Parameters: Array of boat coordinates relative to the target helicopter center
 -- Returns: Nothing

 -- Usage:
 
[X,Y,Z]call fatLurch_fnc_testBoat;


 ================================== START ==============================
*/
_coords = _this;

if((typeName _coords != "ARRAY") || (count _coords != 3)) exitWith {hint "Bad input coords";};

if(!(newBoat isEqualTo objNull)) then {deleteVehicle newBoat};

newBoat = "B_Lifeboat" createVehicle[0,0,0];

newBoat attachTo [cursorTarget, _coords] ;

publicVariable "newBoat";

_data= format["%1 %2", _coords, typeOf cursorTarget];

copyToClipboard str _data;

hint str _data;