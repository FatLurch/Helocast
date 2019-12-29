 /*
 =============================== INFORMATION ===========================

  -- cancelHelocast.sqf - This function commands an AI helo to stop using flight parameters that are suitable for helocasting. Declared as function in config.cpp (fatLurch_fnc_cancelHelocast)
  
 -- By Fat_Lurch (fat.lurch@gmail.com) for ARMA 3
 -- Created: 2019-02-23
 -- Last Edit: 2019-12-27
 -- Parameters: None
 -- Returns: Nothing

 -- Usage:
 
call fatLurch_fnc_cancelHelocast;

 ================================== START ==============================
*/

_helo =_this select 0;

//Add conditional here to use decel function or the commands below
//BIS hasn't added getFlyInHeight command

_altitude = _helo getVariable["altitude", 50];

[_helo, 500] remoteExec ["limitSpeed",_helo];
[_helo, _altitude] remoteExec ["flyInHeight",_helo];

if(count(_helo getVariable "ramp") >0) then		
{
	_ramp = _helo getVariable "ramp";
	{
		_helo animate [_x, 0];
		_helo animateDoor [_x, 0];
	} forEach _ramp;
};

_helo setVariable ["readyHelocast", nil, true];

[_helo] call fatLurch_fnc_lightOff;
[_helo] remoteExec ["fatLurch_fnc_lightOff", 0, true];