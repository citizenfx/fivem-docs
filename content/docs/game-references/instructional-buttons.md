---
title: Instructional Buttons
weight: 760
---

**Instructional Buttons**, also known as Prompts are UI elements that are displayed at the bottom-right corner of the screen, which show what actions certain keys and controls can do. You can make them clickable with your cursor, add multiple buttons, icons and much more.


Simple non-clickable buttons example
------------
### Lua

``` lua
CreateThread(function()
	-- Request the buttons GFX to be loaded
	local ButtonsHandle = RequestScaleformMovie('INSTRUCTIONAL_BUTTONS')
	-- Wait for the buttons GFX to be fully loaded
	while not HasScaleformMovieLoaded(ButtonsHandle) do
		Wait(0)
	end

	-- Clear previous buttons
	CallScaleformMovieMethod(ButtonsHandle, 'CLEAR_ALL')
	-- Disable mouse buttons
	CallScaleformMovieMethodWithNumber(ButtonsHandle, 'TOGGLE_MOUSE_BUTTONS', 0)

	-- Begin setting a button slot
	BeginScaleformMovieMethod(ButtonsHandle, 'SET_DATA_SLOT')
	-- Position of the button
	ScaleformMovieMethodAddParamInt(0)
	-- Add the Enter keyboard icon
	ScaleformMovieMethodAddParamPlayerNameString('~INPUT_FRONTEND_ACCEPT~')
	-- Add the text before icon
	ScaleformMovieMethodAddParamPlayerNameString('Select')
	-- End the function
	EndScaleformMovieMethod()
	-- Sets buttons ready to be drawn
	CallScaleformMovieMethod(ButtonsHandle, 'DRAW_INSTRUCTIONAL_BUTTONS')

	local selectPressed = false
	-- Display instructional buttons while enter hasn't been pressed
	while not selectPressed do
		Wait(0)

		-- Draw the instructional buttons this frame
		DrawScaleformMovieFullscreen(ButtonsHandle, 255, 255, 255, 255, 1)

		-- Is Enter just released
		if IsControlJustReleased(2, 201) then
			selectPressed = true

			print('Enter has been pressed!')
		end
	end

	-- Unload the scaleform movie after enter has been pressed
	SetScaleformMovieAsNoLongerNeeded(ButtonsHandle)
end)

```
![Code Result](/instructional_buttons_result.png) 

Simple clickable buttons example
------------
### Lua

``` lua
CreateThread(function()
	-- Request the buttons GFX to be loaded
	-- Note: RequestScaleformMovieInstance prevents the buttons being stretched on wide-screen
	local ButtonsHandle = RequestScaleformMovieInstance('INSTRUCTIONAL_BUTTONS')

	-- Wait for the buttons GFX to be fully loaded
	while not HasScaleformMovieLoaded(ButtonsHandle) do
		Wait(0)
	end

	-- Clear previous buttons
	CallScaleformMovieMethod(ButtonsHandle, 'CLEAR_ALL')
	-- ENABLE mouse buttons
	CallScaleformMovieMethodWithNumber(ButtonsHandle, 'TOGGLE_MOUSE_BUTTONS', 1)

	-- Begin setting a button slot
	BeginScaleformMovieMethod(ButtonsHandle, 'SET_DATA_SLOT')
	-- Position of the button
	ScaleformMovieMethodAddParamInt(0)
	-- Add the Enter keyboard icon
	ScaleformMovieMethodAddParamPlayerNameString('~INPUT_FRONTEND_ACCEPT~')
	-- Add the text before icon
	ScaleformMovieMethodAddParamPlayerNameString('Select')
	-- Note: Adding last 2 SET_DATA_SLOT parameters while TOGGLE_MOUSE_BUTTONS 
	-- is disabled can cause buttons to bug out
	
	-- Whether or not this button can be clicked by the mouse
	ScaleformMovieMethodAddParamBool(true)
	-- Which control will be triggered when this button is clicked by the mouse (INPUT_FRONTEND_ACCEPT in this case)
	ScaleformMovieMethodAddParamInt(201)
	-- End the function
	EndScaleformMovieMethod()

	-- Sets buttons ready to be drawn
	CallScaleformMovieMethod(ButtonsHandle, 'DRAW_INSTRUCTIONAL_BUTTONS')

	local selectPressed = false
	-- Display instructional buttons while enter hasn't been pressed
	while not selectPressed do
		Wait(0)

		-- Show the mouse this frame
		SetMouseCursorActiveThisFrame()

		-- Disable camera moving left and right
		DisableControlAction(0, 1, true)
		-- Disable camera moving up and down
		DisableControlAction(0, 2, true)
		-- Disable attacking by mouse click
		DisableControlAction(0, 24, true)

		-- Draw the instructional buttons this frame
		DrawScaleformMovieFullscreen(ButtonsHandle, 255, 255, 255, 255, 1)

		-- Is Enter just released
		if IsControlJustReleased(2, 201) then
			selectPressed = true

			print('Select has been pressed!')
		end
	end

	-- Disable mouse buttons so they don't bug out for other scripts
	CallScaleformMovieMethod(ButtonsHandle, 'TOGGLE_MOUSE_BUTTONS', 0)
	-- Unload the scaleform movie after enter has been pressed
	SetScaleformMovieAsNoLongerNeeded(ButtonsHandle)
end)
```
![Code Result](/instructional_buttons_result_2.png) 

