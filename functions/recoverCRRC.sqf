 /*
 =============================== INFORMATION ===========================
  
 -- recoverCRRC.sqf - This function recovers a CRRC. Declared as function in config.cpp (fatLurch_fnc_recoverCRRC)
  
 -- By Fat_Lurch (fat.lurch@gmail.com) for ARMA 3
 -- Created: 2019-02-23
 -- Last Edit: 2019-12-26
 -- Parameters: [helo] - the helo to configure for helocasting
 -- Returns: Nothing

 -- Usage:
 
[helo] call fatLurch_fnc_recoverCRRC;

 ================================== START ==============================
*/

_helo = _this select 0;
_boat = vehicle (_this select 1);

_helo setvariable ["boat",_boat, true];

[_boat, _helo] remoteExec ["disableCollisionWith", owner _boat];	
[_boat, _helo] remoteExec ["disableCollisionWith", owner _helo];	//Needs to run on the owner of boat and helo

//Add code to reference array of assault boats (ref array "in" command)
_helo addEventHandler ["HandleDamage", {if (_boat iskindof 'Rubber_duck_base_F') then { 0; } else { _this select 2; };}];		//disable damage from assaultboats

_coords = _helo getVariable["boatCoords", [0,0,0]];

[_boat,  [_helo,_coords]] remoteExec ["attachto", owner _boat];

sleep 1;

{
	moveOut _x;
	_x setPos [0,0,0];	//Not working for human players
	sleep 0.05;
	//[_x,  _helo] remoteExec ["moveInCargo", owner _x];		//Suspicious "owner _x" is causing other human players to not be loaded into helo
	[_x,  _helo] remoteExec ["moveInCargo", owner _x, true];
	_x moveInCargo _helo;
		
	_x assignAsCargo _helo;
	sleep 0.5;
	
} forEach crew _boat;

[_boat, false] remoteExec ["engineOn", owner _boat, true];

//_helo flyinHeight 50;		//local/global
[_helo, 50] remoteExec ["flyInHeight", owner _helo, true];

//[_helo, false] call fatlurch_fnc_setupHelocast;
[_helo, false] remoteExec ["call fatlurch_fnc_setupHelocast", 2];		//OBE??

if(count(_helo getVariable "ramp") >0) then		
{
	_ramp = _helo getVariable "ramp";
	{
		_helo animate [_x, 0];
		_helo animateDoor [_x, 0];
	} forEach _ramp;
};

