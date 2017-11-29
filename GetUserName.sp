#pragma semicolon 1 

#include <sourcemod> 
#include <sdktools> 

public Plugin:myinfo = { 
    name         = "Haptagu", 
    author         = "KeidaS", 
    description = "Gets if a client name contains @hermandadfenix.es", 
    version     = "0.0",
    url         = "www.hermandadfenix.es" 
}; 

public OnPluginStart() 
{ 
    HookEvent("player_connect", PlayerConnect_Event, EventHookMode_Pre); 
} 

public Action:PlayerConnect_Event(Handle:event, const String:name[], bool:dontBroadcast) 
{ 
    new client; 
    new clientid; 
    decl String:nick[64]; 
    clientid = GetEventInt(event,"userid"); 
    client = GetClientOfUserId(clientid); 
    if(GetClientName(client, nick, sizeof(nick))) 
       	if (StrContains(nick, "@hermandadfenix.es", true)) 
       		PrintToChatAll("HAPTAGUUU");
}  