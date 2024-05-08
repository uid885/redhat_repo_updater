#!/bin/bash
# Author             : Christo Deale
# Date	             : 2024-05-08
# redhat_repo_updater: Utility to update repo on reposerver

# Define the repository ID
REPO_ID="redhat_repo"

# Define the base directory where the repository is stored
REPO_BASE_DIR="/opt/repo-packages-homelab"

# Run reposync to update the repository
reposync --gpgcheck --repoid="$REPO_ID" -l -p "$REPO_BASE_DIR"

# Run createrepo to recreate the repository metadata
createrepo "$REPO_BASE_DIR"

# Restart the Apache HTTP server to apply changes
systemctl restart httpd

echo "Repository $REPO_ID has been updated and metadata has been recreated."
