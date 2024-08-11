if SERVER then
	AddCSLuaFile()

	resource.AddFile("materials/vgui/ttt/dynamic/roles/icon_hooper.vmt")
end

function ROLE:PreInitialize()
	self.color = Color(67, 64, 138, 255)

	self.abbr = "hoop"
	self.score.killsMultiplier = 8
	self.score.teamKillsMultiplier = -8
	self.score.bodyFoundMuliplier = 3
	self.unknownTeam = true

	self.defaultTeam = TEAM_INNOCENT
	self.defaultEquipment = SPECIAL_EQUIPMENT

	self.isPublicRole = true
	self.isPolicingRole = true

	self.conVarData = {
		pct = 0.13,
		maximum = 1,
		minPlayers = 5,
		minKarma = 600,
		credits = 2,
		creditsAwardDeadEnable = 1,
		creditsAwardKillEnable = 0,
		togglable = true,
		random = 25,
		shopFallback = SHOP_FALLBACK_DETECTIVE
	}
end

function ROLE:Initialize()
	roles.SetBaseRole(self, ROLE_DETECTIVE)
end

if SERVER then
	-- Give Loadout on respawn and rolechange
	function ROLE:GiveRoleLoadout(ply, isRoleChange)
		ply:GiveEquipmentWeapon("ttt2_hoop_pass")
		ply:GiveEquipmentItem("item_ttt_armor")
		ply:GiveEquipmentItem("item_ttt_nofalldmg")
	end

	-- Remove Loadout on death and rolechange
	function ROLE:RemoveRoleLoadout(ply, isRoleChange)
		ply:StripWeapon("ttt2_hoop_pass")
		ply:RemoveEquipmentItem("item_ttt_armor")
		ply:RemoveEquipmentItem("item_ttt_nofalldmg")
	end
end