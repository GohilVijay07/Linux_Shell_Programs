#!/bin/bash

echo "Deleting .obj, .lst and empty files..."

find . -type f -name "*.obj" -delete

find . -type f -name "*.lst" -delete

find . -type f -size 0 -delete

echo "Deletion complete."