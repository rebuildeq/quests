# items: 84091, 84092, 84093, 84083
sub EVENT_SPAWN {
	quest::settimer(2,600);
}

sub EVENT_SAY {
	if ($text=~/trick or treat/i) {
		quest::say("Well, it's not ale but you'll just have to deal with that. . .By the by did you happen to bring any ale with you?");
		quest::summonitem(quest::ChooseRandom(84091,84092,84093,84083,84083,84083,84083,84083,84083)); # Item(s): Sand (84091), Chunk of Coal (84092), Pocket Lint (84093), Fairy Fizzles (84083), Fairy Fizzles (84083), Fairy Fizzles (84083), Fairy Fizzles (84083), Fairy Fizzles (84083), Fairy Fizzles (84083)
                quest::updatetaskactivity(500220,6);
	}
}

sub EVENT_TIMER {

	if ($timer == 2) {
		quest::shout("Trick or treat! Smell my feet! Give me something good to eat!");
	}
}
