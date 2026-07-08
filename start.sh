#!/bin/bash

echo "--- JAMOD AI MASTER STARTUP ---"

# Ollama check aur restart
pkill ollama
echo "[+] Starting Ollama Server..."
ollama serve > /dev/null 2>&1 &
sleep 5

# Check ki model install hai ya nahi
if ! ollama list | grep -q "llama3.2"; then
    echo "[!] Model download nahi hai, download ho raha hai (Wait karein)..."
    ollama pull llama3.2
fi

clear
echo "--- JAMOD AI READY ---"
echo "Ab tum AI se baat kar sakte ho!"
ollama run llama3.2
