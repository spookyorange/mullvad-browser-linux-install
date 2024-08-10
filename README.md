# Install tarball version of Mullvad Browser with just a basic script!

A script to easily install Mullvad Browser the tarball way on your Linux machine!

Note: This installation script is by no means affiliated with Mullvad project, Mullvad VPN project, Mullvad Browser project, or their maintainers.

## Usage

Clone the repo and run the script
```bash

git clone https://github.com/spookyorange/mullvad-browser-linux-install.git
cd mullvad-browser-linux-install
sh ./install.sh

```

To remove the application(if it has been installed with this method)
```bash

sh ./uninstall.sh

```

Updates are handled by Mullvad Browser itself. But if you wish to update manually, run the script again.

```bash

sh ./install.sh

```

## Details

The script will install the application in the following destinations if you have installed locally:

- ~/.tarball-installations/mullvad-browser
- ~/.local/bin/mullvad-browser
- ~/.local/share/applications/start-mullvad-browser.desktop
- Also wherever the app data may be at(app decides it and it may change, also may depend on machine your configuration)

## Tested Distros

- Fedora by Spookyorange
- SteamOS(Steam Deck) by Spookyorange

## Contributing

If you have a distro that you would like to add to the list of tested distros, please submit a pull request with the changes you made to the script and the distro you tested it on.
