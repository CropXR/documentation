# Uploading Large Datasets to Research Drive

This guide covers the recommended workflow for uploading large datasets (10+ GB) to Research Drive using rclone.

## Prerequisites

- Rclone installed and configured (see [Connecting via Rclone](../research-drive/connecting/via-rclone.md))
- Write access to the destination folder on Research Drive

## Step 1: Upload with rclone copy

For large datasets, use `rclone copy` rather than mounting. Mounting relies on a continuous network connection, which can cause issues during long transfers.

```bash
rclone copy /local/path "cropxr:destination/folder" --timeout 60m -v
```

The `--timeout` flag prevents timeouts during large file transfers (allow approximately 10 minutes per GB). The `-v` flag provides progress output.

For very large uploads, consider using `--progress` for a summary view:

```bash
rclone copy /local/path "cropxr:destination/folder" --timeout 120m --progress
```

## Step 2: Verify the transfer

After the upload completes, verify that all files transferred correctly:

```bash
rclone check /local/path "cropxr:destination/folder"
```

This compares the source and destination, reporting any differences. If files are missing or mismatched, re-run the copy command—rclone will only transfer files that need updating.

## Step 3: Clean up local files

Once you have verified the files are on Research Drive, you can remove the local copies.

!!! warning "Unmount before deleting"
    If you have any rclone mounts active, unmount them first. Deleting files in a mounted folder will delete them on Research Drive as well.

To unmount on Linux/macOS:

```bash
fusermount -u /mount/point  # Linux
umount /mount/point         # macOS
```

On Windows, close the command prompt running the mount or use Task Manager to end the rclone process.

## Step 4: Secure the data

After uploading, adjust permissions to protect the data from accidental deletion:

1. Go to the folder in [Research Drive](https://cropxr.data.surf.nl/)
2. Open sharing settings (three dots > Details > Sharing)
3. Remove delete permissions for all users, including yourself

Create permissions can remain enabled if others need to add files. See [Sharing Data](../research-drive/sharing-data.md) for details on managing permissions.

## See Also

- [Connecting via Rclone](../research-drive/connecting/via-rclone.md) - Installation and configuration
- [Uploading Data](../research-drive/uploading-data.md) - Overview of all upload methods
- [Sharing Data](../research-drive/sharing-data.md) - Managing folder permissions
