package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.math.FlxPoint;
import flixel.system.FlxSound;
import flixel.text.FlxText;
import flixel.tile.FlxTilemap;
import flixel.tweens.FlxTween;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;
import flixel.util.FlxSpriteUtil;
import flixel.util.FlxTimer;
import openfl.display.BlendMode;
import zerolib.ZBitmapText;
import zerolib.ZMath;

class PlayState extends FlxState
{
	
	var map:Array<Array<Int>> = [
		[1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
		[1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
		[1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
		[1, 1, 0, 0, 0, 1, 1, 1, 1, 1],
		[1, 1, 0, 0, 0, 0, 0, 0, 1, 1],
		[1, 1, 0, 0, 0, 0, 0, 0, 1, 1],
		[1, 1, 1, 0, 0, 1, 1, 1, 1, 1],
		[1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
		[1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
	];
	var level:FlxTilemap;
	var trash_text:ZBitmapText;
	var day_text:ZBitmapText;
	var fade_sprite:FlxSprite;
	
	public var roomba:Roomba;
	public var poofs:Poofs;
	public var trash:FlxTypedGroup<Trash>;
	
	public static var i:PlayState;
	
	override public function create():Void
	{
		super.create();
		
		if (Reg.day == 0)
		{
			FlxG.sound.playMusic("woop", 0.8);
		}
		
		i = this;
		
		Reg.day++;
		
		add(new FlxSprite(0, 0, "assets/images/back.png"));
		
		level = new FlxTilemap();
		level.loadMapFrom2DArray(map, "assets/images/back.png", 16, 16, null, 0, 2);
		add(level);
		
		trash = new FlxTypedGroup();
		
		if (Reg.day == 27)
		{
			for (i in 0...31)
			{
				var t = new Trash(FlxPoint.get(), ZMath.randomRangeInt(0, 8));
				while (level.overlaps(t))
					t.setPosition(Math.random() * 160, Math.random() * 144);
				trash.add(t);
			}
		}
		else
		{
			for (i in 0...32)
			{
				var t = new Trash(FlxPoint.get(), ZMath.randomRangeInt(0, 8));
				while (level.overlaps(t))
					t.setPosition(Math.random() * 160, Math.random() * 144);
				trash.add(t);
			}
		}
		add(trash);
		
		roomba = new Roomba();
		add(roomba);
		
		poofs = new Poofs();
		add(poofs);
		
		add(new FlxSprite(0, 0, "assets/images/front.png"));
		
		if (Reg.day == 9)
		{
			var s = new FlxSprite();
			s.makeGraphic(FlxG.width, FlxG.height, 0xa01d2b53);
			s.blend = BlendMode.MULTIPLY;
			add(s);
		}
		
		if (Reg.day == 11)
		{
			var s = new FlxSprite();
			s.makeGraphic(FlxG.width, FlxG.height, 0xa01d2b53);
			s.blend = BlendMode.MULTIPLY;
			add(s);
			FlxSpriteUtil.flicker(s, 0, 0.5);
		}
		
		trash_text = new ZBitmapText(31, 120, "0123456789!?`@%&'()*+,-./:<_ABCDEFGHIJKLMNOPQRSTUVWXYZ #", FlxPoint.get(8, 8), "assets/images/alphabet.png");
		trash_text.color = 0xffff004d;
		add(trash_text);
		
		day_text = new ZBitmapText(31, 20, "0123456789!?`@%&'()*+,-./:<_ABCDEFGHIJKLMNOPQRSTUVWXYZ #", FlxPoint.get(8, 8), "assets/images/alphabet.png");
		day_text.color = 0xffffccaa;
		day_text.text = "DAY " + Reg.day;
		add(day_text);
		
		fade_sprite = new FlxSprite();
		fade_sprite.makeGraphic(FlxG.width, FlxG.height, 0xff000000);
		fade_sprite.alpha = 0;
		add(fade_sprite);
		
		openSubState(new FadeIn());
		
		FlxG.watch.add(Reg, "counter", "ms:");
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		
		trash_text.text = "TRASH: " + roomba.trash + "/32";
		Reg.counter++;
		
		FlxG.collide(level, roomba);
		FlxG.collide(level, trash);
		FlxG.overlap(roomba, trash, kill_trash);
	}
	
	public function add_wiggle_text(_s:String, _t:Int = 15):Void
	{
		var w = new WiggleText();
		w.write_center(_s, FlxPoint.get(FlxG.width * 0.5, FlxG.height * 0.5), true, _t);
		w.set_color(0, true);
		add(w);
	}
	
	function kill_trash(_r:Roomba, _t:Trash):Void
	{
		FlxG.sound.play("suck" + ZMath.randomRangeInt(0, 9), ZMath.randomRange(0.1, 0.2));
		_t.kill();
		_r.trash++;
		
		if (Reg.day == 27 && _r.trash == 31)
		{
			new FlxTimer().start(5).onComplete = function(t:FlxTimer):Void
			{
				add_wiggle_text("WHAT'S WRONG???", 5);
				new FlxTimer().start(10).onComplete = function(t:FlxTimer):Void
				{
					var t = new Trash(FlxPoint.get(124, 72), ZMath.randomRangeInt(0, 8));
					t.velocity.x = -50;
					trash.add(t);
				}
			}
		}
		
		if (_r.trash >= 32)
			Reg.day == 28 ? add_wiggle_text("YOU'VE BEEN PLAYING\nFOR " + Reg.get_minutes() + " MINUTES") : add_wiggle_text(Reg.vic_text[Reg.day - 1]);
	}
	
	var is_gone:Bool = false;
	
	public function go_to_next_day():Void
	{
		if (!is_gone)
		{
			is_gone = true;
			FlxTween.tween(fade_sprite, {alpha:1}, 2.5).onComplete = function(t:FlxTween):Void
			{
				FlxG.camera.fade(0xff000000, 0.5, false, function():Void
				{
					FlxG.switchState(new PlayState());
				});
			}
		}
	}
	
}

class Reg
{
	
	public static var day:Int = 0;
	public static var counter:Int = 0;
	
	public static var vic_text:Array<String> = [
	//	"01234567890123456789",
		"GOOD JOB #",
		"WHAT A FUN DAY",
		"WOO! YOU'RE GREAT! #",
		"# SPICK AND SPAN #",
		"RETURN TO BASE!",
		"",
		"OOPS I FORGOT\nYESTERDAY'S TEXT",
		"YOU SURE ARE A\nDEDICATED ROBOT!",
		"OOO IT'S SPOOKY\nIN HERE!",
		"LIGHTS ON TODAY!",
		"# DISCO PARTY #",
		"# WORK IS FUN #",
		"HOW ARE YOU TODAY?",
		"SOMETIMES I FEEL\nLIKE YOU JUST DON'T\nLISTEN TO WHAT I AM\nSAYING ANYMORE...",
		"YOU JUST DO\nYOUR LITTLE CLEAN\nUP JOB AND PRETEND\nLIKE I DON'T EXIST.",
		"I'M A REAL PERSON\nWITH REAL FEELINGS\nYOU KNOW...",
		"SORRY, IT'S NOT YOU.",
		"I JUST HAD A ROUGH\nDAY TODAY.",
		"CAN YOU BELIEVE\nTHOSE IDIOTS VOTED\nTHAT WAY???",
		"I MEAN TRUMP I CAN\nUNDERSTAND...",
		"BUT `ONE ROOM`???",
		"IS THIS FUN TO YOU???",
		"`ENTIRE GAME ON ONE\nSCREEN` WAS KIND OF\nBAD BUT THIS IS YECH",
		"NAH, LUDUM DARE IS\nREALLY COOL.",
		"I'M JUST BAD AT\nWORKING WITH A\nTHEME I GUESS.",
		"YOU'RE STILL AT IT?",
		"I'M JUST MESSING\nWITH YOU #",
		"BUSH DID 9/11",
		"THAT'S IN REAL TIME.",
		"IN-GAME YOU'VE BEEN\nPLAYING FOR OVER\nA MONTH!",
		"THERE ARE A TON OF\nOTHER GAMES TO PLAY",
		"I BET MANAGORE\nMADE SOMETHING COOL!",
		"I'VE RUN OUT OF\nTHINGS TO SAY",
		"",
		"",
		"",
		"",
		"WELL WELL WELL...",
		"YOU'RE EITHER VERY\nVERY DEDICATED...",
		"OR VERY VERY CRAZY.",
		"EITHER WAY,\nFOLLOW ME ON TWITTER\n$x01010111",
		"",
		"",
		"",
		"",
		"ARE YOU HOPING FOR\nA BIG PAYOFF?",
		"",
		"",
		"",
		"",
		"...",
		"",
		"",
		"",
		"",
		"",
		"",
		"",
		"",
		"",
		"",
		"",
		"",
		"",
		"",
		"",
		"",
		"",
		"*420 BLAZE IT*\nBUSH DID 9/11\nVAPE NAISH YALL"
	];
	
	public static function get_minutes():Int
	{
		return Math.round(counter / 3600);
	}
	
}