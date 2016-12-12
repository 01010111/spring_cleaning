package;


import haxe.Timer;
import haxe.Unserializer;
import lime.app.Future;
import lime.app.Preloader;
import lime.app.Promise;
import lime.audio.AudioSource;
import lime.audio.openal.AL;
import lime.audio.AudioBuffer;
import lime.graphics.Image;
import lime.net.HTTPRequest;
import lime.system.CFFI;
import lime.text.Font;
import lime.utils.Bytes;
import lime.utils.UInt8Array;
import lime.Assets;

#if sys
import sys.FileSystem;
#end

#if flash
import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.Loader;
import flash.events.Event;
import flash.events.IOErrorEvent;
import flash.events.ProgressEvent;
import flash.media.Sound;
import flash.net.URLLoader;
import flash.net.URLRequest;
#end


class DefaultAssetLibrary extends AssetLibrary {
	
	
	public var className (default, null) = new Map <String, Dynamic> ();
	public var path (default, null) = new Map <String, String> ();
	public var type (default, null) = new Map <String, AssetType> ();
	
	private var lastModified:Float;
	private var timer:Timer;
	
	
	public function new () {
		
		super ();
		
		#if (openfl && !flash)
		
		
		
		
		
		
		
		
		
		
		
		
		openfl.text.Font.registerFont (__ASSET__OPENFL__flixel_fonts_nokiafc22_ttf);
		openfl.text.Font.registerFont (__ASSET__OPENFL__flixel_fonts_monsterrat_ttf);
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		#end
		
		#if flash
		
		className.set ("assets/images/alphabet.ase", __ASSET__assets_images_alphabet_ase);
		type.set ("assets/images/alphabet.ase", AssetType.BINARY);
		className.set ("assets/images/alphabet.png", __ASSET__assets_images_alphabet_png);
		type.set ("assets/images/alphabet.png", AssetType.IMAGE);
		className.set ("assets/images/back.ase", __ASSET__assets_images_back_ase);
		type.set ("assets/images/back.ase", AssetType.BINARY);
		className.set ("assets/images/back.png", __ASSET__assets_images_back_png);
		type.set ("assets/images/back.png", AssetType.IMAGE);
		className.set ("assets/images/front.png", __ASSET__assets_images_front_png);
		type.set ("assets/images/front.png", AssetType.IMAGE);
		className.set ("assets/images/images-go-here.txt", __ASSET__assets_images_images_go_here_txt);
		type.set ("assets/images/images-go-here.txt", AssetType.TEXT);
		className.set ("assets/images/poof.png", __ASSET__assets_images_poof_png);
		type.set ("assets/images/poof.png", AssetType.IMAGE);
		className.set ("assets/images/roomba.png", __ASSET__assets_images_roomba_png);
		type.set ("assets/images/roomba.png", AssetType.IMAGE);
		className.set ("assets/images/trash.png", __ASSET__assets_images_trash_png);
		type.set ("assets/images/trash.png", AssetType.IMAGE);
		className.set ("flixel/sounds/beep.mp3", __ASSET__flixel_sounds_beep_mp3);
		type.set ("flixel/sounds/beep.mp3", AssetType.MUSIC);
		className.set ("flixel/sounds/flixel.mp3", __ASSET__flixel_sounds_flixel_mp3);
		type.set ("flixel/sounds/flixel.mp3", AssetType.MUSIC);
		className.set ("flixel/fonts/nokiafc22.ttf", __ASSET__flixel_fonts_nokiafc22_ttf);
		type.set ("flixel/fonts/nokiafc22.ttf", AssetType.FONT);
		className.set ("flixel/fonts/monsterrat.ttf", __ASSET__flixel_fonts_monsterrat_ttf);
		type.set ("flixel/fonts/monsterrat.ttf", AssetType.FONT);
		className.set ("flixel/images/ui/button.png", __ASSET__flixel_images_ui_button_png);
		type.set ("flixel/images/ui/button.png", AssetType.IMAGE);
		className.set ("flixel/images/logo/default.png", __ASSET__flixel_images_logo_default_png);
		type.set ("flixel/images/logo/default.png", AssetType.IMAGE);
		className.set ("woop", __ASSET__assets_music_mp3_woop_mp3);
		type.set ("woop", AssetType.SOUND);
		className.set ("squu0", __ASSET__assets_sounds_mp3_squu0_mp3);
		type.set ("squu0", AssetType.SOUND);
		className.set ("squu1", __ASSET__assets_sounds_mp3_squu1_mp3);
		type.set ("squu1", AssetType.SOUND);
		className.set ("squu2", __ASSET__assets_sounds_mp3_squu2_mp3);
		type.set ("squu2", AssetType.SOUND);
		className.set ("squu3", __ASSET__assets_sounds_mp3_squu3_mp3);
		type.set ("squu3", AssetType.SOUND);
		className.set ("squu4", __ASSET__assets_sounds_mp3_squu4_mp3);
		type.set ("squu4", AssetType.SOUND);
		className.set ("suck0", __ASSET__assets_sounds_mp3_suck0_mp3);
		type.set ("suck0", AssetType.SOUND);
		className.set ("suck1", __ASSET__assets_sounds_mp3_suck1_mp3);
		type.set ("suck1", AssetType.SOUND);
		className.set ("suck2", __ASSET__assets_sounds_mp3_suck2_mp3);
		type.set ("suck2", AssetType.SOUND);
		className.set ("suck3", __ASSET__assets_sounds_mp3_suck3_mp3);
		type.set ("suck3", AssetType.SOUND);
		className.set ("suck4", __ASSET__assets_sounds_mp3_suck4_mp3);
		type.set ("suck4", AssetType.SOUND);
		className.set ("suck5", __ASSET__assets_sounds_mp3_suck5_mp3);
		type.set ("suck5", AssetType.SOUND);
		className.set ("suck6", __ASSET__assets_sounds_mp3_suck6_mp3);
		type.set ("suck6", AssetType.SOUND);
		className.set ("suck7", __ASSET__assets_sounds_mp3_suck7_mp3);
		type.set ("suck7", AssetType.SOUND);
		className.set ("suck8", __ASSET__assets_sounds_mp3_suck8_mp3);
		type.set ("suck8", AssetType.SOUND);
		className.set ("suck9", __ASSET__assets_sounds_mp3_suck9_mp3);
		type.set ("suck9", AssetType.SOUND);
		className.set ("talk0", __ASSET__assets_sounds_mp3_talk0_mp3);
		type.set ("talk0", AssetType.SOUND);
		className.set ("talk1", __ASSET__assets_sounds_mp3_talk1_mp3);
		type.set ("talk1", AssetType.SOUND);
		className.set ("talk2", __ASSET__assets_sounds_mp3_talk2_mp3);
		type.set ("talk2", AssetType.SOUND);
		className.set ("talk3", __ASSET__assets_sounds_mp3_talk3_mp3);
		type.set ("talk3", AssetType.SOUND);
		className.set ("talk4", __ASSET__assets_sounds_mp3_talk4_mp3);
		type.set ("talk4", AssetType.SOUND);
		className.set ("talk5", __ASSET__assets_sounds_mp3_talk5_mp3);
		type.set ("talk5", AssetType.SOUND);
		className.set ("talk6", __ASSET__assets_sounds_mp3_talk6_mp3);
		type.set ("talk6", AssetType.SOUND);
		className.set ("talk7", __ASSET__assets_sounds_mp3_talk7_mp3);
		type.set ("talk7", AssetType.SOUND);
		className.set ("talk8", __ASSET__assets_sounds_mp3_talk8_mp3);
		type.set ("talk8", AssetType.SOUND);
		className.set ("talk9", __ASSET__assets_sounds_mp3_talk9_mp3);
		type.set ("talk9", AssetType.SOUND);
		
		
		#elseif html5
		
		var id;
		id = "assets/images/alphabet.ase";
		path.set (id, id);
		
		type.set (id, AssetType.BINARY);
		id = "assets/images/alphabet.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/back.ase";
		path.set (id, id);
		
		type.set (id, AssetType.BINARY);
		id = "assets/images/back.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/front.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/images-go-here.txt";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/images/poof.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/roomba.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/trash.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "flixel/sounds/beep.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "flixel/sounds/flixel.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "flixel/fonts/nokiafc22.ttf";
		className.set (id, __ASSET__flixel_fonts_nokiafc22_ttf);
		
		type.set (id, AssetType.FONT);
		id = "flixel/fonts/monsterrat.ttf";
		className.set (id, __ASSET__flixel_fonts_monsterrat_ttf);
		
		type.set (id, AssetType.FONT);
		id = "flixel/images/ui/button.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "flixel/images/logo/default.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "woop";
		path.set (id, "assets/music/mp3/woop.mp3");
		
		type.set (id, AssetType.SOUND);
		id = "squu0";
		path.set (id, "assets/sounds/mp3/squu0.mp3");
		
		type.set (id, AssetType.SOUND);
		id = "squu1";
		path.set (id, "assets/sounds/mp3/squu1.mp3");
		
		type.set (id, AssetType.SOUND);
		id = "squu2";
		path.set (id, "assets/sounds/mp3/squu2.mp3");
		
		type.set (id, AssetType.SOUND);
		id = "squu3";
		path.set (id, "assets/sounds/mp3/squu3.mp3");
		
		type.set (id, AssetType.SOUND);
		id = "squu4";
		path.set (id, "assets/sounds/mp3/squu4.mp3");
		
		type.set (id, AssetType.SOUND);
		id = "suck0";
		path.set (id, "assets/sounds/mp3/suck0.mp3");
		
		type.set (id, AssetType.SOUND);
		id = "suck1";
		path.set (id, "assets/sounds/mp3/suck1.mp3");
		
		type.set (id, AssetType.SOUND);
		id = "suck2";
		path.set (id, "assets/sounds/mp3/suck2.mp3");
		
		type.set (id, AssetType.SOUND);
		id = "suck3";
		path.set (id, "assets/sounds/mp3/suck3.mp3");
		
		type.set (id, AssetType.SOUND);
		id = "suck4";
		path.set (id, "assets/sounds/mp3/suck4.mp3");
		
		type.set (id, AssetType.SOUND);
		id = "suck5";
		path.set (id, "assets/sounds/mp3/suck5.mp3");
		
		type.set (id, AssetType.SOUND);
		id = "suck6";
		path.set (id, "assets/sounds/mp3/suck6.mp3");
		
		type.set (id, AssetType.SOUND);
		id = "suck7";
		path.set (id, "assets/sounds/mp3/suck7.mp3");
		
		type.set (id, AssetType.SOUND);
		id = "suck8";
		path.set (id, "assets/sounds/mp3/suck8.mp3");
		
		type.set (id, AssetType.SOUND);
		id = "suck9";
		path.set (id, "assets/sounds/mp3/suck9.mp3");
		
		type.set (id, AssetType.SOUND);
		id = "talk0";
		path.set (id, "assets/sounds/mp3/talk0.mp3");
		
		type.set (id, AssetType.SOUND);
		id = "talk1";
		path.set (id, "assets/sounds/mp3/talk1.mp3");
		
		type.set (id, AssetType.SOUND);
		id = "talk2";
		path.set (id, "assets/sounds/mp3/talk2.mp3");
		
		type.set (id, AssetType.SOUND);
		id = "talk3";
		path.set (id, "assets/sounds/mp3/talk3.mp3");
		
		type.set (id, AssetType.SOUND);
		id = "talk4";
		path.set (id, "assets/sounds/mp3/talk4.mp3");
		
		type.set (id, AssetType.SOUND);
		id = "talk5";
		path.set (id, "assets/sounds/mp3/talk5.mp3");
		
		type.set (id, AssetType.SOUND);
		id = "talk6";
		path.set (id, "assets/sounds/mp3/talk6.mp3");
		
		type.set (id, AssetType.SOUND);
		id = "talk7";
		path.set (id, "assets/sounds/mp3/talk7.mp3");
		
		type.set (id, AssetType.SOUND);
		id = "talk8";
		path.set (id, "assets/sounds/mp3/talk8.mp3");
		
		type.set (id, AssetType.SOUND);
		id = "talk9";
		path.set (id, "assets/sounds/mp3/talk9.mp3");
		
		type.set (id, AssetType.SOUND);
		
		
		var assetsPrefix = null;
		if (ApplicationMain.config != null && Reflect.hasField (ApplicationMain.config, "assetsPrefix")) {
			assetsPrefix = ApplicationMain.config.assetsPrefix;
		}
		if (assetsPrefix != null) {
			for (k in path.keys()) {
				path.set(k, assetsPrefix + path[k]);
			}
		}
		
		#else
		
		#if (windows || mac || linux)
		
		var useManifest = false;
		
		className.set ("assets/images/alphabet.ase", __ASSET__assets_images_alphabet_ase);
		type.set ("assets/images/alphabet.ase", AssetType.BINARY);
		
		className.set ("assets/images/alphabet.png", __ASSET__assets_images_alphabet_png);
		type.set ("assets/images/alphabet.png", AssetType.IMAGE);
		
		className.set ("assets/images/back.ase", __ASSET__assets_images_back_ase);
		type.set ("assets/images/back.ase", AssetType.BINARY);
		
		className.set ("assets/images/back.png", __ASSET__assets_images_back_png);
		type.set ("assets/images/back.png", AssetType.IMAGE);
		
		className.set ("assets/images/front.png", __ASSET__assets_images_front_png);
		type.set ("assets/images/front.png", AssetType.IMAGE);
		
		className.set ("assets/images/images-go-here.txt", __ASSET__assets_images_images_go_here_txt);
		type.set ("assets/images/images-go-here.txt", AssetType.TEXT);
		
		className.set ("assets/images/poof.png", __ASSET__assets_images_poof_png);
		type.set ("assets/images/poof.png", AssetType.IMAGE);
		
		className.set ("assets/images/roomba.png", __ASSET__assets_images_roomba_png);
		type.set ("assets/images/roomba.png", AssetType.IMAGE);
		
		className.set ("assets/images/trash.png", __ASSET__assets_images_trash_png);
		type.set ("assets/images/trash.png", AssetType.IMAGE);
		
		className.set ("flixel/sounds/beep.mp3", __ASSET__flixel_sounds_beep_mp3);
		type.set ("flixel/sounds/beep.mp3", AssetType.MUSIC);
		
		className.set ("flixel/sounds/flixel.mp3", __ASSET__flixel_sounds_flixel_mp3);
		type.set ("flixel/sounds/flixel.mp3", AssetType.MUSIC);
		
		className.set ("flixel/fonts/nokiafc22.ttf", __ASSET__flixel_fonts_nokiafc22_ttf);
		type.set ("flixel/fonts/nokiafc22.ttf", AssetType.FONT);
		
		className.set ("flixel/fonts/monsterrat.ttf", __ASSET__flixel_fonts_monsterrat_ttf);
		type.set ("flixel/fonts/monsterrat.ttf", AssetType.FONT);
		
		className.set ("flixel/images/ui/button.png", __ASSET__flixel_images_ui_button_png);
		type.set ("flixel/images/ui/button.png", AssetType.IMAGE);
		
		className.set ("flixel/images/logo/default.png", __ASSET__flixel_images_logo_default_png);
		type.set ("flixel/images/logo/default.png", AssetType.IMAGE);
		
		className.set ("woop", __ASSET__assets_music_mp3_woop_mp3);
		type.set ("woop", AssetType.SOUND);
		
		className.set ("squu0", __ASSET__assets_sounds_mp3_squu0_mp3);
		type.set ("squu0", AssetType.SOUND);
		
		className.set ("squu1", __ASSET__assets_sounds_mp3_squu1_mp3);
		type.set ("squu1", AssetType.SOUND);
		
		className.set ("squu2", __ASSET__assets_sounds_mp3_squu2_mp3);
		type.set ("squu2", AssetType.SOUND);
		
		className.set ("squu3", __ASSET__assets_sounds_mp3_squu3_mp3);
		type.set ("squu3", AssetType.SOUND);
		
		className.set ("squu4", __ASSET__assets_sounds_mp3_squu4_mp3);
		type.set ("squu4", AssetType.SOUND);
		
		className.set ("suck0", __ASSET__assets_sounds_mp3_suck0_mp3);
		type.set ("suck0", AssetType.SOUND);
		
		className.set ("suck1", __ASSET__assets_sounds_mp3_suck1_mp3);
		type.set ("suck1", AssetType.SOUND);
		
		className.set ("suck2", __ASSET__assets_sounds_mp3_suck2_mp3);
		type.set ("suck2", AssetType.SOUND);
		
		className.set ("suck3", __ASSET__assets_sounds_mp3_suck3_mp3);
		type.set ("suck3", AssetType.SOUND);
		
		className.set ("suck4", __ASSET__assets_sounds_mp3_suck4_mp3);
		type.set ("suck4", AssetType.SOUND);
		
		className.set ("suck5", __ASSET__assets_sounds_mp3_suck5_mp3);
		type.set ("suck5", AssetType.SOUND);
		
		className.set ("suck6", __ASSET__assets_sounds_mp3_suck6_mp3);
		type.set ("suck6", AssetType.SOUND);
		
		className.set ("suck7", __ASSET__assets_sounds_mp3_suck7_mp3);
		type.set ("suck7", AssetType.SOUND);
		
		className.set ("suck8", __ASSET__assets_sounds_mp3_suck8_mp3);
		type.set ("suck8", AssetType.SOUND);
		
		className.set ("suck9", __ASSET__assets_sounds_mp3_suck9_mp3);
		type.set ("suck9", AssetType.SOUND);
		
		className.set ("talk0", __ASSET__assets_sounds_mp3_talk0_mp3);
		type.set ("talk0", AssetType.SOUND);
		
		className.set ("talk1", __ASSET__assets_sounds_mp3_talk1_mp3);
		type.set ("talk1", AssetType.SOUND);
		
		className.set ("talk2", __ASSET__assets_sounds_mp3_talk2_mp3);
		type.set ("talk2", AssetType.SOUND);
		
		className.set ("talk3", __ASSET__assets_sounds_mp3_talk3_mp3);
		type.set ("talk3", AssetType.SOUND);
		
		className.set ("talk4", __ASSET__assets_sounds_mp3_talk4_mp3);
		type.set ("talk4", AssetType.SOUND);
		
		className.set ("talk5", __ASSET__assets_sounds_mp3_talk5_mp3);
		type.set ("talk5", AssetType.SOUND);
		
		className.set ("talk6", __ASSET__assets_sounds_mp3_talk6_mp3);
		type.set ("talk6", AssetType.SOUND);
		
		className.set ("talk7", __ASSET__assets_sounds_mp3_talk7_mp3);
		type.set ("talk7", AssetType.SOUND);
		
		className.set ("talk8", __ASSET__assets_sounds_mp3_talk8_mp3);
		type.set ("talk8", AssetType.SOUND);
		
		className.set ("talk9", __ASSET__assets_sounds_mp3_talk9_mp3);
		type.set ("talk9", AssetType.SOUND);
		
		
		if (useManifest) {
			
			loadManifest ();
			
			if (Sys.args ().indexOf ("-livereload") > -1) {
				
				var path = FileSystem.fullPath ("manifest");
				lastModified = FileSystem.stat (path).mtime.getTime ();
				
				timer = new Timer (2000);
				timer.run = function () {
					
					var modified = FileSystem.stat (path).mtime.getTime ();
					
					if (modified > lastModified) {
						
						lastModified = modified;
						loadManifest ();
						
						onChange.dispatch ();
						
					}
					
				}
				
			}
			
		}
		
		#else
		
		loadManifest ();
		
		#end
		#end
		
	}
	
	
	public override function exists (id:String, type:String):Bool {
		
		var requestedType = type != null ? cast (type, AssetType) : null;
		var assetType = this.type.get (id);
		
		if (assetType != null) {
			
			if (assetType == requestedType || ((requestedType == SOUND || requestedType == MUSIC) && (assetType == MUSIC || assetType == SOUND))) {
				
				return true;
				
			}
			
			#if flash
			
			if (requestedType == BINARY && (assetType == BINARY || assetType == TEXT || assetType == IMAGE)) {
				
				return true;
				
			} else if (requestedType == TEXT && assetType == BINARY) {
				
				return true;
				
			} else if (requestedType == null || path.exists (id)) {
				
				return true;
				
			}
			
			#else
			
			if (requestedType == BINARY || requestedType == null || (assetType == BINARY && requestedType == TEXT)) {
				
				return true;
				
			}
			
			#end
			
		}
		
		return false;
		
	}
	
	
	public override function getAudioBuffer (id:String):AudioBuffer {
		
		#if flash
		
		var buffer = new AudioBuffer ();
		buffer.src = cast (Type.createInstance (className.get (id), []), Sound);
		return buffer;
		
		#elseif html5
		
		return null;
		//return new Sound (new URLRequest (path.get (id)));
		
		#else
		
		if (className.exists(id)) return AudioBuffer.fromBytes (cast (Type.createInstance (className.get (id), []), Bytes));
		else return AudioBuffer.fromFile (path.get (id));
		
		#end
		
	}
	
	
	public override function getBytes (id:String):Bytes {
		
		#if flash
		
		switch (type.get (id)) {
			
			case TEXT, BINARY:
				
				return Bytes.ofData (cast (Type.createInstance (className.get (id), []), flash.utils.ByteArray));
			
			case IMAGE:
				
				var bitmapData = cast (Type.createInstance (className.get (id), []), BitmapData);
				return Bytes.ofData (bitmapData.getPixels (bitmapData.rect));
			
			default:
				
				return null;
			
		}
		
		return cast (Type.createInstance (className.get (id), []), Bytes);
		
		#elseif html5
		
		var loader = Preloader.loaders.get (path.get (id));
		
		if (loader == null) {
			
			return null;
			
		}
		
		var bytes = loader.bytes;
		
		if (bytes != null) {
			
			return bytes;
			
		} else {
			
			return null;
		}
		
		#else
		
		if (className.exists(id)) return cast (Type.createInstance (className.get (id), []), Bytes);
		else return Bytes.readFile (path.get (id));
		
		#end
		
	}
	
	
	public override function getFont (id:String):Font {
		
		#if flash
		
		var src = Type.createInstance (className.get (id), []);
		
		var font = new Font (src.fontName);
		font.src = src;
		return font;
		
		#elseif html5
		
		return cast (Type.createInstance (className.get (id), []), Font);
		
		#else
		
		if (className.exists (id)) {
			
			var fontClass = className.get (id);
			return cast (Type.createInstance (fontClass, []), Font);
			
		} else {
			
			return Font.fromFile (path.get (id));
			
		}
		
		#end
		
	}
	
	
	public override function getImage (id:String):Image {
		
		#if flash
		
		return Image.fromBitmapData (cast (Type.createInstance (className.get (id), []), BitmapData));
		
		#elseif html5
		
		return Image.fromImageElement (Preloader.images.get (path.get (id)));
		
		#else
		
		if (className.exists (id)) {
			
			var fontClass = className.get (id);
			return cast (Type.createInstance (fontClass, []), Image);
			
		} else {
			
			return Image.fromFile (path.get (id));
			
		}
		
		#end
		
	}
	
	
	/*public override function getMusic (id:String):Dynamic {
		
		#if flash
		
		return cast (Type.createInstance (className.get (id), []), Sound);
		
		#elseif openfl_html5
		
		//var sound = new Sound ();
		//sound.__buffer = true;
		//sound.load (new URLRequest (path.get (id)));
		//return sound;
		return null;
		
		#elseif html5
		
		return null;
		//return new Sound (new URLRequest (path.get (id)));
		
		#else
		
		return null;
		//if (className.exists(id)) return cast (Type.createInstance (className.get (id), []), Sound);
		//else return new Sound (new URLRequest (path.get (id)), null, true);
		
		#end
		
	}*/
	
	
	public override function getPath (id:String):String {
		
		//#if ios
		
		//return SystemPath.applicationDirectory + "/assets/" + path.get (id);
		
		//#else
		
		return path.get (id);
		
		//#end
		
	}
	
	
	public override function getText (id:String):String {
		
		#if html5
		
		var loader = Preloader.loaders.get (path.get (id));
		
		if (loader == null) {
			
			return null;
			
		}
		
		var bytes = loader.bytes;
		
		if (bytes != null) {
			
			return bytes.getString (0, bytes.length);
			
		} else {
			
			return null;
		}
		
		#else
		
		var bytes = getBytes (id);
		
		if (bytes == null) {
			
			return null;
			
		} else {
			
			return bytes.getString (0, bytes.length);
			
		}
		
		#end
		
	}
	
	
	public override function isLocal (id:String, type:String):Bool {
		
		var requestedType = type != null ? cast (type, AssetType) : null;
		
		#if flash
		
		//if (requestedType != AssetType.MUSIC && requestedType != AssetType.SOUND) {
			
			return className.exists (id);
			
		//}
		
		#end
		
		return true;
		
	}
	
	
	public override function list (type:String):Array<String> {
		
		var requestedType = type != null ? cast (type, AssetType) : null;
		var items = [];
		
		for (id in this.type.keys ()) {
			
			if (requestedType == null || exists (id, type)) {
				
				items.push (id);
				
			}
			
		}
		
		return items;
		
	}
	
	
	public override function loadAudioBuffer (id:String):Future<AudioBuffer> {
		
		var promise = new Promise<AudioBuffer> ();
		
		#if (flash)
		
		if (path.exists (id)) {
			
			var soundLoader = new Sound ();
			soundLoader.addEventListener (Event.COMPLETE, function (event) {
				
				var audioBuffer:AudioBuffer = new AudioBuffer();
				audioBuffer.src = event.currentTarget;
				promise.complete (audioBuffer);
				
			});
			soundLoader.addEventListener (ProgressEvent.PROGRESS, function (event) {
				
				if (event.bytesTotal == 0) {
					
					promise.progress (0);
					
				} else {
					
					promise.progress (event.bytesLoaded / event.bytesTotal);
					
				}
				
			});
			soundLoader.addEventListener (IOErrorEvent.IO_ERROR, promise.error);
			soundLoader.load (new URLRequest (path.get (id)));
			
		} else {
			
			promise.complete (getAudioBuffer (id));
			
		}
		
		#else
		
		promise.completeWith (new Future<AudioBuffer> (function () return getAudioBuffer (id)));
		
		#end
		
		return promise.future;
		
	}
	
	
	public override function loadBytes (id:String):Future<Bytes> {
		
		var promise = new Promise<Bytes> ();
		
		#if flash
		
		if (path.exists (id)) {
			
			var loader = new URLLoader ();
			loader.dataFormat = flash.net.URLLoaderDataFormat.BINARY;
			loader.addEventListener (Event.COMPLETE, function (event:Event) {
				
				var bytes = Bytes.ofData (event.currentTarget.data);
				promise.complete (bytes);
				
			});
			loader.addEventListener (ProgressEvent.PROGRESS, function (event) {
				
				if (event.bytesTotal == 0) {
					
					promise.progress (0);
					
				} else {
					
					promise.progress (event.bytesLoaded / event.bytesTotal);
					
				}
				
			});
			loader.addEventListener (IOErrorEvent.IO_ERROR, promise.error);
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			promise.complete (getBytes (id));
			
		}
		
		#elseif html5
		
		if (path.exists (id)) {
			
			var request = new HTTPRequest ();
			promise.completeWith (request.load (path.get (id) + "?" + Assets.cache.version));
			
		} else {
			
			promise.complete (getBytes (id));
			
		}
		
		#else
		
		promise.completeWith (new Future<Bytes> (function () return getBytes (id)));
		
		#end
		
		return promise.future;
		
	}
	
	
	public override function loadImage (id:String):Future<Image> {
		
		var promise = new Promise<Image> ();
		
		#if flash
		
		if (path.exists (id)) {
			
			var loader = new Loader ();
			loader.contentLoaderInfo.addEventListener (Event.COMPLETE, function (event:Event) {
				
				var bitmapData = cast (event.currentTarget.content, Bitmap).bitmapData;
				promise.complete (Image.fromBitmapData (bitmapData));
				
			});
			loader.contentLoaderInfo.addEventListener (ProgressEvent.PROGRESS, function (event) {
				
				if (event.bytesTotal == 0) {
					
					promise.progress (0);
					
				} else {
					
					promise.progress (event.bytesLoaded / event.bytesTotal);
					
				}
				
			});
			loader.contentLoaderInfo.addEventListener (IOErrorEvent.IO_ERROR, promise.error);
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			promise.complete (getImage (id));
			
		}
		
		#elseif html5
		
		if (path.exists (id)) {
			
			var image = new js.html.Image ();
			image.onload = function (_):Void {
				
				promise.complete (Image.fromImageElement (image));
				
			}
			image.onerror = promise.error;
			image.src = path.get (id) + "?" + Assets.cache.version;
			
		} else {
			
			promise.complete (getImage (id));
			
		}
		
		#else
		
		promise.completeWith (new Future<Image> (function () return getImage (id)));
		
		#end
		
		return promise.future;
		
	}
	
	
	#if (!flash && !html5)
	private function loadManifest ():Void {
		
		try {
			
			#if blackberry
			var bytes = Bytes.readFile ("app/native/manifest");
			#elseif tizen
			var bytes = Bytes.readFile ("../res/manifest");
			#elseif emscripten
			var bytes = Bytes.readFile ("assets/manifest");
			#elseif (mac && java)
			var bytes = Bytes.readFile ("../Resources/manifest");
			#elseif (ios || tvos)
			var bytes = Bytes.readFile ("assets/manifest");
			#else
			var bytes = Bytes.readFile ("manifest");
			#end
			
			if (bytes != null) {
				
				if (bytes.length > 0) {
					
					var data = bytes.getString (0, bytes.length);
					
					if (data != null && data.length > 0) {
						
						var manifest:Array<Dynamic> = Unserializer.run (data);
						
						for (asset in manifest) {
							
							if (!className.exists (asset.id)) {
								
								#if (ios || tvos)
								path.set (asset.id, "assets/" + asset.path);
								#else
								path.set (asset.id, asset.path);
								#end
								type.set (asset.id, cast (asset.type, AssetType));
								
							}
							
						}
						
					}
					
				}
				
			} else {
				
				trace ("Warning: Could not load asset manifest (bytes was null)");
				
			}
		
		} catch (e:Dynamic) {
			
			trace ('Warning: Could not load asset manifest (${e})');
			
		}
		
	}
	#end
	
	
	public override function loadText (id:String):Future<String> {
		
		var promise = new Promise<String> ();
		
		#if html5
		
		if (path.exists (id)) {
			
			var request = new HTTPRequest ();
			var future = request.load (path.get (id) + "?" + Assets.cache.version);
			future.onProgress (function (progress) promise.progress (progress));
			future.onError (function (msg) promise.error (msg));
			future.onComplete (function (bytes) promise.complete (bytes.getString (0, bytes.length)));
			
		} else {
			
			promise.complete (getText (id));
			
		}
		
		#else
		
		promise.completeWith (loadBytes (id).then (function (bytes) {
			
			return new Future<String> (function () {
				
				if (bytes == null) {
					
					return null;
					
				} else {
					
					return bytes.getString (0, bytes.length);
					
				}
				
			});
			
		}));
		
		#end
		
		return promise.future;
		
	}
	
	
}


