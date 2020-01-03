 /*
 =============================== INFORMATION ===========================

  -- helocast.sqf - This function initiates the helocast. Declared as function in config.cpp (fatLurch_fnc_helocast)
  
 -- By Fat_Lurch (fat.lurch@gmail.com) for ARMA 3
 -- Created: 2019-02-23
 -- Last Edit: 2020-01-03
 -- Returns: Nothing

 -- Usage:
 
[helo]call fatLurch_fnc_helocast;
[helo]spawn fatLurch_fnc_helocast; ***(Required if not called from addAction)***

 ================================== START ==============================
*/
diag_log text "*** helocast ***";

params["_helo"];	//jumpers can be "group" or "all", _jumpingBoats is the *desired* number of boats to helocast
_jumpPlan = _helo getVariable "jumpPlan";

diag_log text format["_helo: %1", _helo];
diag_log text format["_jumpPlan: %1", _jumpPlan];

diag_log text format["count: %1", count _jumpPlan];
for "_i" from 0 to count(_jumpPlan) do 

{
	
	if(_i==count(_jumpPlan)) exitWith{};
	
	diag_log text format["_i: %1", _i-1];
	
	if(_i>0) then 
	{
		[_helo, _helo getVariable "boatArray" select 0] call fatLurch_fnc_moveBoat;
		sleep 1 + random 0.2;
	};
	
	//build variables
	_boat = (_jumpPlan select _i) select 0;
	_jumpers =(_jumpPlan select _i) select 1;
	diag_log text format["_boat: %1", _boat];
	diag_log text format["_jumpers: %1", _jumpers];	

	//eject boat
	[_helo, _boat]call fatLurch_fnc_ejectBoat;
	sleep 1 + random 0.2;
	
	//eject jumpers
	{
		
		if (vehicle _x == _helo) then
		{
			//conditional exists so jumpers who have already jumped aren't tallied multiple times
			[_helo, _x] remoteExec ["fatLurch_fnc_eject", 0, true];
			sleep 1 + random 0.4;
		};
	} forEach _jumpers;

};

[_helo] call fatLurch_fnc_lightOff;
[_helo] remoteExec ["fatLurch_fnc_lightOff", 0, true];

sleep 1 + random 2;

_altitude = _helo getVariable["altitude", 50];

[_helo, 500] remoteExec ["limitSpeed",owner _helo];
[_helo, _altitude] remoteExec ["flyInHeight",owner _helo];

/*
{
	if(group driver _helo != group _x) then 
	//Reset Animation State
	{
		[_x, ""] remoteExec ["switchMove", owner _x];
            	_x playMove "";
		sleep 0.7+random 0.4;
	};

} forEach jumpers;	//have all of the non-aircrew exit the helo
*/

[_helo, "close"] call fatLurch_fnc_rampDoor;




