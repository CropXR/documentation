# Upload and Download with the Command Line Tool

The tool is called `rhub`. It sends a folder of data to the Resilience Hub and fetches datasets you have the right to download.

Copy each command into a terminal and replace the example values with your own. The terminal is the program Terminal on macOS and PowerShell on Windows.

## 1. Install

You need `git` and `uv`. Install what you do not have yet.

=== "macOS"

    ```bash
    curl -LsSf https://astral.sh/uv/install.sh | sh
    ```

    If `git --version` says that git is missing, install it with `xcode-select --install`.

=== "Linux"

    ```bash
    curl -LsSf https://astral.sh/uv/install.sh | sh
    ```

    If `git --version` says that git is missing, install it with `sudo apt install git`.

=== "Windows"

    ```powershell
    winget install Git.Git
    winget install astral-sh.uv
    ```

Open a new terminal and install the tool. The command also installs rclone, the program that moves the data.

```bash
uv tool install --with "rclone-bin==1.74.1" "git+https://gitlab.ewi.tudelft.nl/reit/dataXR/resilience-hub-cli.git@v0.1.0"
```

If uv says that the tool folder is not on your `PATH`, run `uv tool update-shell` and open a new terminal.

Tell the tool where the Resilience Hub is.

=== "macOS"

    ```bash
    echo 'export RHUB_BACKEND_URL="https://data.cropresilience.org"' >> ~/.zshrc
    ```

=== "Linux"

    ```bash
    echo 'export RHUB_BACKEND_URL="https://data.cropresilience.org"' >> ~/.bashrc
    ```

=== "Windows"

    ```powershell
    setx RHUB_BACKEND_URL "https://data.cropresilience.org"
    ```

Open a new terminal and check that everything is in place.

```bash
rhub --version
rhub whoami
```

```
0.1.0
signed in as: nobody, run rhub login
backend url: https://data.cropresilience.org
```

## 2. Sign in

If you have never signed in to the [catalogue](https://catalogue.cropresilience.org), do that once in the browser first. The Resilience Hub knows you only after that.

```bash
rhub login
```

The tool prints a link and waits.

```
Open https://auth.cropresilience.org/realms/resilience-hub/device?user_code=WDJB-MJHT
Waiting for approval...
```

Open the link in a browser, sign in with your institute account, and approve. The terminal continues by itself. The browser can be on another device, so this also works on a compute node.

You sign in once. `rhub logout` ends the sign-in.

## 3. Upload a dataset

Put everything that belongs to the dataset into one folder. You also need the number of the assay, which is the number at the end of its address in the catalogue, for example `https://catalogue.cropresilience.org/assays/42`.

```bash
rhub upload "/Users/researcher/data/wheat-drought-2026" --assay-id 42 --title "Wheat drought trial 2026"
```

| Part | Replace it with |
|---|---|
| The path in quotes | The path of your folder. On Windows a path looks like `C:\Users\anna\data\trial`, without a backslash at the end |
| `42` | The number of your assay |
| The title in quotes | The title of the dataset in the catalogue |

The tool reads every file once, which takes a while for a large dataset, and then sends the files.

```
Ready to upload 3 files, 195.3 KiB.
195.3 KiB / 195.3 KiB (100%), 3 of 3 files, 1.2 MiB/s
Upload verified.
https://data.cropresilience.org/register/17
```

"Upload verified." means that everything arrived unchanged. The work package lead of your project gets an email with the link in the last line and registers the dataset.

!!! warning "An upload cannot be changed afterwards"
    To correct a dataset, fix the folder on your computer and upload it again.

What one upload can hold:

- Files smaller than 5 GiB each, and at most 10000 files.
- What can be sent within one hour. Split a larger dataset into several uploads.

To stop an upload, press ++ctrl+c++. A stopped upload has to be started again.

## 4. Download a dataset

Open the dataset in the catalogue. Its download address ends with the identifier of the dataset.

```
https://data.cropresilience.org/download/3f2504e0-4f89-11d3-9a0c-0305e82c3301
```

Name the identifier and a new folder for the files.

```bash
rhub download 3f2504e0-4f89-11d3-9a0c-0305e82c3301 "/Users/researcher/data/wheat-drought-2026-copy"
```

```
Fetching 3 files, 195.3 KiB.
195.3 KiB / 195.3 KiB (100%), 3 of 3 files, 2.4 MiB/s
Done. The resource is in /Users/researcher/data/wheat-drought-2026-copy.
```

If a download was stopped, run the same command again and add `--merge`. The files that finished are skipped.

## 5. When something goes wrong

| The message says | What to do |
|---|---|
| `RHUB_BACKEND_URL is not set` | Set the address, see [Install](#1-install), and open a new terminal |
| `rclone was not found` | Run the install command again, see [Install](#1-install) |
| `Not signed in` or `The stored sign-in could not be renewed` | Run `rhub login` |
| `The backend did not accept your sign-in` | Run `rhub login`. If the message stays, sign in to the catalogue in the browser once |
| `Invalid value for 'source'` or `Got unexpected extra argument` | Put the path and the title in quotes, and check the path |
| You may not upload to the assay | Check the number of the assay. If it is right, ask the person who submitted the assay to add you as a creator |
| The credentials expired during the transfer | For an upload, split the dataset. For a download, run the command again with `--merge` |
| The folder already holds files | Name a new folder for the download, or add `--merge` to continue one |
| The resource does not exist or you may not download it | Check the identifier, then ask the owner of the dataset |

Every command explains itself with `--help`, for example `rhub upload --help`.

## 6. Questions and feedback

Write to the DataXR team at [data@cropxr.org](mailto:data@cropxr.org). Include the output of `rhub --version` and `rhub whoami`, the command you ran, and what the tool printed. Never send a password or a token.

## 7. Update or remove the tool

To move to a new version, run the install command of [Install](#1-install) again, with the new version number in place of `v0.1.0`.

These commands remove the stored sign-in and the tool.

```bash
rhub logout
uv tool uninstall resilience-hub-cli
```
