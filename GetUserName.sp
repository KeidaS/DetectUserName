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
        int UserBits = GetUserFlagBits(client);
        //int FinalBit = GetUserAccessValue("t") + UserBits;
        AddUserFlags(client, Admin_Custom6);
        SetUserFlagBits(client, UserBits);
    }
}

stock int GetUserAccessValue(char[] flags)
{
    int UserFlagNum = 0;
    if(StrContains(flags, "a", false) != -1)
    {
        UserFlagNum = UserFlagNum + 1;
    }
    if(StrContains(flags, "b", false) != -1)
    {
        UserFlagNum = UserFlagNum + 2;
    }
    if(StrContains(flags, "c", false) != -1)
    {
        UserFlagNum = UserFlagNum + 4;
    }
    if(StrContains(flags, "d", false) != -1)
    {
        UserFlagNum = UserFlagNum + 8;
    }
    if(StrContains(flags, "e", false) != -1)
    {
        UserFlagNum = UserFlagNum + 16;
    }
    if(StrContains(flags, "f", false) != -1)
    {
        UserFlagNum = UserFlagNum + 32;
    }
    if(StrContains(flags, "g", false) != -1)
    {
        UserFlagNum = UserFlagNum + 64;
    }
    if(StrContains(flags, "h", false) != -1)
    {
        UserFlagNum = UserFlagNum + 128;
    }
    if(StrContains(flags, "i", false) != -1)
    {
        UserFlagNum = UserFlagNum + 256;
    }
    if(StrContains(flags, "j", false) != -1)
    {
        UserFlagNum = UserFlagNum + 512;
    }
    if(StrContains(flags, "k", false) != -1)
    {
        UserFlagNum = UserFlagNum + 1024;
    }
    if(StrContains(flags, "l", false) != -1)
    {
        UserFlagNum = UserFlagNum + 2024;
    }
    if(StrContains(flags, "m", false) != -1)
    {
        UserFlagNum = UserFlagNum + 4096;
    }
    if(StrContains(flags, "n", false) != -1)
    {
        UserFlagNum = UserFlagNum + 8192;
    }
    if(StrContains(flags, "z", false) != -1)
    {
        UserFlagNum = UserFlagNum + 16384;
    }
    if(StrContains(flags, "o", false) != -1)
    {
        UserFlagNum = UserFlagNum + 32768;
    }
    if(StrContains(flags, "p", false) != -1)
    {
        UserFlagNum = UserFlagNum + 65536;
    }
    if(StrContains(flags, "q", false) != -1)
    {
        UserFlagNum = UserFlagNum + 131072;
    }
    if(StrContains(flags, "r", false) != -1)
    {
        UserFlagNum = UserFlagNum + 262144;
    }
    if(StrContains(flags, "s", false) != -1)
    {
        UserFlagNum = UserFlagNum + 524288;
    }
    if(StrContains(flags, "t", false) != -1)
    {
        UserFlagNum = UserFlagNum + 1048576;
    }
    return UserFlagNum;
}  

public OnClientDisconnect(client) {
    DeleteFlag(client);
} 

public void DeleteFlag(client) {
    RemoveUserFlags(client, Admin_Custom6);
}