 /*
 =============================== INFORMATION ===========================

  -- helocast.sqf - This function initiates the helocast. Declared as function in config.cpp (fatLurch_fnc_helocast)
  
 -- By Fat_Lurch (fat.lurch@gmail.com) for ARMA 3
 -- Created: 2019-02-23
 -- Last Edit: 2019-12-25
 -- Parameters: None
 -- Returns: Nothing

 -- Usage:
 
[helo]call fatLurch_fnc_helocast;
[helo]spawn fatLurch_fnc_helocast; ***(Required if not called from addAction)***

 ================================== START ==============================
*/

_helo =_this select 0;
_boat = (_helo) getVariable "boat";	//get reference to the specific boat associated with the helo
_jumpOffset = (_helo) getVariable ["jumpOffset", [0,0,0]];	

[_boat, false] remoteExec ["allowDamage", owner _boat];	
[_helo, false] remoteExec ["allowDamage", owner _helo];	

[_boat, false] remoteExec ["lock", owner _boat, true];	

detach _boat;

//===== Add Marker to boat =====
//_marker = "chemlight_green" createVehicle [0,0,0];
_marker = createSimpleObject ["chemlight_green", [0,0,0]]; //Trying as simple object to keep from falling off in MP - 2019-12-25
_marker attachTo [_boat, [0,0,1.2], "drivingwheel"];

_boat setVariable ["marker", _marker, true];


[_boat, false] remoteExec ["allowDamage",owner _boat];	
//[_helo, false] remoteExec ["allowDamage",owner _helo];

//Depeding on the type of helo, the boat may need to be slid out the back. The variable push is the boolean for this
if(_helo getVariable "push") then 	//G
{
	while {(getposASL _boat select 2)>0.4} do
	{
		//Keep pushing the boat until it's 0.1 meters from the surface of the water
		[_boat, [(velocityModelSpace _boat select 0), (velocityModelSpace _helo select 1)-6,(velocity _boat select 2)]] remoteExec ["setvelocityModelSpace", _boat];	//(velocity _boat select 2) is important, otherwise the boat moves as if there is no gravity
		sleep 0.25;
	};
};

sleep 1;	//wait a short while to clear to boat

_jumpers= crew _helo;

[_boat,[0,0,0]] remoteExec ["setVelocity", owner _boat];	//Stop the boat from drifting away

_helo setvariable ["boat",nil, true];
_helo setVariable ["readyHelocast", nil, true];

[_boat, _helo] remoteExec ["enableCollisionWith", owner _boat, true];	
[_boat, _helo] remoteExec ["enableCollisionWith", owner _helo, true];	//Needs to run on the owner of boat and helo

rot=_helo getVariable ["jumpRotation", 0];

{
	if(group driver _helo != group _x) then 
	//Eject all non-flight crew
	{
		//===== Begin clusterfuck to eject crew =====
		[_x, _helo, rot, _jumpOffset] remoteExec ["fatLurch_fnc_eject", 0, true];
		sleep 1 + random 0.4;
	};

} forEach _jumpers;	//have all of the non-aircrew exit the helo

[_helo] call fatLurch_fnc_lightOff;
[_helo] remoteExec ["fatLurch_fnc_lightOff", 0, true];

sleep 1;

_altitude = _helo getVariable["altitude", 50];

[_helo, 500] remoteExec ["limitSpeed",owner _helo];	//TODO: Change to the helo's values when event started 
[_helo, _altitude] remoteExec ["flyInHeight",owner _helo];
	
{
	if(group driver _helo != group _x) then 
	//Reset Animation State
	{
		[_x, ""] remoteExec ["switchMove", owner _x];
            	_x playMove "";
		sleep 0.7+random 0.4;
	};

} forEach _jumpers;	//have all of the non-aircrew exit the helo

[_helo, "close"] call fatLurch_fnc_rampDoor;

[_boat, true] remoteExec ["allowDamage",0];	//These need to be remoteExec (Local Arguments) - 2019-12-08


