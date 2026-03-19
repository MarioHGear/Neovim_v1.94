#!/bin/bash
echo "Instalando dependencias del sistema para mi config de Neovim..."
sudo pacman -S neovim git base-devel nodejs npm python python-pip unrar ripgrep fd lazygit --noconfirm
echo "¡Listo! Ahora clona tu repo y abre nvim."
