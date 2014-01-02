package ru.zzzzzzerg.linden.play;

import openfl.utils.JNI;

#if android

class GamesClientImpl
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

  public function unlockAchievement(achievementId : String)
  {
    _unlockAchievement(achievementId);
  }

  public function incrementAchievement(achievementId : String, steps : Int)
  {
    _incrementAchievement(achievementId, steps);
  }

  public function showAchievements()
  {
    _showAchievements();
  }

  public function submitScore(leaderboardId : String, score : Int)
  {
    _submitScore(leaderboardId, score);
  }

  public function showLeaderboard(leaderboardId : String)
  {
    _showLeaderboard(leaderboardId);
  }

  private static function initJNI()
  {
    if(_signIn == null)
    {
      _signIn = JNI.createStaticMethod("ru/zzzzzzerg/linden/GooglePlay",
          "signInGamesClient", "()Z");
    }

    if(_signOut == null)
    {
      _signOut = openfl.utils.JNI.createStaticMethod("ru/zzzzzzerg/linden/GooglePlay",
          "signOutGamesClient", "()V");
    }

    if(_unlockAchievement == null)
    {
      _unlockAchievement = openfl.utils.JNI.createStaticMethod("ru/zzzzzzerg/linden/GooglePlay",
          "unlockAchievement", "(Ljava/lang/String;)V");
    }

    if(_incrementAchievement == null)
    {
      _incrementAchievement = openfl.utils.JNI.createStaticMethod("ru/zzzzzzerg/linden/GooglePlay",
          "incrementAchievement", "(Ljava/lang/String;I)V");
    }

    if(_showAchievements == null)
    {
      _showAchievements = openfl.utils.JNI.createStaticMethod("ru/zzzzzzerg/linden/GooglePlay",
          "showAchievements", "()V");
    }

    if(_submitScore == null)
    {
      _submitScore = openfl.utils.JNI.createStaticMethod("ru/zzzzzzerg/linden/GooglePlay",
          "submitScore", "(Ljava/lang/String;J)V");
    }

    if(_showLeaderboard == null)
    {
      _showLeaderboard = openfl.utils.JNI.createStaticMethod("ru/zzzzzzerg/linden/GooglePlay",
          "showLeaderboard", "(Ljava/lang/String;)V");
    }
  }

  private static var _signIn : Dynamic = null;
  private static var _signOut : Dynamic = null;
  private static var _unlockAchievement : Dynamic = null;
  private static var _incrementAchievement : Dynamic = null;
  private static var _showAchievements : Dynamic = null;
  private static var _submitScore : Dynamic = null;
  private static var _showLeaderboard : Dynamic = null;
}

typedef GamesClient = GamesClientImpl;
#else
class GamesClientFallback
{
  var _handler : ConnectionHandler;

  public function new(handler : ConnectionHandler)
  {
    _handler = handler;
  }

  public function signIn() : Bool
  {
    _handler.onSignedIn("GAMES_CLIENT");
    return true;
  }
  public function signOut()
  {
    _handler.onSignedOut("GAMES_CLIENT");
  }
  public function unlockAchievement(achievementId : String)
  {
    trace(["Not implemented", "unlockAchievement", achievementId]);
  }
  public function incrementAchievement(achievementId : String, steps : Int)
  {
    trace(["Not implemented", "incrementAchievement", achievementId, steps]);
  }
  public function showAchievements()
  {
    trace(["Not implemented", "showAchievements"]);
  }
  public function submitScore(leaderboardId : String, score : Int)
  {
    trace(["Not implemented", "submitScore", leaderboardId, score]);
  }
  public function showLeaderboard(leaderboardId : String)
  {
    trace(["Not implemented", "showLeaderboard", leaderboardId]);
  }
}

typedef GamesClient = GamesClientFallback;
#end

