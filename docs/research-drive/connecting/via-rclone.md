# Connecting via Rclone

Rclone is an open-source command-line tool for managing files across cloud storage platforms. It supports syncing, copying, and transferring files of virtually any size.

!!! tip "When to use Rclone"
    Use Rclone for large datasets (10+ GB) or when you need scripted/automated transfers. For smaller uploads, the [browser interface](via-browser.md) may be simpler.

## Choosing the Right Method

| Method | Best for | Considerations |
|--------|----------|----------------|
| **Copy** | One-time uploads, archiving data | Files are transferred once; no ongoing sync |
| **Sync** | Keeping folders in sync | Deletes files at destination that don't exist at source |
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

Research Drive permissions affect what you can access via Rclone. See [Sharing Data](../sharing-data.md) for details on managing permissions.

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
    Once you upload data to a shared folder, the folder owner controls access. Coordinate with your team about who should have read/write access. See [Sharing Data](../sharing-data.md) for sharing guidelines.

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

## Installation

=== "Linux/macOS"

    ```bash
    sudo -v ; curl https://rclone.org/install.sh | sudo bash
    ```

=== "Windows"

    1. Download from [rclone.org/downloads](https://rclone.org/downloads/)
    2. Extract to a folder (e.g., `C:\rclone`)
    3. Run commands from that folder, or add it to your PATH

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

### Step 2: Obscure the Password

```bash
rclone obscure YOUR_APP_PASSWORD
```

Save the output string for the next step.

### Step 3: Get Your WebDAV URL

1. In Research Drive, go to **Files**
2. Click **Settings** (bottom left corner) > **WebDAV**
3. Copy the URL (format: `https://cropxr.data.surf.nl/remote.php/dav/files/your@email.com/`)

### Step 4: Create Configuration File

Create or edit the rclone configuration file:

| OS | Path |
|---|---|
| Linux/macOS | `~/.config/rclone/rclone.conf` |
| Windows | `%USERPROFILE%\.config\rclone\rclone.conf` |

Add the following:

```ini
[cropxr]
type = webdav
url = https://cropxr.data.surf.nl/remote.php/dav/files/your@email.com
vendor = nextcloud
user = your@email.com
pass = YOUR_OBSCURED_PASSWORD
```

Replace `your@email.com` with your login email and `YOUR_OBSCURED_PASSWORD` with the output from Step 2.

### Step 5: Test Connection

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

### Mounting as Local Drive

=== "Linux/macOS"

    ```bash
    rclone mount "cropxr:folder" /local/mount/point --vfs-cache-mode writes --use-cookies -v
    ```

=== "Windows"

    First install [WinFsp](https://winfsp.dev/) (requires admin privileges).

    ```bash
    rclone mount "cropxr:folder" K: --vfs-cache-mode writes --use-cookies -v
    ```

!!! note "Path formats"
    Paths can be either the full path or the shared folder name:

    - Full path: `cropxr:cropxr (Projectfolder)/investigations/inv_folder/study_folder`
    - Shared folder: `cropxr:study_folder`

!!! tip "Best practice"
    Mount a specific folder (e.g., your study folder) rather than the root. This improves performance and simplifies navigation.

### Command Flags Explained

| Flag | Purpose |
|------|---------|
| `--vfs-cache-mode writes` | Caches files during upload for reliable transfers |
| `--use-cookies` | Maintains session with Nextcloud/WebDAV servers |
| `-v` | Verbose output for monitoring progress |
| `--timeout` | Maximum time for a single operation |

## Troubleshooting

| Issue | Solution |
|-------|----------|
| "chunked upload" error | Update rclone to version 1.63.1 or newer |
| Connection timeout | Add `--timeout 60m` or increase the value |
| Permission denied | Verify your app password and username |
| Mount not working (Windows) | Ensure WinFsp is installed |

!!! tip "When reporting issues"
    Include the rclone command you ran, the error message, and your rclone version (`rclone --version`). For Research Drive platform issues, see [SURF servicedesk](https://servicedesk.surf.nl/).

## See Also

- [Uploading Data](../uploading-data.md) - Overview of upload methods
- [Via Browser](via-browser.md) - Simpler option for small uploads
- [Via NextCloud](via-nextcloud.md) - Desktop sync client alternative
- [Sharing Data](../sharing-data.md) - Managing folder permissions

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
