---
title: Work with drawable components and props using collections
weight: 481
---

Inside the GTAV Ped drawable components and props are stored in named groups called collections. However, collections were previously unavailable for FiveM users. The drawable components and props were indexed through a global index. On every TU (Title Update), the global index of custom drawable components and props would change (see below for more details on why it happens). This complicates the migration to the latest game build.

The new set of natives allows accessing drawable components and props through collections. The collection-based indexes remain stable after TUs. **So using these natives will simplify all future TU updates for a server.**

    Note: The new natives are currently available for GTAV and on client side only.

### How drawable components and props indexing works

    Note: Drawable components and props are stored in Ped in the same way. Below we will refer to drawable components / drawables only.

You can think of collections in Ped as list of buckets placed one after another. Each collection is named and contains multiple drawables.

**Global index** is an index of drawable starting from the beginning of the set. **Local index** is an index of drawable starting from the beginning of each collection.

E.g.:

<table class="collections-indices-example"><tbody>
  <tr>
    <td></td>
    <td colspan="9">Official GTAV collections</td>
    <td colspan="5">Custom collections</td>
  </tr>
  <tr>
    <td>Collection names</td>
    <td colspan="2">""</td>
    <td colspan="4">"female_freemode_beach"</td>
    <td colspan="3">"female_xmas"</td>
    <td colspan="3">"custom_collection_1"</td>
    <td colspan="2">"custom_collection_2"</td>
  </tr>
  <tr>
    <td>Local indexes</td>
    <td>0</td>
    <td>1</td>
    <td>0</td>
    <td>1</td>
    <td>2</td>
    <td>3</td>
    <td>0</td>
    <td>1</td>
    <td>2</td>
    <td>0</td>
    <td>1</td>
    <td>2</td>
    <td>0</td>
    <td>1</td>
  </tr>
  <tr>
    <td>Global indexes</td>
    <td>0</td>
    <td>1</td>
    <td>2</td>
    <td>3</td>
    <td>4</td>
    <td>5</td>
    <td>6</td>
    <td>7</td>
    <td>8</td>
    <td>9</td>
    <td>10</td>
    <td>11</td>
    <td>12</td>
    <td>13</td>
  </tr>
</tbody>
</table>

<style>
.collections-indices-example td {
    border: 0.5px solid grey;
}

.collections-indices-example td:not(:first-child) {
    text-align: center !important;
}
</style>

The first collection corresponds to the base game (without any DLCs). After the base game collection follow collection that correspond to official DLCs. Custom collections are added to the end.

After TU is released and new official DLC collection is added - all custom collections are shifted. So, the global indexes that correspond to custom collections shift and must be updated on every TU. While the indexes that are relative to the beginning of a collection will remain stable after TU.

#### Where collection name is set

The base game name collection is an empty string. Names of other collections are set by `<CPedVariationInfo name="...">` tag of the corresponding `.ymt` file. E.g. see `Grand Theft Auto V\update\x64\dlcpacks\mp2024_01\dlc.rpf\x64\models\cdimages\mp2024_01_female.rpf\mp_f_freemode_01_mp_f_2024_01.ymt` base game file.

### New natives

There are three groups of new natives:
- Natives to get general information about collections 
- Natives to convert between global and local indexes.
- Natives that are analogues to the existing natives that work with drawable components and props. But instead of working with global indexes they work with collection names and local indexes.

#### General info natives

- {{% native_link "GET_PED_COLLECTIONS_COUNT" %}} - get total number of collections available for Ped
- {{% native_link "GET_PED_COLLECTION_NAME" %}} - get collection name by collection number

#### Conversion between global and local indexing

- {{% native_link "GET_PED_COLLECTION_NAME_FROM_DRAWABLE" %}}, {{% native_link "GET_PED_COLLECTION_LOCAL_INDEX_FROM_DRAWABLE" %}} - get collection name and local index from global drawable index
- {{% native_link "GET_PED_COLLECTION_NAME_FROM_PROP" %}}, {{% native_link "GET_PED_COLLECTION_LOCAL_INDEX_FROM_PROP" %}} - get collection name and local index from global prop index
- {{% native_link "GET_PED_DRAWABLE_GLOBAL_INDEX_FROM_COLLECTION" %}} - get global drawable index from collection name and local index
- {{% native_link "GET_PED_PROP_GLOBAL_INDEX_FROM_COLLECTION" %}} - get global prop index from collection name and local index

