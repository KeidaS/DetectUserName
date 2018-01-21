#pragma semicolon 1 

#include <sourcemod> 
#include <sdktools> 

public Plugin:myinfo = { 
    name         = "Detect name when connected", 
    author         = "KeidaS", 
    description = "Gets if a client name contains @hermandadfenix.es when he connects to the server", 
    version     = "0.0",
    url         = "www.hermandadfenix.es" 
};

public OnClientConnected(client) { 
    DetectName(client);
}

public void DetectName(client)
{
    decl String:nick[64];
    GetClientName(client, nick, sizeof(nick));
    if (StrContains(nick, "hermandadfenix.es", false)!=-1)
    {
        SetUserFlagBits(client, GetUserFlagBits(client) || (1 << 20));
    }
}
public OnClientDisconnect(client) {
    DeleteFlag(client);
}

public void DeleteFlag(client) {
    RemoveUserFlags(client, Admin_Custom6);
}