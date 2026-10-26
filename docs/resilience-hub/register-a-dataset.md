# Register a dataset

This page is for **work package leads**. When someone in your work package uploads a dataset, you get a registration link. With that link you register the dataset in the catalogue. Until you do, nobody can find or download it.

You do not need to install anything. You only need your browser and your catalogue account.

## What the registration link is

The registration link is a unique link for one uploaded dataset. The upload tool creates it as soon as an upload has arrived complete and unchanged.

```
https://data.cropresilience.org/register/{id}
```

Every dataset has its own link. A link for one dataset never registers another dataset.

!!! note "Opening the link changes nothing"
    The dataset is registered only when you confirm it on the page.

## How registering differs from uploading and downloading

| Step | Who does it | What it does |
|---|---|---|
| [Upload](cli-tool/cli-upload.md) | A researcher in the work package, with the command line tool | Sends the data files to the data storage. The files are stored, but nobody can find them yet |
| **Register** | **The work package lead, in the browser, with the registration link** | Adds the dataset to the catalogue and links it to the assay and its metadata |
| [Download](cli-tool/cli-download.md) | Anyone the dataset is shared with, with the command line tool | Copies the data files to their own computer |

When you register, you do not move or change the data files. You only make it part of the catalogue and link the data to the metadata.

## Who receives the link

The link goes to the **work package lead** of the project that the assay belongs to. In the catalogue, the work package lead is the *asset gatekeeper* of the project.

You get the link in two ways:

- **By email.** The subject is "Registration required:" followed by the title of the dataset.

Only a work package lead of the right project can register the dataset. If someone else opens the link, they are not able to register.

## Before you start

- [ ] You have a [catalogue account](seek/upload-prerequisites.md#1-get-a-fairdomseek-account) and have signed in to it at least once.
- [ ] You are the work package lead (asset gatekeeper) of the project that the assay belongs to.
- [ ] You can open the assay in the catalogue. If you cannot, ask the uploader to share it with the work package.

## After registering

The dataset is now a data file in the catalogue, linked to its assay. You are its creator.

- **Who can download it.** Every member of your work package. Nobody outside the work package can download it.
- **Sharing it more widely.** Only you, as the work package lead, can share the dataset with people outside the work package. See [Permissions in FairdomSEEK](seek/permissions-in-fairdomseek.md).
- **Downloading it.** Members [download the dataset](cli-tool/cli-download.md) with the identifier on the page of the data file.

Opening the link again after registering does no harm. The dataset is not registered a second time.

## Questions and feedback

Write to the DataXR team at [data@cropxr.org](mailto:data@cropxr.org). Include the registration link and what the page showed.
