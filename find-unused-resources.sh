#!/bin/sh

#print usual html headers
echo "<html>"
echo "<h2> Unused resources </h2>"
#usual disclaimer
echo "<i> <b>Note:</b> This scans searches all the source folders( .h, .m) and user interface definitions (.xib, .nib ، .storyboard). Please look for images carefully in the below list which are used in the project definition (pbxproj file) in runtime in the code like 'image_%d',1 .<br>In order for links to work the report file must be in the same folder as project.</i>"
unusedfiles="";
#initialize the counter
let count=0;
let totalsize=0;
# collect the files needs to be introspected
project=`find $1 -name '*.?ib' -o -name '*.[mh]' -o -name '*.storyboard'`

for i in `find $1 -name '*.gif' -o -name '*.jpg' -o -name '*.JPG' -o -name '*.png' -o -name '*.PNG' -o -name '*.jpeg' -o -name '*.JPEG'`; do
file=`basename -s .jpg "$i" | xargs basename -s .JPG | xargs basename -s .png | xargs basename -s .PNG | xargs basename -s @2x | xargs basename -s @3x`
if ! grep -q $file $project; then

if [[ $i == *"Images.xcassets"* ]]
then
continue;
fi

filesize=`stat -f "%z" $i`;

if [[ -z "$filesize" ]]
then
continue;
fi

filesizekb=`echo "$filesize 1024.0" | awk '{printf "%.2f", $1 / $2}'`
unusedfiles="$unusedfiles <br> <a href=\"$i\">$i</a> ($filesizekb kb)";
let "count += 1";
let "totalsize += $filesize"
fi
done

#construct body
totalsizekb=`echo "$totalsize 1024.0" | awk '{printf "%.2f", $1 / $2}'`
echo "<body>"
echo "<h3>"
echo "There are $count unused images (total size: $totalsizekb kb)"
echo "</h3>"
echo "<pre>"

#generate body content if there are unused files.
if [ $count > 0 ]; then
echo $unusedfiles;
fi
echo "</pre>"

echo "</body>"
echo "</html>"

#thats it!
