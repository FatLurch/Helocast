 /*
 =============================== INFORMATION ===========================
  
 -- loadableBoat.sqf - This function returns the closest, appropriate boat that's suitable to be logistically loaded into a helo within 10 meters. Declared as function in config.cpp (fatLurch_fnc_loadableBoat)
  
 -- By Fat_Lurch (fat.lurch@gmail.com) for ARMA 3
 -- Created: 2019-12-26
 -- Last Edit: 2020-01-05
 -- Parameters: [helo] - the helo to search relative to
 -- Returns: Array [boolean if boat found, array of boats]

 -- Usage:
 
[helo] call fatLurch_fnc_loadableBoat;

 -- Conditions Evaluated:
 	-helo engine off
 	-boat engine off
 	-there's a suitable boat nearby via isBoat function
 	-helo alive
 	-boat alive
 	-no crew in boat
 	-Room on the helicopter for another boat

 ================================== START ==============================
*/

params["_helo"];

if(count nearestObjects[_helo, ["Rubber_duck_base_F"], 10] == 0) exitWith{[false, []]};

_boatCount = _helo getVariable["boatCount", 0];
_boatCoords = _helo getVariable "boatCoords";
_boatCoordsCount = count _boatCoords;

if(!(_boatCount<_boatCoordsCount)) exitWith {[false, []]};

acceptableBoats=[];

_nearBoats = (nearestObjects[_helo, ["Rubber_duck_base_F"], 10]);


{
	_inHelo = _x getVariable["inHelo", false];
	if((!isEngineOn _helo) && (!isEngineOn _x) && ([_x] call fatLurch_fnc_isBoat) && (alive _x) && (alive _helo) && (count crew _x==0) && (! _inHelo)) then
	{
		acceptableBoats pushBack _x;
	};
}forEach _nearBoats;

_return = [true, acceptableBoats];
_return


