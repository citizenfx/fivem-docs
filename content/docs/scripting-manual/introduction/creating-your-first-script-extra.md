---
title: How to create your first FiveM resource (advanced part)
---

# Advanced Topics in FiveM Resource Development

Congratulations on making your first FiveM resource! As you continue your journey in FiveM development, you'll encounter more complex scenarios and challenges. This advanced guide aims to equip you with the knowledge and techniques to tackle these situations, ensuring your resources are robust, optimized, and secure.

## Validating Parameters

In the basic guide, we introduced a simple validation step to ensure that the client script receives a valid parameter from the server. This is crucial for preventing cheating attempts and maintaining the integrity of your game environment. Here's how you can enhance this validation process:

```lua
RegisterNetEvent('cfx:client:firstEvent', function(information)
    -- Ensure the parameter is valid
    if not information then 
        print('Invalid parameter received')
        return 
    end
    
    -- Proceed with the event logic
    TriggerEvent('chat:addMessage', {
        template = '<div class="chat-message"><b>SYSTEM</b><br>{0} has been sent to you</div>',
        args = {information}
    })
end)
```

This code snippet check `information` parameter is a valid param. If the validation fails, it throws an error, preventing the execution of any potentially wrong code.

## Optimization Techniques

As your resources grow in complexity, keeping them optimized is key to maintaining a smooth player experience. Here are some optimization tips:

- **Minimize Network Traffic**: Only send necessary data between the client and server to reduce bandwidth usage.
- **Prevent multiples threads**: Avoid creating too many threads or using them too frequently, as they can significantly impact performance. If you are using 4 threads with simple checks, combine all them in 1.
- **Cache References**: Instead of repeatedly calling `GetPlayerName`, `GetPlayerServerId`, etc., cache these values when possible. Natives that will never change value doesn't require to be call every time on the **same player session**.

---

This advanced guide is just the beginning of what's possible in FiveM resource development. As you explore these topics, you'll find that the possibilities are endless. Keep experimenting, learning, and most importantly, enjoy the process of creating amazing experiences for your players.


<!-- 
TO DO
Add ways to secure events
How to use player token
How to cache data
How to optimize resources
 -->