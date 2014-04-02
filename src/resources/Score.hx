package resources;

import com.haxepunk.HXP;

class Score
{

	

	public static function resetScore()
	{
		POINTS = 0;
		death = false; 
	}

	public static function addKill()
	{
		//HXP.console.log(["called score" + POINTS]);
		POINTS+=500;
	}

	public function returnScore():Int
	{
		return POINTS;
	}

	
	public function diee ()
	{
		death = true;
	}

	public function live()
	{      
	       death = false;
	}

	static public var POINTS:Int;
	static public var death:Bool;
}