Simple buttons with icons example
------------
### Lua

```lua
CreateThread(function()
	-- Request the buttons GFX to be loaded
	local ButtonsHandle = RequestScaleformMovie('INSTRUCTIONAL_BUTTONS')
	-- Wait for the buttons GFX to be fully loaded
	while not HasScaleformMovieLoaded(ButtonsHandle) do
		Wait(0)
	end

	-- Clear previous buttons
	CallScaleformMovieMethod(ButtonsHandle, 'CLEAR_ALL')

	-- Begin setting a button slot
	BeginScaleformMovieMethod(ButtonsHandle, 'SET_DATA_SLOT')
	-- Position of the button
	ScaleformMovieMethodAddParamInt(0)
	-- Add the arrow up/down icon
	ScaleformMovieMethodAddParamInt(45)
	-- Note: You can add up to 20 keys and icons
	---- Add the text before the icon
	ScaleformMovieMethodAddParamPlayerNameString('Scroll')
	-- End the function
	EndScaleformMovieMethod()

	-- Begin setting a button slot
	BeginScaleformMovieMethod(ButtonsHandle, 'SET_DATA_SLOT')
	-- Position of the button
	ScaleformMovieMethodAddParamInt(1)
	-- Add the loading icon
	ScaleformMovieMethodAddParamInt(50)
	-- Note: You can add up to 20 keys and icons
	---- Add the text before the icon
	ScaleformMovieMethodAddParamPlayerNameString('Loading')
	-- End the function
	EndScaleformMovieMethod()

	-- Sets buttons ready to be drawn
	CallScaleformMovieMethod(ButtonsHandle, 'DRAW_INSTRUCTIONAL_BUTTONS')

	local startedLoading = GetGameTimer()
	-- Display instructional buttons for 3 seconds (3000 ms)
	while GetGameTimer() - startedLoading < 3000 do
		Wait(0)

		-- Draw the instructional buttons this frame
		DrawScaleformMovieFullscreen(ButtonsHandle, 255, 255, 255, 255, 1)
	end

	-- Unload the scaleform movie after enter has been pressed
	SetScaleformMovieAsNoLongerNeeded(ButtonsHandle)
end)

```
![Code Result](/instructional_buttons_result_3.png) 

Icon list
---------------

