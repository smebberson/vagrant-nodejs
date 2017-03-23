# vagrant-nodejs

A simple and general purpose Node.js VM.

- Node.js v7.x
- NPM v4.x
- Git v2.x

## Requirements

There are few requirements for AEMIS development, as most of the dependencies are automatically installed for you, via Vagrant.

- Vagrant
- VMWare Fusion (and Vagrant-VMware provider plugin) or Virtualbox
- Vagrant Host Manager plugin (execute `vagrant plugin install vagrant-hostmanager` to install).

## Usage

Once you've forked this repository:

- Edit `vagrant.json` and customize to suit your needs.
- Run `vagrant up` to create the virtual machine.
- Run `vagrant ssh` to gain command line access within the virtual machine and go crazy.

## Creating a brand new repository

If you would rather not fork, but use this as a starting point (as I usually do), follow these steps:

- Clone this repository to your computer.
- Run `git archive --format zip --output /full/path/to/zipfile.zip master` to create an export of the repositories files.
- Run `unzip /full/path/to/zipfile.zip -d /full/path/to/new/repository` to unzip the contents to a new folder.
- Run `cd /full/path/to/new/repository && git init` to initialize a new git repository.
- Run `git add .` to stage all files and folders.
- Run `git commit -m "Initial commit."` to create the first commit.

You now have a brand new repository, based off the files in this repository.

If you work with GitHub:

- Run `git remote add origin https://github.com/<youraccount>/<yourrepository>.git` to add GitHub as a remote origin.
- Run `git push -u origin master` to synchronize the repository with the remote origin on GitHub.

## License

[MIT](LICENSE.md)