#if !display
#if flash

@:keep @:bind #if display private #end class __ASSET__assets_images_alphabet_ase extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_images_alphabet_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_back_ase extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_images_back_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_front_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_images_go_here_txt extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_images_poof_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_roomba_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_trash_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__flixel_sounds_beep_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__flixel_sounds_flixel_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends flash.text.Font { }
@:keep @:bind #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends flash.text.Font { }
@:keep @:bind #if display private #end class __ASSET__flixel_images_ui_button_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__flixel_images_logo_default_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_music_mp3_woop_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_mp3_squu0_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_mp3_squu1_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_mp3_squu2_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_mp3_squu3_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_mp3_squu4_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_mp3_suck0_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_mp3_suck1_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_mp3_suck2_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_mp3_suck3_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_mp3_suck4_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_mp3_suck5_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_mp3_suck6_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_mp3_suck7_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_mp3_suck8_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_mp3_suck9_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_mp3_talk0_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_mp3_talk1_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_mp3_talk2_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_mp3_talk3_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_mp3_talk4_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_mp3_talk5_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_mp3_talk6_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_mp3_talk7_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_mp3_talk8_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_mp3_talk9_mp3 extends flash.media.Sound { }


#elseif html5












@:keep #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends lime.text.Font { public function new () { super (); name = "Nokia Cellphone FC Small"; } } 
@:keep #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends lime.text.Font { public function new () { super (); name = "Monsterrat"; } } 






























