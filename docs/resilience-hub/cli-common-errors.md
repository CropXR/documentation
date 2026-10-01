## When something goes wrong

| The message says | What to do |
|---|---|
| `RHUB_BACKEND_URL is not set` | Set the addresses, see [Set the addresses](#set-the-addresses), and open a new terminal |
| `rclone was not found` | Run the install command again, see [Install rhub](#install-rhub) |
| `Not signed in` or `The stored sign-in could not be renewed` | Run `rhub login` |
| `The backend did not accept your sign-in` | Run `rhub login`. If the message stays, sign in to the catalogue in your browser once |
| `Could not reach the backend` | Check your connection. The Resilience Hub answers only on a TU Delft network or through eduVPN |
| `Invalid value for 'source'` or `Got unexpected extra argument` | Keep the quotes around the place of the folder and around the title, and check the place of the folder |
| You may not upload to the assay | Check the assay id. If it is right, ask the person who submitted the assay to add you as a creator |
| The credentials expired during the transfer | For an upload, split the dataset. For a download, run the command again with `--merge` |
| The folder already holds files | Choose a folder that does not exist yet, or add `--merge` to continue a download |
| The resource does not exist or you may not download it | Check the identifier, then ask the owner of the dataset |

Every command explains itself with `--help`, for example `rhub upload --help`.

## Questions and feedback

Write to the DataXR team at [data@cropxr.org](mailto:data@cropxr.org). Include the output of `rhub --version` and `rhub whoami`, the command you ran, and what the tool printed. Never send a password or a token.