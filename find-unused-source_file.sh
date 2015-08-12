#!/bin/sh

#print usual html headers
echo "<html>"
echo "<h2> Unused resources </h2>"
#usual disclaimer
#echo "<i> <b>Note:</b> This scans all the xib, nib files for the images available. Please look for splash screens or other images carefully in the below list which are used in the project definition (pbxproj file).<br>In order for links to work the report file must be in the same folder as project.</i>"

if ! grep -q --exclude="$mfile\.*" $mfile $project; then

if [[ $i == *"SDK"* ]]
then
continue;
fi

unusedfiles="$unusedfiles <br> $i";
let "count = count + 1";

fi
done
echo "<i><b>Note:</b> This scans all source files (*.h, *.m, *.c, *.a, *.cpp) references in all pbxproj definitions. Once it is added into project definitions, it is considered being used.</i> <br>"

echo "<h3>"
echo "There are $count unused files"
echo "</h3>"
echo "<pre>"
#generate body content if there are unused files.
if [ $count > 0 ]; then
echo $unusedfiles;
fi
echo "</pre>"
echo "</body>"
echo "</html>"#thats it!