#else



#if (windows || mac || linux || cpp)


@:file("assets/images/alphabet.ase") #if display private #end class __ASSET__assets_images_alphabet_ase extends lime.utils.Bytes {}
@:image("assets/images/alphabet.png") #if display private #end class __ASSET__assets_images_alphabet_png extends lime.graphics.Image {}
@:file("assets/images/back.ase") #if display private #end class __ASSET__assets_images_back_ase extends lime.utils.Bytes {}
@:image("assets/images/back.png") #if display private #end class __ASSET__assets_images_back_png extends lime.graphics.Image {}
@:image("assets/images/front.png") #if display private #end class __ASSET__assets_images_front_png extends lime.graphics.Image {}
@:file("assets/images/images-go-here.txt") #if display private #end class __ASSET__assets_images_images_go_here_txt extends lime.utils.Bytes {}
@:image("assets/images/poof.png") #if display private #end class __ASSET__assets_images_poof_png extends lime.graphics.Image {}
@:image("assets/images/roomba.png") #if display private #end class __ASSET__assets_images_roomba_png extends lime.graphics.Image {}
@:image("assets/images/trash.png") #if display private #end class __ASSET__assets_images_trash_png extends lime.graphics.Image {}
@:file("C:/HaxeToolkit/haxe/lib/flixel/4,2,0/assets/sounds/beep.mp3") #if display private #end class __ASSET__flixel_sounds_beep_mp3 extends lime.utils.Bytes {}
@:file("C:/HaxeToolkit/haxe/lib/flixel/4,2,0/assets/sounds/flixel.mp3") #if display private #end class __ASSET__flixel_sounds_flixel_mp3 extends lime.utils.Bytes {}
@:font("C:/HaxeToolkit/haxe/lib/flixel/4,2,0/assets/fonts/nokiafc22.ttf") #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends lime.text.Font {}
@:font("C:/HaxeToolkit/haxe/lib/flixel/4,2,0/assets/fonts/monsterrat.ttf") #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends lime.text.Font {}
@:image("C:/HaxeToolkit/haxe/lib/flixel/4,2,0/assets/images/ui/button.png") #if display private #end class __ASSET__flixel_images_ui_button_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/flixel/4,2,0/assets/images/logo/default.png") #if display private #end class __ASSET__flixel_images_logo_default_png extends lime.graphics.Image {}
@:file("assets/music/mp3/woop.mp3") #if display private #end class __ASSET__assets_music_mp3_woop_mp3 extends lime.utils.Bytes {}
@:file("assets/sounds/mp3/squu0.mp3") #if display private #end class __ASSET__assets_sounds_mp3_squu0_mp3 extends lime.utils.Bytes {}
@:file("assets/sounds/mp3/squu1.mp3") #if display private #end class __ASSET__assets_sounds_mp3_squu1_mp3 extends lime.utils.Bytes {}
@:file("assets/sounds/mp3/squu2.mp3") #if display private #end class __ASSET__assets_sounds_mp3_squu2_mp3 extends lime.utils.Bytes {}
@:file("assets/sounds/mp3/squu3.mp3") #if display private #end class __ASSET__assets_sounds_mp3_squu3_mp3 extends lime.utils.Bytes {}
@:file("assets/sounds/mp3/squu4.mp3") #if display private #end class __ASSET__assets_sounds_mp3_squu4_mp3 extends lime.utils.Bytes {}
@:file("assets/sounds/mp3/suck0.mp3") #if display private #end class __ASSET__assets_sounds_mp3_suck0_mp3 extends lime.utils.Bytes {}
@:file("assets/sounds/mp3/suck1.mp3") #if display private #end class __ASSET__assets_sounds_mp3_suck1_mp3 extends lime.utils.Bytes {}
@:file("assets/sounds/mp3/suck2.mp3") #if display private #end class __ASSET__assets_sounds_mp3_suck2_mp3 extends lime.utils.Bytes {}
@:file("assets/sounds/mp3/suck3.mp3") #if display private #end class __ASSET__assets_sounds_mp3_suck3_mp3 extends lime.utils.Bytes {}
@:file("assets/sounds/mp3/suck4.mp3") #if display private #end class __ASSET__assets_sounds_mp3_suck4_mp3 extends lime.utils.Bytes {}
@:file("assets/sounds/mp3/suck5.mp3") #if display private #end class __ASSET__assets_sounds_mp3_suck5_mp3 extends lime.utils.Bytes {}
@:file("assets/sounds/mp3/suck6.mp3") #if display private #end class __ASSET__assets_sounds_mp3_suck6_mp3 extends lime.utils.Bytes {}
@:file("assets/sounds/mp3/suck7.mp3") #if display private #end class __ASSET__assets_sounds_mp3_suck7_mp3 extends lime.utils.Bytes {}
@:file("assets/sounds/mp3/suck8.mp3") #if display private #end class __ASSET__assets_sounds_mp3_suck8_mp3 extends lime.utils.Bytes {}
@:file("assets/sounds/mp3/suck9.mp3") #if display private #end class __ASSET__assets_sounds_mp3_suck9_mp3 extends lime.utils.Bytes {}
@:file("assets/sounds/mp3/talk0.mp3") #if display private #end class __ASSET__assets_sounds_mp3_talk0_mp3 extends lime.utils.Bytes {}
@:file("assets/sounds/mp3/talk1.mp3") #if display private #end class __ASSET__assets_sounds_mp3_talk1_mp3 extends lime.utils.Bytes {}
@:file("assets/sounds/mp3/talk2.mp3") #if display private #end class __ASSET__assets_sounds_mp3_talk2_mp3 extends lime.utils.Bytes {}
@:file("assets/sounds/mp3/talk3.mp3") #if display private #end class __ASSET__assets_sounds_mp3_talk3_mp3 extends lime.utils.Bytes {}
@:file("assets/sounds/mp3/talk4.mp3") #if display private #end class __ASSET__assets_sounds_mp3_talk4_mp3 extends lime.utils.Bytes {}
@:file("assets/sounds/mp3/talk5.mp3") #if display private #end class __ASSET__assets_sounds_mp3_talk5_mp3 extends lime.utils.Bytes {}
@:file("assets/sounds/mp3/talk6.mp3") #if display private #end class __ASSET__assets_sounds_mp3_talk6_mp3 extends lime.utils.Bytes {}
@:file("assets/sounds/mp3/talk7.mp3") #if display private #end class __ASSET__assets_sounds_mp3_talk7_mp3 extends lime.utils.Bytes {}
@:file("assets/sounds/mp3/talk8.mp3") #if display private #end class __ASSET__assets_sounds_mp3_talk8_mp3 extends lime.utils.Bytes {}
@:file("assets/sounds/mp3/talk9.mp3") #if display private #end class __ASSET__assets_sounds_mp3_talk9_mp3 extends lime.utils.Bytes {}



#end
#end

#if (openfl && !flash)
@:keep #if display private #end class __ASSET__OPENFL__flixel_fonts_nokiafc22_ttf extends openfl.text.Font { public function new () { var font = new __ASSET__flixel_fonts_nokiafc22_ttf (); src = font.src; name = font.name; super (); }}
@:keep #if display private #end class __ASSET__OPENFL__flixel_fonts_monsterrat_ttf extends openfl.text.Font { public function new () { var font = new __ASSET__flixel_fonts_monsterrat_ttf (); src = font.src; name = font.name; super (); }}

#end

#end