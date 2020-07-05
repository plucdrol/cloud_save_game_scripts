# Cloud Save Game scripts

This repository is meant to be copied in a shared Google Drive directory so that its users can share save game files.

## Setup

- Copy this repository in a Google Drive directory named "cloud_save_games"
	- Alternatively check in the scripts to ensure variables for paths are properly set up
- In each script, ensure the directory paths are properly updated

## Usage

- Go in the subfolder for the game of your choice, right-click the file "setup_cloud_save.bat" and choose "Run as Administrator".
- Follow the instructions the script directs.
- Upon successful completion, open the game which should include the shared saves.

## Caveats

When setting up cloud saves, your local save folder will **become** the cloud save folder.

Consequences:
	- Any changes you make locally will be **applied remotely**.
	- Scripts can migrate your local save files to the cloud but they will be **shared with other users**.

Workaround:
	- You can pause or turn off Google Drive sync (can be done from the "Backup and sync from Google" system tray icon -> 3 vertical dots top right -> "Pause")
