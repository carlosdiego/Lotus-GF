#include "StdAfx.h"
#include "PacketHandler.h"
#include "DBConn.h"
#include "AbnormalStatus.h"
#include "Query.h"

CPacketHandler g_PacketHandler;

CPacketHandler::CPacketHandler()
{
	memset(handlerArray, 0, sizeof(handlerArray));
}

CPacketHandler::~CPacketHandler()
{
}

void CPacketHandler::Init()
{
	typedef bool (*orgBind)(INT64, int, SocketCallback);

	orgBind(0x4D3D00L)(0x2739680, 0xF9, CPacketHandler::Handle);
	orgBind(0x4D3D00L)(0x2739680, 0x80, CAbnormalStatus::RequestSaveAbnormalStatus);
	orgBind(0x4D3D00L)(0x2739680, 0x81, CAbnormalStatus::RequestLoadAbnormalStatus);

	WriteNOP(0x54314B, 5);
	WriteNOP(0x54317E, 5);

	for(UINT n=0;n<256;n++)
	{
		Bind(n, CPacketHandler::DummyPacket);
	}

	Bind(CI_TEST, TestPacket);
	Bind(CI_REQUEST_SAVE_BUFF_LIST, CPacketHandler::RequestSaveSchemeBuffList);
	Bind(CI_REQUEST_LOAD_BUFF_LIST, CPacketHandler::RequestLoadSchemeBuffList);
	Bind(CI_REQUEST_LOAD_DONATE_POINTS, CPacketHandler::RequestLoadDonatePoints);
	Bind(CI_REQUEST_SAVE_DONATE_POINTS, CPacketHandler::RequestSaveDonatePoints);
	Bind(CI_REQUEST_LOAD_PVP_DATA, CPacketHandler::RequestLoadPvPData);
	Bind(CI_REQUEST_SAVE_PVP_POINTS, CPacketHandler::RequestSavePvPPoints);
	Bind(CI_REQUEST_LOAD_VOTE_POINTS, CPacketHandler::RequestLoadVotePoints);
	Bind(CI_REQUEST_SAVE_VOTE_POINTS, CPacketHandler::RequestSaveVotePoints);
	Bind(CI_REQUEST_SAVE_PVP_STAT, CPacketHandler::RequestSavePvPStat);
	Bind(CI_REQUEST_LOAD_CERTIFICATION_SKILLS, CPacketHandler::RequestLoadCertificationSkills);
	Bind(CI_REQUEST_LOAD_CHAMPIONSHIP_TEAMS, CPacketHandler::RequestLoadChampionshipTeams);
	Bind(CI_REQUEST_LOAD_CHAMPIONSHIP_MATCHES, CPacketHandler::RequestLoadChampionshipMatches);
	Bind(CI_REQUEST_SAVE_CHAMPIONSHIP_TEAM, CPacketHandler::RequestSaveChampionshipTeam);
	Bind(CI_REQUEST_SAVE_CHAMPIONSHIP_MATCH, CPacketHandler::RequestSaveChampionshipMatch);
	Bind(CI_REQUEST_SAVE_TRANSFERRED_PVP_POINTS, CPacketHandler::RequestSaveTransferredPvPPoints);
	Bind(CI_REQUEST_LOAD_PVP_SEASON, CPacketHandler::RequestLoadPvPSeason);
	Bind(CI_REQUEST_PROCESS_PVP_SEASON, CPacketHandler::RequestProcessPvPSeason);
	Bind(CI_REQUEST_SET_PVP_REWARD_FLAG, CPacketHandler::RequestSetPvPRewardFlag);
	Bind(CI_REQUEST_LOAD_PVP_TOP_PLAYERS, CPacketHandler::RequestLoadPvPTopPlayers);
	Bind(CI_REQUEST_SAVE_GM_LOGIN, CPacketHandler::RequestSaveGMLogin);
	Bind(CI_REQUEST_SAVE_GM_LOGOUT, CPacketHandler::RequestSaveGMLogout);
	Bind(CI_REQUEST_SAVE_HWID, CPacketHandler::RequestSaveHWID);
	Bind(CI_REQUEST_SET_ITEM_LOCK_PASSWORD, CPacketHandler::RequestSetItemLockPassword);
	Bind(CI_REQUEST_SET_ITEM_LOCK_STATE, CPacketHandler::RequestSetItemLockState);
	Bind(CI_REQUEST_LOAD_ITEM_LOCKS, CPacketHandler::RequestLoadItemLocks);
	Bind(CI_REQUEST_LOAD_BANNED_HWID, CPacketHandler::RequestLoadBannedHardwareId);
	Bind(CI_REQUEST_BAN_HWID, CPacketHandler::RequestBanHardwareId);
	Bind(CI_REQUEST_UNBAN_HWID, CPacketHandler::RequestUnBanHardwareId);
	Bind(CI_REQUEST_SAVE_REAL_IP, CPacketHandler::RequestSaveRealIp);
	Bind(CI_REQUEST_LOAD_AIO, CPacketHandler::RequestLoadAIO);
	Bind(CI_REQUEST_SAVE_AIO, CPacketHandler::RequestSaveAIO);
}

