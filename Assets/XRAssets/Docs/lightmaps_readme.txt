****************XRIToolset: 2018.1 - Acacia********************************************
Purpose: Baking Lightmaps Workflow Steps
A walk-through of the process to properly bake both day and night lightmaps for a scene
to use with the XRIToolset Day/Night lightmap swapping
****************©Copyright 100 Worries, All Rights Reserved*****************************

+ Supports ReflectionProbes present since Untioy 5.0+.
+ Use these steps in the proper order to bake lightmaps, this system assumes these routines are met!

**************************
Prerequisite
**************************
Prerequisite 1.)
If not already, put all your 'Day' baked lighting GameObjects onto an empty root GameObject at (0, 0, 0); see example gallery setup.

Prerequisite 2.)
If not already, put all your 'Night' baked lighting GameObjects onto an empty root GameObject at (0, 0, 0); see example gallery setup.

Prerequisite 3.)
If not already, configure the LightManager for both the day and night configurations for your scene; see example gallery setup.

**************************
Baking Lightmaps
**************************
Step .1)
Select the LightManager and hit the 'SwapLightmapSettings' button to read 'Night'.

Step .2)
Disable the 'Day' root lighting GameObject.

Step .2a)
Enable the 'Night' root lighting GameObject.

Step .3)
Bake the lightmaps as normal using the 'Lighting' Settings in Unity.

Step .3a)
Editor will create a folder with the same name as the scene in the same folder as the scene, this contains all the lightmaps and reflection maps.

Step 4.)
Duplicate this folder and move the duplicate version to the 'Resources' folder in the root 'Assets' directory.

Step 4.a)
Rename this duplicate folder back to the scene name, this is case senstive!

**************************
Repeat for Day Lightmaps
**************************
Step .5)
Select the LightManager and hit the 'SwapLightmapSettings' button to read 'Day'.

Step .6)
Disable the 'Night' root lighting GameObject.

Step .6a)
Enable the 'Day' root lighting GameObject.

Step .7)
Bake the lightmaps as normal using the 'Lighting' Settings in Unity.

Step .7a)
Editor will overwrite the previously created folder with the scene name with the new 'Day' lightmaps and reflection maps.

**************************
Finished
**************************
+ XRIToolset will now treat the lightmaps and reflectionmaps stored in the 'Resources' directory as the 'Night' set.
+ XRIToolset will now treat the lightmaps and reflectionmaps stored in the original scene named directory as the 'Day' set.