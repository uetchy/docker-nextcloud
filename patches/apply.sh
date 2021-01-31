#!/bin/sh

patch --binary -ruN -p0 -d ./data/app/lib < patches/lib.patch
patch --binary -ruN -p0 -d ./data/app/resources < patches/resources.patch
