# Connecting via Rclone

Rclone is an open-source command-line tool for managing files across cloud storage platforms. It supports syncing, copying, and transferring files of virtually any size.

!!! tip "When to use Rclone"
    Use Rclone for large datasets (10+ GB) or when you need scripted/automated transfers. For smaller uploads, the [browser interface][1] may be simpler.

## The Command Line

The command line (interface) allows you to interact with a computer through text commands.

The command line has different names, depending on the software platform.

| Operating system | Term           |
| ---------------- | -------------- |
| Windows          | Command Prompt |
| Mac              | Terminal       |
| Linux            | Terminal       |

## Accessing the Command Line

### Windows

- Click the Start menu or press the windows key
- Type `cmd` or `Command Prompt`
- Click the result

### Mac (macOS)

- Press Command (⌘) + Space bar
- Type `Terminal`
- Press Enter

### Linux

- Press the windows key (Start menu)
- Type `Terminal`
- Press Enter

## Obtaining a folder path

rclone commands such as copy & sync require you to specify a local folder path. This is the location of a folder on your machine that you wish to act on.

Drag your desired folder onto the terminal, the terminal automatically receives the path.

## Choosing the Right Method

| Method    | Best for                        | Considerations                  |
| --------- | ------------------------------- | ------------------------------- |
| **Copy**  | One-time uploads, archiving data | Files are transferred once; no ongoing sync |
| **Sync**  | Keeping folders in sync         | Deletes files at destination that don't exist at source |
| **Mount** | Interactive work, browsing files | Requires stable connection; slower for large operations |

### Copy vs Sync

- **Copy**: Transfers files from source to destination. Safe for uploads - won't delete anything.
- **Sync**: Makes destination identical to source. Use with caution - files only at destination will be deleted.

```bash
# Copy: safe, additive
rclone copy /local/data "cropxr:study_folder"

# Sync: makes destination match source (destructive)
rclone sync /local/data "cropxr:study_folder"
```

!!! warning "Sync deletes files"
    `rclone sync` will delete files at the destination that don't exist at the source. Always use `--dry-run` first to preview changes.

### When to Mount

Mounting is useful when you need to:

- Browse files interactively
- Work with software that expects local file paths
- Make small edits without downloading entire files

Mounting is **not recommended** for:

- Large batch uploads (use `copy` instead)
- Unreliable network connections
- Long-running operations

## Working with Permissions

Research Drive permissions affect what you can access via Rclone. See [Sharing Data][2] for details on managing permissions.

### What You Can See

Rclone can only access folders that are:

- Owned by you, or
- Shared with you (appears in your root directory)

### Upload Permissions

Before uploading, ensure you have **write access** to the destination folder. If you only have read access, uploads will fail. See [Getting Access](../getting-access.md) if you need to request permissions.

### Best Practice Workflow

1. **Request folder access** from the folder owner or data team
2. **Verify access** by listing the folder: `rclone lsd cropxr:folder_name`
3. **Upload data** using copy or sync
4. **Notify the data team** if permissions need adjustment after upload

!!! note "Permissions after upload"
    Once you upload data to a shared folder, the folder owner controls access. Coordinate with your team about who should have read/write access. See [Sharing Data][2] for sharing guidelines.

## Quickstart

Once configured, use these commands:

```bash
# Copy files to Research Drive
rclone copy /local/path "cropxr:destination/folder"

# Mount Research Drive as a local folder
rclone mount "cropxr:folder" /mount/point --vfs-cache-mode writes
```

## Requirements

!!! warning "Version Requirement"
    Rclone version **1.63.1 or newer** is required for Nextcloud compatibility. Earlier versions will fail with a chunked upload error.

## Downloading rclone

