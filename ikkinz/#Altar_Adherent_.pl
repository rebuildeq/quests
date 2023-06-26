#Altar_Adherent (294637)
sub EVENT_SPAWN {
  if(!defined($qglobals{$instanceid.adhere2})) {
    $adhere = int(rand(4)) + 1;
    quest::setglobal($instanceid.adhere2,$adhere,3,"H6");
  }
  else {
    $adhere = $qglobals{$instanceid.adhere2};
  }
}

sub EVENT_DEATH_COMPLETE {
  if ($status >= 80 ) {
	quest::ze(0,"The adherent's debris litters the ground. It has been beaten.");
    }
  elsif((($class eq "Bard") || ($class eq "Beastlord") || ($class eq "Paladin") || ($class eq "Ranger") || ($class eq "Shadowknight")) && ($qglobals{$instanceid.adhere2} == 2)) {
	quest::ze(0,"The adherent's debris litters the ground. It has been beaten.");
  }
  elsif((($class eq "Berserker") || ($class eq "Monk") || ($class eq "Rogue") || ($class eq "Warrior")) && ($qglobals{$instanceid.adhere2} == 3)) {
	quest::ze(0,"The adherent's debris litters the ground. It has been beaten.");
  }
  elsif((($class eq "Cleric") || ($class eq "Druid") || ($class eq "Shaman")) && ($qglobals{$instanceid.adhere2} == 4)) {
	quest::ze(0,"The adherent's debris litters the ground. It has been beaten.");
  }
  elsif((($class eq "Enchanter") || ($class eq "Magician") || ($class eq "Necromancer") || ($class eq "Wizard")) && ($qglobals{$instanceid.adhere2} == 1)) {
	quest::ze(0,"The adherent's debris litters the ground. It has been beaten.");
  }
  else {
    quest::spawn2(294637 ,0,0,$x,$y,$z,$h); # NPC: #Altar_Adherent_
	quest::ze(0,"Your energy didn't match that required to kill the stone worker.");
    if($adhere == 1) {
      quest::ze(0,"The creature will perish under the strength of intelligent magic");
    }
    if($adhere == 2) {
      quest::ze(0,"The creature appears weak to the combined effort of might and magic!");
    }
    if($adhere == 3) {
      quest::ze(0,"The creature appears weak to the combined effort of strength and cunning!");
    }
    if($adhere == 4) {
      quest::ze(0,"The creature cannot stand up to the power of healers");
    }
	quest::ze(0,"It reforms instantly!");
  }
}
