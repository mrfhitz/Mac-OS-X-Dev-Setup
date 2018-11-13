## Mac OS X Dev Setup
This document describes how I set up my developer environment on a new MacBook or iMac. We will set up some developer tools and [Vagrant](https://www.vagrantup.com). Vagrant will be used as the core of our environment to set up the web servers. As you read and follow these steps, feel free to send me any feedback or comments you may have.

The document assumes you are new to Mac. The steps below were tested on **OS X Yosemite**.

If you have any comments or suggestions, feel free to give me a shout [on Twitter](https://twitter.com/mrfhitz)!

- [System update](#system-update)
- [System preferences](#system-preferences)
- [Browser preferences](#browser-preferences)
- [Homebrew](#homebrew)
- [Consolas](#consolas)
- [Beautiful terminal](#beautiful-terminal)
- [Git](#git)
- [Atom](#Atom)
- [Vim](#vim)
- [Vagrant](#vagrant)
- [Node.js](#nodejs)
- [SASS](#sass)
- [Heroku](#heroku)
- [Projects folder](#projects-folder)
- [Apps](#apps)

## System update
First thing you need to do, on any OS actually, is update the system! For that: Apple Icon > Software Update... Well done, you work like a pro!

## System preferences
If this is a new computer, there are a couple tweaks I like to make to the System Preferences. Feel free to follow these, or to ignore them, depending on your personal preferences.

In Apple Icon > System Preferences:
* Trackpad > Tap to click;
* Keyboard > Key Repeat > Fast (all the way to the right);
* Keyboard > Delay Until Repeat > Short (all the way to the right);
* Dock > Enable Automatically hide and show the Dock;
* Dock > Enable Minimize window into application Icon;
* Dock > Disable animate open applications;
* Dock > Enable Show indicators for open applications;
* Dock > Disable Magnification.

## Browser preferences
My main browser its Safary but some times its usefull to have another one like Chrome.

Donwload Chrome from [www.google.com/chrome](www.google.com/chrome). Open the .dmg file once it's done downloading (this will mount the disk image), and drag and drop the Google Chrome app into the Applications folder (on the Mac, most applications are installed this way). When done, you can unmount the disk in Finder (the small "eject" icon next to the disk under Devices).

## Homebrew

Package managers make it so much easier to install and update applications (for Operating Systems) or libraries (for programming languages). The most popular one for OS X is [Homebrew](http://brew.sh/).

### Install

An important dependency before Homebrew can work is the **Command Line Tools** for **Xcode**. These include compilers that will allow you to build things from source.

Now, Xcode weights something like 2GB, and you don't need it unless you're developing iPhone or Mac apps. Good news is Apple provides a way to install only the Command Line Tools, without Xcode. To do this you need to go to [http://developer.apple.com/downloads](http://developer.apple.com/downloads), and sign in with your Apple ID (the same one you use for iTunes and app purchases). Unfortunately, you're greeted by a rather annoying questionnaire. All questions are required, so feel free to answer at random.

Once you reach the downloads page, search for "command line tools", and download the latest **Command Line Tools (OS X Mountain Lion) for Xcode**. Open the **.dmg** file once it's done downloading, and double-click on the **.mpkg** installer to launch the installation. When it's done, you can unmount the disk in Finder.

**Note**: If you are running **OS X 10.9 Mavericks**, then you can install the Xcode Command Line Tools directly from the command line with `$ xcode-select --install`, and you don't have to go through the download page and the questionnaire.

Finally, we can install Hombrew! In the terminal paste the following line (without the `$`), hit **Enter**, and follow the steps on the screen:

    $ ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

One thing we need to do is tell the system to use programs installed by Hombrew (in `/usr/local/bin`) rather than the OS default if it exists. We do this by adding `/usr/local/bin` to your `$PATH` environment variable:

    $ echo 'export PATH="/usr/local/bin:$PATH"' >> ~/.bash_profile

Open a new terminal tab with **Cmd+T** (you should also close the old one), then run the following command to make sure everything works:

    $ brew doctor

### Usage

To install a package (or **Formula** in Homebrew vocabulary) simply type:

    $ brew install <formula>

To update Homebrew's directory of formulae, run:

    $ brew update

**Note**: I've seen that command fail sometimes because of a bug. If that ever happens, run the following (when you have Git installed):

    $ cd /usr/local
    $ git fetch origin
    $ git reset --hard origin/master

To see if any of your packages need to be updated:

    $ brew outdated

To update a package:

    $ brew upgrade <formula>

Homebrew keeps older versions of packages installed, in case you want to roll back. That rarely is necessary, so you can do some cleanup to get rid of those old versions:

    $ brew cleanup

To see what you have installed (with their version numbers):

    $ brew list --versions

## Consolas

I really like the Consolas font for coding. Being a Microsoft (!) font, it is not installed by default. Since we're going to be looking at a lot of terminal output and code, let's install it now.

There are two ways we can install it. If you bought **Microsoft Office for Mac**, install that and Consolas will be installed as well.

If you don't have Office, follow these steps:

    $ brew install cabextract
    $ cd ~/Downloads
    $ mkdir consolas
    $ cd consolas
    $ curl -LO https://sourceforge.net/projects/mscorefonts2/files/cabs/PowerPointViewer.exe
    $ cabextract PowerPointViewer.exe
    $ cabextract ppviewer.cab
    $ open CONSOLA*.TTF

And click **Install Font**. Thanks to Alexander Zhuravlev for his [post](http://blog.ikato.com/post/15675823000/how-to-install-consolas-font-on-mac-os-x).

## Beautiful terminal
Since we are gonna spend so much time in the terminal, we should try to make it a more pleasant and colorful place. What follows might seem like a lot of work, but trust me, it'll make the development experience so much better.

Let's go ahead and start by adding some color. I'm a big fan of the [Solarized](http://ethanschoonover.com/solarized) color scheme. It is supposed to be scientifically optimal for the eyes. I just find it pretty.

Scroll down the page and download the latest version. Unzip the archive.
In  **Terminal > Preferences** you will find some window profiles. Lets import the solarized profile.
* Click on the gear sign on the bottom left corner of the window, close to the "-" button. Them chose import;
* Navigate yourself to the  ``osx-terminal-colors-solarized``folder and chose the dark template;
* Then set the new profile as default.

Now let's change the font. In Terminal > Preferences..., under the tab Profiles, section Text, change both fonts to Consolas 13pt.

**Note:** You don't have to do this, but there is some color in this template that I like to ajust:
* Text: White;
* Bold Text: Grey White;
* Selection: Soft dark blue.

Finally, under the section **Window**, change the size to something better, like **Columns: 105** and **Rows: 27**.

Not a lot of colors yet. We need to tweak a little bit our Unix user's profile for that. This is done (on OS X and Linux), in the `~/.bash_profile` text file (`~` stands for the user's home directory).

We'll come back to the details of that later, but for now, just download the files [.bash_profile](https://raw.githubusercontent.com/mrfhitz/Mac-OS-X-Dev-Setup/master/.bash_profile), [.bash_prompt](https://raw.githubusercontent.com/mrfhitz/Mac-OS-X-Dev-Setup/master/.bash_prompt), [.aliases](https://raw.githubusercontent.com/mrfhitz/Mac-OS-X-Dev-Setup/master/.aliases) attached to this document into your home directory (`.bash_profile` is the one that gets loaded, I've set it up to call the others):

    $ cd ~
    $ curl -O https://raw.githubusercontent.com/mrfhitz/Mac-OS-X-Dev-Setup/master/.bash_profile
    $ curl -O https://raw.githubusercontent.com/mrfhitz/Mac-OS-X-Dev-Setup/master/.bash_prompt
    $ curl -O https://raw.githubusercontent.com/mrfhitz/Mac-OS-X-Dev-Setup/master/.aliases

With that, open a new terminal tab (Cmd+T) and see the change! Try the list commands: `ls`, `ls -lh` (aliased to `ll`), `ls -lha` (aliased to `la`).

At this point you can also change your computer's name, which shows up in this terminal prompt. If you want to do so, go to **System Preferences** > **Sharing**. For example, I changed mine from "Nicolas's MacBook Air" to just "MacBook Air", so it shows up as `MacBook-Air` in the terminal.

Now we have a terminal we can work with!

(Thanks to Mathias Bynens for his awesome [dotfiles](https://github.com/mathiasbynens/dotfiles).)

## Git

What's a developer without [Git](http://git-scm.com/)? To install, simply run:

    $ brew install git

When done, to test that it installed fine you can run:

    $ git --version

And `$ which git` should output `/usr/local/bin/git`.

Let's set up some basic configuration. Download the [.gitconfig](https://raw.githubusercontent.com/mrfhitz/Mac-OS-X-Dev-Setup/master/.gitconfig) file to your home directory:

    $ cd ~
    $ curl -O https://raw.githubusercontent.com/mrfhitz/Mac-OS-X-Dev-Setup/master/.gitconfig

It will add some color to the `status`, `branch`, and `diff` Git commands, as well as a couple aliases. Feel free to take a look at the contents of the file, and add to it to your liking.

Next, we'll define your Git user (should be the same name and email you use for [GitHub](https://github.com/) and [Heroku](http://www.heroku.com/)):

    $ git config --global user.name "Your Name Here"
    $ git config --global user.email "your_email@youremail.com"

They will get added to your `.gitconfig` file.

To push code to your GitHub repositories, we're going to use the recommended HTTPS method (versus SSH). So you don't have to type your username and password everytime, let's enable Git password caching as described [here](https://help.github.com/articles/set-up-git):

    $ git config --global credential.helper osxkeychain

**Note**: On a Mac, it is important to remember to add `.DS_Store` (a hidden OS X system file that's put in folders) to your `.gitignore` files. You can take a look at this webpage: [GitIgnore.io](https://www.gitignore.io).

## Vim

Although Atom will be our main editor, it is a good idea to learn some very basic usage of [Vim](http://www.vim.org/). It is a very popular text editor inside the terminal, and is usually pre-installed on any Unix system.

For example, when you run a Git commit, it will open Vim to allow you to type the commit message.

Vim's default settings aren't great, and you could spend a lot of time tweaking your configuration (the `.vimrc` file). But if you're like me and just use Vim occasionally, you'll be happy to know that [Tim Pope](https://github.com/tpope) has put together some sensible defaults to quickly get started.

First, install [pathogen.vim](https://github.com/tpope/vim-pathogen) by running:

    $ mkdir -p ~/.vim/autoload ~/.vim/bundle && \
        curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

Then create a file `~/.vimrc` (you can use `$ vim ~/.vimrc`), and paste in the following:

    execute pathogen#infect()
    syntax on
    filetype plugin indent on

Install the Vim "sensible defaults" by running:

    $ cd ~/.vim/bundle
    $ git clone git://github.com/tpope/vim-sensible.git

And finally, install the Vim "NERD Tree" by running:

    $ cd ~/.vim/bundle
    $ git clone https://github.com/scrooloose/nerdtree.git

With that, Vim will look a lot better next time you open it!

## Vagrant
[Vagrant](https://www.vagrantup.com) creates and configures a virtual development environments. It can be seen as a higher-level wrapper around virtualization software such as VirtualBox and around configuration management software such as Ansible, Chef, Salt and Puppet. With Vagrant i can create a virtual local VPS on my laptop.

### Install

[Vagrant](https://www.vagrantup.com) uses [Oracle Virtual Box](https://www.virtualbox.org) software to work. So please install Virtual box using the website .dmg file.
When the Virtualbox instalation its done download the [Vagrant](https://www.vagrantup.com) software from there webpage and just do the dame with vagrant.dmg.

### Usage
Usualy Vagrant will give you a empty virtual machine with Ubunto installed in it. Thats usefull but sounds really boring to prepare a machine every time you need a web dev environment. So that's why I made a bash script that will install everything you need when the environment its been made.

Just ust this command to download my vagrant config before turning your vagrant on:

    $ curl -O https://raw.githubusercontent.com/mrfhitz/Mac-OS-X-Dev-Setup/master/vagrant/bootstrap.sh
    $ curl -O https://raw.githubusercontent.com/mrfhitz/Mac-OS-X-Dev-Setup/master/vagrant/Vagrantfile

Now you are ready to use the vagrant commands, they have a lot of commands that you can learn but the one that you will use the most are:
* Start virtual env/Creacte virtual env: ``$ vagrant up``
* Turn off virtual env: ``$ vagrant halt``

**Note:** If you are using my config I made the vagrant to use the port [:8888](localhost:8888) as your apache server.
**ERROR:** If you get the error: ```Valid states are 'starting, running'. The machine is in the 'poweroff' state.``` you need to change the version of Virtualbox you have instaled. I have tested VirtualBox 4.3 and it work fine.

## Node.js

Install [Node.js](http://nodejs.org/) with Homebrew:

    $ brew update
    $ brew install node

The formula also installs the [npm](https://npmjs.org/) package manager. However, as suggested by the Homebrew output, we need to add `/usr/local/share/npm/bin` to our path so that npm-installed modules with executables will have them picked up.

To do so, add this line to your `~/.path` file, before the `export PATH` line:

```bash
PATH=/usr/local/share/npm/bin:$PATH
```

Open a new terminal for the `$PATH` changes to take effect.

We also need to tell npm where to find the Xcode Command Line Tools, by running:

    $ sudo xcode-select -switch /usr/bin

(If Xcode Command Line Tools were installed by Xcode, try instead:)

    $ sudo xcode-select -switch /Applications/Xcode.app/Contents/Developer

Node modules are installed locally in the `node_modules` folder of each project by default, but there are at least two that are worth installing globally. Those are [CoffeeScript](http://coffeescript.org/) and [Grunt](http://gruntjs.com/):

    $ npm install -g coffee-script
    $ npm install -g grunt-cli

### Npm usage

To install a package:

    $ npm install <package> # Install locally
    $ npm install -g <package> # Install globally

To install a package and save it in your project's `package.json` file:

    $ npm install <package> --save

To see what's installed:

    $ npm list # Local
    $ npm list -g # Global

To find outdated packages (locally or globally):

    $ npm outdated [-g]

To upgrade all or a particular package:

    $ npm update [<package>]

To uninstall a package:

    $ npm uninstall <package>

## SASS

CSS preprocessors are becoming quite popular, the most popular processors are [LESS](http://lesscss.org/) and [SASS](http://sass-lang.com). Preprocessing is a lot like compiling code for CSS. It allows you to reuse CSS in many different ways. Let's start out with using SASS as a basic preprocessor, it's used by a lot of popular CSS frameworks like [Bootstrap](http://getbootstrap.com/).

### Install

If you prefer the command line over an application then getting Sass set up is a fairly quick process. Sass has a Ruby dependency but if you're using a Mac, congratulations, Ruby comes pre-installed. Here's the quickest way we've found to start using Sass by using the command line:

Install Sass. Ruby uses Gems to manage its various packages of code like Sass. In your open terminal window type:

    $ gem install sass

This will install Sass and any dependencies for you. It's pretty magical. If you get an error message then it's likely you will need to use the ``sudo`` command to install the Sass gem. It would look like:

    $ sudo gem install sass

**Double-check.** You should now have Sass installed, but it never hurts to double-check. In your terminal application you can type:

    $ sass -v

It should return ``Sass 3.4.15 (Selective Steve)``. Congratulations! You've successfully installed Sass.. Great!

### Usage

If you have a directory with many Sass files that you want to be watched and compited to css at every save you can use the command:

    $ sass --watch app/sass:public/stylesheets

## Heroku

[Heroku](http://www.heroku.com/), if you're not already familiar with it, is a [Platform-as-a-Service](http://en.wikipedia.org/wiki/Platform_as_a_service) (PaaS) that makes it really easy to deploy your apps online. There are other similar solutions out there, but Heroku was among the first and is currently the most popular. Not only does it make a developer's life easier, but I find that having Heroku deployment in mind when building an app forces you to follow modern app development [best practices](http://www.12factor.net/).

### Install

Assuming that you have an account (sign up if you don't), let's install the [Heroku Client](https://devcenter.heroku.com/articles/using-the-cli) for the command-line. Heroku offers a Mac OS X installer, the [Heroku Toolbelt](https://toolbelt.heroku.com/), that includes the client. But for these kind of tools, I prefer using Homebrew. It allows us to keep better track of what we have installed. Luckily for us, Homebrew includes a `heroku-toolbelt` formula:

    $ brew install heroku-toolbelt

The formula might not have the latest version of the Heroku Client, which is updated pretty often. Let's update it now:

    $ heroku update

Don't be afraid to run `heroku update` every now and then to always have the most recent version.

### Usage

Login to your Heroku account using your email and password:

    $ heroku login

If this is a new account, and since you don't already have a public **SSH key** in your `~/.ssh` directory, it will offer to create one for you. Say yes! It will also upload the key to your Heroku account, which will allow you to deploy apps from this computer.

If it didn't offer create the SSH key for you (i.e. your Heroku account already has SSH keys associated with it), you can do so manually by running:

     $ mkdir ~/.ssh
     $ ssh-keygen -t rsa

Keep the default file name and skip the passphrase by just hitting Enter both times. Then, add the key to your Heroku account:

    $ heroku keys:add

Once the key business is done, you're ready to deploy apps! Heroku has a great [Getting Started](https://devcenter.heroku.com/articles/python) guide, so I'll let you refer to that (the one linked here is for Python, but there is one for every popular language). Heroku uses Git to push code for deployment, so make sure your app is under Git version control. A quick cheat sheet (if you've used Heroku before):

    $ cd myapp/
    $ heroku create myapp
    $ git push heroku master
    $ heroku ps
    $ heroku logs -t

The [Heroku Dev Center](https://devcenter.heroku.com/) is full of great resources, so be sure to check it out!

## Projects folder

This really depends on how you want to organize your files, but I like to put all my version-controlled projects in `~/Projects`. Other documents I may have, or things not yet under version control, I like to put in `~/Documents`.

## Apps

Here is a quick list of some apps I use, and that you might find useful as well:
- [GitHub App](https://mac.github.com): Usually its easyer to use the terminal but some times in extreme merges i like to use this app to make sure everything its gonna be well handled.
- [PHPStorm](https://www.jetbrains.com/phpstorm/): JetBARINS awesome IDE to do web related programming. Its just a good IDE for web.
- [Visual Studio](https://www.visualstudio.com/en-us/products/code-vs.aspx): I'm not sure about this one, but recently have been working well for me.
- [Eclipse](https://eclipse.org): A good one that i always use when working with java.
- [SmartSVN](http://www.smartsvn.com): Awesome app to help you work with Subversion projects on mac.
