package;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxSubState;
import flixel.math.FlxPoint;
import flixel.tweens.FlxTween;
import flixel.util.FlxTimer;
import PlayState.Reg;

/**
 * ...
 * @author ...
 */
class FadeIn extends FlxSubState
{

	public function new() 
	{
		super();
		
		for (x in 0...10)
		{
			for (y in 0...9)
			{
				var s = new FlxSprite(x * 16, y * 16);
				s.makeGraphic(16, 16, 0xff000000);
				if (Reg.day <= Reg.vic_text.length)
				{
					new FlxTimer().start((x + y) * 0.1).onComplete = function(t:FlxTimer):Void
					{
						FlxTween.tween(s.scale, {x:0, y:0}, 0.2);
						FlxTween.tween(s, {angle:180}, 0.2);
					}
				}
				add(s);
			}
		}
		
		if (Reg.day <= Reg.vic_text.length)
		{
			new FlxTimer().start(20 * 0.1).onComplete = function(t:FlxTimer):Void
			{
				Reg.counter += 120;
				close();
			}
		}
		
		else
		{
			var w = new WiggleText();
			w.write_center("SORRY BYE #", FlxPoint.get(FlxG.width * 0.5, FlxG.height * 0.5), true, 10);
			add(w);
		}
	}
	
}