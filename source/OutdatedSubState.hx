package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxSubState;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import lime.app.Application;

class OutdatedSubState extends MusicBeatState
{
	public static var leftState:Bool = false;

	override function create()
	{
		super.create();
		var bg:FlxSprite = new FlxSprite().makeGraphic(FlxG.width, FlxG.height, FlxColor.BLACK);
		add(bg);
		var ver = "v" + Application.current.meta.get('version');
		var txt:FlxText = new FlxText(0, 0, FlxG.width,
			"WARNING!!! \n\n\n\nYou are using a early version of ProjectFNF!! \n Some Features might not work as they should, And crashes will happen. \n Press Enter to go to the Latest Stable Release,\n or press ESC to continue.\n Port by GaboWuz\n GaboWuz: Hiiiii",
			32);
		txt.setFormat("VCR OSD Mono", 32, FlxColor.WHITE, CENTER);
		txt.screenCenter();
		add(txt);
	}

	override function update(elapsed:Float)
	{
		#if mobile
        var jusTouched:Bool = false;

        for (touch in FlxG.touches.list)
          if (touch.justPressed)
            jusTouched = true;
        #end
	
		if (controls.ACCEPT #if android || FlxG.android.justReleased.BACK #end)
		{
			FlxG.openURL("https://github.com/aflacc/ProjectFNF/releases/tag/v0.4-a");
		}
		if (controls.BACK #if mobile || jusTouched #end)
		{
			leftState = true;
			FlxG.switchState(new MainMenuState());
		}
		super.update(elapsed);
	}
}
