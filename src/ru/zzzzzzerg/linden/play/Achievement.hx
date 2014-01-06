package ru.zzzzzzerg.linden.play;


class Achievement
{
  public static var STATE_HIDDEN : Int = 2;
  public static var STATE_REVEALED : Int = 1;
  public static var STATE_UNLOCKED : Int = 0;

  public static var TYPE_INCREMENTAL : Int = 1;
  public static var TYPE_STANDARD : Int = 0;

  public var id : String;
  public var name : String;
  public var state : Int;
  public var type : Int;
  public var steps : Int;
  public var totalSteps : Int;

  public function new(id : String, name : String, state : Int, type : Int, steps : Int, totalSteps : Int)
  {
    this.id = id;
    this.name = name;
    this.state = state;
    this.type = type;
    this.steps = steps;
    this.totalSteps = totalSteps;
  }

  public function toString() : String
  {
    if(type == TYPE_INCREMENTAL)
    {
      return 'a{id=$id, name=$name, state=$state, type=$type, steps=$steps/$totalSteps}';
    }
    else
    {
      return 'a{id=$id, name=$name, state=$state, type=$type}';
    }
  }
}
