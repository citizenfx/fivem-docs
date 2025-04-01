---
title: Fuel consumption
weight: 482
---

By default in GTAV and FiveM vehicles do not consume fuel. This feature allows to turn the fuel consumption on and customize it for your needs.

### Turn on/off

To set/check the fuel consumption use {{% native_link "SET_FUEL_CONSUMPTION_STATE" %}}/{{% native_link "GET_FUEL_CONSUMPTION_STATE" %}} natives. Set true to turn it on, false - to turn it off.

### How it works

#### Fuel consumption speed

When turned on, fuel consumption is calculated by the formula:

```
time_step * revolutions_per_minute * vehicle_fuel_consumption_rate_multiplier * global_fuel_consumption_rate_multiplier
```

I.e. fuel is consumed faster the more revolutions engine does. This approximates how fuel consumption works in real world.

Fuel is not consumed when the engine is turned off.

By default, 65 liter gas tank car with average fuel consumption can stay **idle for ~16.67 hours** or run with **max RPM for ~2.5 hours**.

#### Customize consumption speed

To customize/check global (across all vehicles) fuel consumption rate (`global_fuel_consumption_rate_multiplier` in the formula above) use {{% native_link "SET_FUEL_CONSUMPTION_RATE_MULTIPLIER" %}}/{{% native_link "GET_FUEL_CONSUMPTION_RATE_MULTIPLIER" %}} natives. By default it is set to 1. If set to negative - 0 will be used instead.

To customize fuel consumption per vehicle (`vehicle_fuel_consumption_rate_multiplier` in the formula above) use {{% native_link "SET_HANDLING_FLOAT" %}} (for all vehicles with given class) or {{% native_link "SET_VEHICLE_HANDLING_FLOAT" %}} (for a specific vehicle) native with `fieldName` equal to `fPetrolConsumptionRate`. By default it is set to 0.5 for all vehicles.

You can also use [CodeWalker](https://github.com/dexyfex/CodeWalker) tool or similar to edit vehicle `handling.meta` file and set `fPetrolConsumptionRate` value to `HandlingData`. If not set it results to the default value of 0.5.

#### Petrol tank volume and current fuel level

To customize petrol tank volume use {{% native_link "SET_HANDLING_FLOAT" %}}/{{% native_link "SET_VEHICLE_HANDLING_FLOAT" %}} natives with `fieldName` equal to `fPetrolTankVolume`.

You can also use [CodeWalker](https://github.com/dexyfex/CodeWalker) tool or similar to edit vehicle `handling.meta` file and set `fPetrolTankVolume` value to `HandlingData`.

To update/check fuel level in a vehicle use {{% native_link "GET_VEHICLE_FUEL_LEVEL" %}}/{{% native_link "SET_VEHICLE_FUEL_LEVEL" %}} natives.

#### Vehicles without fuel consumption

Fuel is not consumed for the following vehicles:

- Vehicles that only have NPCs in them.
- Bicycles. I.e. vehicles with vehicle type equal to 12.
- Vehicles with infinite fuel. I.e. vehicles with petrol tank volume equal to 0. By default it's only bicycles.

To check if vehicle will consume fuel when player is inside (i.e. petrol tank volume above 0 and not a bicycle) use {{% native_link "DOES_VEHICLE_USE_FUEL" %}} native.

### Gas stations

When turning on fuel consumption you need to think about mechanisms to allow players to refuel a vehicle.

We do not provide out of the box functionality for gas stations. But you can implement it on your own using provided natives.

#### Example gas stations implementation

```lua
-- List of all gas stations in the world.
-- Update this list to include all gas station locations.
-- You can create a config file and read it from there, or just hard code as in this example.
GasStations = {
    {
        coords = vector3(64.55, 20.4, 68.9),  
        radius = 8
    }
}

-- Distance from point is the simplest way to determine if vehicle is at a gas station.
-- You can use polygons if you need more precision.
function IsPointInGasStation(point, gasStation)
    return #(point - gasStation.coords) <= gasStation.radius
end

-- Triggered when player enters gas station.
-- You can customize communication with a player the way you want.
function ProcessGasStationEnter(vehicle)
    -- Get current vehicle fuel level.
    local vehicleFuelLevel = GetVehicleFuelLevel(vehicle)
    -- Get vehicle petrol tank volume.
    local vehicleGasTankVolume = GetVehicleHandlingFloat(vehicle, "CHandlingData", "fPetrolTankVolume")
    -- Display basic text message.
    local gasStationMessage = string.format("Welcome to gas station. You have %.3f out of %.3f liters of fuel left. Press G to fill tank.", vehicleFuelLevel, vehicleGasTankVolume)
    AddTextEntry("CH_ALERT", gasStationMessage)
    BeginTextCommandDisplayHelp("CH_ALERT")
    EndTextCommandDisplayHelp(0, false, false, 200)
end

-- Fill up player's vehicle gas tank.
-- You can customize communication with a player the way you want.
function ProcessGasStationFuelPurchase(vehicle)
    -- Get vehicle petrol tank volume.
    local vehicleGasTankVolume = GetVehicleHandlingFloat(vehicle, "CHandlingData", "fPetrolTankVolume")
    -- Fill up the tank.
    SetVehicleFuelLevel(vehicle, vehicleGasTankVolume)
end

-- Checks if the specified vehicle is close to a gas station.
-- Caller must ensure that the vehicle exists.
function IsVehicleAtGasStation(vehicle)
    -- If the vehicle doesn't use fuel (i.e. a bicycle or with infinite fuel).
    if not DoesVehicleUseFuel(vehicle) then
        return false
    end

    -- Get coordinates of the vehicle and check that it's close enough to any of the gas stations.
    local vehicleCoords = GetEntityCoords(vehicle)
    for _, gasStation in ipairs(GasStations) do
        if IsPointInGasStation(vehicleCoords, gasStation) then
            return true
        end
    end
    return false
end

CreateThread(function()
    -- Main loop.
    while true do
        -- Do not add sleep time since this thread is operating with controls.
        Wait(0)

        -- Only run script if fuel consumption is turned on globally.
        if GetFuelConsumptionState() then

            -- Check if player is in a vehicle.
            local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
            if DoesEntityExist(vehicle) then

                if IsVehicleAtGasStation(vehicle) then

                    ProcessGasStationEnter(vehicle)

                    -- If G is pressed on a keyboard.
                    if IsControlPressed(0, 58) then
                        ProcessGasStationFuelPurchase(vehicle)
                    end
                end
            end
        end
    end
end)
```
