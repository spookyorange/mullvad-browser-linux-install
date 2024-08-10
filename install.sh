#!/bin/bash

app_name=mullvad-browser
literal_name_of_installation_directory=".tarball-installations"
universal_path_for_installation_directory="$HOME/$literal_name_of_installation_directory"
app_installation_directory="$universal_path_for_installation_directory/mullvad-browser"
official_package_location="https://mullvad.net/en/download/browser/linux-x86_64/latest"
tar_location=$(mktemp /tmp/mullvadbrowser.XXXXXX.tar.xz)
open_tar_application_data_location="mullvad-browser"
local_bin_path="$HOME/.local/bin"
local_application_path="$HOME/.local/share/applications"
app_bin_in_local_bin="$local_bin_path/$app_name"
desktop_in_local_applications="$local_application_path/start-mullvad-browser.desktop"
executable_path="$app_installation_directory/Browser/start-mullvad-browser"

echo "Welcome to Mullvad Browser tarball installer, just chill and wait for the installation to complete!"

sleep 1

echo "Checking to see if an older installation exists"
if [ -f "$app_bin_in_local_bin" ]; then
  echo "Old bin file detected, removing..."
  rm "$app_bin_in_local_bin"
fi

if [ -d "$app_installation_directory" ]; then
  echo "Old app files are found, removing..."
  rm -rf "$app_installation_directory"
fi

if [ -f "$desktop_in_local_applications" ]; then
  echo "Old app files are found, removing..."
  rm "$desktop_in_local_applications"
fi

sleep 1

echo "Installing the latest package"
curl -L -o "$tar_location" "$official_package_location"
if [ $? -eq 0 ]; then
    echo OK
else
    echo "Installation failed. Curl not found or not installed"
    exit
fi

tar -xvf "$tar_location"

echo "Installed and untarred successfully"

if [ ! -d "$universal_path_for_installation_directory" ]; then
  echo "Creating the $universal_path_for_installation_directory directory for installation"
  mkdir "$universal_path_for_installation_directory"
fi

mv $open_tar_application_data_location $app_installation_directory

echo "Mullvad Browser successfully moved to your safe place!"

rm $tar_location

if [ ! -d $local_bin_path ]; then
  echo "$local_bin_path not found, creating it for you"
  mkdir $local_bin_path
fi

touch $app_bin_in_local_bin
chmod u+x $app_bin_in_local_bin
echo "#!/bin/bash
$executable_path" >> $app_bin_in_local_bin

echo "Created executable for your \$PATH if you ever need"

if [ ! -d $local_application_path ]; then
  echo "Creating the $local_application_path directory for desktop file"
  mkdir $local_application_path
fi

echo "Running Mulvad browser's recommended registration process"
initial_dir=$(pwd)

cd "$app_installation_directory" || exit
"./start-mullvad-browser.desktop" --register-app
cd "$initial_dir" || exit

echo "Created desktop entry successfully"

sleep 1

echo "Installation is successful"

sleep 1

echo "Done, and done, long live survellience-free browsing!"

sleep 1

exit 0
