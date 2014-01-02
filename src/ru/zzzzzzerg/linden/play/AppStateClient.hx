package ru.zzzzzzerg.linden.play;

#if android
class AppStateClientImpl
{
  public function new(handler : ConnectionHandler)
  {
    initJNI();
  }

  public function signIn() : Bool
  {
    return _signIn();
  }

  public function signOut()
  {
    _signOut();
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
    if(_signIn == null)
    {
      _signIn = openfl.utils.JNI.createStaticMethod("ru/zzzzzzerg/linden/GooglePlay",
          "signInAppStateClient", "()Z");
    }

    if(_signOut == null)
    {
      _signOut = openfl.utils.JNI.createStaticMethod("ru/zzzzzzerg/linden/GooglePlay",
          "signOutAppStateClient", "()V");
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

  private static var _signIn : Dynamic = null;
  private static var _signOut : Dynamic = null;
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

  public function new(handler : ConnectionHandler)
  {
    _handler = handler;
  }

  public function signIn() : Bool
  {
    _handler.onSignedIn("APP_STATE_CLIENT");
    return true;
  }
  public function signOut()
  {
    _handler.onSignedOut("APP_STATE_CLIENT");
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
