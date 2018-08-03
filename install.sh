#!/usr/bin/env bash
rm -rf ./pkg ./src ./surf-**
makepkg -sif --skipinteg --noconfirm
