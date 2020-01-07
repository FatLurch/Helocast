 /*
 =============================== INFORMATION ===========================

  -- eject.sqf - This function ejects individuals from a helicopter. Declared as function in config.cpp (fatLurch_fnc_eject)
  
 -- By Fat_Lurch (fat.lurch@gmail.com) for ARMA 3
 -- Created: 2019-12-27
 -- Last Edit: 2020-01-03
 -- Parameters: helo, jumper
 -- Returns: Nothing

 -- Usage:
 
[jumper, helo]call fatLurch_fnc_eject;

 ================================== START ==============================
*/
params["_helo", "_jumper"];

_rot = _helo getVariable ["jumpRotation", 0];
_jumpOffset = _helo getVariable ["jumpOffset", [0,0,0]];
[_jumper] orderGetIn false; //This seems to be the needed bit to keep AI from re-entering the host helicopter
sleep 0.01;


//_array = ["AdvePercMstpSnonWnonDnon", "AsdvPercMstpSnonWnonDnon_relax", "AfalPercMstpSnonWnonDnon", "AmovPercMstpSnonWnonDnon", "AmovPercMstpSsurWnonDnon", "AsdvPercMstpSnonWnonDnon_goup"];
animArray = ["AmovPercMstpSsurWnonDnon"];	
_jumper allowdamage false;
_anim = animArray select floor random count animArray;
_jumper setPos [0,0,0];	//GG
_jumper attachTo [_helo, _jumpOffset, "pos cargo"];	//GG
detach _jumper;	//GG

_jumper setVelocityModelSpace[velocityModelSpace _jumper select 0,(-1*(velocityModelSpace _jumper select 1)+2), velocityModelSpace _jumper select 2];
_jumper switchMove _anim;
_jumper setDir(getDir _helo +_rot);

sleep 1.9;	//1.7 seconds seems to be the magic number

_jumper switchMove "AswmPercMstpSnonWnonDnon";	
_jumper allowdamage true;
_jumper enableAI "MOVE";