Download rclone from [rclone.org/downloads](https://rclone.org/downloads/)

Refer to the table below to easily identify the correct download for your machine.

| Your device                        | What to download   |
| ---------------------------------- | ------------------ |
| Windows                            | Intel/AMD - 64 Bit |
| Mac (2020 or newer, M1/M2/M3 chip) | ARM - 64 Bit       |
| Mac (2019 or older, Intel chip)    | Intel/AMD - 64 Bit |
| Linux                              | Intel/AMD - 64 Bit |

## Installation

!!! tip
    If downloading and extracting rclone, place the extracted folder on the local drive or OneDrive.
    Do not place it on a university network drive e.g. //WURNET.

### Windows

1. Extract the download to a folder (e.g., `C:\rclone`)
2. Open the rclone folder in File Explorer
3. Click the address bar at the top and type 'cmd'
4. Press Enter. This opens a command prompt window with the rclone folder set as the working directory
5. Run rclone commands from that folder.

When running commands from inside the rclone folder, you must start your command with .\rclone. The `.\` tells your terminal to run the rclone program inside the folder.

**Example:**

```bat
.\rclone copy "C:\local\dataset" "cropxr:destination/folder"
```

### Linux/macOS (with admin access)

```bash
sudo -v ; curl https://rclone.org/install.sh | sudo bash
```

This is a system-wide install of rclone, which means that rclone can be run from any location within the terminal. You can therefore run rclone commands without the "./" prefix.

**Example:**
```bash
rclone copy /local/dataset "cropxr:destination/folder"
```
    
### Linux/macOS (without admin access)

1. Open your Files app and go to your Downloads folder.
2. Right-click the downloaded file and choose Extract Here.
3. Open the extracted folder (it will have a name like `rclone-v1.xx.x-linux-amd64`).
4. Inside this folder, you should see a file called `rclone`.
5. Right-click inside the folder and choose **Open in Terminal**
6. Make rclone executable by running:
```bash
chmod +x rclone
```
7. You can now run rclone commands from this terminal window.

When running commands from inside the rclone folder, you must start your command with `./rclone`. The `./` tells the terminal to run the rclone program inside the folder.

Verify installation:

```bash
rclone --version
```


## Configuration

### Step 1: Generate App Password

1. Log in to [Research Drive](https://cropxr.data.surf.nl/)
2. Go to **Settings** (top right) > **Security**
3. Under "Devices & sessions", click **Create new app password**
4. Copy the password immediately (it is only shown once)

### Step 2: Get Your WebDAV URL

1. In Research Drive, go to **Files**
2. Click **Settings** (bottom left corner) > **WebDAV**
3. Copy the URL (format: `https://cropxr.data.surf.nl/remote.php/dav/files/your@email.com/`)

### Step 3: rclone configuration

1. Open the command line in the rclone folder.
2. Run `rclone config` (This starts the built-in config setup tool)
3. Create a new connection by typing `n`
4. Enter the name for the remote connection e.g. `cropxr`
5. Scroll through the list for your desired storage type e.g. `webdav` and enter its number.
6. Enter the connection details
   - URL: `https://cropxr.data.surf.nl/remote.php/dav/files/your@email.com`
   - Vendor: `nextcloud` or 2
   - User: enter your login email address
   - Password: enter your app password
7. Confirm the settings when prompted and save the configuration.
8. Enter `No` for editing advanced config
9. Enter `Yes` when asked about keeping the newly configured remote connection.

### Step 4: Test Connection

```bash
rclone lsd cropxr:
```

This should list the folders in your Research Drive.

## Usage

### Copying Files

```bash
rclone copy /local/source "cropxr:destination/folder"
```

For large files, add a timeout (approximately 10 minutes per GB):

```bash
rclone copy --timeout 60m /local/source "cropxr:destination/folder"
```

### Step 6: Commands for verifying successful file transfer

`.\rclone ls cropxr:destination/folder`

This command shows a list of files stored in the remote destination.
You can use this to check that your files appear in the list and that the file names look correct.

`.\rclone check "C:\path\to\your\files" cropxr:destination/folder`

This command compares files between your computer and the remote destination.

The absence of errors means that everything matches. Errors indicate that files did not transfer correctly or are missing. In such a case, try repeating the `copy`   and `check` commands.

### Mounting as Local Drive

=== "Linux/macOS"

```
```bash
rclone mount "cropxr:folder" /local/mount/point --vfs-cache-mode writes --use-cookies -v
```
```

=== "Windows"

```
First install [WinFsp](https://winfsp.dev/) (requires admin privileges).

```bash
rclone mount "cropxr:folder" K: --vfs-cache-mode writes --use-cookies -v
```
```

!!! note "Path formats"
    Paths can be either the full path or the shared folder name:

    - Full path: `cropxr:cropxr (Projectfolder)/investigations/inv_folder/study_folder`
    - Shared folder: `cropxr:study_folder`

!!! tip "Best practice"
    Mount a specific folder (e.g., your study folder) rather than the root. This improves performance and simplifies navigation.

### Command Flags Explained

| Flag                      | Purpose                              |
| ------------------------- | ------------------------------------ |
| `--vfs-cache-mode writes` | Caches files during upload for reliable transfers |
| `--use-cookies`           | Maintains session with Nextcloud/WebDAV servers |
| `-v`                      | Verbose output for monitoring progress |
| `--timeout`               | Maximum time for a single operation  |

## Troubleshooting

| Issue                       | Solution                          |
| --------------------------- | --------------------------------- |
| "chunked upload" error      | Update rclone to version 1.63.1 or newer |
| Connection timeout          | Add `--timeout 60m` or increase the value |
| Permission denied           | Verify your app password and username |
| Mount not working (Windows) | Ensure WinFsp is installed        |

!!! tip "When reporting issues"
    Include the rclone command you ran, the error message, and your rclone version (`rclone --version`). For Research Drive platform issues, see [SURF servicedesk](https://servicedesk.surf.nl/).

## See Also

- [Uploading Data](../uploading-data.md) - Overview of upload methods
- [Via Browser][1] - Simpler option for small uploads
- [Via NextCloud](via-nextcloud.md) - Desktop sync client alternative
- [Sharing Data][2] - Managing folder permissions

## External References

### SURF Research Drive

- [SURF Rclone guide](https://servicedesk.surf.nl/wiki/spaces/WIKI/pages/117179081/RD+How+to+use+Rclone+with+Research+Drive)
- [Research Drive documentation](https://servicedesk.surf.nl/wiki/spaces/WIKI/pages/117178397)
- [Research Drive FAQ](https://servicedesk.surf.nl/wiki/spaces/WIKI/pages/117178461)

### Rclone

- [Rclone documentation](https://rclone.org/docs/)
- [Rclone WebDAV](https://rclone.org/webdav/) - WebDAV backend configuration
- [Rclone copy](https://rclone.org/commands/rclone_copy/) - Copy command reference
- [Rclone sync](https://rclone.org/commands/rclone_sync/) - Sync command reference
- [Rclone mount](https://rclone.org/commands/rclone_mount/) - Mount command reference
- [Rclone flags](https://rclone.org/flags/) - Global flags reference

[1]: via-browser.md
[2]: ../sharing-data.md

```
