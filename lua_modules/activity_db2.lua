local activity_db = {}

activity_db.Records = {
	[Zone.freporte] = {
		{
			Announcement = "Activity 1 [start]",
			Hail = "Activity 1 Hail Message [start]",
			Keyword = "start",
			Request = "Insert activity directions on how to do activity",
			QuestType = 0, -- 0 = click quest
			QuestItemID = 12345,
			ObjectiveModelType = 0, -- 0 = #race, 1 = weapontype?
			ObjectiveModel = "stu",
			ObjectiveLocations = { { X = 100, Y = 200, Z = 300, Heading = 0, }, },
			Result = "Thank you for doing activity, here is your reward",
			RewardTier = 1,
		},
	},
}

return activity_db
