#!/bin/bash

echo "Enter service name:"
read service

if systemctl is-active --quiet "$service"
then
    echo "$service is running"
else
    echo "$service is not running"
fi