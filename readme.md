# Github backup script

This is simple bash script for backup all of your user's or organization's repositories.

## Creating personal oauth token

Firsly, you should create your personal [oauth token](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/creating-a-personal-access-token).

## Running script

Next step is running of my script

```bash
# Fetching all your user repositories
GITHUB_AUTH_TOKEN=<your-token-here> bash backup.sh

# Fetching all your organization repositories
GITHUB_AUTH_TOKEN=<your-token-here> bash backup.sh org <your-org-name>
```

All your repositories will be fetched and stored as .tgz file.