#### Analogues to existing natives

| Old (global index based) native | New (collection-based) native |
| ---------- | ---------- |
| {{% native_link "SET_PED_COMPONENT_VARIATION" %}} | {{% native_link "SET_PED_COLLECTION_COMPONENT_VARIATION" %}} |
| {{% native_link "SET_PED_PROP_INDEX" %}} | {{% native_link "SET_PED_COLLECTION_PROP_INDEX" %}} |
| {{% native_link "SET_PED_PRELOAD_VARIATION_DATA" %}} | {{% native_link "SET_PED_COLLECTION_PRELOAD_VARIATION_DATA" %}} |
| {{% native_link "SET_PED_PRELOAD_PROP_DATA" %}} | {{% native_link "SET_PED_COLLECTION_PRELOAD_PROP_DATA" %}} |
| {{% native_link "GET_NUMBER_OF_PED_DRAWABLE_VARIATIONS" %}} | {{% native_link "GET_NUMBER_OF_PED_COLLECTION_DRAWABLE_VARIATIONS" %}} |
| {{% native_link "GET_NUMBER_OF_PED_PROP_DRAWABLE_VARIATIONS" %}} | {{% native_link "GET_NUMBER_OF_PED_COLLECTION_PROP_DRAWABLE_VARIATIONS" %}} |
| {{% native_link "GET_NUMBER_OF_PED_TEXTURE_VARIATIONS" %}} | {{% native_link "GET_NUMBER_OF_PED_COLLECTION_TEXTURE_VARIATIONS" %}} |
| {{% native_link "GET_NUMBER_OF_PED_PROP_TEXTURE_VARIATIONS" %}} | {{% native_link "GET_NUMBER_OF_PED_COLLECTION_PROP_TEXTURE_VARIATIONS" %}} |
| {{% native_link "IS_PED_COMPONENT_VARIATION_VALID" %}} | {{% native_link "IS_PED_COLLECTION_COMPONENT_VARIATION_VALID" %}} |
| {{% native_link "IS_PED_COMPONENT_VARIATION_GEN9_EXCLUSIVE" %}} | {{% native_link "IS_PED_COLLECTION_COMPONENT_VARIATION_GEN9_EXCLUSIVE" %}} |
| {{% native_link "GET_PED_DRAWABLE_VARIATION" %}} | {{% native_link "GET_PED_DRAWABLE_VARIATION_COLLECTION_LOCAL_INDEX" %}} |
| {{% native_link "GET_PED_DRAWABLE_VARIATION" %}} | {{% native_link "GET_PED_DRAWABLE_VARIATION_COLLECTION_NAME" %}} |
| {{% native_link "GET_PED_PROP_INDEX" %}} | {{% native_link "GET_PED_PROP_COLLECTION_LOCAL_INDEX" %}} |
| {{% native_link "GET_PED_PROP_INDEX" %}} | {{% native_link "GET_PED_PROP_COLLECTION_NAME" %}} |

### Examples

Below are some example lua scripts that illustrate usage of the new natives.

Listing all collections available for ped and number of component and prop drawable variations available in each collection:

