package ru.zzzzzzerg.linden.play;

class ConnectionHandler
{
  public function new()
  {
    achievements = new Array<Achievement>();
    states = new Array<AppState>();
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
    onAchievementsLoaded(achievements);
  }

  public function onAchievementsLoaded(achievements : Array<Achievement>)
  {
  }

  private function _onLoadStateInfo(key : Int, localVersion : String, localData : String,
      hasConflict : Bool, conflictVersion : String, conflictData : String)
  {
    states.push(new AppState(key, localVersion, localData, hasConflict, conflictVersion, conflictData));
  }

  private function _onStateListLoaded()
  {
    onStateListLoaded(states);
  }

  public function onStateListLoaded(states : Array<AppState>)
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
  public var states : Array<AppState>;
}
