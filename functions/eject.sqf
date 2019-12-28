_x = _this select 0;
_helo = _this select 1;
_rot = _this select 2;

[_x] remoteExec ["unassignVehicle", 0, true];
//_array = ["AdvePercMstpSnonWnonDnon", "AsdvPercMstpSnonWnonDnon_relax", "AfalPercMstpSnonWnonDnon", "AmovPercMstpSnonWnonDnon", "AmovPercMstpSsurWnonDnon", "AsdvPercMstpSnonWnonDnon_goup"];
animArray = ["AmovPercMstpSsurWnonDnon"];	
_x allowdamage false;
_anim = animArray select floor random count animArray;
_x setPos [0,0,0];	//GG
_x attachTo [_helo, [0,0,0], "pos cargo"];	//GG
detach _x;	//GG
_x setDir(getDir _helo +_rot);
_x setVelocityModelSpace[velocityModelSpace _x select 0,(-1*(velocityModelSpace _x select 1)+2), velocityModelSpace _x select 2];
_x switchMove _anim;
sleep 1.9;	//1.7 seconds seems to be the magic number
_x switchMove "AswmPercMstpSnonWnonDnon";	//Still "snaps" out of animation, but is in a relaxed underwater pose.
sleep 0.8;
_x allowdamage true;