bool CPacketHandler::Bind(UINT id, SocketCallback func)
{
	if(id < 256)
	{
		handlerArray[id] = func;
		return true;
	}
	return false;
}

bool CPacketHandler::Handle(CSocket *pSocket, const unsigned char* packet)
{
	WORD opCode = 0;
	const unsigned char* pck = Disassemble(packet, "h", &opCode);

	if(opCode > 1)
	{
		if(opCode < 256)
		{
			return g_PacketHandler.handlerArray[opCode](pSocket, pck);
		}else
		{
			g_Log.Add(CLog::Error, L"[%s]ー Invalid packet opcode[%x]", __FUNCTIONW__, opCode);
			return false;
		}
	}else
	{
		return SocketCallback(0x4DB594L)(pSocket, packet);
	}

	return false;
}

bool CPacketHandler::DummyPacket(CSocket *pSocket, const unsigned char *packet)
{
	g_Log.Add(CLog::Error, L"[%s]ー called with opcode[%x]", __FUNCTIONW__, packet[-2]);
	return false;
}

bool CPacketHandler::RequestSaveAIO(CSocket* pSocket, const unsigned char* packet)
{
	UINT charId = 0, aioId = 0, startTime = 0;;
	Disassemble(packet, "ddd", &charId, &aioId, &startTime);

	CQuery query(L"UPDATE [dbo].[user_data] SET [aio_id] = ?, [aio_start_time] = ? WHERE [char_id] = ?");
	query.AddParam(aioId);
	query.AddParam(startTime);
	query.AddParam(charId);

	CDBConn *pCon = new CDBConn();
	pCon->PrepareStatement(query.Get());
	pCon->ExecutePrepared(query.Get());
	delete pCon;

	return false;
}

bool CPacketHandler::RequestLoadAIO(CSocket* pSocket, const unsigned char* packet)
{
	UINT charId = 0;
	Disassemble(packet, "d", &charId);

	CQuery query(L"SELECT [aio_id], [aio_start_time] FROM [dbo].[user_data] WHERE [char_id] = ?");
	query.AddParam(charId);

	UINT aioId = 0, startTime = 0;
	CDBConn *pCon = new CDBConn();
	pCon->Bind(&aioId);
	pCon->Bind(&startTime);
	pCon->PrepareStatement(query.Get());
	if(pCon->ExecutePrepared(query.Get()))
	{
		pCon->Fetch();
	}
	
	delete pCon;

	if(aioId > 0)
	{
		pSocket->Send("chddd", 0x1E, CO_REPLY_LOAD_AIO, charId, aioId, startTime);
	}
	return false;
}

bool CPacketHandler::RequestUnBanHardwareId(CSocket* pSocket, const unsigned char* packet)
{
	WCHAR wsHwid[33];
	memset(wsHwid, 0, sizeof(wsHwid));

	for(UINT n=0;n<32;n++)
	{
		wsHwid[n] = (*packet);
		packet++;
	}

	CQuery query(L"{ Call dbo.lin_UnBanHardwareId ('?') }");
	query.AddParam(wsHwid);
	CDBConn *pCon = new CDBConn();
	pCon->PrepareStatement(query.Get());
	pCon->ExecutePrepared(query.Get());
	delete pCon;

	return false;
}

bool CPacketHandler::RequestSaveRealIp(CSocket *pSocket, const unsigned char *packet)
{
	UINT charId = 0;
	UtB ip;
	ip.full = 0;
	Disassemble(packet, "dd", &charId, &ip);

	CQuery query(L"{ Call dbo.lin_SaveRealIp (?, '?') }");
	wstringstream ipStream;
	ipStream << (UINT)ip.part[0] << L"." << (UINT)ip.part[1] << L"." << (UINT)ip.part[2] << L"." << (UINT)ip.part[3]; 
	query.AddParam(charId);
	query.AddParam(ipStream.str().c_str());

	CDBConn *pCon = new CDBConn;
	pCon->PrepareStatement(query.Get());
	pCon->ExecutePrepared(query.Get());
	delete pCon;

	return false;
}

