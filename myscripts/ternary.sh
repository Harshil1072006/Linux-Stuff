#!/bin/bash

#condition 1 && condition 2 || condition 3
read -p "Enter your age " age

[[ $age -ge 18 ]] && echo "Audalt" || echo "child"

