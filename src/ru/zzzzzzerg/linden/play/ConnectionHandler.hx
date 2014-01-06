package ru.zzzzzzerg.linden.play;

class ConnectionHandler
{
  public function new()
  {
  }

  public function onWarning(msg : String, where : String)
  {
  }

  public function onError(what : String, code : Int, where : String)
  {
  }

  public function onException(msg : String, where : String)
  {
  }

  public function onConnectionEstablished(what : String)
  {
  }

  public function onSignedOut(what : String)
  {
  }

  public function onAchievementsLoaded(achievements : Array<Dynamic>)
  {
  }

  public function onStateListLoaded(states : Array<Dynamic>)
  {
  }

  public function onStateDeleted(statusCode : Int, stateKey : Int)
  {
  }

  public function onStateConflict(stateKey : Int, resolvedVersion : String,
      localData : String, serverData : String)
  {
  }

  public function onStateLoaded(stateKey : Int, data : String, stale : Bool)
  {
  }

  public function onStateNotFound(stateKey : Int)
  {
  }
}
