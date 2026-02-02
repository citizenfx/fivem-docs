---
title: Enabling Full Client Dumps
weight: 90
description: >
  Information about Full Client Dumps
---

## Enabling Full Client Dumps

This guide explains how to enable full client memory dumps for FiveM/RedM, reproduce a crash, locate the generated dump file, and disable dumps afterward.

### Enabling Dumps

To enable full dumps:

1. Go to your FiveM/RedM installation directory.
2. Open the file named [CitizenFX.ini](/docs/client-manual/citizenfx/#how-to-find-this-file) with a text editor such as notepad.
3. Add the following line at the bottom of the file:

```ini
EnableFullMemoryDump=1
```

4. Save the CitizenFX.ini file.

### Causing the Crash & Finding the Dump

1. Launch the game again and try to reproduce the original crash.
When the crash occurs, your game may freeze for several minutes. This is normal. The dump is being written to your drive.
Do not close the game, even if Windows prompts you to do so.
After the dump finishes writing, the usual crash window will appear.
2. Confirm the crash is the same one you were asked to report
Typically, this means it has the same Legacy crash hash.
If it's not the same crash, return to the first step.
3. A Windows Explorer window should automatically open, pointing to the crashes directory in your FiveM/RedM installation folder.
A large dump file (usually several GB) will already be selected.

### Compressing the Dump

Use WinRAR, 7-Zip, or Windows "Send to → Compressed folder" to zip the dump file.
The compressed file will usually be 1-2 GB.

### Disabling Dumps

Once you are finished:

1. Reopen your CitizenFX.ini file.
2. Remove the line:

```ini
EnableFullMemoryDump=1
```

3. Save the CitizenFX.ini file.
