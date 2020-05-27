#!/bin/bash

red=`tput setaf 1`
green=`tput setaf 2`
endcolor=`tput sgr0`

start () {
    echo "${green} $1 ${endcolor}";
}

end () {
    echo "${green}Done ... ${endcolor}";
}

execute () {
    start "*** Running $1 ***"
        bin/magento $1;
    end

    printf "\n";
}

permission () {
    start "*** chmod $1 for $2 ***"
        chmod -R $1 $2;
    end

    printf "\n";
}

rm -rf generated/
composer dumpautoload -o;
execute s:d:c
execute c:c
execute c:f
permission 777 var/
permission 777 generated/
permission 777 app/etc/
composer dumpautoload -o;
