-- Yoxi Protector + No Skidding screen
local domain = "https://твой-домен.рф/yoxi-protector/"   -- ← меняешь только тут

local realHub = "https://irondoors.vercel.app/script.lua"   -- твой хаб остаётся там же

-- Если это браузер — показываем только No Skidding навсегда
if not game or not game.PlaceId then
    return [[
<!DOCTYPE html>
<html lang="ru"><head><meta charset="utf-8"><title>No Skidding</title>
<style>
  body{margin:0;height:100vh;background:#000;color:#fff;display:flex;align-items:center;justify-content:center;font-family:"Arial Black",sans-serif}
  .txt{font-size:95px;letter-spacing:10px;text-shadow:0 0 50px #fff,0 0 100px #ff00ff;animation:g 1.7s infinite}
  @keyframes g{0%{opacity:.6;transform:scale(.95)} 50%{opacity:1;transform:scale(1.05)} 100%{opacity:.6;transform:scale(.95)}}
</style>
</head><body><div class="txt">No Skidding</div></body></html>
]]
end

-- Мы в Roblox'e — продолжаем
local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()

local badExecutors = {
    "Xeno",
    "Solara", 
    "JJSploit"
}

if getexecutorname and table.find(badExecutors, getexecutorname()) then
    Fluent:Notify({
        Title = "Executor not supported",
        Content = "Your Executor is not supported",
        Duration = 8
    })
    return
end

-- Всё ок — запускаем твой настоящий хаб
loadstring(game:HttpGet(realHub))()
