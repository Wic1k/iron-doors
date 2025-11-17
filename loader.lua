local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()

if getexecutorname and (
    getexecutorname() == "Xeno" 
    or getexecutorname() == "Solara" 
    or getexecutorname() == "JJSploit"
) then
    Fluent:Notify({
        Title = "Executor not supported",
        Content = "Your Executor is not supported",
        Duration = 5
    })
else
    loadstring(game:HttpGet("https://irondoors.vercel.app/script.lua"))()
