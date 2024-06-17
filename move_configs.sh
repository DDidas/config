#!/bin/bash

# Setze das Verzeichnis deines Konfigurations-Repositories
# Ändere dies entsprechend, wenn dein Repository in einem anderen Verzeichnis geklont wird
REPO_DIR=~/my-configs

# Funktion, um Dateien sicher zu verschieben
move_if_exists() {
  if [[ -e "$1" ]]; then
    mv "$1" "$2"
    echo "Verschoben: $1 nach $2"
  else
    echo "Datei nicht gefunden: $1"
  fi
}

# Verschiebe zsh Konfigurationen an die richtigen Stellen
move_if_exists $REPO_DIR/.zshrc ~/
move_if_exists $REPO_DIR/.zprofile ~/
move_if_exists $REPO_DIR/.zshenv ~/
move_if_exists $REPO_DIR/.zlogin ~/
move_if_exists $REPO_DIR/.p10k.zsh ~/

# Überprüfe, ob das Verzeichnis .config/wezterm existiert, wenn nicht, erstelle es
mkdir -p ~/.config/wezterm

# Verschiebe die WezTerm Konfiguration an die richtige Stelle
move_if_exists $REPO_DIR/wezterm.lua ~/.config/wezterm/

# Gib eine abschließende Meldung aus
echo "Konfigurationsdateien wurden erfolgreich verschoben."


