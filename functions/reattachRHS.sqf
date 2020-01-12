 /*
 =============================== INFORMATION ===========================
  
 -- reattachRHS.sqf - This function "defeats" the unattach RHS issues when a ramp is opened as part of their cargo system for boats being helocast. Declared as function in config.cpp (fatLurch_fnc_reattachRHS
  
 -- By Fat_Lurch (fat.lurch@gmail.com) for ARMA 3
 -- Created: 2020-01-11
 -- Last Edit: 2020-01-11
 -- Parameters: [_helo] - The helo where the reattach needs to happen
 -- Returns: Nothing

 -- Usage:
 
[_helo] call fatLurch_fnc_reattachRHS;

 ================================== START ==============================
*/

params["_helo"];

//rhsArray=["RHS_CH_47F_10","RHS_CH_47F_light","RHS_CH_47F","rhsusf_CH53E_USMC","rhsusf_CH53E_USMC_D"];
//if(!(typeOf _helo in rhsArray)) exitWith{};

if(!alive _helo) exitWith {};

_boatArray = _helo getVariable ["boatArray", [nil, nil]];	//Array of boats in the _helo
_boatCoords = _helo getVariable "boatCoords";	//Array of boat locations in the aircraft

_boatArray = _boatArray arrayIntersect _boatArray;	//trim the nil values in _boatArray

{
	_boatIndex = [_helo, _x] call fatLurch_fnc_boatIndex;	//Determine which position in the _helo the boat is supposed to be stored in
	_x attachTo [_helo, _boatCoords select _boatIndex];	//attach to the original coordinates
}forEach _boatArray;

sleep 0.1;

[_helo] spawn fatLurch_fnc_reattachRHS;