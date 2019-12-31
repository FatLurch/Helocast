 /*
 =============================== INFORMATION ===========================

  -- addCRRC.sqf - This function adds a boat to a helo if conditions are suitable. Declared as function in config.cpp (fatLurch_fnc_addCRRC)
  
 -- By Fat_Lurch (fat.lurch@gmail.com) for ARMA 3
 -- Created: 2019-12-24
 -- Last Edit: 2019-12-28
 -- Parameters: [helo, boatType] - the helo to add the boat to, the classname of the boat to be spawned (Optional)
 -- Returns: Nothing

 -- Usage:
 
[helo, boatType] call fatLurch_fnc_addCRRC;

 ================================== START ==============================
*/
params["_helo", ["_boatType", "B_Boat_Transport_01_F"]];

_boatCoords=[];
/*
_helo = _this select 0;									
_boatType = "B_Boat_Transport_01_F";
if(!isNil (_this select 1)) then {_boatType = _this select 1};
*/

_hasBoat = (_helo) getVariable ["boat", false];

if ((!_hasBoat)&&(!isNil {_helo getVariable "boatCoords";})) then
{
	boat =  _boatType createVehicle [0,0,0];
	boat attachTo [_helo, _helo getVariable "boatCoords"]; 
	_helo setvariable ["boat",boat, true];		//associate the specific boat being used with the helo for use in other scripts
	[boat, true] remoteExec ["lock", owner boat, true];	
};

[boat, _helo] remoteExec ["disableCollisionWith", boat, true];	
[_helo, boat] remoteExec ["disableCollisionWith", _helo, true];	//Needs to run on the owner of boat and helo