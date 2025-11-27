---
title: Adaptive Cards in deferrals
date: 2019-06-29T08:11:09.000+02:00
---

{{< alert title="Cookbook Archive" color="warning" >}}
**Note:** This Cookbook article was originally published on **June 29, 2019**. Newer information may exist.
{{< /alert >}}

We'll be writing some more documentation on this soon, but the latest server version (combined with the canary client at this time - no prod yet!) supports presenting [Adaptive Cards](https://adaptivecards.io/) to clients during deferrals.

Here's a quick code sample:

```lua
AddEventHandler('playerConnecting', function(name, skr, d)
    d.defer()

    Wait(50)

    -- badly serialized JSON in a string, from the Adaptive Cards designer
    d.presentCard([==[{"type":"AdaptiveCard","body":[{"type":"TextBlock","size":"ExtraLarge","weight":"Bolder","text":"Server password?!"},{"type":"TextBlock","text":"That's right, motherfucker! You have to enter a goddamn PASSWORD to connect to this server...","wrap":true},{"type":"Input.Text","id":"password","title":"","placeholder":"better enter one now"},{"type":"Image","url":"http://images.amcnetworks.com/ifccenter.com/wp-content/uploads/2019/04/pulpfic_1280.jpg","altText":""},{"type":"ActionSet","actions":[{"type":"Action.Submit","title":"Sure..."},{"type":"Action.ShowCard","title":"YOU WISH!!!!!!","card":{"type":"AdaptiveCard","body":[{"type":"Image","url":"https://i.imgur.com/YjMR0E6.jpg","altText":""}],"$schema":"http://adaptivecards.io/schemas/adaptive-card.json"}}]}],"$schema":"http://adaptivecards.io/schemas/adaptive-card.json","version":"1.0"}]==],
        function(data, rawData)
            -- you can chain cards, this is just the example adaptive card in the designer
            d.presentCard([==[{"type":"AdaptiveCard","body":[{"type":"Container","items":[{"type":"TextBlock","size":"Medium","weight":"Bolder","text":"Publish Adaptive Card schema"},{"type":"ColumnSet","columns":[{"type":"Column","items":[{"type":"Image","style":"Person","url":"https://pbs.twimg.com/profile_images/3647943215/d7f12830b3c17a5a9e4afcc370e3a37e_400x400.jpeg","size":"Small"}],"width":"auto"},{"type":"Column","items":[{"type":"TextBlock","weight":"Bolder","text":"Matt Hidinger","wrap":true},{"type":"TextBlock","spacing":"None","text":"Created {{DATE(2017-02-14T06:08:39Z,SHORT)}}","isSubtle":true,"wrap":true}],"width":"stretch"}]}]},{"type":"Container","items":[{"type":"TextBlock","text":"Now that we have defined the main rules and features of the format, we need to produce a schema and publish it to GitHub. The schema will be the starting point of our reference documentation.","wrap":true},{"type":"FactSet","facts":[{"title":"Board:","value":"Adaptive Card"},{"title":"List:","value":"Backlog"},{"title":"Assigned to:","value":"Matt Hidinger"},{"title":"Due date:","value":"Not set"}]}]}],"actions":[{"type":"Action.ShowCard","title":"Set due date","card":{"type":"AdaptiveCard","body":[{"type":"Input.Date","id":"dueDate"},{"type":"Input.Text","id":"comment","placeholder":"Add a comment","isMultiline":true}],"actions":[{"type":"Action.Submit","title":"OK","url":"http://adaptivecards.io"}],"$schema":"http://adaptivecards.io/schemas/adaptive-card.json"}},{"type":"Action.Submit","title":"View","url":"http://adaptivecards.io"}],"$schema":"http://adaptivecards.io/schemas/adaptive-card.json","version":"1.0"}]==],
                function(_, rawData2)
                    -- normally you'd check the password, also submit button IDs are sent as submitId
                    -- we're lazy so just reject everyone and tell them the password
                    d.done('you suck actually for entering the password: ' .. data.password .. ' and data like ' .. rawData2)
                end)
        end)
end)
```

\--

---

*Original discussion thread: [https://forum.fivem.net/t/adaptive-cards-in-deferrals/612598](https://forum.fivem.net/t/adaptive-cards-in-deferrals/612598)*
