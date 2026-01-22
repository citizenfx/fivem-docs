---
title: Running two FiveM clients
weight: 1004
toc_hide: true
description: >
  This guide explains how to run **two FiveM clients at the same time** on one PC.
---

## Running Two FiveM Clients (Using Shortcuts)

### Step 1: Locate the FiveM Executable

By default, FiveM is installed at:

```text
C:\Users\<YourUsername>\AppData\Local\FiveM\FiveM.exe
```

Replace `<YourUsername>` with your actual Windows username.
If you have installed FiveM in a different location, navigate to that directory instead.
You can also right-click your existing FiveM shortcut and choose **Open file location**.

---

### Step 2: Create Two Separate Shortcuts

1. Right-click `FiveM.exe`
2. Select **Create shortcut**
3. Rename the shortcuts:
   - `FiveM - Client 1`
   - `FiveM - Client 2`

---

### Step 3: Add the `-cl2` Launch Parameter

Only the **second** FiveM shortcut needs to be modified.

#### Client 2 (Second Instance)

1. Right-click **FiveM - Client 2**
2. Select **Properties**
3. In the **Target** field, append `-cl2` **after** the closing quote  
Example:

    ```text
    "C:\Users\<YourUsername>\AppData\Local\FiveM\FiveM.exe" -cl2
    ```

    Replace `<YourUsername>` with your actual Windows username.

4. Click **OK**

### Step 4: Launch the Clients

1. Start **FiveM - Client 1**
2. Wait until it fully loads
3. Start **FiveM - Client 2**

You’re now ready to run two FiveM clients simultaneously.
