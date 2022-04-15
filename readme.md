# Github backup script

Русская версия инструкции здесь - https://amorev.ru/full-github-backup/

This is simple bash script for backup all of your user's or organization's repositories. Inspired by [stongo/github-backup](https://github.com/stongo/github-backup)

## Creating personal oauth token

Firsly, you should create your personal [oauth token](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/creating-a-personal-access-token).

### Connecting ssh key of your account

Script clones all of your repositories, using ssh clone. So you must to add your ssh-key to your github account. How-to is [here](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account)

## Running script

Next step is running of my script

```bash
# Fetching all your user repositories
GITHUB_AUTH_TOKEN=<your-token-here> bash backup.sh

# Fetching all your organization repositories
GITHUB_AUTH_TOKEN=<your-token-here> bash backup.sh org <your-org-name>
```

All your repositories will be fetched and stored as .tgz file. 

### Restoring data

```bash
# extract archive to /tmp
tar -C /tmp -xf repository.git.tgz

# clone project.git normally. /tmp/project.git is what gets extracted and is the output of the initial git clone --mirror
git clone /tmp/project.git

# change directory to the project
cd project

# change the remote url
git remote set-url origin https://new-remote.com/project.git

# push to new remote repository
git push origin master --tags
```
