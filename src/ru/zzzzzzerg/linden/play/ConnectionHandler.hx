package ru.zzzzzzerg.linden.play;

class ConnectionHandler
{
  public function new()
  {
    achievements = new Array<Achievement>();
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

  private function _onLoadAchievement(id : String, name : String,
      state : Int, type : Int,
      steps : Int, totalSteps : Int)
  {
    achievements.push(new Achievement(id, name, state, type, steps, totalSteps));
  }

  private function _onAchievementsLoaded()
  {
    onAchievementsLoaded(achievements.copy());
    achievements = new Array<Achievement>();
  }

  public function onAchievementsLoaded(achievements : Array<Achievement>)
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

  public var achievements : Array<Achievement>;
}