bool CPacketHandler::RequestBanHardwareId(CSocket* pSocket, const unsigned char* packet)
{
	WCHAR wsHwid[33];
	memset(wsHwid, 0, sizeof(wsHwid));
	WCHAR account[25] = { 0 };
	WCHAR gm[25] = { 0 };

	for(UINT n=0;n<32;n++)
	{
		wsHwid[n] = (*packet);
		packet++;
	}
	UINT timeout = 0;
	Disassemble(packet, "SSd", sizeof(account), account, sizeof(gm), gm, &timeout);

	CQuery query(L"{ Call dbo.lin_BanHardwareId  ('?', '?', '?', ?) }");
	query.AddParam(wsHwid);
	query.AddParam(account);
	query.AddParam(gm);
	query.AddParam(timeout);

	CDBConn *pCon = new CDBConn();
	pCon->PrepareStatement(query.Get());
	pCon->ExecutePrepared(query.Get());
	delete pCon;

	return false;
}

bool CPacketHandler::RequestLoadBannedHardwareId(CSocket *pSocket, const unsigned char* packet)
{
	CQuery query(L"{ Call dbo.lin_LoadBannedHardwareId }");
	
	struct BHI
	{
		WCHAR wsHWID[33];
		WCHAR account[25];
		WCHAR gm[25];
		UINT timeout;
	};

	BHI bhi;
	memset(&bhi, 0, sizeof(bhi));

	vector<BHI> bans;

	CDBConn db;
	db.Bind(bhi.wsHWID, 66);
	db.Bind(bhi.account, 50);
	db.Bind(bhi.gm, 50);
	db.Bind(&bhi.timeout);
	db.PrepareStatement(query.Get());
	if(db.ExecutePrepared(query.Get()))
	{
		while(db.Fetch())
		{
			bans.push_back(bhi);
			memset(&bhi, 0, sizeof(bhi));
		}
	}

	for(UINT n=0;n<bans.size();n++)
	{
		BHI& bh = bans[n];
		BYTE hwid[32];
		for(UINT m=0;m<32;m++)
		{
			hwid[m] = static_cast<BYTE>(bh.wsHWID[m]);
		}
		pSocket->Send("chbSSd", 0x1E, CO_REPLY_LOAD_BANNED_HWID, 32, hwid, bh.account, bh.gm, bh.timeout);
	}

	return false;
}

bool CPacketHandler::RequestLoadItemLocks(CSocket *pSocket, const unsigned char* packet)
{
	CQuery query(L"{ Call dbo.lin_LoadItemLocks }");
	struct ItemLockData
	{
		UINT charId;
		WCHAR wPassword[32];
		UINT lockState;
	};

	ItemLockData ild;
	memset(&ild, 0, sizeof(ild));
	vector<ItemLockData> data;
	CDBConn db;
	db.Bind(&ild.charId);
	db.Bind(ild.wPassword, sizeof(ild.wPassword));
	db.Bind(&ild.lockState);
	db.PrepareStatement(query.Get());
	if(db.ExecutePrepared(query.Get()))
	{
		while(db.Fetch())
		{
			data.push_back(ild);
			memset(&ild, 0, sizeof(ild));
		}
	}

	for(UINT n=0;n<data.size();n++)
	{
		ItemLockData& ild = data[n];
		pSocket->Send("chdSd", 0x1E, CO_REPLY_LOAD_ITEM_LOCK, ild.charId, ild.wPassword, ild.lockState);
	}
	return false;
}

bool CPacketHandler::RequestSetItemLockState(CSocket *pSocket, const unsigned char* packet)
{
	UINT charId = 0, lockState = 0;
	Disassemble(packet, "dd", &charId, &lockState);
	if(charId)
	{
		CQuery query(L"{ Call dbo.lin_ItemLockSetLockState (?, ?) }");
		query.AddParam(charId);
		query.AddParam(lockState);
		CDBConn db;
		db.PrepareStatement(query.Get());
		db.ExecutePrepared(query.Get());
	}
	return false;
}

