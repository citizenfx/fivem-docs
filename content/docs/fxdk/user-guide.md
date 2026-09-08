---
title: FxDK User Guide
weight: 950
---

# Projects

## Creating a new project
We're assuming you're completely new to this. Once you open FxDK (Cfx.re Development Kit), you should see a dialog that displays a list of projects (if any exist) and two buttons, one named 'Create New Project', along with another one named 'Open Project'.

For this, we're going to click on 'Create New Project'.

![Welcome screen, create new project](/fxdk/fxdk-welcome-screen-create-new-project.png)

Once you click on 'Create New Project', another dialog will be shown titled 'Create New Project', this dialog will ask you what the Project name should be, as well as the directory for that project. For this specific scenario, we're going to name our project 'my_project' and we're going to select a path for our project by clicking on 'Select' and selecting a folder.

Click on 'Create' once done.

![Creating a new project dialog](/fxdk/fxdk-create-new-project-dialog.png)

Congratulations 🎉, your project is now created and you can move over to either, [creating a map](#creating-a-map), or [creating a new resource](#creating-a-new-resource).

## Building a project
You can build your project by clicking on 'Build Project' next to the play icon at the top of the project explorer. The project will be built relative to where your project is located. You can change the project build directory by clicking on 'Open Build Modal' which is shown as a cog.

![Build project settings icon](/fxdk/fxdk-build-project-settings-icon.png)

# Resources

## Creating a new resource
In order to create a new resource, we're going to click on the '+' icon at the top of the project explorer, this button is located next to the 'Project settings' cog.

![Create a new resource icon](/fxdk/fxdk-create-new-resource-icon.png)


A new dialog named 'Create Resource' will show on our screen, at this point we're going to be asked a name for our resource, as well as the template we're going to use. We're going to name this resource 'my-resource' and will use 'Lua' as the template. Once that's done, we're going to click on 'Create'.

![Create a new resource dialog](/fxdk/fxdk-create-resource-dialog.png)

From this point on, we're going to get a pretty standard Lua template we can work on. 

## Running and testing a resource
You can test a resource by clicking on 'Start server', located over the top left where the project explorer is located. Doing so will create a local server for you, running the current resource you are working on.

![Start server icon](/fxdk/fxdk-start-server-icon.png)

During this state, you will be able to test your resource and perform edits to scripts (server and client-side) all while the server is running, which is extremely useful if you want to see how a hud element would behave in-game for example.

## Adding new files to your resource
You can add new files to your resource by right clicking on the project explorer, from there you can add any file you want. _Remember to add this file to your `fxmanifest.lua` once it's added so things work accordingly_. 

If you're not sure how the resource manifest works, you should check [this](/docs/scripting-reference/resource-manifest/resource-manifest) out.

# Assets

## Importing an asset
FxDK allows us to import assets, for this use case we're going to import an asset from 'Example resources'. In order to do this we're going to click on 'Import Asset' located next to the '+' icon at the top of the project explorer.

![Import asset icon](/fxdk/fxdk-import-asset-icon.png)

Once we click on 'Import Asset', a dialog named 'Import Asset From' will be shown, this has several ways to import an asset including a way to import one from a Git repository, but for this use case we're just going to import one of the example resources. So click on 'Example resources' from the left navigation pane and pick a name for your asset. For this specific use case, we're going to use 'my-asset', but you can pick anything you want.

We're going to use the 'Loading Screen' example by clicking on it, after that we click 'Import'.

![Import asset from dialog](/fxdk/fxdk-import-asset-from-dialog.png)

That's it, our example asset will be imported and we will now be able to use it by clicking on 'Start server', located over the top left where the project explorer is located.

# Maps

## Introduction
FxDK's World Editor easily allows us to create maps, some of what is mentioned here, can be found under the [world editor page](/docs/fxdk/world-editor). This is only created as a user guide aimed toward users who would rather prefer to have things in this fashion.

## Creating a map
We're going to create a very simple map by just adding a couple of objects to the environment. In order to do this we're going to click on 'New Map' located next to the '+' icon at the top of the project explorer.

![New map icon](/fxdk/fxdk-new-map-icon.png)

After clicking on that, we're going to be asked what we want to name our map, we will name it 'my-map' followed by pressing enter. Once we do so, a new entry will be created on the project explorer, named 'my-map'.

![Map on project explorer](/fxdk/fxdk-map-on-project-explorer.png)

We're going to click on it, and the world editor will start loading. Once it loads, we're going to be greeted by a tutorial.

![World editor greet screen](/fxdk/fxdk-world-editor-greet-screen.png)

From this point on we can either choose to follow the tutorial or to skip it completely, it's a good idea to follow it as a starting point, since it explains what most UI elements do. We're now ready to move over to the next section, which is [adding objects](#adding-an-object).

## Adding an object
To add an object, we're going to go over the plus sign on the top left corner of our world editor (`CTRL+A`) and we're going to pick an object by clicking on an item on the list. The editor allows us to search for objects and shows previews of them.

![Adding an object](/fxdk/fxdk-world-editor-add-box-object.png)

Once the object is placed we can start [manipulating it](#manipulating-an-object), which is explained down below.

## Manipulating an object
Manipulating an object allows us to modify its position and scale to name a few things. Now in order to manipulate an object, we have to first find it. To do this, we click on 'Map Additions' and select the object we want to edit.

![Finding an object](/fxdk/fxdk-world-editor-find-object.png)

Once we click on the object we want to edit, we will be shown the object with white highlighting all around it along with a couple pivot points and some controls down below, shown at the bottom of the following image.
These controls from left to right indicate the following:

- Switch to local coords
- Translate (Move)
- Rotate
- Scale

*Manipulating an object*

![Manipulating an object](/fxdk/fxdk-world-editor-object-edit.png)

We're going to click on 'Translate', which essentially means 'Move' and we're going to place this object somewhere by using the pivot points. Once that's done we don't need to do anything else, we can click on 'Play' at the top right or simply press `F5` to try out our new map. Changes will be automatically saved.
