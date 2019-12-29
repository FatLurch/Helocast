 /*
 =============================== INFORMATION ===========================

  -- eject.sqf - This function ejects individuals from a helicopter. Declared as function in config.cpp (fatLurch_fnc_eject)
  
 -- By Fat_Lurch (fat.lurch@gmail.com) for ARMA 3
 -- Created: 2019-12-27
 -- Last Edit: 2019-12-28
 -- Parameters: jumper, helo, rotation, jumpOffset
 -- Returns: Nothing

 -- Usage:
 
[jumper, helo, rotation, jumpOffset]call fatLurch_fnc_eject;

 ================================== START ==============================
*/

_x = _this select 0;
_helo = _this select 1;
_rot = _this select 2;
_justOffset = _this select 3;

[_x] remoteExec ["unassignVehicle", 0, true];
//_array = ["AdvePercMstpSnonWnonDnon", "AsdvPercMstpSnonWnonDnon_relax", "AfalPercMstpSnonWnonDnon", "AmovPercMstpSnonWnonDnon", "AmovPercMstpSsurWnonDnon", "AsdvPercMstpSnonWnonDnon_goup"];
animArray = ["AmovPercMstpSsurWnonDnon"];	
_x allowdamage false;
_anim = animArray select floor random count animArray;
_x setPos [0,0,0];	//GG
_x attachTo [_helo, _justOffset, "pos cargo"];	//GG
detach _x;	//GG
_x setDir(getDir _helo +_rot);
_x setVelocityModelSpace[velocityModelSpace _x select 0,(-1*(velocityModelSpace _x select 1)+2), velocityModelSpace _x select 2];
_x switchMove _anim;
sleep 1.9;	//1.7 seconds seems to be the magic number
_x switchMove "AswmPercMstpSnonWnonDnon";	
sleep 0.8;
_x allowdamage true;