bool CPacketHandler::RequestSetItemLockPassword(CSocket *pSocket, const unsigned char* packet)
{
	UINT charId = 0, lockState = 0;
	WCHAR wPassword[32];
	Disassemble(packet, "dSd", &charId, sizeof(wPassword), wPassword, &lockState);

	if(charId > 0)
	{
		CQuery query(L"{ Call dbo.lin_ItemLockSetPassword (?, '?', ?) }");
		query.AddParam(charId);
		query.AddParam(wPassword);
		query.AddParam(lockState);
		CDBConn db;
		db.PrepareStatement(query.Get());
		db.ExecutePrepared(query.Get());
	}


	return false;
}

bool CPacketHandler::RequestSaveHWID(CSocket *pSocket, const unsigned char* packet)
{
	UINT charId = 0;
	BYTE hardwareId[32];
	memset(hardwareId, 0, sizeof(hardwareId));
	packet = Disassemble(packet, "d", &charId);
	memcpy(hardwareId, packet, 32);

	wstring hwid;
	for(int n=0;n<32;n++)
	{
		hwid += (WCHAR)hardwareId[n];	
	}
	if(charId > 0)
	{
		wstringstream strUser;
		strUser << L"{Call dbo.lin_SaveHWID (" << charId << L", '" << hwid.c_str() << "')}";

		CDBConn db;
		wstring cmd = strUser.str();
		db.PrepareStatement(cmd.c_str());
		db.ExecutePrepared(cmd.c_str());
	}
	return false;
}

bool CPacketHandler::RequestSaveGMLogin(CSocket *pSocket, const unsigned char* packet)
{
	UINT charId = 0;
	Disassemble(packet, "d", &charId);
	if(charId > 0)
	{
		wstringstream strUser;
		strUser << L"{Call dbo.linSaveGMLogin (" << charId << L")}";

		CDBConn db;
		wstring cmd = strUser.str();
		db.PrepareStatement(cmd.c_str());
		db.ExecutePrepared(cmd.c_str());
	}
	return false;
}

bool CPacketHandler::RequestSaveGMLogout(CSocket *pSocket, const unsigned char* packet)
{
	UINT charId = 0;
	Disassemble(packet, "d", &charId);
	if(charId > 0)
	{
		wstringstream strUser;
		strUser << L"{Call dbo.linSaveGMLogout (" << charId << L")}";

		CDBConn db;
		wstring cmd = strUser.str();
		db.PrepareStatement(cmd.c_str());
		db.ExecutePrepared(cmd.c_str());
	}
	return false;
}

bool CPacketHandler::RequestLoadPvPTopPlayers(CSocket *pSocket, const unsigned char* packet)
{
	wstringstream str;
	str << L"{ Call dbo.lin_LoadPvPTopPlayers }";
	UINT count = 0;
	WCHAR wName[50];
	char buff[8190];
	int len = 0;
	CDBConn db;
	wstring cmd = str.str();
	db.Bind(wName, sizeof(wName));
	db.PrepareStatement(cmd.c_str());
	if( db.ExecutePrepared(cmd.c_str()) )
	{
		while(db.Fetch())
		{
			len += Assemble(&buff[len], (sizeof(buff) - len), "S", wName);
			count++;
		}
	}
	pSocket->Send("chdb", 0x1E, CO_REPLY_LOAD_PVP_TOP_PLAYERS, count, len, buff);

	return false;
}


bool CPacketHandler::RequestSetPvPRewardFlag(CSocket *pSocket, const unsigned char* packet)
{
	UINT charId = 0;
	Disassemble(packet, "d", &charId);
	if(charId)
	{
		wstringstream str;
		str << L"{ Call dbo.lin_SetPvPRewardFlag (" << charId << L") }";
		CDBConn db;
		wstring cmd = str.str();
		db.PrepareStatement(cmd.c_str());
		db.ExecutePrepared(cmd.c_str());
	}
	return false;
}

bool CPacketHandler::RequestProcessPvPSeason(CSocket *pSocket, const unsigned char* packet)
{
	UINT startTime = 0;
	UINT topCount = 0;
	Disassemble(packet, "dd", &startTime, &topCount);
	if(startTime)
	{
		wstringstream str;
		str << L"{ Call dbo.lin_ProcessPvPSeason (" << startTime << L", " << topCount << L") }";
		CDBConn db;
		wstring cmd = str.str();
		db.PrepareStatement(cmd.c_str());
		db.ExecutePrepared(cmd.c_str());
	}
	return false;
}

