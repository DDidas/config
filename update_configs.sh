#!/bin/bash

# Setze das Verzeichnis deines Konfigurations-Repositories
CONFIG_REPO=~/my-configs

# Kopiere WezTerm Konfiguration
cp ~/.config/wezterm/wezterm.lua $CONFIG_REPO/

# Kopiere zsh Konfigurationen
cp ~/.zshrc $CONFIG_REPO/
cp ~/.zprofile $CONFIG_REPO/ 2>/dev/null
cp ~/.zshenv $CONFIG_REPO/ 2>/dev/null
cp ~/.zlogin $CONFIG_REPO/ 2>/dev/null

# Kopiere NeoVim Konfigurationen
mkdir -p $CONFIG_REPO/nvim
cp -R ~/.config/nvim/* $CONFIG_REPO/nvim/

# Wechsle zum Konfigurations-Repository
cd $CONFIG_REPO

# Füge alle geänderten Dateien zum Git-Repository hinzu
git add .

# Erstelle einen Commit mit dem aktuellen Datum und Uhrzeit als Nachricht
DATE=$(date +"%Y-%m-%d %H:%M:%S")
git commit -m "Update configurations at $DATE"





