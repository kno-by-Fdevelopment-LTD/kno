#!/usr/bin/env bash
# install.sh — Installateur Kno pour Linux
# Usage : curl -fsSL https://raw.githubusercontent.com/kno-by-Fdevelopment-LTD/kno/main/install.sh | bash

set -e

KNO_VERSION="1.7.7"
REPO="kno-by-Fdevelopment-LTD/kno"
ASSET="Kno-linux-x64-v${KNO_VERSION}.tar.gz"
URL="https://github.com/${REPO}/releases/download/v${KNO_VERSION}/${ASSET}"
INSTALL_DIR="$HOME/.kno"
BIN_DIR="$HOME/.local/bin"

echo ""
echo "╔══════════════════════════════════════╗"
echo "║   Installation de Kno v${KNO_VERSION}         ║"
echo "╚══════════════════════════════════════╝"
echo ""

# Vérifier curl ou wget
if command -v curl &>/dev/null; then
    DOWNLOAD="curl -fsSL --progress-bar"
elif command -v wget &>/dev/null; then
    DOWNLOAD="wget -q --show-progress -O -"
else
    echo "Erreur : curl ou wget requis."
    exit 1
fi

# Créer les dossiers
mkdir -p "$INSTALL_DIR" "$BIN_DIR"

# Téléchargement
echo "→ Téléchargement de Kno v${KNO_VERSION}..."
if command -v curl &>/dev/null; then
    curl -fsSL --progress-bar -L "$URL" -o "$INSTALL_DIR/$ASSET"
else
    wget -q --show-progress "$URL" -O "$INSTALL_DIR/$ASSET"
fi

# Extraction
echo "→ Extraction..."
tar -xzf "$INSTALL_DIR/$ASSET" -C "$INSTALL_DIR" --strip-components=1
rm -f "$INSTALL_DIR/$ASSET"
chmod +x "$INSTALL_DIR/kno"

# Créer le lanceur dans ~/.local/bin
cat > "$BIN_DIR/kno" << 'LAUNCHER'
#!/usr/bin/env bash
cd "$HOME/.kno"
exec "$HOME/.kno/kno" "$@"
LAUNCHER
chmod +x "$BIN_DIR/kno"

# Ajouter ~/.local/bin au PATH si nécessaire
SHELL_RC=""
if [ -f "$HOME/.bashrc" ]; then SHELL_RC="$HOME/.bashrc"; fi
if [ -f "$HOME/.zshrc" ]; then SHELL_RC="$HOME/.zshrc"; fi

if [ -n "$SHELL_RC" ] && ! grep -q '\.local/bin' "$SHELL_RC"; then
    echo 'export PATH="$HOME/.local/bin:$PATH"' >> "$SHELL_RC"
    echo "→ PATH mis à jour dans $SHELL_RC"
fi

export PATH="$HOME/.local/bin:$PATH"

echo ""
echo "✓ Kno installé dans $INSTALL_DIR"
echo ""
echo "═══════════════════════════════════════════"
echo "  Pour lancer Kno :"
echo ""
echo "  kno"
echo ""
echo "  Puis ouvrez : http://localhost:8000"
echo "═══════════════════════════════════════════"
echo ""
echo "  Note : si 'kno' n'est pas trouvé, tapez :"
echo "  source ~/.bashrc && kno"
echo ""