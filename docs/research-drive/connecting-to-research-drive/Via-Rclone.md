
Rclone is a powerful, open-source command-line program designed for managing files across cloud storage platforms. Often described as the "Swiss Army knife" of cloud storage management, Rclone allows users to sync, copy, and transfer files between various cloud storage providers including Google Drive, Dropbox, Amazon S3, Microsoft OneDrive, and many others. Since its creation in 2012 by Nick Craig-Wood, Rclone has become an essential tool for system administrators, developers, and tech-savvy individuals who need to efficiently handle data across multiple cloud environments. With its robust encryption capabilities, extensive configuration options, and ability to handle files of virtually any size, Rclone provides a versatile solution for both personal and enterprise cloud storage management needs.

## Installation

### Manual Download and Install
- Download and install Rclone from [Rclone's website](https://rclone.org/downloads/)
- Verify installation by running `rclone --version` in your terminal

### Script Download and Install
To install rclone on Linux/macOS/BSD systems, run:

    sudo -v ; curl https://rclone.org/install.sh | sudo bash

## Generate App Credentials
- Go to Research Drive Settings > Security
- Click "Create new app password"
- Note down the password

## Obscure Password
- Open your terminal
- Run the command:
    ```bash
    rclone obscure YOUR_APP_PASSWORD
    ```
- Copy the outputted obscured password string

## Configuration Setup
Create or edit the rclone configuration file:
- Linux/MacOS: `~/.config/rclone/rclone.conf`
- Windows: `%USERPROFILE%\.config\rclone\rclone.conf`

Add the following configuration:
```
[cropxr]
type = webdav
url = https://cropxr.data.surfsara.nl/remote.php/webdav/
vendor = owncloud
user = YOUR_APP_USERNAME 
bearer_token_command = exit
pass = YOUR_OBSCURED_PASSWORD
```

Replace:
- `YOUR_APP_USERNAME` with your email address that you use to login to Research Drive
- `YOUR_OBSCURED_PASSWORD` with the obscured password from step 3

## Mounting Commands

**Linux/MacOS**:
```bash
rclone mount "cropxr:cropxr (Projectfolder)/WPC1" /local/folder/ --vfs-cache-mode writes --use-cookies -v
```

**Windows**:
```bash
rclone mount "cropxr:cropxr (Projectfolder)/WPC1" K: --vfs-cache-mode writes --use-cookies -v
```

The `--vfs-cache-mode writes` flag is an important Rclone configuration option that controls how file data is cached when using Rclone to mount a remote file system.
When set to "writes", this option means:

- Files opened for reading are not cached initially
- Files opened for writing are cached during the entire upload
- File data read from the remote while a file is open is cached

The `--use-cookies` flag in Rclone enables the use of cookies for authentication and session management when connecting to remote servers, particularly WebDAV servers like Research Drive (which is based on OwnCloud).

Best practice is to mount a specific folder (e.g., `WPC1`) rather than the root of Research Drive. This helps in managing permissions and access control more effectively.

