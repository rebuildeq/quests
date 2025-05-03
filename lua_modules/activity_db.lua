local activity_db = {}

activity_db.Records = {
	[Zone.freporte] = {
		{
			ActivityName = "ChopTreesForBarkeep",
			Announcement = "Would anyone be willing to assist in cutting down [trees]?",
			Hail = "Hail stranger",
			Keyword = "trees",
			Request = "Here is what you need to do",
			QuestType = 0,
			QuestItemID = 12345,
			ObjectiveModelType = 0,
			ObjectiveModel = "stu",
			ObjectiveLocations = {
				{ X = 100, Y = 200, Z = 300, },
				{ X = 400, Y = 500, Z = 600, },
			},
			Result = "Thanks for doing the activity",
			RewardTier = 1,
		},
		{
			ActivityName = "test2",
			Announcement = "I need more [cowbell]",
			Keyword = "cowbell",
		},
	},

}

return activity_db