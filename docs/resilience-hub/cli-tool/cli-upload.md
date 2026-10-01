# Upload with the Command Line Tool

You need to first install the tool on your computer. Follow the [installation guide](cli-install.md).

Copy each command from this page into the terminal and press Enter. Some commands hold example values that you replace with your own. The page says which.

## Sign in

If you have never signed in to the [catalogue](https://test.catalogue.resiliencehub.ewi.tudelft.nl), do that once in your browser first. The Resilience Hub knows you only after that.

```bash
rhub login
```

The tool prints a link and waits.

```
Open https://auth.cropresilience.org/realms/dev/device?user_code=WDJB-MJHT
Waiting for approval...
```

Open the link in your browser and sign in. The browser then asks whether you grant the tool access. Click "Yes". The terminal continues by itself.

![The page that asks to grant access to the Resilience Hub CLI, with the buttons Yes and No](../../img/rhub-login-consent.png)

You sign in once. The tool remembers it.

## Upload a dataset

!!! note "Before you can upload"
    Your metadata has to be in the catalogue first, with the assay that the dataset belongs to. If it is not there yet, see [SEEK Metadata Entry](../seek/index.md).

### Find the assay id

Open the assay in the catalogue. The assay id is the number at the end of the address in the address bar of your browser.

```
https://test.catalogue.resiliencehub.ewi.tudelft.nl/assays/42
```

In this example the assay id is `42`.

### Command to upload data

Put everything that belongs to the dataset into one folder. To upload it, run this command in the terminal.

```bash
rhub upload "/path/to/data" --assay-id 42 --title "Dataset Title"
```

Replace the three example values with your own.

| Example value | Replace it with |
|---|---|
| `/path/to/data` | The place of your folder on your computer. On macOS you can drag the folder into the terminal. On Windows it looks like `C:\Users\anna\data\trial` |
| `42` | Your assay id |
| `Dataset Title` | The title of your dataset in the catalogue |

Keep the quotes around the place of the folder and around the title.

Once the upload has started, the tool reads every file once and then sends the files. It shows you the status.

```
Ready to upload 3 files, 195.3 KiB.
195.3 KiB / 195.3 KiB (100%), 3 of 3 files, 1.2 MiB/s
```

A large dataset takes longer. Keep your laptop charging and make sure that it does not go to sleep.

### Data upload successful

```
Upload verified.
https://test.data.resiliencehub.ewi.tudelft.nl/register/17
```

"Upload verified." means that all your files arrived unchanged. The work package lead of your project gets an email with the link in the last line and registers the dataset.

!!! warning "An upload cannot be changed afterwards"
    To correct a dataset, fix the folder on your computer and upload it again.

### What one upload can hold

- Files smaller than 5 GiB each, and at most 10000 files.
- What can be sent within one hour. Split a larger dataset into several uploads.

To stop an upload, press ++ctrl+c++. A stopped upload has to be started again.

## Questions and feedback

Write to the DataXR team at [data@cropxr.org](mailto:data@cropxr.org). Include the output of `rhub --version` and `rhub whoami`, the command you ran, and what the tool printed. Never send a password or a token.

## Update or remove the tool

To move to a new version, run the command of [Install rhub](cli-install.md#install-rhub) again, with the new version number in place of `v0.2.0`.

These commands remove the stored sign-in and the tool.

```bash
rhub logout
uv tool uninstall resilience-hub-cli
```
