#!/bin/sh

patch -d ./data/app/lib -uNr- --dry-run -p0 < patches/lib.patch
patch -d ./data/app/resources -uNr- --dry-run -p0 < patches/resources.patch
