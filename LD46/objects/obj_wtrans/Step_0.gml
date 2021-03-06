/*	GMS2_ProjectBase

	Copyright (C) 2020  Nghia Lam

	This program is free software: you can redistribute it and/or modify
	it under the terms of the GNU General Public License as published by
	the Free Software Foundation, either version 3 of the License, or
	(at your option) any later version.

	This program is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	GNU General Public License for more details.

	You should have received a copy of the GNU General Public License
	along with this program.  If not, see <https://www.gnu.org/licenses/>.
*/

/* ********************************************************************* */

/// @description	Update Transition here

if (global.gstate != eGAME.run)
{	
	if (global.gstate == eGAME.transition) 
		percent = max(0, percent - max(percent/timer, 0.005));
	else
		percent = min(1, percent + max((1-percent)/timer, 0.005));
	
	if (percent == 1) || (percent == 0)
	{
		switch (global.gstate)
		{
			case eGAME.transition:
			{
				global.gstate = eGAME.run;
				break;
			}
			case eGAME.next:
			{
				type = eTRANSTYPE.close_in;
				global.gstate = eGAME.transition;
				room_goto_next();
				break;
			}
			case eGAME.goto:
			{
				type = eTRANSTYPE.close_in;
				room_goto(target);
				global.gstate = eGAME.transition;
				break;
			}
			case eGAME.restart:
			{
				type = eTRANSTYPE.close_in;
				global.gstate = eGAME.transition;
				game_restart();
				break;
			}
		}
	}
}
