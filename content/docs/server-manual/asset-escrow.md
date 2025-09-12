---
title: Asset Escrow
weight: 1
description: >
  Information about the Asset Escrow system.
---

## What is Asset Escrow?

Asset Escrow is a system that allows developers to protect their code by preventing others from modifying or accessing certain scripts directly.

## What is currently supported?

Currently **Lua**, **YFT**, **YDD**, and **YDR** files are supported.

## Creating an escrowed asset

1. Visit [Portal](https://portal.cfx.re/).
2. Select "Create an asset"
3. Choose "Select File" and type the name of your asset
4. Upload your zipped asset and allow it to be processed for encryption

The maximum file size for escrowed assets is 1GB.

## Managing assets

### Updating an escrowed asset

1. Visit [Portal](https://portal.cfx.re/).
2. Select "Created Assets" and choose the asset you want to update.
3. Choose "Re-Upload" and upload your new zipped asset.
4. Allow it to be processed for encryption

When you re-upload an asset, the new version replaces the old one in your account. The previous version is not retained for you, but users who already downloaded an older version will still be able to use it.

### Downloading an escrowed asset

1. Visit [Portal](https://portal.cfx.re/).
2. Select "Created Assets" and choose the asset you want to download.
3. Choose the save icon in the lower right corner to download the asset.

The asset, which can be used on any server that you own, will be downloaded.

### Deleting an escrowed asset

1. Visit [Portal](https://portal.cfx.re/).
2. Select "Created Assets" and choose the asset you want to delete.
3. Choose "Delete" and confirm the deletion.

## Sell your resource on Tebex

When creating a new package on [Tebex](/docs/server-manual/setting-up-a-tebex-store/), it will ask you to configure what your customers should receive upon purchasing this package. Select "FiveM Asset" and then choose the desired asset(s) from the dropdown list.  
When a user buys access to the resource, they will receive an email with a download link.

## Can I still obfuscate code in escrowed resources?

Thanks to the asset escrow and encryption system, obfuscating code in escrowed resources is not necessary.

## Can I sell subscription-based resources?

You can create and update resources that require a subscription to access. 
If the subscription expires, the asset is removed from the subscribed user's account and will no longer start on the user's server.

## What happens if an unauthorized server tries to run my resource?

The resource will not start, and an error stating 'You lack the required entitlement' will appear in the server console.  
The server owner must purchase your content to be eligible to run your resource.

## Is NUI supported in this system?

New User Interface (NUI) is not currently supported.

## How can I select which files should be protected by the escrow system?

You can tell the escrow system to ignore certain files by using the 'escrow_ignore' directive in your fxmanifest.lua like the example below:

```lua
escrow_ignore {
  'script/code.lua',  -- Only ignore one file
  'stream/tuner.ydr', -- Works for any file, stream or code
  'stream/*.yft',     -- Ignore all .yft files in that folder
  'stream/**/*.yft'   -- Ignore all .yft files in any subfolder
}
```

## Can I transfer my own asset to another user?

Transfer of created assets to another account is not supported, and escrowed assets can only be distributed via a Tebex package.
