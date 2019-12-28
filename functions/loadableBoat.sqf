 /*
 =============================== INFORMATION ===========================
  
 -- loadableBoat.sqf - This function returns the closest, appropriate boat that's suitable to be logistically loaded into a helo within 10 meters. Declared as function in config.cpp (fatLurch_fnc_loadableBoat)
  
 -- By Fat_Lurch (fat.lurch@gmail.com) for ARMA 3
 -- Created: 2019-12-26
 -- Last Edit: 2019-12-26
 -- Parameters: [helo] - the helo to search relative to
 -- Returns: Array [boolean if boat found, boat]

 -- Usage:
 
[helo] call fatLurch_fnc_loadableBoat;

 -- Conditions Evaluated:
 	-helo engine off
 	-boat engine off
 	-there's a suitable boat nearby via isBoat function
 	-the helo doesn't already have a boat
 	-helo alive
 	-boat alive
 	-no crew in boat

 ================================== START ==============================
*/

_helo = _this select 0;

if(count nearestObjects[_helo, ["Rubber_duck_base_F"], 10] == 0) exitWith{[false, ""];};

_nearestBoat = (nearestObjects[_helo, ["Rubber_duck_base_F"], 10]) select 0;

if((!isEngineOn _helo) && (!isEngineOn _nearestBoat) && ([_nearestBoat] call fatLurch_fnc_isBoat) &&(isNil {_helo getVariable 'boat'}) && (alive _nearestBoat) && (alive _helo) && (count crew _nearestBoat==0)) then
{
	[true, _nearestBoat];
}
else
{
	[false, ""];
};