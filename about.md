My app is used to load a list of Minecraft servers. This app uses a lot of code from my second app, including the server struct, which is based on the response from Minecraft Server Status API.

In this app, the user can edit the details of the server in-memory. The user can add a name to the server. After this change is made, the data remains until the app is closed.

On the home page, all the servers are listed. There is also a search page. The search will filter for songs that contain the query in the server name, the hostname (web address), or the IP.

An animation is used to display the server icon, which is stored in the json in base 64 format.

Some issues:
- Previews did not work. For one, #Preview doesn’t work in the Keck lab. I attempted preview functions, but they didn’t work because they didn’t accept @Binding variables.
- Swift didn't let me use a ServerRow<T> with switch/case to bind and edit a variable of type T. Instead, I had to create many different ServerRow views for each type of variable the user might edit.

Credits
- Myself in Assignment 0221
- Minecraft Server Status API https://api.mcsrvstat.us for inspiration
- ChatGPT 3.5
- Minecraft server creators, especially Hypixel and my brother, who created the featured servers.
- Hypixel is to credit for the Hypixel logo image.
- Minecraft is to credit for the app icon.
