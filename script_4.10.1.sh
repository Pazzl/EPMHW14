#!/bin/bash

until [[ "${IN_STR}" == "quit" ]]
do
    read -p "Enter text: " IN_STR
done