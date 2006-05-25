#ifndef CAMPAIGN_MAX_ENTRIES
#define CAMPAIGN_MAX_ENTRIES 64
#endif

// each i-th array element corresponds to the list entry campaign_offset+i
float campaign_entries;
float campaign_offset;
string campaign_gametype[CAMPAIGN_MAX_ENTRIES];
string campaign_mapname[CAMPAIGN_MAX_ENTRIES];
float campaign_bots[CAMPAIGN_MAX_ENTRIES];
float campaign_botskill[CAMPAIGN_MAX_ENTRIES];
float campaign_fraglimit[CAMPAIGN_MAX_ENTRIES];
string campaign_mutators[CAMPAIGN_MAX_ENTRIES];
string campaign_shortdesc[CAMPAIGN_MAX_ENTRIES];
string campaign_longdesc[CAMPAIGN_MAX_ENTRIES];

// load the campaign file, but use the given offset and limit the number of
// entries being read. Returns the number of entries successfully read (this
// number is also stored in campaign_entries).
// NOTE: there MUST be a corresponding CampaignFile_Unload() to unzone the
// strings.
float CampaignFile_Load(float offset, float entries);
void CampaignFile_Unload();

// Sets up the campaign for the n-th array item (meaning: campaign_offset+nth
// level) using localcmd()
void CampaignSetup(float n);

// this wraps the campaign_longdesc field to the given field, or just replaces the linefeeds if l==0
string Campaign_wordwrap(string s, float l)