| ID  | Name                                   |
|-----|----------------------------------------|
| 0   | Arrow Up                               |
| 1   | Arrow Down                             |
| 2   | Arrow Left                             |
| 3   | Arrow Right                            |
| 4   | Dpad up                                |
| 5   | Dpad down                              |
| 6   | Dpad left                              |
| 7   | Dpad right                             |
| 8   | Dpad                                   |
| 9   | Dpad all                               |
| 10  | Dpad up down                           |
| 11  | Dpad left right                        |
| 12  | Left stick up                          |
| 13  | Left stick down                        |
| 14  | Left stick left                        |
| 15  | Left stick down                        |
| 16  | Left stick                             |
| 17  | Left stick                             |
| 18  | Left stick up down                     |
| 19  | Left stick left right                  |
| 20  | Left stick clockwise                   |
| 21  | Right stick up                         |
| 22  | Right stick down                       |
| 23  | Right stick left                       |
| 24  | Right stick right                      |
| 25  | Right stick                            |
| 26  | Right stick                            |
| 27  | Right stick up down                    |
| 28  | Right stick left right                 |
| 29  | Right stick clockwise                  |
| 30  | A                                      |
| 31  | B                                      |
| 32  | X                                      |
| 33  | Y                                      |
| 34  | RB                                     |
| 35  | LT                                     |
| 36  | RB                                     |
| 37  | RT                                     |
| 38  | Start                                  |
| 39  | Select                                 |
| 40  | Invalid                                |
| 41  | Invalid                                |
| 42  | Invalid                                |
| 43  | Invalid                                |
| 44  | Clockwise Spinner                      |
| 45  | Arrow up down                          |
| 46  | Arrow left right                       |
| 47  | Arrow left right up down               |
| 48  | Clockwise spinner                      |
| 49  | Cloud save spinner (Yellow, Clockwise) |
| 50  | Counter-clockwise spinner              |

## INSTRUCTIONAL_BUTTONS Scaleform Movie Methods

These are all the movie methods you can call on INSTRUCTIONAL_BUTTONS, after they have been requested. You can use scaleform movie method natives (shown above) to call them.

```
TOGGLE_MOUSE_BUTTONS(bool toggle)
Toggles clickable buttons

SET_SAVING_TEXT(int iconEnum, string saveStr)
Sets a text with loading icon

REMOVE_SAVING()
Removes the loading icon text

CLEAR_ALL()
Clears all instructional button slots

CLEAR_RENDER()
Stops rendering buttons

OVERRIDE_POSITION(float x, float y, bool alignBottomRight)
Overrides buttons' position.

SET_CLEAR_SPACE(float clearSpace)

SET_DATA_SLOT(int index, any icon, string text, bool clickable, int controlIndex)
Adds a button slot. You can add up to 20 icons, those can be either input strings (e.g ~INPUT_FRONTEND_ACCEPT~ for enter) or icon id's.
Note: Make sure to not add last two parameters if TOGGLE_MOUSE_BUTTONS is FALSE to prevent glitchy buttons.

SET_DATA_SLOT_EMPTY()
Alias for CLEAR_ALL()

CLEAR_BACKGROUNDS()
Removes background for the buttons.

DRAW_INSTRUCTIONAL_BUTTONS(int layoutType)
Sets buttons to be drawn.

GET_NUMBER_OF_ROWS()
Returns number of rows. Note: You need to use scaleform movie method return value natives for this.

SET_BACKGROUND()
Adds background.

SET_PADDING(int top, int right, int bottom, int left)

SET_BACKGROUND_COLOUR(int r, int g, int b, int a)
Overrides background colour.

OVERRIDE_RESPAWN_TEXT(int index, string text)
Overrides text for a button.

FLASH_BUTTON_BY_ID(int buttonID, int alpha, int duration)
Flashes a button

SET_MAX_WIDTH(float maxWidth)
Sets max width for buttons. This prevents buttons from being off-screen if there are too many data slots set. Instead, they will stack up.

SET_HIT_AREA_VISIBLE(bool isVisible)
Shows debug hit area for mouse visible. This hit area is used for native 0x3d9acb1eb139e702, which returns wether or not the mouse cursor is above instructional buttons if TOGGLE_MOUSE_BUTTONS is true.
```