bool CPacketHandler::RequestLoadPvPSeason(CSocket *pSocket, const unsigned char* packet)
{
	wstringstream str;
	str << L"{ Call dbo.lin_LoadPvPSeason ( " << _time32(0) << L") }";
	UINT id = 0, startTime = 0, state = 0;
	BOOL initialized = FALSE;
	CDBConn db;
	db.Bind(&id);
	db.Bind(&state);
	db.Bind(&startTime);
	wstring cmd = str.str();
	db.PrepareStatement(cmd.c_str());
	if( db.ExecutePrepared(cmd.c_str()) )
	{
		if(db.Fetch())
		{
			initialized = TRUE;
		}
	}
	pSocket->Send("chdddd", 0x1E, CO_REPLY_LOAD_PVP_SEASON, initialized, id, state, startTime);

	return false;
}

bool CPacketHandler::RequestSaveTransferredPvPPoints(CSocket *pSocket, const unsigned char* packet)
{
	UINT charId = 0, points = 0;
	Disassemble(packet, "dd", &charId, &points);
	if(charId)
	{
		wstringstream str;
		str << L"{ Call dbo.lin_SaveTransferredPvPPoints (" << charId << L", " << points << L") }";
		CDBConn db;
		wstring cmd = str.str();
		db.PrepareStatement(cmd.c_str());
		db.ExecutePrepared(cmd.c_str());
		g_Logger.Add(L"Saving transferred pvp points[%d] for char_id[%d]", points, charId);
	}
	return false;
}

bool CPacketHandler::RequestLoadChampionshipTeams(CSocket *pSocket, const unsigned char *packet)
{
	UINT id = 0, charId1 = 0, charId2 = 0, charId3 = 0;
	INT32 points = 0, winCount = 0, loseCount = 0, drawCount = 0, killCount = 0, deathCount = 0;
	WCHAR wName[25];

	UINT teamCount = 0;
	CDBConn db;
	const WCHAR* stm = L"SELECT COUNT(*) FROM [dbo].[championship_team]";
	db.Bind(&teamCount);
	db.PrepareStatement(stm);
	if(db.ExecutePrepared(stm))
	{
		db.Fetch();
	}

	if(teamCount > 0)
	{
		stm = L"{ call dbo.lin_LoadChampionshipTeams }";
		db.ResetParam();
		db.Bind(&id);
		db.Bind(wName, sizeof(wName));
		db.Bind(&charId1);
		db.Bind(&charId2);
		db.Bind(&charId3);
		db.Bind(&points);
		db.Bind(&winCount);
		db.Bind(&loseCount);
		db.Bind(&drawCount);
		db.Bind(&killCount);
		db.Bind(&deathCount);
		db.PrepareStatement(stm);
		if(db.ExecutePrepared(stm))
		{
			while(db.Fetch())
			{
				pSocket->Send("chddSddddddddd", 0x1E, CO_REPLY_LOAD_CHAMPIONSHIP_TEAM, teamCount, id, wName, charId1, charId2, charId3, points, winCount, loseCount, drawCount, killCount, deathCount);
			}
		}
	}
	return false;
}

bool CPacketHandler::RequestLoadChampionshipMatches(CSocket *pSocket, const unsigned char *packet)
{
	//[id], [state], [start_time], [team1_id], [team2_id], [winner_id]
	UINT id = 0, state = 0, startTime = 0, teamId1 = 0, teamId2 = 0, winnerId = 0;
	

	UINT matchCount = 0;
	CDBConn db;
	const WCHAR* stm = L"SELECT COUNT(*) FROM [dbo].[championship_match]";
	db.Bind(&matchCount);
	db.PrepareStatement(stm);
	if(db.ExecutePrepared(stm))
	{
		db.Fetch();
	}

	if(matchCount > 0)
	{
		stm = L"{ call dbo.lin_LoadChampionshipMatches }";
		db.ResetParam();
		db.Bind(&id);
		db.Bind(&state);
		db.Bind(&startTime);
		db.Bind(&teamId1);
		db.Bind(&teamId2);
		db.Bind(&winnerId);
		db.PrepareStatement(stm);
		if(db.ExecutePrepared(stm))
		{
			while(db.Fetch())
			{
				pSocket->Send("chddddddd", 0x1E, CO_REPLY_LOAD_CHAMPIONSHIP_MATCH, matchCount, id, state, startTime, teamId1, teamId2, winnerId);
			}
		}
	}
	return false;
}

