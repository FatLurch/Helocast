 /*
 =============================== INFORMATION ===========================
  
 -- nonFlightCrew.sqf - This function identifies which occupants in a helicopter are not flight crew. Declared as function in config.cpp (fatLurch_fnc_nonFlightCrew)
  
 -- By Fat_Lurch (fat.lurch@gmail.com) for ARMA 3
 -- Created: 2020-01-01
 -- Last Edit: 2020-01-01
 -- Parameters: [helo] - the helo to evaluate
 -- Returns: Array of non flight crew

 -- Usage:
 
[helo] call fatLurch_fnc_nonFlightCrew;

 ================================== START ==============================
*/

params["_helo"];

{
	if(_helo getCargoIndex _x > -1) then {cargoArray pushback _x};
}forEach crew _helo;

cargoArray