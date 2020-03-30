 /*
 =============================== INFORMATION ===========================

  -- helocast.sqf - This function initiates the helocast. Declared as function in config.cpp (fatLurch_fnc_helocast)
  
 -- By Fat_Lurch (fat.lurch@gmail.com) for ARMA 3
 -- Created: 2019-02-23
 -- Last Edit: 2020-01-06
 -- Returns: Nothing

 -- Usage:
 
[helo]call fatLurch_fnc_helocast;
[helo]spawn fatLurch_fnc_helocast; ***(Required if not called from addAction)***

*** Assumes a jump plan being associated with the helo via the jumpPlan variable:
jumpPlan=[[boat1,  [jumpers1]],[boat2, [jumpers2]]]

 ================================== START ==============================
*/
params["_helo"];

[_helo]call fatLurch_fnc_defaultJumpPlan;	//If no jumpPlan is assigned to the vehicle, assume all boats and passengers are going at once

_jumpPlan = _helo getVariable "jumpPlan";	//jumpPlan is an array that controls who and what jumps - jumpPlan = [[boat_1, [jumpers_1]], [boat_n, [jumpers_n]]];
_boatCoords = _helo getVariable "boatCoords";

for "_i" from 0 to count(_jumpPlan) do 
{
	if(_i==count(_jumpPlan)) exitWith{};
	
	/*
	if(_i>0) then 
	{
		[_helo, _helo getVariable "boatArray" select 0] call fatLurch_fnc_moveBoat;
		sleep 1 + random 0.2;
	};
	*/
	
	//build variables
	_boat = (_jumpPlan select _i) select 0;
	_jumpers = (_jumpPlan select _i) select 1;

	

	//eject boat
	if([_helo, _boat] call fatLurch_fnc_boatIndex != count _boatCoords - 1) then {[_helo,_boat] call fatLurch_fnc_moveBoat};	//If boat isn't full aft, move it there - TODO - may make if(_i>0) then... obsolete
	[_helo, _boat]call fatLurch_fnc_ejectBoat;
	sleep 1 + random 0.2;
	
	//eject jumpers
	if(!isNil{_jumpers}) then 
	{
		{	
			
			if (vehicle _x == _helo) then	/*conditional exists so jumpers who have already jumped aren't transported back to the aircraft*/
			{		
				[_helo, _x] remoteExec ["fatLurch_fnc_eject", 0, true];
				sleep 1 + random 0.4;
			};
		} forEach _jumpers;
	};

};

[_helo] remoteExec ["fatLurch_fnc_lightOff", 0, true];

sleep 3 + random 2;

//Post-jump restore aircraft
_altitude = _helo getVariable["altitude", 50];
[_helo, 500] remoteExec ["limitSpeed",owner _helo];
[_helo, _altitude] remoteExec ["flyInHeight",owner _helo];
[_helo, "close"] call fatLurch_fnc_rampDoor;




