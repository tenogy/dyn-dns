#!/bin/bash
echo "startup runnning...";
#buildDir=$projectDir/devops/scripts;

function main {
   
    echo "reading config from path $1"
    buildDir=$projectDir/devops/scripts;
    
    source $buildDir/parse_yaml.sh;
    eval $(parse_yaml $1 "config_")
   
    echo "version:${config_version}";

    echo "increment build number"
    awk -F ': ' '/buildNumber/{$2=$2+1""}1' OFS=': ' $2 > _current.tmp && mv -f _current.tmp $2 

    echo "read state"
    eval $(parse_yaml $2 "state_")
    echo "buildNumber:${state_buildNumber}";

    appVersion="${config_version}.${state_buildNumber}";
    echo "build the app ${appVersion}";
    cd $projectDir;
    docker build --no-cache -t $imageName:$appVersion --build-arg VERSION=$sdkVersion -f devops/Dockerfile .
  
    
    exit
}