bool CPacketHandler::RequestSaveChampionshipTeam(CSocket *pSocket, const unsigned char *packet)
{
	UINT id = 0;
	INT32 points = 0, winCount = 0, loseCount = 0, drawCount = 0, killCount = 0, deathCount = 0;
	Disassemble(packet, "ddddddd", &id, &points, &winCount, &loseCount, &drawCount, &killCount, &deathCount);
	if(id > 0)
	{
		wstringstream stmStream;
		stmStream << L"{ call lin_SaveChampionshipTeam ( " << id << L", " << points << L", " << winCount << L", " << loseCount << L", " << drawCount << L", " << killCount << L", " << deathCount << L") }";

		CDBConn db;
		db.PrepareStatement(stmStream.str().c_str());
		db.ExecutePrepared(stmStream.str().c_str());
	}

	return false;
}

bool CPacketHandler::RequestSaveChampionshipMatch(CSocket *pSocket, const unsigned char *packet)
{
	//Send("chddd", 0xF9, CI_REQUEST_SAVE_CHAMPIONSHIP_MATCH, id, state, winnerId)
	UINT id = 0, state = 0, winnerId = 0;

	Disassemble(packet, "ddd", &id, &state, &winnerId);
	if(id > 0)
	{
		wstringstream stmStream;
		stmStream << L"{ call lin_SaveChampionshipMatch ( " << id << L", " << state << L", " << winnerId << L") }";
		CDBConn db;
		db.PrepareStatement(stmStream.str().c_str());
		db.ExecutePrepared(stmStream.str().c_str());
	}

	return false;
}

bool CPacketHandler::RequestLoadCertificationSkills(CSocket *pSocket, const unsigned char *packet)
{
	UINT charId = 0;
	Disassemble(packet, "d", &charId);
	if(charId)
	{
		wstringstream str;
		str << L"{ Call dbo.lin_GetAquireSkill (" << charId << L", " << 0 << " ) }";

		int skillId = 0, level = 0, isLocked = 0;
		char buff[8190];
		int len = 0;
		UINT skillCount = 0;

		CDBConn db;

		db.Bind(&skillId);
		db.Bind(&level);
		db.Bind(&isLocked);
		wstring wStatement = str.str();
		db.PrepareStatement(wStatement.c_str());
		if(db.ExecutePrepared(wStatement.c_str()))
		{
			while(db.Fetch())
			{
				len += Assemble(&buff[len], 8190 - len, "dd", skillId, level);
				skillCount++;
			}
		}

		if(skillCount > 0)
		{
			pSocket->Send("chddb", 0x1E, CO_REPLY_LOAD_CERTIFICATION_SKILLS, charId, skillCount, len, buff);
		}

	}
	return false;
}

bool CPacketHandler::RequestSavePvPStat(CSocket *pSocket, const unsigned char* packet)
{
	UINT victimId = 0, killerId = 0;
	INT32 victimLevel, victimClassId, killerLevel, killerClassId, killerHp, killerMaxHp, killerCp, killerMaxCp, pvpType, x, y, z, deathTime = 0, skillId = 0, skillLevel = 0;
	Disassemble(packet, "ddddddddddddddddd", &victimId, &victimLevel, &victimClassId, &killerId, &killerClassId, &killerLevel, &killerHp, &killerMaxHp, &killerCp, &killerMaxCp, &pvpType, &x, &y, &z, &skillId, &skillLevel, &deathTime);
	if(victimId && killerId)
	{
		wstringstream str;
		str << L"{ Call dbo.lin_AddPvpStat (" << victimId << L", " 
			<< victimClassId << L", "
			<< victimLevel << L", "
			<< killerId << L", "
			<< killerClassId << L", "
			<< killerLevel << L", "
			<< killerHp << L", "
			<< killerMaxHp << L", "
			<< killerCp << L", "
			<< killerMaxCp << L", "
			<< x << L", "
			<< y << L", "
			<< z << L", "
			<< pvpType << L", "
			<< skillId << L", "
			<< skillLevel << L", "
			<< deathTime << L") }";
		CDBConn db;
		wstring cmd = str.str();
		db.PrepareStatement(cmd.c_str());
		db.ExecutePrepared(cmd.c_str());
	}
	return false;
}

