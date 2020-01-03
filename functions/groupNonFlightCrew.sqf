 /*
 =============================== INFORMATION ===========================
  
 -- groupNonFlightCrew.sqf - This function identifies which occupants in a helicopter are not flight crew. Declared as function in config.cpp (fatLurch_fnc_groupNonFlightCrew)
  
 -- By Fat_Lurch (fat.lurch@gmail.com) for ARMA 3
 -- Created: 2020-01-01
 -- Last Edit: 2020-01-01
 -- Parameters: [helo, unit] - the helo to evaluate, the unit who's group is being looked for
 -- Returns: Array of non flight crew that are in the unit's group

 -- Usage:
 
[helo, unit] call fatLurch_fnc_groupNonFlightCrew;

 ================================== START ==============================
*/
params["_helo", "_unit"];
groupArray=[];

cargoArray =[_helo] call fatLurch_fnc_nonFlightCrew;

{
	if(group _x == group _unit) then {groupArray pushBack _x};
}forEach cargoArray;

groupArray