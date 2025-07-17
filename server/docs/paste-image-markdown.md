# Paste Image Markdown

A procedure designed to paste the windows clipboard image into neovim over ssh.

### Procedure

1. Run windows script to upload image to server via `scp`. On my system this is configured as `ctrl-alt-P` on PowerToys
2. A *windows terminal* window will pop up - enter login password
3. Run `PasteImageMarkdown` *nvim* command to insert the image link

### How it works

- Windows script stores *clipboard image* into a directory, and sets a `latest.txt` file with the image name
- `scp` copies both over to the server
- The *nvim* command reads the `latest.txt` file for the image name and inserts the image link

