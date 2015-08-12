Some useful utilities to help iOS development

find-unused-resource.sh

A small utility which generates a report of unused resources ( .gif, .jpg, .png, .jpeg) in the xcode project. Searches all the source folders( .h, .m) and user interface definitions (.xib, .nib ، .storyboard). This will generate a list of images for cleaning up.

Steps for using this script are following:

Step 1: Create folder<Project_Name_Unused_Images> on Desktop.
Step 2: Open terminal and cd to that folder(cd and drag folder to terminal).
Step 3: Type this command on terminal: 
	sh find-unused-resources.sh Project_Path > unused_images.html

Note: <Project_Path> Remove this and drag the project folder and press Enter.

You can show unused_images.html in same folder open in any browser and show the list of unused images.


Note: There are some constraint in this script

If any resources used runtime in the code like ”image_%d”,1 . image_1.png is a false positive.

Ignore created named “0” file.

===========================================================================
All rights reserved.
 