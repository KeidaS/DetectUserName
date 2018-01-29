#pragma semicolon 1 

#include <sourcemod> 
#include <sdktools> 

public Plugin:myinfo = { 
    name        = "Detect user name", 
    author      = "KeidaS", 
    description = "Gets if a client name contains @hermandadfenix.es when he connects to the server and assings a flag.", 
    version     = "1.0",
    url         = "www.hermandadfenix.es" 
};

public OnClientPostAdminFilter(client) { 
    DetectName(client);
}

public void DetectName(client)
{
    decl String:nick[64];
    GetClientName(client, nick, sizeof(nick));
    if (StrContains(nick, "hermandadfenix.es", false)!=-1)
    {
        AddUserFlags(client, Admin_Custom6);
    }
}
public OnClientDisconnect(client) {
    DeleteFlag(client);
}

public void DeleteFlag(client) {
    RemoveUserFlags(client, Admin_Custom6);
}