#include "stdafx.h"
#include "Action.h"

TCHAR g_ConfigFile[260];

vector<pair<WORD, WORD>> g_NamePatterns;

void Action::Init()
{
	GetCurrentDirectory(MAX_PATH,g_ConfigFile);
	lstrcat(g_ConfigFile, _T("\\CachedExt.ini"));
	const WCHAR* sectionName = L"Setting";
	TCHAR temp[8190];
	if(GetPrivateProfileString(sectionName, _T("NamePattern"), 0, temp, 8190, g_ConfigFile))
	{
		wstring tmp(temp);
		size_t pos = tmp.find(L"-");
		while(pos != wstring::npos)
		{
			tmp = tmp.replace(pos, 1, L" ");
			pos = tmp.find(L"-", pos);
		}
		wstringstream patternStream(tmp);
		wstring low, high;
		while(patternStream >> low >> high)
		{
			g_Log.Add(CLog::Blue, L"NamePattern ー %c-%c", low[0], high[0]);
			g_NamePatterns.push_back(pair<WORD, WORD>(low[0], high[0]));
		}
	}

	WriteCall(0x415B2C, Action::CheckCharacterName);
	WriteCall(0x415F6D, Action::CheckCharacterName);
	WriteCall(0x41B7C7, Action::CheckCharacterName);
	WriteCall(0x41CE5B, Action::CheckCharacterName);
	WriteCall(0x41D89E, Action::CheckCharacterName);
	WriteCall(0x4211D7, Action::CheckCharacterName);
	WriteCall(0x423ACF, Action::CheckCharacterName);
	WriteCall(0x4284C2, Action::CheckCharacterName);
	WriteCall(0x4415C5, Action::CheckCharacterName);
	WriteCall(0x5258FE, Action::CheckCharacterName);
}

bool Action::CheckCharacterName(const WCHAR* wName, UINT country, bool pet)
{
	if(country == 1 && g_NamePatterns.size() > 0)
	{
		size_t len = wcslen(wName);
		if((( pet && len < 25 ) || len < 17 ) && len > 0 )
		{		
			for(UINT n=0;n<len;n++)
			{
				bool valid = false;
				for(UINT m=0;m<g_NamePatterns.size();m++)
				{
					if(g_NamePatterns[m].first <= wName[n] && g_NamePatterns[m].second >= wName[n])
					{
						valid = true;
						break;
					}
				}
				if(!valid)
				{
					g_Log.Add(CLog::Error, L"[%S] Trying to use invalid character in name!", __FUNCTION__);
					return false;
				}
			}
		}else
		{
			g_Log.Add(CLog::Error, L"[%S] Trying to use invalid length name!", __FUNCTION__);
			return false;
		}
		return true;
	}else
	{
		typedef bool (*f)(const WCHAR*, int, bool);
		return f(0x55264CL)(wName, country, pet);
	}
}