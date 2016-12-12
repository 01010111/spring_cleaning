package;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.group.FlxSpriteGroup;
import flixel.math.FlxPoint;
import flixel.math.FlxRandom;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;
import zerolib.ZMath;

/**
 * ...
 * @author ...
 */
class WiggleText extends FlxTypedGroup<WiggleLetter>
{
	
	var random_color:Bool;
	var text_colors:Array<Int> = [
		0xffff004d,
		0xffffa300,
		0xfffff024,
		0xff00e756,
		0xff29adff,
		0xff83769c,
		0xffff77a8,
		0xffffccaa
	];
	
	public function new() 
	{
		super();
		for (i in 0...128)
			add(new WiggleLetter());
	}
	
	public function write_left(_text:String, _p:FlxPoint, _from_bottom:Bool = false, _timer:Int = 5):Void
	{
		for (l in members)
			l.kill();
		
		var _phase:Float = 0;
		for (i in 0..._text.length)
		{
			if (getFirstAvailable() != null)
				getFirstAvailable().place_letter(_text.charAt(i), FlxPoint.get(_p.x + 8 * i, _p.y), _phase, _from_bottom, _timer);
			_phase += 0.2;
		}
	}
	
	public function write_center(_text:String, _p:FlxPoint, _from_bottom:Bool = false, _timer:Int = 5):Void
	{
		for (l in members)
			l.kill();
		
		var _ta = _text.split("\n");
		var _phase:Float = 0;
		
		for (n in 0..._ta.length)
		{
			var _px = _p.x - (ZMath.clamp(_ta[n].length, 0 , 20) * 0.5 * 8);
			
			for (i in 0..._ta[n].length)
			{
				if (getFirstAvailable() != null)
					getFirstAvailable().place_letter(_ta[n].charAt(i), FlxPoint.get(_px + 8 * i, _p.y + n * 8 - ((_ta.length - 1) * 8 * 0.5)), _phase, _from_bottom, _timer);
				_phase += 0.2;
			}
		}
		
	}
	
	var counter:Int = 0;
	var timer:Int = 6;
	
	override public function update(elapsed:Float):Void 
	{
		if (random_color && counter % timer == 0)
		{
			var r = text_colors[ZMath.randomRangeInt(0,7)];
			for (l in members)
				l.change_color(r);
		}
		counter++;
		super.update(elapsed);
	}
	
	public function set_color(_color:Int, _random:Bool = false):Void
	{
		if (_random)
			random_color = true;
		else
			for (l in members)
				l.color = _color;
	}
	
}

class WiggleLetter extends FlxSprite
{
	
	var alphabet = "0123456789!?`@%&'()*+,-./:<_ABCDEFGHIJKLMNOPQRSTUVWXYZ $x";
	
	public function new()
	{
		super();
		loadGraphic("assets/images/alphabet.png", true, 8, 8);
		exists = false;
	}
	
	public function place_letter(_f:String, _p:FlxPoint, _phase:Float, _from_bottom:Bool, _timer:Int):Void
	{
		animation.frameIndex = 0;
		while (_f != alphabet.charAt(animation.frameIndex) && animation.frameIndex < 57)
			animation.frameIndex++;
		setPosition(_p.x, _p.y);
		exists = true;
		offset.y = -2;
		scale.set();
		new FlxTimer().start(_phase * 0.25).onComplete = function(t:FlxTimer):Void
		{
			if (_f != " ")
			{
				if (Math.random() > 0.4) 
					FlxG.sound.play("talk" + ZMath.randomRangeInt(0, 9), ZMath.randomRange(0.3, 0.4));
			}
			FlxTween.tween(scale, {x:1, y:1}, 0.5, {ease:FlxEase.backOut});
			if (_from_bottom)
			{
				y += FlxG.height;
				alpha = 0;
				FlxTween.tween(this, {y:y - FlxG.height, alpha:1}, 1, {ease:FlxEase.backOut});
				new FlxTimer().start(_timer).onComplete = function(t:FlxTimer):Void
				{
					FlxTween.tween(this, {y:y - FlxG.height, alpha:0}, 1, {ease:FlxEase.backIn}).onComplete = function(t:FlxTween):Void
					{
						kill();
					}
				}
			}
		}
		var t = FlxTween.tween(offset, {y:offset.y + 4}, 0.5, {type:FlxTween.PINGPONG, ease:FlxEase.sineInOut});
		t.percent = 1 - _phase;
	}
	
	public function change_color(_color:Int):Void
	{
		color = _color;
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
	}
	
}