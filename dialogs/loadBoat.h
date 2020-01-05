#include "CustomControlClasses.h"
class loadBoat
{
	idd = -1;
	
	//200 - boat - 				lbData [200, lbCurSel 200]
	//201 - position index - 	lbData [201, lbCurSel 201]
	//202 - helo - 				ctrlText 202
		
	onUnload ="if(_this select 1==1) then {[ctrlText 202 call BIS_fnc_objectFromNetId, lbData [200, lbCurSel 200] call BIS_fnc_objectFromNetId, parseNumber lbData [201, lbCurSel 201]] call fatLurch_fnc_loadBoat;};";
		
	class ControlsBackground
	{
		class Background
		{
			lineSpacing = 0;		//ADDED
			type = 0;
			idc = -1;
			x = safeZoneX + safeZoneW * 0.40208334;
			y = safeZoneY + safeZoneH * 0.43333334;
			w = safeZoneW * 0.19583334;
			h = safeZoneH * 0.12685186;
			style = 0+16;
			text = "  Load Boat";
			colorBackground[] = {0.502,0.502,0.502,1};
			colorText[] = {0.949,0.949,0.949,1};
			font = "PuristaBold";
			sizeEx = 0.045;
			
		};
		class Boat
		{
			type = 0;
			idc = -1;
			x = safeZoneX + safeZoneW * 0.41800879;
			y = safeZoneY + safeZoneH * 0.46354167;
			w = safeZoneW * 0.02928258;
			h = safeZoneH * 0.02994792;
			style = 1;
			text = "Boat";
			colorBackground[] = {0.502,0.502,0.502,1};
			colorText[] = {0.949,0.949,0.949,1};
			font = "PuristaMedium";
			sizeEx = .04;
			
		};
		class Position
		{
			type = 0;
			idc = -1;
			x = safeZoneX + safeZoneW * 0.40833334;
			y = safeZoneY + safeZoneH * 0.49074075;
			w = safeZoneW * 0.0390625;
			h = safeZoneH * 0.02962963;
			style = 1;
			text = "Position";
			colorBackground[] = {0.502,0.502,0.502,1};
			colorText[] = {0.949,0.949,0.949,1};
			font = "PuristaMedium";
			sizeEx = .04;
			
		};
		
	};
	class Controls
	{
		class OK
		{
			action = "closeDialog 1";	//ADDED - emulates OK action
			type = 1;
			idc = -1;
			x = safeZoneX + safeZoneW * 0.4265625;
			y = safeZoneY + safeZoneH * 0.52685186;
			w = safeZoneW * 0.0453125;
			h = safeZoneH * 0.025;
			style = 0+2;
			text = "OK";
			borderSize = 0;
			colorBackground[] = {0,0,0,1};
			colorBackgroundActive[] = {0,0.5882,0,1};
			colorBackgroundDisabled[] = {0.2,0.2,0.2,1};
			colorBorder[] = {0.6,0.6,0.6,1};
			colorDisabled[] = {0.2,0.2,0.2,1};
			colorFocused[] = {0.2,0.2,0.2,1};
			colorShadow[] = {0,0,0,0};
			colorText[] = {0.949,0.949,0.949,1};
			font = "PuristaMedium";
			offsetPressedX = 0.01;
			offsetPressedY = 0.01;
			offsetX = 0.01;
			offsetY = 0.01;
			sizeEx = 0.05;
			soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1.0};
			soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter",0.09,1.0};
			soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1.0};
			soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush",0.09,1.0};
			
		};
		class Cancel
		{
			action = "closeDialog 2";	//ADDED - emulates cancel action
			type = 1;
			idc = -1;
			x = safeZoneX + safeZoneW * 0.52635432;
			y = safeZoneY + safeZoneH * 0.52734375;
			w = safeZoneW * 0.045388;
			h = safeZoneH * 0.02473959;
			style = 0+2;
			text = "Cancel";
			borderSize = 0;
			colorBackground[] = {0,0,0,1};
			colorBackgroundActive[] = {0,0.5882,0,1};
			colorBackgroundDisabled[] = {0.2,0.2,0.2,1};
			colorBorder[] = {0.6,0.6,0.6,1};
			colorDisabled[] = {0.2,0.2,0.2,1};
			colorFocused[] = {0.2,0.2,0.2,1};
			colorShadow[] = {0,0,0,0};
			colorText[] = {0.949,0.949,0.949,1};
			font = "PuristaMedium";
			offsetPressedX = 0.01;
			offsetPressedY = 0.01;
			offsetX = 0.01;
			offsetY = 0.01;
			sizeEx = 0.05;
			soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1.0};
			soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter",0.09,1.0};
			soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1.0};
			soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush",0.09,1.0};
			
		};
		class Boat
		{
			type = 4;
			idc = 200;	//CHANGED to a useful value
			x = safeZoneX + safeZoneW * 0.45625;
			y = safeZoneY + safeZoneH * 0.47222223;
			w = safeZoneW * 0.12708334;
			h = safeZoneH * 0.01944445;
			style = 16;
			arrowEmpty = "\A3\ui_f\data\GUI\RscCommon\RscCombo\arrow_combo_ca.paa";
			arrowFull = "\A3\ui_f\data\GUI\RscCommon\RscCombo\arrow_combo_active_ca.paa";
			colorBackground[] = {0.302,0.302,0.302,1};
			colorDisabled[] = {0.302,0.302,0.302,1};
			colorSelect[] = {0.949,0.949,0.949,1};
			colorSelectBackground[] = {0,0.5882,0,1};
			colorText[] = {0.949,0.949,0.949,1};
			font = "PuristaMedium";
			maxHistoryDelay = 0;
			sizeEx = 0.035;
			soundCollapse[] = {"\A3\ui_f\data\sound\RscCombo\soundCollapse",0.1,1.0};
			soundExpand[] = {"\A3\ui_f\data\sound\RscCombo\soundExpand",0.1,1.0};
			soundSelect[] = {"\A3\ui_f\data\sound\RscCombo\soundSelect",0.1,1.0};
			wholeHeight = 0.3;
			class ComboScrollBar
			{
				color[] = {1,1,1,1};
				thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
				arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
				arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
				border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
				
			};
			
		};
		class Position
		{
			type = 4;
			idc = 201;	//CHANGED to a useful value
			x = safeZoneX + safeZoneW * 0.45625;
			y = safeZoneY + safeZoneH * 0.49722223;
			w = safeZoneW * 0.12760417;
			h = safeZoneH * 0.01944445;
			style = 16;
			arrowEmpty = "\A3\ui_f\data\GUI\RscCommon\RscCombo\arrow_combo_ca.paa";
			arrowFull = "\A3\ui_f\data\GUI\RscCommon\RscCombo\arrow_combo_active_ca.paa";
			colorBackground[] = {0.302,0.302,0.302,1};
			colorDisabled[] = {0.302,0.302,0.302,1};
			colorSelect[] = {0.949,0.949,0.949,1};
			colorSelectBackground[] = {0,0.5882,0,1};
			colorText[] = {0.949,0.949,0.949,1};
			font = "PuristaMedium";
			maxHistoryDelay = 0;
			sizeEx = 0.035;
			soundCollapse[] = {"\A3\ui_f\data\sound\RscCombo\soundCollapse",0.1,1.0};
			soundExpand[] = {"\A3\ui_f\data\sound\RscCombo\soundExpand",0.1,1.0};
			soundSelect[] = {"\A3\ui_f\data\sound\RscCombo\soundSelect",0.1,1.0};
			wholeHeight = 0.3;
			class ComboScrollBar
			{
				color[] = {1,1,1,1};
				thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
				arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
				arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
				border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
				
			};
		};
		class Helo
		{
			type = 0;
			idc = 202;
			x = safeZoneX + safeZoneW * 0.78222657;
			y = safeZoneY + safeZoneH * 0.71180556;
			w = safeZoneW * 0.0703125;
			h = safeZoneH * 0.08680556;
			style = 0;
			text = "";
			colorBackground[] = {0,1,0,0};
			colorText[] = {0,0,0,0};
			font = "PuristaMedium";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);	
		};	
	};
};
