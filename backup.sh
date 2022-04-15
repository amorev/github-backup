#!/bin/sh

set -ex

TYPE="$1"
if [[ -z $TYPE ]]
then
  TYPE="USER"
fi
ORG="$2"
AUTHENTICATION_API_TOKEN="${GITHUB_AUTH_TOKEN:?"must be set and non-empty"}:x-oauth-basic"
DATE=$(date +"%Y%m%d")
TEMP_DIR="github_${TYPE}_${ORG}_${DATE}"
BACKUP_FILE="${TEMP_DIR}.tgz"
REPOS_API_URL="https://api.github.com/user/repos"

MESSAGE_STRING="Fetching USER repositories"
if [[ $TYPE = "org" ]]
then
REPOS_API_URL="https://api.github.com/orgs/${ORG}/repos?type=owner"
MESSAGE_STRING="Fetching $ORG organization repositories"
fi

echo $MESSAGE_STRING to $BACKUP_FILE file

mkdir -p "backups/$TEMP_DIR" && cd "backups/$TEMP_DIR"
curl -u $AUTHENTICATION_API_TOKEN -s "$REPOS_API_URL" | grep -Eo '"ssh_url": "[^"]+"' | awk '{print $2}' | xargs -n 1 git clone --mirror
cd ..
tar zcf "$BACKUP_FILE" "$TEMP_DIR"
rm -rf "$TEMP_DIR"