bool CPacketHandler::RequestLoadDonatePoints(CSocket *pSocket, const unsigned char* packet)
{
	UINT charId = 0, accountId = 0;
	Disassemble(packet, "dd", &charId, &accountId);
	if(charId)
	{
		wstringstream str;
		str << L"{ Call dbo.lin_LoadDonatePoints (" << accountId << L") }";
		UINT points = 0;
		CDBConn db;
		db.Bind(&points);
		wstring cmd = str.str();
		db.PrepareStatement(cmd.c_str());
		if( db.ExecutePrepared(cmd.c_str()) )
		{
			db.Fetch();
		}
		pSocket->Send("chdd", 0x1E, CO_REPLY_LOAD_DONATE_POINTS, charId, points);
	}
	return false;
}

bool CPacketHandler::RequestLoadPvPData(CSocket *pSocket, const unsigned char* packet)
{
	UINT charId = 0;
	Disassemble(packet, "d", &charId);
	if(charId)
	{
		wstringstream str;
		str << L"{ Call dbo.lin_LoadPvPData (" << charId << L") }";
		UINT points = 0;
		UINT transferredPoints = 0;
		UINT lastSeasonPoints = 0;
		UINT receivedReward = 0;
		UINT topPlayer = 0;
		CDBConn db;
		db.Bind(&points);
		db.Bind(&lastSeasonPoints);
		db.Bind(&transferredPoints);
		db.Bind(&topPlayer);
		db.Bind(&receivedReward);
		wstring cmd = str.str();
		db.PrepareStatement(cmd.c_str());
		if( db.ExecutePrepared(cmd.c_str()) )
		{
			db.Fetch();
		}
		pSocket->Send("chdddddd", 0x1E, CO_REPLY_LOAD_PVP_DATA, charId, points, lastSeasonPoints, transferredPoints, topPlayer, receivedReward);
	}
	return false;
}

bool CPacketHandler::RequestLoadVotePoints(CSocket *pSocket, const unsigned char* packet)
{
	UINT charId = 0, accountId = 0;
	Disassemble(packet, "dd", &charId, &accountId);
	
	if(charId > 0 && accountId > 0)
	{
		wstringstream str;
		str << L"{ Call dbo.lin_LoadVotePoints (" << accountId << L") }";
		UINT points = 0;
		CDBConn db;
		db.Bind(&points);
		wstring cmd = str.str();
		db.PrepareStatement(cmd.c_str());
		if( db.ExecutePrepared(cmd.c_str()) )
		{
			db.Fetch();
		}

		pSocket->Send("chdd", 0x1E, CO_REPLY_LOAD_VOTE_POINTS, charId, points);
	}
	return false;
}

bool CPacketHandler::RequestSaveDonatePoints(CSocket *pSocket, const unsigned char* packet)
{
	UINT accountId = 0, points = 0;
	Disassemble(packet, "dd", &accountId, &points);
	if(accountId)
	{
		wstringstream str;
		str << L"{ Call dbo.lin_SaveDonatePoints (" << accountId << L", " << points << L") }";
		CDBConn db;
		wstring cmd = str.str();
		db.PrepareStatement(cmd.c_str());
		db.ExecutePrepared(cmd.c_str());
		g_Logger.Add(L"Saving donate points[%d] for accountId[%d]", points, accountId);
	}
	return false;
}

bool CPacketHandler::RequestSavePvPPoints(CSocket *pSocket, const unsigned char* packet)
{
	UINT charId = 0, points = 0;
	Disassemble(packet, "dd", &charId, &points);
	if(charId)
	{
		wstringstream str;
		str << L"{ Call dbo.lin_SavePvPPoints (" << charId << L", " << points << L") }";
		CDBConn db;
		wstring cmd = str.str();
		db.PrepareStatement(cmd.c_str());
		db.ExecutePrepared(cmd.c_str());
		g_Logger.Add(L"Saving pvp points[%d] for char_id[%d]", points, charId);
	}
	return false;
}

bool CPacketHandler::RequestSaveVotePoints(CSocket *pSocket, const unsigned char* packet)
{
	UINT accountId = 0, points = 0;
	Disassemble(packet, "dd", &accountId, &points);
	if(accountId)
	{
		wstringstream str;
		str << L"{ Call dbo.lin_SaveVotePoints (" << accountId << L", " << points << L") }";
		CDBConn db;
		wstring cmd = str.str();
		db.PrepareStatement(cmd.c_str());
		db.ExecutePrepared(cmd.c_str());
		g_Logger.Add(L"Saving vote points[%d] for account_id[%d]", points, accountId);
	}
	return false;
}

