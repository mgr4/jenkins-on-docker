#!/bin/bash

KEYS_DIR="keys"

# Check if keys directory exists
if [ ! -d "$KEYS_DIR" ]; then
  echo "Directory '$KEYS_DIR' does not exist. Creating the directory..."
  mkdir "$KEYS_DIR"
fi

# Remove existing keys and authorized_keys file
if [ -f "$KEYS_DIR/id_rsa" ] || [ -f "$KEYS_DIR/id_rsa.pub" ] || [ -f "$KEYS_DIR/authorized_keys" ]; then
  echo "Removing existing keys and authorized_keys file..."
  rm -f "$KEYS_DIR/id_rsa" "$KEYS_DIR/id_rsa.pub" "$KEYS_DIR/authorized_keys"
fi

# Generate new SSH keys
echo "Generating new SSH keys..."
ssh-keygen -f "$KEYS_DIR/id_rsa" -t rsa -N ""

# Create authorized_keys file
echo "Creating authorized_keys file..."
cp "$KEYS_DIR/id_rsa.pub" "$KEYS_DIR/authorized_keys"

cd ..