# Creating your first server side script in C#

Getting started with server side scripting in FiveM can be very overwhelming. It can be hard to learn where to start, but luckily, this doc has been created to help you do precisely this!
Here, we will be creating server events to retrieve and store information!

*You should read the [Client Side Documentation](https://docs.fivem.net/docs/scripting-manual/introduction/creating-your-first-script-csharp/) first!*

# Setting up your enviorment
The simplest way to set up your enviorment is to get the NuGet package publicly available! Everything you need to do is comprehensively listed below!

 1. Firstly, set up and install any version Mircosoft Visual Studio.
 2. Create a new project under "Class Libary(.NET Framew6ork)"
 3. Give this project a name! Here it will be called "SampleProject"
 4. Set the "Framework" to ".NET Framework 4.7.2.
![enter image description here](https://media.discordapp.net/attachments/992071418286186536/992072042440556674/unknown.png)

**Ok, that's the enviorment set up. Now we just need the NuGet and we can start coding!**
1. Navigate to the topbar of the page and select "Project". This will open a dropdown menu containing the option "Manage NuGet Packages"
![enter image description here](https://media.discordapp.net/attachments/992071418286186536/992072690754130000/unknown.png)
2. Clicking this will bring you onto the NuGet Package Manager screen. Tab over to the "Browse" option.![enter image description here](https://media.discordapp.net/attachments/992071418286186536/992073315059503165/unknown.png?width=1440&height=673)
3. From here, getting the NuGet package is quite easy! Type "*CitizenFx.Core.Server*" into the search bar! You will then get a number of options.![enter image description here](https://media.discordapp.net/attachments/992071418286186536/992073857177505834/unknown.png?width=968&height=700)
4. You will see the top item in the screenshot is the "official" package. Click on this open and press install.

Congrats! You've just installed the NuGet package! Now let's start writing some code!

# Writing some basic code
Firstly, let's get our references sorted! We need to call three items in order to access everything!
```csharp
using CitizenFX;
using CitizenFX.Core;
using static CitizenFX.Core.Native.API;
```
These are essentially just adding the functions of FiveM into your project!

Now, as you'll remember from the Client Side Docs. Every script must inherit from the `BaseScript` class.
Let's add this below!
```csharp
namespace SampleProject
{
    public class Class1 : BaseScript
    {
    }
}
```
Ok! Now the setup is complete, time to write pure code!

The first thing we'll do is write a quick script to grab the players license key when they connect.

Lets start by hooking the connecting event.
This sounds much more difficult than it actually is, but it's really not hard!
```csharp
    public class Class1 : BaseScript
    {
        public Class1()
        {
            EventHandlers["playerConnecting"] += new Action<Player, string, dynamic, dynamic>(OnPlayerConnecting);
        }
        void OnPlayerConnecting([FromSource] Player player, string playerName, dynamic kickReason, dynamic defer)
        {
        }
    }
   ```
   Ok, there's quite a bit in here. So let me explain how events are hooked.
   Events are triggered either by a script or by the server when certain conditions are met or triggered. These events come with special parameters, like this one! So let's explain the parameters!
  1. `Player` is a special class that has a massive amount of information about an individual user. We are going to be using this a lot.
  2. `string` is going to contain the name of the player in **this** instance.
  3. `dynamic`'s are two very special types we will be working with here. The first dynamic contains a reason for kicking the player, and the second is our deferral. 
  It's important to explain what a dynamic is, before we proceed. Dynamics can be pretty much anything, this is because the type of the dynamic is only checked at runtime, not by your compiler.
  ```csharp
  dynamic number = 123; // This can be a dynamic
  dynamic letter = "h"; // This can also be a dynamic
  dynamic location = new Vector3(0, 0, 0); // Yes, even this can be a dynamic.
```
Now, that's the parameters explained. So let's move onto the event target. The event target is the function you trigger when an event with the name and parameters you have set is recieved. Here, we are using `OnPlayerConnecting`. So let's start using this event!

```csharp
void OnPlayerConnecting([FromSource] Player player,  string playerName,  dynamic kickReason,  dynamic defer)  
{ 
} 
```
There's not much to digest right away, however, I need to talk to you about a really useful tool, `[FromSource] Player`.
Every event that is coming from a Client can use this. This effectively gives you a `Player` class to use in your code! How useful!
This can be used in *any* event via adding the parameter `[Fromsource] Player variableName`

Now it's time to write some real code.
```csharp
        void OnPlayerConnecting([FromSource] Player player, string playerName, dynamic kickReason, dynamic defer)
        {
        //Remember how dynamics can be anything? Here they are using functions that won't appear in your editor! These will each be explained.
            defer.defer(); // defer() will hold the connection to the server before allowing the player to load in. This is commonly used when you have extensive checks that will take some time to perform.
            defer.update("Just running some checks within the system"); // This provides a simple message to let the player know what's going on!
            string license = player.Identifiers["license"]; // One of the features of the Player class is the ability to get a special array of their identifiers. These can be accssed by name, such as "license" or "steam".
            Console.WriteLine(license); // We now just want to print our license to the console.
            defer.done(); // REMEMBER! Once the process here is done, you **need** to finish the deferall via defer.done().
        }
   ```
   Alright, that's all nice and simple isn't it? This will print your license key to the console, go ahead and try it!

# Server Callbacks
Callbacks in C# are really simple! The `NetworkCallbackDelegate` type provides substantial coverage in this area.
So lets jump in and set it up!

**Client Side Setup**
Assuming you have already setup a client script, this function will get you set up immediately
```csharp
TriggerServerEvent("eventName", new Action<object>((data) =>
            {
				// Arg will be the data you're calling! Really simple!
				Console.WriteLine(data);
            }));
```
Let's break it down now.
`TriggerServerEvent("eventName"` This is of course triggering your event name like a normal event.
`new Action<object>`This is the important part. This needs to match the data type you want to get. For example, if you wanted to get a List of integers, you would use `new Action<List<int>>`. Really easy, right?
Let's get back to the server.
Finally, `arg` is the variable the data will be assigned to.

**Server Side Setup**
Firstly, we need to hook the event. So let's get that done.
```csharp
            EventHandlers["eventName"] += new Action<NetworkCallbackDelegate>(TestEvent);
```
`NetworkCallbackDelegate` is used when we want to call information back to the client.
Now let's actually write the callback.

```csharp
void TestEvent(NetworkCallbackDelegate cb)
        {
            cb.Invoke("Callback!");
        }
   ```
Wow! This is overly easy isn't it? We can now callback anything we want!

# MySQL
One of the amazing benefits of C# is how easy and quick it is to run database calls. In fact, we can send and recieve data in less than 10 lines of code!

Firstly, we're going to need a special NuGet package. Repeat the same steps you took in the setup phase, but instead of installing "Citizenfx.Core.Server" you are going to install "[MySQL.Data](https://www.nuget.org/packages/MySql.Data/)"
You'll need to add an extra reference now, though!
```csharp
using MySql.Data.MySqlClient;
```
Perfect! We can now use the built in MySQL functions.
We now need to prepare a connection. We're going to need a connection string though.
Here is a standard MariaDB connection string.
```csharp
private string connectionString  = "Server=myServerAddress;Database=myDataBase;Uid=myUsername;Pwd=myPassword";
```

## Making changes to the Database
Making changes is extremely simple! In fact, it's only around 5 lines to do a basic change.
You'll need to set up an event or a trigger to have this run, this section will only cover how to implement it.
```csharp
void UpdateDatabase(string query)
{
		MySqlConnection conn = new MySqlConnection(connectionString);
	    conn.Open();
        MySqlCommand cmd = new MySqlCommand(query, conn);
        cmd.ExecuteNonQuery();
        conn.Close();
}
``` 
Now we'll talk about what has happened here.
`MySqlConnection conn = new MySqlConnection(connectionString);` Here we have prepared the connection to the database. You need to include a valid connection string as the parameter of this.
`conn.Opens();` This connects your resource to the database.
`MySqlCommand cmd =  new  MySqlCommand(query, conn);` And this create a command  using the query on the connection.
`cmd.ExecuteNonQuery();` And this one executes the command!
`conn.Close();` Finally, we close the connection. ALWAYS do this, otherwise the database *will* crash!

## Getting data from the database
What's the point of adding data to the database without being able to read any? This is almost exactly the same, so let's jump straight into it!
```csharp
void ReadFromDatabase(string query)
{
		MySqlConnection conn = new MySqlConnection(connStr);
        conn.Open();
        MySqlCommand cmd = new MySqlCommand(query, conn);
        MySqlDataReader rdr = cmd.ExecuteReader();
		
		while(rdr.Read())
		{
			Console.WriteLine(rdr[0].ToString());
		}
        rdr.Close();
        conn.Close();
}
```
Theres a bit of information you need to know here. Let's start where the first difference was here.
`MySqlDataReader rdr = cmd.ExecuteReader();` Here we have created a DataReader, which does what it's name states, reads data.
`while(rdr.Read())` Importantly with this, this a **boolean**, so this means it *only* runs if theres a result.
Ok, so what is the rdr[0]? 
rdr returns an array. Arrays start from index 0, so 0 represents the first column returned. It's important to note this while loop will continue for every row it returns.

But what if I only want to know if a row exists?
This is quite simple as well, replace the while loop with this if/else statement
```csharp
if (!rdr.HasRows)
{
	Console.WriteLine("Nope, nothing here!");
}
else {
	Console.WriteLine("There's a row or two down here!");
}
```
The final difference is `rdr.Close();`. It is absolutely paramount that you close the reader before opening a new one. If you leave this open, or try to close the connection before you do so, the script will crash.

# Running and executing this
As you'll remember from the client reference, to execute a c# script it's extension needs to be .net.dll. If you haven't already go back and set this in the assembly name!'

Once you've done that you can build it!

## Including the MySQL addon
Unlike a lot of packages, you do need to manually include some files in the resource if you wish to use MySql.Data. 
These are `Ubiety.Dns.Core.dll` & `MySql.Data.dll`. Copy and paste these into the folder you are putting your script into, then add the following to `fxmanifest.lua`
```lua
files {
	'MySql.Data.dll',
	'Ubiety.Dns.Core.dll'
}
```

# All done!