
Rclone is a powerful, open-source command-line program designed for managing files across cloud storage platforms. Often described as the "Swiss Army knife" of cloud storage management, Rclone allows users to sync, copy, and transfer files between various cloud storage providers including Google Drive, Dropbox, Amazon S3, Microsoft OneDrive, and many others. Since its creation in 2012 by Nick Craig-Wood, Rclone has become an essential tool for system administrators, developers, and tech-savvy individuals who need to efficiently handle data across multiple cloud environments. With its robust encryption capabilities, extensive configuration options, and ability to handle files of virtually any size, Rclone provides a versatile solution for both personal and enterprise cloud storage management needs. 

Reference instructions for mounting on Windows by SURF can be found [here](https://servicedesk.surf.nl/wiki/spaces/WIKI/pages/117179081/RD+How+to+use+Rclone+with+Research+Drive) These steps overlap with the instructions below.

## Requirements

!!! warning "Version Requirement"
    Rclone version **1.63.1 or newer** is required for Nextcloud compatibility. Earlier versions will fail with a chunked upload error.

## Installation

### Manual Download and Install
- Download and install Rclone from [Rclone's website](https://rclone.org/downloads/)
- Verify installation by running `rclone --version` in your terminal

When using Windows, you can use the rclone command only from the folder where rclone.exe is located. The executable can be moved if needed.

### Script Download and Install
To install rclone on Linux/macOS/BSD systems, run:

    sudo -v ; curl https://rclone.org/install.sh | sudo bash

## Generate App Credentials
- Go to Research Drive Settings > Security
- Click "Create new app password"
- Copy the password immediately - it is only displayed once and cannot be retrieved later

## Obscure Password
- Open your terminal
- Run the command:
    ```bash
    rclone obscure YOUR_APP_PASSWORD
    ```
- Copy the outputted obscured password string

## Get WebDAV URL
- Go to Research Drive > Files > Settings (in bottom left corner) > WebDAV
- Copy the WebDAV URL

The URL should follow this format:
```
https://<your-environment>.surf.nl/remote.php/dav/files/<your-username>/
```

## Configuration Setup
Create or edit the rclone configuration file:
- Linux/MacOS: `~/.config/rclone/rclone.conf`
- Windows: `%USERPROFILE%\.config\rclone\rclone.conf`

Add the following configuration:
```
[cropxr]
type = webdav
url = https://cropxr.data.surf.nl/remote.php/dav/files/<your-username>
vendor = nextcloud
user = <your-username>
pass = <your-obscured-password>
```

Replace:
- `<your-username>` with your email address that you use to login to Research Drive
- `<your-obscured-password>` with the obscured password from the previous step

## Mounting Commands

**Linux/MacOS**:
```bash
rclone mount "cropxr:research_drive/folder" /local/folder/ --vfs-cache-mode writes --use-cookies -v
```

**Windows**:

For mounting in Windows, you need to install [WinFsp](https://winfsp.dev/). This means that you need administative priviledge to install programs on your computer, or you need to ask the systems admins for this program in advance.
In the terminal from the folder that contains rclone:

```bash
rclone mount "cropxr:research_drive/folder" K: --vfs-cache-mode writes --use-cookies -v
```

The `--vfs-cache-mode writes` flag is an important Rclone configuration option that controls how file data is cached when using Rclone to mount a remote file system.
When set to "writes", this option means:

- Files opened for reading are not cached initially
- Files opened for writing are cached during the entire upload
- File data read from the remote while a file is open is cached

The `--use-cookies` flag in Rclone enables the use of cookies for authentication and session management when connecting to remote servers, particularly WebDAV servers like Research Drive (which is based on Nextcloud).

Replace the paths in the example command with the actual path needed.
The path of the folder on the research drive, should be either the complete path, or the path that is visible to/shared with the user.
This likely looks like this for the full path
`cropxr:cropxr (Projectfolder)/investigations/investigation_folder/study_folder`
or like this for shared folders
`cropxr:study_folder`

Best practice is to mount a specific folder (e.g., `WPC1`) rather than the root of Research Drive. This helps in managing permissions and access control more effectively.


## Copy Commands
```bash
rclone copy /my/source/location "cropxr:research_drive/destination/folder"
```
Replace the paths in the example command with the actual path needed.
The path of the folder on the research drive, should be either the complete path, or the path that is visible to/shared with the user.
This likely looks like this for the full path
`cropxr:cropxr (Projectfolder)/investigations/investigation_folder/study_folder`
or like this for shared folders
`cropxr:study_folder`

This copies the file from the source to the research drive. When the source location is a folder, all the contents of the folder are copied to the desination.
For large files it is recommended to add a time-out. The timeout should be 10 min per GB of the largest file that will be copied.

```bash
rclone copy --timeout 50m /my/source/location "cropxr:research_drive/destination/folder"
```
