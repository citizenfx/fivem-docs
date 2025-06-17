---
title: Setting up a Tebex Store
weight: 367
description: >
  A step-by-step guide on setting up a Tebex Store.
---

## What is Tebex?

[Tebex][Tebex] is our authorized monetization partner for the Cfx.re Platform, allowing you to easily monetize your FiveM or RedM server.<br>

It provides a convenient and secure way for server owners to set up and manage their stores, allowing players to purchase virtual items and other game-related content. In addition to being the exclusive monetization partner of FiveM, [Tebex][Tebex] offers a full suite of monetization features, handling all taxes, billing, and providing full insurance for transactions. This makes it easier for server owners to focus on creating a great experience for their players while leaving the complexities of payments and compliance to [Tebex][Tebex].<br>

The use of any other platform or payment provider is prohibited and is a violation of the [Platform License Agreement][fivem-pla].<br> Monetization of game servers is also subject to the policies outlined in the PLA, as well as the [Tebex][Tebex] [Acceptable Use Policy][tebex-aup] (AUP) and [Terms of Service][tebex-tos] (TOS).<br>

## Prerequisites

Before starting, ensure that you successfully [setup a FiveM-Server][setting-up-a-server-guides].<br>

## Tebex Store Setup
1. Register a new account [here][tebex-registration].
2. Verify your email address. A link will be sent to your email address.
3. Check your personal details. If correct, start and complete the [identity verification][tebex-identity-verification].
4. Create a [project][tebex-project]:
    - Provide a project name.
    - Provide the prefered currency
    - Provide the type of the project. If you are running a server choose "<em>I operate a game server</em>".
5. Open your Tebex Control Panel and click [Integrations > Game Servers][tebex-integration-game-servers].
6. Click **Connect Game Server** > **Plugin**.
7. Name your server and click **Continue**.
8. Follow the instructions on-screen to add your unique secret-key to your **server.cfg**. We recommend adding the line at the bottom of the file like this:<code>sv_tebexSecret yourtebexsecretkey</code>
9. Restart your server.
10. Click **Continue** on the Tebex Control Panel page you have open.
You will be redirected to the [onboarding page][tebex-get-started].

{{% alert color="warning" title="Continue button not lighting up?" %}}Check your server console for errors, go to the Control Panel and click **Skip**. {{% /alert %}}

### Before you can go live

Before your store can go live, you must to complete the following steps:

1. Provide a store description.
2. Confirm customer support contact.
3. Set up wallet.
4. Complete ID verification.
5. Create a package.
6. Associate your **Cfx.re** account.

After that you can submit your store for [review][tebex-review] to Tebex.<br>

Once the [review][tebex-review] is completed, you can add packages, customize your store, offer virtual goods to your community, and change the appearance of your Tebex store with one of many [templates][tebex-templates].

## FiveM Server Wrapper

The community-built [Tebex server wrapper][tebex-fivem-server-wrapper] enables you to connect your Tebex store to your gameserver. It makes it easier to give players rewards and perks and simplifies the setup of your Tebex Store.<br>

After setting up packages on your Tebex Store and within the wrapper itself, all you need to do is get your players to run <b>/redeem [Transaction ID]</b> and the wrapper will give the player their purchase(s).

### FiveM Server Wrapper Installation

1. [Download the wrapper][tebex-download-wrapper]
2. Extract the wrapper to your resource folder (You need to remove **-main** from the end of the folder name, the folder within your resources directory should be called <b>nass_serverstore</b>) 
3. Import the <b>codes.sql</b> to your database
4. Add  ‘<b>ensure nass_serverstore</b>’ in your <b>server.cfg.</b> 
5. Add the game server command below to each package you’d like to set up with the wrapper:
    <code>purchase_package_tebex {"transid":"{transaction}", "packagename":"{packageName}"}</code>

    <br>You’ll need to add it as a command that executes **When the package is purchased**.<br>

6. Click **Settings** icon next to the command and set the **Require Player to be Online** to **Execute the command even if the player is offline**.
7. Go to **Edit Package** and click **Update** to confirm the changes made.
8. At this point you can setup your packages within the wrapper itself - you can do this within the <b>config.lua</b> inside the wrapper’s script folder on your server.
9. Get your players to run **/redeem [Transaction ID]** on your server when they've made their purchase. The transaction ID will be sent to the players email address after a purchase is made on your store.

## Useful Links

[Tebex FAQs][tebex-faq]<br>
[Tebex Identity Verification][tebex-identity-verification]<br>
[Tebex Store Review][tebex-review]<br>
[Tips for getting your store application approved][tebex-tips-store-application]


---

[tebex]: https://tebex.io
[tebex-registration]: https://accounts.tebex.io/register
[tebex-project]: https://creator.tebex.io/creator-segments?#/
[tebex-integration-game-servers]: https://creator.tebex.io/game-servers
[tebex-faq]: https://docs.tebex.io/creators/faq
[setting-up-a-server-guides]: /docs/server-manual/setting-up-a-server/#available-guides
[tebex-identity-verification]: https://docs.tebex.io/creators/initial-setup/identity-verification-for-tebex-store-onboarding
[tebex-review]: https://docs.tebex.io/creators/initial-setup/your-store-review
[tebex-tips-store-application]: https://docs.tebex.io/creators/initial-setup/tips-for-getting-your-store-application-approved
[fivem-pla]: https://fivem.net/terms
[tebex-tos]: https://checkout.tebex.io/terms
[tebex-fivem-server-wrapper]: https://docs.tebex.io/creators/tebex-control-panel/game-servers/fivem/fivem-server-wrapper
[tebex-download-wrapper]: https://github.com/najeetpie/nass_serverstore
[tebex-aup]: https://www.tebex.io/terms-creator-agreement/acceptable-use-policy
[tebex-get-started]: https://creator.tebex.io/get-started
[tebex-templates]: https://creator.tebex.io/templates