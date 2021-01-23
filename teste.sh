#!/bin/bash   

echo "Change time for files"   
find ~/.PhpStorm* -type d -exec touch -t $(date +"%Y%m%d%H%M") {} \;   

echo "removing evaluation key"   
rm ~/.PhpStorm*/config/eval/PhpStorm*.evaluation.key   

echo "resetting evalsprt in options.xml"   
#for version after 2018,3   
sed -i '/evlsprt/d' ~/.PhpStorm*/config/options/other.xml   
# for older versions   
sed -i '/evlsprt/d' ~/.PhpStorm*/config/options/options.xml   

echo "resetting evalsprt in prefs.xml"   
sed -i '/evlsprt/d' ~/.java/.userPrefs/prefs.xml   

echo "removing evals folders"   
rm -rf ~/.java/.userPrefs/jetbrains/phpstorm/   
