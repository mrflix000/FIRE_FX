
#!/data/data/com.termux/files/usr/bin/bash

set -e

REPO="YOUR_USERNAME/FIRE-FX"
DIR="$HOME/.firefx"
BIN="$PREFIX/bin"

echo "[+] Installing FIRE FX..."

pkg install python git -y

if [ -d "$DIR/.git" ]; then
    git -C "$DIR" pull --ff-only
else
    git clone "https://github.com/$REPO.git" "$DIR"
fi

mkdir -p "$BIN"

cat > "$BIN/firefx" <<'EOF'
#!/data/data/com.termux/files/usr/bin/bash
cd "$HOME/.firefx"
exec python firefx.py "$@"
EOF

chmod 700 "$BIN/firefx"

echo "[+] FIRE FX installed!"
echo "[+] Run: firefx"
