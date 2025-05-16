# Research Drive

# CropXR Research Drive Documentation

Welcome to the CropXR Research Drive! This guide will help you effectively use our collaborative research platform.

## Table of Contents
1. [Project registration](#project-registration)
1. [Project Data Organization](#project-data-organization)
1. [File Organization Guidelines](#file-organization-guidelines)
1. [File Upload Guidelines](#file-upload-guidelines)
1. [Mounting Research Drive](#mounting-research-drive)
1. [Support and Communication](#support-and-communication)
1. [SSO and EduID](#eduid)
1. [Links](#links)
1. [Contact](#contact)

## Project registration
To get dedicated storage space for your investigations, please fill out the 
[project registration form](https://forms.office.com/e/vmhWfLi47G).
A dedicated study folder will be created for you. 

## Project Data Organization

### Data Sensitivity Levels

All data sharing is conducted through the DAC. Approval for sharing depends on the sensitivity level of the data.

The DAC oversees five levels of data access:

| Access Level  | Description | DAC Approval needed for **CropXR** members? | DAC Approval needed for **non-CropXR** members? | Notes |
|--------------|-------------|----------------------------------------------|----------------------------------------------|-------|
| **Public** | Data accessible to everyone | No | No | No restrictions or monitoring required |
| **Internal (CropXR)** | Data for internal **CropXR** use | Yes | Yes | Approval needed to ensure data aligns with organizational use policies |
| **Restricted** | Specific individuals within **CropXR**, listed in data catalog | Yes* | Yes* | Access logged and monitored. Role-based access rights required |
| **Confidential** | Specific individuals, **not** listed in catalog | Yes* | Yes* | Limited to select individuals with specific security clearances |

**\* It is the responsibility of the person who uploads the data to indicate who can view the data.** The person can do so by selecting specific individuals or groups who can access the data. The Resilience Hub will include security measures to make sure that only the selected individuals can access the data.

### Standard Project Structure

Data Sharing Directories:

- **WPXYZ-public** (Public data, can be shared with everyone even outside CropXR)
- **WPXYZ-restricted** (Specific members have access, usually workpackage members)
- **WPXYZ-internal** (Everyone in CropXR has read access)
- **WPXYZ-confidential** (Only specific members have access, highly controlled)

### Sharing Guidelines

1. Sharing Rules:
   - Only share folders with the workpackage prefix (e.g. 'WPXYZ-')
   - Never share non-prefixed folders (e.g., 'studies', 'assays', 'raw')
   - Always share from the nearest parent folder with 'WPXYZ-' prefix
   - This ensures unique folder names and prevents conflicts
   - Once you uploaded a dataset, remove the write/change/delete permissions for everyone, to keep the data safe

2. Examples:
   - ✅ CORRECT: Share 'WPXYZ-seq1'
   - ❌ INCORRECT: Share 'assays' or 'raw' folders directly

## File Organization Guidelines

### Naming Conventions

1. Basic Rules:
   - Use date prefix: `YYMMDD_description_version`
   - Keep names short but descriptive
   - Use hyphens (-) and underscores (_) to separate information:
     - Hyphens for general separation: `240101_experiment-results`
     - Underscores for sub-grouping: `250101_experiment-results_version2`
   - Include version numbers when applicable

2. Avoid:
   - Spaces in file or folder names
   - Special characters
   - Non-standard date formats

### Directory Structure

1. Data Organization:
   - Separate `raw` from `processed` directories
   - Include metadata tables with all datasets
   - Create a README.md file for each major directory

2. README.md Requirements:
   - Owner of the folder
   - File descriptions and formats
   - Experimental methods (when applicable)
   - Relationships between files
   - Data processing steps

For a practical example of recommended directory structure, check the **Example-directory-structure** folder in the WELCOME directory of the Research Drive.

## File Upload Guidelines

### Upload Methods

Choose your upload method based on file size and quantity:

1. Browser Upload
   - Best for: Files up to several GB
   - Method: Direct upload through Research Drive interface

2. OwnCloud Client
   - Best for: Multiple files or large datasets
   - Features: Automatic handling of large files
   - Supports upload resumption

3. Command Line Tools (curl/rclone)
   - Best for: Very large datasets (10-30 GB)
   - Requires: Command line experience
   - Provides maximum upload size capacity

## Mounting Research Drive

### Using Rclone

1. Installation:
   - Download and install Rclone from [Rclone's website](https://rclone.org/downloads/)
   - Verify installation by running `rclone --version` in your terminal

2. Generate App Credentials:
   - Go to Research Drive Settings > Security
   - Click "Create new app password"
   - Note down the password

3. Obscure Password:
   - Open your terminal
   - Run the command:
     ```bash
     rclone obscure YOUR_APP_PASSWORD
     ```
   - Copy the outputted obscured password string

4. Configuration Setup:
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

5. Mounting Commands:

   Linux/MacOS:
   ```bash
   rclone mount "cropxr:cropxr (Projectfolder)/WPC1-Demonstrator" /local/folder/ --vfs-cache-mode writes --use-cookies -v
   ```

   Windows:
   ```bash
   rclone mount "cropxr:cropxr (Projectfolder)/WPC1-Demonstrator" K: --vfs-cache-mode writes --use-cookies -v
   ```

### Network Drive Mounting (Not Recommended)

While possible, mounting Research Drive as a network drive using Finder/Explorer is not recommended due to quota management issues.

1. Generate App Credentials:
   - Go to Research Drive Settings > Security
   - Click "Create new app password"
   - Note down the password

2. Connection URL:
   `https://cropxr.data.surfsara.nl/remote.php/webdav/`

Note: For detailed mounting instructions across different operating systems, refer to [this guide](https://www.chemie.fu-berlin.de/bcpnet/Doku/MapNetworkDrives.html).

## Support and Communication

For questions or suggestions about these guidelines, please use the [research-drive channel on Slack](https://cropxr.slack.com/archives/C06TD73J70F). This documentation is continuously improved based on community feedback.


## Single Sign-on (SSO)
The CropXR research drive uses SRAM to authenticate. It is connected to all four universities Singe Sign On mechanisms. If you are affiliated with a university you should use your university credentials to sign up and log in.

### EduID
eduID is used to give collaborators without an institutional account access to access the SURF Research Drive, SURF Research Cloud, or iRODS. For example, when research collaborations consist of researchers from different companies participating in university research projects. 

#### EduID - Known Issues
There this is a known issue where your eduID mobile app somehow gets unlinked with your eduID account preventing you from logging in. To solve the issue, follow the steps below:

![](Documents/fig/EduID-issue-1.png)

1. Navigate to mijn.eduid.nl en log in using a magic link (not the app option)
2. Navigate tot the security tab
3. If an old connection with the eduID app already exists, deactivate this Mobile app registration. If this option is not visible, proceed with step 4.

![](Documents/fig/EduID-issue-2.png)


4. Now register the app again by selecting "Get it now" in the window below and scan the qr code using your mobile eduID app. Follow the steps in your mobile eduID app.

![](Documents/fig/EduID-issue-3.png)


5. Finally, setup a recovery phone number in your web browser.
You should now be able to login to you Researcch Drive environment again.

## Research Drive Roles
Overview of projects & users in the dashboard
When you open the Research Drive dashboard and navigate to the "User accounts" tab, you will have a overview of all Research Drive accounts. Depending on your role and permissions, you have different visibility within the Research Drive Dashboard.

### Normal users
Users with the role member or Project Folder Owner only see their own account. They have no more privileges to manage other active user accounts.
Exception are invites, as long an invite isn't full filled, the invite remain visible and manageable by the inviter.

### Contract admins
A user who is contract admin for a specific contract, will see next of all projectfolder also all user accounts linked to the contract.
Learn more about how to manage a user or project.

### Dashboard admins
A user in the role of dashboard admins is able to view all user accounts and projects.

![](Documents/fig/RD-roles.png)

|Role | Name | Email |
|-----|------|-------|
|Contract admin | | |
|Dashboard Admin | Sören Wacker | s.wacker@tudelft.nl |
|Project-folder Owner (cropxr) | Sören Wacker | s.wacker@tudelft.nl |


## Links

- [Research Drive Wiki](https://wiki.surfnet.nl/display/RDRIVE)
- [Research Drive Tutorials](https://wiki.surfnet.nl/display/RDRIVE/Tutorials)
- [Research Drive Best Practices](https://wiki.surfnet.nl/display/RDRIVE/Best+practices)
- [CropXR SharePoint](https://solisservices.sharepoint.com/sites/11017)
- [CropXR GitHub Repository](https://github.com/cropxr)

## Contact

If you have questions regarding this document, the research drive, 
or any other  data related question please feel free to reach out 
via email to [mailto:dataxr@uu.nl](dataxr@uu.nl), or write us in 
the [research-drive](https://cropxr.slack.com/archives/C06TD73J70F) slack channel.


