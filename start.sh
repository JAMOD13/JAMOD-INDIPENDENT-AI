#!/bin/bash

echo "=========================================="
echo "      JAMOD AI - FULLY INDEPENDENT        "
echo "=========================================="

# 1. Check & Install Dependencies
if ! command -v ollama &> /dev/null; then
    echo "[!] Ollama install nahi hai, install kar raha hoon..."
    pkg update && pkg install ollama -y
fi

# 2. Server Start (Background)
echo "[+] Ollama server start ho raha hai..."
ollama serve > /dev/null 2>&1 &
sleep 8

# 3. Model Pulling (Vision Model for Image & Text)
# Qwen-VL text aur image dono samajh sakta hai
echo "[+] AI Model load ho raha hai (Qwen-VL)..."
ollama pull qwen2.5-vl:3b

# 4. Final Setup
clear
echo "=========================================="
echo "    JAMOD AI READY! (Text & Image)        "
echo "=========================================="
echo "Tip: Image analyze karne ke liye path copy paste karo."
ollama run qwen2.5-vl:3b
