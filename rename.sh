#!/bin/bash

# The script renames the base project directory and
# changes all the files that depend on its name.

if [[ -n $1 && -n $2 ]]
then
    files=(
    "./docker-compose.prod.yml"
    "app/manage.py"
    "app/$1/asgi.py"
    "app/$1/settings.py"
    "app/$1/wsgi.py"
    )

    for file in ${files[@]}; do
        sed -i "s/$1/$2/g" $file
        echo "Changed '$file' file"
    done

    mv app/$1 app/$2
    echo "Renamed folder '$1' to '$2'"
else
    echo "Usage: ./rename.sh {initial_project_name} {new_project_name}"
fi