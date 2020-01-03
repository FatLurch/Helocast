 /*
 =============================== INFORMATION ===========================

  -- moveBoat.sqf - Switches the position of a boat in a helo. Declared as function in config.cpp (fatLurch_fnc_moveBoat)
  
 -- By Fat_Lurch (fat.lurch@gmail.com) for ARMA 3
 -- Created: 2020-01-01
 -- Last Edit: 2020-01-03
 -- Parameters: [helo, boat] - the helo the boat is being mvoed in, the boat being moved in the helo
 -- Returns: Nothing

 -- Usage:
 
[helo, boat] call fatLurch_fnc_moveBoat;

 ================================== START ==============================
*/
params["_helo", "_boat"];

_boatArray = _helo getVariable ["boatArray", [nil,nil]];

if([_helo, _boat]call fatLurch_fnc_boatIndex == 0) then 
{
	//Boat is Forward - Move it Aft
	detach _boat;
	_boat attachTo [_helo, _helo getVariable "boatCoords" select 1];
	_boatArray set[0,nil];
	_boatArray set[1,_boat];
}
else
{
	//Boat is Aft - Move it Forward
	detach _boat;
	_boat attachTo [_helo, _helo getVariable "boatCoords" select 0];
	_boatArray set[1,nil];
	_boatArray set[0,_boat];
};
_helo setVariable["boatArray", _boatArray];