bool CPacketHandler::RequestLoadSchemeBuffList(CSocket *pSocket, const unsigned char* packet)
{
	UINT charId = 0, subjobId = 0;
	Disassemble(packet, "dd", &charId, &subjobId);

	UINT count = 0;
	UINT data[40];
	memset(data, 0, sizeof(data));

	//User
	wstringstream strUser;
	strUser << L"{Call dbo.lin_LoadSchemeBufferList (" << charId << L", " << subjobId << L", " << (INT)0 << L")}";

	CDBConn db;
	for(int n=0;n<40;n++)
	{
		db.Bind(&data[n]);
	}

	wstring cmd = strUser.str();
	db.PrepareStatement(cmd.c_str());
	if( db.ExecutePrepared(cmd.c_str()) )
	{
		db.Fetch();
	}

	char buff[8192];
	int len = 0;
	for(int n=0;n<40;n++)
	{
		if(data[n] > 0)
		{
			len += Assemble(&buff[len], (8192 - len), "d", data[n]);
			count++;
		}
	}
	if(count > 0)
	{
		pSocket->Send("chddddb", 0x1E, CO_REPLY_LOAD_BUFF_LIST, charId, subjobId, 0, count, len, buff);
	}

	//Summon
	count = 0;
	len = 0;
	memset(data, 0, sizeof(data));
	wstringstream strSummon;
	strSummon << L"{Call dbo.lin_LoadSchemeBufferList (" << charId << L", " << subjobId << L", " << (INT)1 << L")}";

	db.ResetParam();
	for(int n=0;n<40;n++)
	{
		db.Bind(&data[n]);
	}

	cmd = strSummon.str();
	db.PrepareStatement(cmd.c_str());
	if( db.ExecutePrepared(cmd.c_str()) )
	{
		db.Fetch();
	}

	for(int n=0;n<40;n++)
	{
		if(data[n] > 0)
		{
			len += Assemble(&buff[len], (8192 - len), "d", data[n]);
			count++;
		}
	}
	if(count > 0)
	{
		pSocket->Send("chddddb", 0x1E, CO_REPLY_LOAD_BUFF_LIST, charId, subjobId, 1, count, len, buff);
	}
	
	return false;
}

bool CPacketHandler::RequestSaveSchemeBuffList(CSocket *pSocket, const unsigned char* packet)
{
	UINT charId = 0, subjobId = 0, summon = 0, count = 0;
	packet = Disassemble(packet, "dddd", &charId, &subjobId, &summon, &count);

	if(count > 0 && count <= 40 && charId > 0)
	{
		UINT data[40];
		memset(data, 0, sizeof(data));
		for(UINT n = 0; n < count; n++)
		{
			packet = Disassemble(packet, "d", &data[n]);
		}

		wstringstream str;
		str << L"{ Call dbo.lin_HaveSchemeBufferList (" << charId << L", " << subjobId << L", " << summon << L") }";
		BOOL exist = FALSE;

		CDBConn db;
		db.Bind(&exist);
		wstring cmd = str.str();
		db.PrepareStatement(cmd.c_str());
		if( db.ExecutePrepared(cmd.c_str()) )
		{
			db.Fetch();
		}

		if(exist)
		{
			wstringstream updateStr;
			updateStr << L"{Call dbo.lin_UpdateSchemeBufferList (" << charId << L", " << subjobId << L", " << summon << L", ";

			for(int n=0;n<40;n++)
			{
				if(n == 39)
				{
					updateStr << data[n] << L") }";
				}else
				{
					updateStr << data[n] << L", ";
				}
			}

			db.ResetParam();
			cmd = updateStr.str();
			db.PrepareStatement(cmd.c_str());
			db.ExecutePrepared(cmd.c_str());
		}else
		{
			wstringstream createStr;
			createStr << L"{ Call dbo.lin_CreateSchemeBufferList (" << charId << L", " << subjobId << L", " << summon << L", ";

			for(int n=0;n<40;n++)
			{
				if(n == 39)
				{
					createStr << data[n] << L") }";
				}else
				{
					createStr << data[n] << L", ";
				}
			}

			db.ResetParam();
			cmd = createStr.str();
			db.PrepareStatement(cmd.c_str());
			db.ExecutePrepared(cmd.c_str());
		}

	}
	return false;
}

bool CPacketHandler::TestPacket(CSocket *pSocket, const unsigned char* packet)
{
	DWORD value = 0;
	Disassemble(packet, "d", &value);

	g_Log.Add(CLog::Blue, L"[%s]ー called with value[%d]!", __FUNCTIONW__, value);

	pSocket->Send("chd", 0x1E, CO_TEST, value);
	return false;
}