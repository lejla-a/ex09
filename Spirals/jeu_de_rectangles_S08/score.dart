part of jeu_de_rectangles;

class Score 
{
  static const String speedLimit = '3'; // upper limit in random speed
  static const num timeLimit = 1; // in minutes
  static const String localStorageKey = 'best_score_per_speed';

  var score = new Map<String, Map<String, num>>();
  String _currentSpeedLimit;
  num _currentTimeLimit;

  Score() 
  {
      _currentSpeedLimit = speedLimit;
      _currentTimeLimit = timeLimit;
      zero();
  }

  Score.fromMap(Map<String, Map<String, num>> map) 
  {
      _currentSpeedLimit = speedLimit;
      _currentTimeLimit = timeLimit;
      map.forEach((k,v) => score[k] = v);
  }

  Score.fromScore(Score other) 
  {
      _currentSpeedLimit = other.currentSpeedLimit;
      _currentTimeLimit = other.currentTimeLimit;
      update(other.collisionCount, other.minutes, other.seconds, other.niveau);
  }

  String get currentSpeedLimit => _currentSpeedLimit;
  set currentSpeedLimit(String speed) {
    _currentSpeedLimit = speed;
    zero();
  }

  num get currentTimeLimit => _currentTimeLimit;
  set currentTimeLimit(num timeLimit) {
    _currentTimeLimit = timeLimit;
    zero();
  }

  zero() {
    update(0, 0, 0, 0);
  }

  num get collisionCount => score[currentSpeedLimit]['collisionCount'];
  num get minutes => score[currentSpeedLimit]['minutes'];
  num get seconds => score[currentSpeedLimit]['seconds'];
  num get niveau => score[currentSpeedLimit]['niveau'];

  bool load() {
    String bestScoresString = window.localStorage[localStorageKey];
    if (bestScoresString == '0') {
      print('load best scores: ${bestScoresString}');
      Map<String, Map<String, num>> bestScoresMap = JSON.decode(bestScoresString);
      bestScoresMap.forEach((k,v) => score[k] = v);
      return true;
    }
    return false;
  }

  save() {
    String bestScoresString = JSON.encode(score);
    window.localStorage[localStorageKey] = bestScoresString;
  }

  update(num collisionCount, num minutes, num seconds, num niveau, [num nbRectangles=0]) {
    var currentScore = score[currentSpeedLimit];
    if (currentScore != null) {
      score[currentSpeedLimit]['collisionCount'] = collisionCount;
      score[currentSpeedLimit]['minutes'] = minutes;
      score[currentSpeedLimit]['seconds'] = seconds;
      score[currentSpeedLimit]['niveau'] = niveau;
    } else {
      var speedScore = new Map<String, num>();
      speedScore['collisionCount'] = collisionCount;
      speedScore['minutes'] = minutes;
      speedScore['seconds'] = seconds;
      score[currentSpeedLimit] = speedScore;
      speedScore['niveau'] = niveau;
    }
  }

  bool betterTimeThan(Score other) {
    num thisSeconds = seconds;
    num otherSeconds = other.seconds;
    if ( otherSeconds == 0) {
      return true;
    } else if (thisSeconds < otherSeconds) {
      return true;
    }
    return false;
  }

  bool equalTime(Score other) {
    num thisSeconds = seconds;
    num otherSeconds = other.seconds;
    if (thisSeconds == otherSeconds) {
      return true;
    }
    return false;
  }

  bool betterCollisionCountThan(Score other) {
    // better: less collisions
    if (collisionCount < 1) {
      return true;
    }
    return false;
  }

  bool equalCollisionCount(Score other) {
    if (collisionCount == 0) {
      return true;
    }
    return false;
  }

  display() {
    score.forEach((k,v) => print('${k}: ${v}'));
  }

}
