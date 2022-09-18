#!/bin/bash

for folder in */ ; do
        echo "Update ${folder}?"
        read input
        if [ "y" == "${input}" ]; then
                cd "${folder}"
		echo "=========================== Update =============================="
                ./update.sh
                echo "=========================== Latest =============================="
                ./latest.sh
                echo "=========================== Stable =============================="
                ./stable.sh
                cd -
        else
                echo "Ignoring ${folder}"
        fi
done
