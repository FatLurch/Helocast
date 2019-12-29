 /*
 =============================== INFORMATION ===========================

  -- rampDoor.sqf - This function handles ramp and door operations on a helo. It checks to see if there are appropriate ramps for the helo and then opens or closes them. Declared as function in config.cpp (fatLurch_fnc_rampDoor)
  
 -- By Fat_Lurch (fat.lurch@gmail.com) for ARMA 3
 -- Created: 2019-12-28
 -- Last Edit: 2019-12-28
 -- Parameters: helo, "open" or "close"
 -- Returns: Nothing

 -- Usage:
 
[helo, "open"] call fatLurch_fnc_rampDoor;
[helo, "close"] call fatLurch_fnc_rampDoor;

 ================================== START ==============================
*/
_kill=false;
helo = _this select 0;
_op = toLower(_this select 1);

inv = helo getVariable["rampInvert", false];//Most aircraft use 1 for open, 0 for close. Some are inverted


//Logic for determining if the ramp needs to be sent a 0 or 1 for animation based on the intended operation and if that aircraft's animation is "backwards" ala the A2 MH-47 ports
switch (_op) do 
{
	case "open": 
	{
		if(inv) then {rampOp=0;} else {rampOp=1;};
	};
	
	
	case "close":
	{
		if(inv) then {rampOp=1;} else {rampOp=0;};
	};
    
	default {_kill=true};	
};

if(_kill)exitWith {diag_log text format["Helocast Debug - bad input command to fatLurch_fnc_rampDoor: %1 - Should be 'open' or 'close'", _op];};


if(count(helo getVariable "ramp") > 0) then	
{
	_ramp = helo getVariable "ramp";
	{
		helo animate [_x, rampOp];
		helo animateDoor [_x, rampOp];
	} forEach _ramp;
};