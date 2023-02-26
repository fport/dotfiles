#!/bin/bash

# Paket listesini içeren dosya yolu
packages_file="./packages.txt"

# Dosya mevcut mu kontrol edin
if [[ ! -f "$packages_file" ]]; then
  echo "Paket listesi dosyası ($packages_file) mevcut değil!"
  exit 1
fi

# Paketleri yüklemek için döngü
while read package; do
  # Paketin yüklü olup olmadığını kontrol edin
  if brew list "$package" >/dev/null 2>&1; then
    echo "$package zaten yüklü, atlanıyor..."
  else
    echo "========================"
    echo "Yükleme: $package"
    echo "========================"
    brew install "$package"
  fi
done < "$packages_file"
