package ru.zzzzzzerg.linden;

import ru.zzzzzzerg.linden.play.ConnectionHandler;
import ru.zzzzzzerg.linden.play.GamesClient;
import ru.zzzzzzerg.linden.play.AppStateClient;

#if android
import openfl.utils.JNI;
#end

class GooglePlay
{
  private var _gamesClient : GamesClient;
  private var _appStateClient : AppStateClient;

  public function new(handler : ConnectionHandler)
  {
#if android
    initJNI();
    _start(handler);
#end

    _gamesClient = new GamesClient(handler);
    _appStateClient = new AppStateClient(handler);
  }

  public var games(get, never) : GamesClient;
  public function get_games() : GamesClient
  {
    return _gamesClient;
  }

  public var cloudSave(get, never) : AppStateClient;
  public function get_cloudSave() : AppStateClient
  {
    return _appStateClient;
  }

#if android
  private static function initJNI()
  {
    if(_start == null)
    {
      _start = JNI.createStaticMethod("ru/zzzzzzerg/linden/GooglePlay",
          "start", "(Lorg/haxe/lime/HaxeObject;)V");
    }
  }

  private static var _start : Dynamic = null;
#end
}
