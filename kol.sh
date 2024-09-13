#!/bin/bash

# Daftar window ID untuk masing-masing browser
browsers=(58720257 106954814 109051966)

# Fungsi untuk berpindah ke browser berikutnya berdasarkan window ID
switch_to_next_browser() {
    for window_id in "${browsers[@]}"; do
        # Cek apakah window ID masih valid (jendela masih terbuka)
        xdotool getwindowname "$window_id" > /dev/null 2>&1
        if [ $? -eq 0 ]; then
            echo "Berpindah ke browser dengan Window ID: $window_id"
            # Fokus ke jendela browser berdasarkan window ID
            xdotool windowactivate --sync "$window_id"
            break
        else
            echo "Window ID $window_id tidak ditemukan atau tidak aktif."
        fi
    done
}

# Deteksi input tombol Tab
while true; do
    # Jika tombol Tab ditekan, maka lakukan switching ke browser berikutnya
    read -rsn1 input
    if [ "$input" = $'\t' ]; then
        switch_to_next_browser
    fi
done