```lua
function printFullCollectionInfo(ped, collectionName)
    print(string.format("   Name: \"%s\"", collectionName))

    print("   Number of drawable variations per component number:")
    -- See https://docs.fivem.net/natives/?_0x262B14F48D29DE80 for the list of all components.
    for i = 0, 12 do
        local drawableVariationsCount = GetNumberOfPedCollectionDrawableVariations(ped, i, collectionName)
        print(string.format("       For component %d: %d", i, drawableVariationsCount))
    end

    print("   Number of drawable variations per anchor point:")
    -- See https://docs.fivem.net/natives/?_0x93376B65A266EB5F for the list of all anchor points.
    for i = 0, 12 do
        local drawablePropVariationsCount = GetNumberOfPedCollectionPropDrawableVariations(ped, i, collectionName)
        print(string.format("       For anchor %d: %d", i, drawablePropVariationsCount))
    end
end

function printFullCollectionsInfo(ped)
    local collectionsCount = GetPedCollectionsCount(ped)
    print(string.format("Found %d collections", collectionsCount))
    for i = 0, collectionsCount - 1 do
        local collectionName = GetPedCollectionName(ped, i)

        print(string.format("Collection %d", i))
        printFullCollectionInfo(ped, collectionName)
    end
end

RegisterCommand('PrintFullPlayerPedCollectionsInfo', function(source)
    local playerPed = PlayerPedId()
    printFullCollectionsInfo(playerPed)
end, true)
```

Set new ped look (for `mp_f_freemode_01` ped model, see https://docs.fivem.net/docs/game-references/ped-models/, other models may have less drawable variations available):

```lua
function setLook(ped)
    -- Use head (component id 0) from base game collection (empty string) and local index 27.
    -- Base game collection indexes and global indexes are the same (see documentation above).
    -- Same as SetPedComponentVariation(ped, 0, 27, 0, 0)
    SetPedCollectionComponentVariation(ped, 0, '', 27, 0, 0)

    -- Use pants (component id 4) from mpHeist DLC collection ("female_heist"), local index 9 and texture number 3.
    -- Same as SetPedComponentVariation(ped, 4, 41, 3, 0)
    SetPedCollectionComponentVariation(ped, 4, 'female_heist', 9, 3, 0)

    -- Use hat (anchor point 0) from mpBiker DLC collection ("mp_f_bikerdlc_01"), local index 0 and texture number 0.
    -- Same as SetPedPropIndex(ped, 0, 82, 0, 0)
    SetPedCollectionPropIndex(ped, 0, 'mp_f_bikerdlc_01', 0, 0, false)
end

function testInvalidComponentVariation(ped)
    -- Attempt to set shirt (component id 11) from mpBeach DLC collection ("female_freemode_beach") but invalid (out of bounds) local index 999999.
    -- The component drawable variation will not be set since the variation is invalid.
    SetPedCollectionComponentVariation(ped, 11, 'female_freemode_beach', 999999, 0, 0)

    -- Confirm that previously requested drawable variation is indeed invalid.
    -- Same as IsPedComponentVariationValid(ped, 11, 999999 + 16, 0, 0)
    -- +16 because there are 16 drawable variations in the base game collection that go before the mpBeach DLC collection.
    if not IsPedCollectionComponentVariationValid(ped, 11, 'female_freemode_beach', 999999, 0, 0) then
        print("Invalid component drawable variation was requested.")
    end
end

RegisterCommand('SetPlayerPedLook', function(source)
    local playerPed = PlayerPedId()
    setLook(playerPed)
    testInvalidComponentVariation(playerPed)
end, true)
```

Print information about drawable variations that are set for the ped:

```lua
function printPedLookInfo(ped, componentId)
    print(string.format("For component id %d, the following drawable is used:", componentId))

    local collectionName = GetPedDrawableVariationCollectionName(ped, componentId)
    local collectionLocalIndex = GetPedDrawableVariationCollectionLocalIndex(ped, componentId)

    print(string.format("   Collection name: \"%s\"", collectionName))
    print(string.format("   Local drawable index: %d", collectionLocalIndex))

    -- Will get the same result as if we called GetPedDrawableVariation(ped, componentId)
    local globalDrawableIndex = GetPedDrawableGlobalIndexFromCollection(ped, componentId, collectionName, collectionLocalIndex)

    print(string.format("   Which corresponds to global drawable index: %d", globalDrawableIndex))
end

RegisterCommand('PrintPlayerPantsInfo', function(source)
    local playerPed = PlayerPedId()
    -- Print info about drawable variation that is set as pants (component id 4).
    printPedLookInfo(playerPed, 4)
end, true)
```
