Some useful utilities to help iOS development

find-unused-source_file.sh

A small utility which generates a report of unused resources ( .h , .m) in the xcode project. Searches all the source folders( .h, .m , .pch, .storyboard).This will generate a list of all .h files which are unused.

Steps for using this script are following:

Step 1: Create folder<Project_Name_Unused_Images> on Desktop.
Step 2: Open terminal and cd to that folder(cd and drag folder to terminal).
Step 3: Type this command on terminal: 

	sh find-unused-source_file.sh Project_Path > unused_files.html

Note: <Project_Path> Remove this and drag the project folder and press Enter.

You can show unused_files.html in same folder open in any browser and show the list of unused files.


Ignore created named “0” file.

===========================================================================
All rights reserved.
 