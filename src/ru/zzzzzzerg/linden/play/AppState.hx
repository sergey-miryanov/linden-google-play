package ru.zzzzzzerg.linden.play;

class AppState
{
  public var key : Int;
  public var localVersion : String;
  public var localData : String;
  public var hasConflict : Bool;
  public var conflictVersion : String;
  public var conflictData : String;

  public function new(key : Int, localVersion : String, localData : String,
      hasConflict : Bool, conflictVersion : String, conflictData : String)
  {
    this.key = key;
    this.localVersion = localVersion;
    this.localData = localData;
    this.hasConflict = hasConflict;
    this.conflictVersion = conflictVersion;
    this.conflictData = conflictData;
  }

  public function toString() : String
  {
    if(hasConflict)
    {
      return 's{key=$key, version=$localVersion, conflictVersion=$conflictVersion}';
    }
    else
    {
      return 's{key=$key, version=$localVersion}';
    }
  }
}
