 /*
 =============================== INFORMATION ===========================
  
 -- ejectBoat.sqf - Function to handle ejection of a boat and associated hosuekeeping. Declared as function in config.cpp (fatLurch_fnc_ejectBoat)
  
 -- By Fat_Lurch (fat.lurch@gmail.com) for ARMA 3
 -- Created: 2020-01-01
 -- Last Edit: 2020-01-03
 -- Parameters: [_helo, _boat] - The helo the boat is being ejected from and the boat itself
 -- Returns: None

 -- Usage:
 
[_helo, _boat]call fatLurch_fnc_ejectBoat;

 ================================== START ==============================
*/
params["_helo", ["_boat", nil]];

if(isNil {_boat}) exitWith {};

_boatArray = _helo getVariable["boatArray", [nil, nil]];
_boatCoords = _helo getVariable "boatCoords";
_push = _helo getVariable ["push", false];

[_boat, false] remoteExec ["allowDamage", owner _boat];	
[_helo, false] remoteExec ["allowDamage", owner _helo];	
[_boat, false] remoteExec ["lock", owner _boat, true];	

if(_boat==nil) exitWith{};

detach _boat;
_helo setVariable ["readyHelocast", nil, true];

if (!_push) then 
{
	//If the boat isn't being dropped, give it some seperation from the aircraft to prevent PhysX collisions which will roll the boat over
	_boat setpos [getPos _boat select 0, getPos _boat select 1, (getPos _boat select 2)-0.2];	
};

_boatIndex = [_helo, _boat]call fatLurch_fnc_boatIndex;
_boatArray set [_boatIndex, nil];

[_boat] call fatLurch_fnc_addMarker;	//Add a marker to the boat

//Depeding on the type of helo, the boat may need to be slid out the back. The variable push is the boolean for this
if(_push) then 	//G
{
	while {(getposASL _boat select 2)>0.4} do
	{
		//Keep pushing the boat until it's 0.1 meters from the surface of the water
		[_boat, [(velocityModelSpace _boat select 0), (velocityModelSpace _helo select 1)-6,(velocity _boat select 2)]] remoteExec ["setvelocityModelSpace", _boat];	//(velocity _boat select 2) is important, otherwise the boat moves as if there is no gravity
		sleep 0.25;
	};
}
else
{
	waitUntil {(getposASL _boat select 2)>0.4};
};

sleep 1;

[_boat,[0,0,0]] remoteExec ["setVelocity", owner _boat];	//Stop the boat from drifting away

[_boat, _helo] remoteExec ["enableCollisionWith", _boat, true];	
[_boat, true] remoteExec ["allowDamage",0];	//These need to be remoteExec (Local Arguments) - 2019-12-08