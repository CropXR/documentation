# Before Uploading a Dataset

This page covers what needs to be in place before you can upload a dataset in SEEK. It also covers how sharing
permissions work, and how to find data you are already entitled to access.

!!! note "This page assumes that an assay already exists"
    If you're setting up a brand new study/assay, or defining the metadata structure for the
    first time, use the [Full Guide](full-guide.md) instead. This page is for uploading into an
    assay someone has already created.

## Checklist: are you ready to upload?

- [ ] You have an active SEEK account
- [ ] You've been added to your Work Package's project
- [ ] You have Editing access to the assay you're uploading to
- [ ] You know the assay's SEEK ID

If any of these do not apply to you, the upcoming sections will guide you through how to get there. Otherwise, you're all ready to upload!

## 1. Get a SEEK account

1. Go to the [Catalogue webpage](https://catalogue.cropresilience.org/) & select "Log in" at the
   top right corner.
2. Under the "KeyCloak" tab, click "Sign in with KeyCloak".
3. Click "SURFcontext" and sign in with your university account.
4. On first login, grant the requested permissions.

## 2. Confirm you've been added to your project

Every CropXR Work Package maps to a single project in SEEK. Projects are visible to everyone, even if you have never joined one.
. You can browse projects by clicking the 'Browse' tab in the navigation bar, and selecting 'Projects'.

If you're not yet a member of your Work Package's project, you can request membership from the
project's page. Every project has a **Work Package Lead**, who acts as the Project Administrator and
approves join requests. If you do not know who your Work Package Lead is, please contact the DataXR team (data@cropxr.org).

Access to project studies, assays and data files are not automatically granted to project members. Access to such material must be shared separately.
 (see [Permission levels](#permission-levels), below).

## 3. Get edit access to the assay

Uploading requires **Editing** access on the assay itself — not just the study it belongs to, or
the investigation the study belongs to.

!!! warning "Access doesn't cascade"
    Having access to a study does not automatically give you access to its assays. Similarly, having access to an
    assay does not give you access to its data files. Each is shared independently, so please check
    permissions on the specific assay you intend to upload to.

If you don't have editing access:

- Ask whoever created the assay, or your Work Package Lead, to add you as a contributor with
  editing access.
- If you can't find the assay at all, it may be shared privately with people other than yourself. see [Finding data you're entitled to access](#finding-data-youre-entitled-to-access).

If the assay doesn't exist yet, it needs to be created before you can upload. See the
[Full Guide](full-guide.md#phase-1-creating-the-template) for how to:

- create the assay
- connect it to the correct study and investigation
- set up its metadata skeleton (choosing the right templates)

## 4. Find the assay's SEEK ID

The SEEK ID is the number at the end of the assay's URL. Open the assay in the Catalogue and
read it off the address bar:

```
https://catalogue.cropresilience.org/assays/123
                                             ^^^
                                          SEEK ID
```

The same pattern applies to studies, investigations, and data files.
The ID is always the number at the end of that resource's URL.

## Permission levels

SEEK's sharing settings from lowest (Private) to highest (Managing):

| Level | What it grants |
|---|---|
| Hidden (private) | Nothing. The resource doesn't appear for you at all (no title, no ID, no link). |
| Visible | You can see that it exists and view its metadata, but cannot download or edit it. |
| Accessible | View **and download**. |
| Editing | View, download, **and upload/edit**. This is what you need to upload a dataset. |
| Managing | Full control, including deleting the resource and changing who else has access. |

Each level includes everything below it. Sharing can be set for specific people, or for everyone
in the project, and it's set independently on every resource. A study, its assays, and its data
files can each have completely different sharing settings. See the
[Full Guide](full-guide.md#phase-3) for how to change sharing settings on a resource.

After you upload, your Work Package Lead reviews and approves the registration in SEEK. If your
upload isn't showing up yet, that review step is the most likely reason. Please check with them before
assuming something went wrong.

## Finding data you're entitled to access

Projects and institutions are always visible to everyone, so you can always browse the list of
projects. Below that level, what you can see depends on the sharing settings described
above:

- A resource shared with your project, or with you directly, appears when you browse or search
  the Catalogue as normal.
- A private resource that you do not have access to is completely hidden from you. There's no way to tell from the interface whether it doesn't exist or simply isn't shared with you.

If you expect to have access to a study, assay, or dataset and can't find it, don't assume the
link is wrong or the resource doesn't exist. It is more likely that the resource is private. Contact the resource's
creator or your Work Package Lead to request access.

## See also

- [Short Guide](short-guide.md) — quick reference for entering metadata once you're set up
- [Full Guide](full-guide.md) — detailed guide for creating studies and assays from scratch
- [Reference](reference.md) — formatting reference for the upload spreadsheets
