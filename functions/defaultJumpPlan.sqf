 /*
 =============================== INFORMATION ===========================

  -- defaultJumpPlan.sqf - This function assigns a default jump plan to a helo if one isn't already assigned. Declared as function in config.cpp (fatLurch_fnc_defaultJumpPlan)
  This function assumes that if no jump plan is assigned, all boats and jumpers are jumping at once
  
 -- By Fat_Lurch (fat.lurch@gmail.com) for ARMA 3
 -- Created: 2020-01-03
 -- Last Edit: 2020-01-05
 -- Parameters: Helo to be evaluated
 -- Returns: Nothing

 -- Usage:
 
[_helo]call fatLurch_fnc_defaultJumpPlan;

jumpPlan=[[boat1,  [jumpers1]],[boat2, [jumpers2]]]

 ================================== START ==============================
*/
diag_log text "*** defaultJumpPlan ***";

params["_helo"];

diag_log text format["_helo: %1", _helo];

_jumpPlan = _helo getVariable ["jumpPlan", []];

diag_log text format["_jumpPlan at start: %1", _jumpPlan];

if(count _jumpPlan > 0) exitWith{diag_log text "EXITING";};

_boatArray = _helo getVariable ["boatArray", nil];
_boatCount = [_helo] call fatLurch_fnc_countBoats;
_jumpers = [_helo] call fatLurch_fnc_nonFlightCrew;

diag_log text format["_boatArray: %1", _boatArray];
diag_log text format["_boatCount: %1", _boatCount];
diag_log text format["_jumpers: %1", _jumpers];

switch (_boatCount) do 
{
    	case 0: {_jumpPlan = [[nil,_jumpers]];};
    
	case 1: 
    	{
    		//1 boat in the aircraft
    		if(!isNil{_boatArray select 0}) then /*find where the boat is in the aircraft*/
    		{
    			_jumpPlan = [[_boatArray select 0, _jumpers]];
    		}
    		else 
    		{
    			_jumpPlan = [[_boatArray select 1, _jumpers]];
    		};
	};
	
    	case 2:
	{
		_jumpPlan = [[_boatArray select 1, _jumpers],[_boatArray select 0, nil]];
	};
};

_helo setVariable ["jumpPlan", _jumpPlan, true];



/*

boat=vehicle player getVariable "boatArray" select 1; 
boat2=vehicle player getVariable "boatArray" select 0;  
jumpers=[vehicle player, player] call fatLurch_fnc_groupNonFlightCrew;  
jumpers2=[vehicle player] call fatLurch_fnc_nonFlightCrew;  
jumpPlan = [[boat, jumpers],[boat2,jumpers2]];  
vehicle player setVariable ["jumpPlan", jumpPlan]; 
 
[CH47]spawn fatLurch_fnc_helocast;

*/