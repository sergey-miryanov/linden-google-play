package ru.zzzzzzerg.linden.play;

#if android
class AppStateClientImpl
{
  public function new(handler : ConnectionHandler)
  {
    initJNI();
  }

  public function connect() : Bool
  {
    return _connect();
  }

  public function signOut()
  {
    _signOut();
  }

  public function isSignedIn() : Bool
  {
    return _isSignedIn();
  }

  public function loadState(stateKey : Int)
  {
    _loadState(stateKey);
  }

  public function updateState(stateKey : Int, data : String)
  {
    _updateState(stateKey, data);
  }

  public function resolveState(stateKey : Int, version : String, data : String)
  {
    _resolveState(stateKey, version, data);
  }

  public function deleteState(stateKey : Int)
  {
    _deleteState(stateKey);
  }


  private static function initJNI()
  {
    if(_connect == null)
    {
      _connect = openfl.utils.JNI.createStaticMethod("ru/zzzzzzerg/linden/GooglePlay",
          "connectAppStateClient", "()Z");
    }

    if(_signOut == null)
    {
      _signOut = openfl.utils.JNI.createStaticMethod("ru/zzzzzzerg/linden/GooglePlay",
          "signOutAppStateClient", "()V");
    }

    if(_isSignedIn == null)
    {
      _isSignedIn = openfl.utils.JNI.createStaticMethod("ru/zzzzzzerg/linden/GooglePlay",
          "isAppStateClientSignedIn", "()Z");
    }

    if(_loadState == null)
    {
      _loadState = openfl.utils.JNI.createStaticMethod("ru/zzzzzzerg/linden/GooglePlay",
          "loadState", "(I)V");
    }

    if(_updateState == null)
    {
      _updateState = openfl.utils.JNI.createStaticMethod("ru/zzzzzzerg/linden/GooglePlay",
          "updateState", "(ILjava/lang/String;)V");
    }

    if(_resolveState == null)
    {
      _resolveState = openfl.utils.JNI.createStaticMethod("ru/zzzzzzerg/linden/GooglePlay",
          "resolveState", "(ILjava/lang/String;Ljava/lang/String;)V");
    }

    if(_deleteState == null)
    {
      _deleteState = openfl.utils.JNI.createStaticMethod("ru/zzzzzzerg/linden/GooglePlay",
          "deleteState", "(I)V");
    }
  }

  private static var _connect : Dynamic = null;
  private static var _signOut : Dynamic = null;
  private static var _isSignedIn : Dynamic = null;
  private static var _loadState : Dynamic = null;
  private static var _updateState : Dynamic = null;
  private static var _resolveState : Dynamic = null;
  private static var _deleteState : Dynamic = null;
}

typedef AppStateClient = AppStateClientImpl;
#else
class AppStateClientFallback
{
  var _handler : ConnectionHandler;
  var _isSignedIn : Bool;

  public function new(handler : ConnectionHandler)
  {
    _handler = handler;
    _isSignedIn = false;
  }

  public function connect() : Bool
  {
    _handler.onConnectionEstablished("APP_STATE_CLIENT");
    _isSignedIn = true;
    return true;
  }
  public function signOut()
  {
    _handler.onSignedOut("APP_STATE_CLIENT");
    _isSignedIn = false;
  }

  public function isSignedIn()
  {
    return _isSignedIn;
  }

  public function loadState(stateKey : Int)
  {
    _handler.onStateLoaded(stateKey, "", false);
  }

  public function updateState(stateKey : Int, data : String)
  {
    trace(["Not implemented", "updateState", stateKey, data]);
  }

  public function resolveState(stateKey : Int, version : String, data : String)
  {
    trace(["Not implemented", "resolveState", stateKey, version, data]);
  }

  public function deleteState(stateKey : Int)
  {
    trace(["Not implemented", "deleteState", stateKey]);
  }
}

typedef AppStateClient = AppStateClientFallback;
#end
