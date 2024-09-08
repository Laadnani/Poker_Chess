import 'package:flutter_chess/constants.dart';
import 'package:squares/squares.dart';

class GameModelOffline {
  String gameId;
  String side;
  String userId;
  String positonFen;
  String winner;
  String userTime;
  String opponentTime;
  String userMove;
  String opponentMove;
  String boardState;
  String playState;
  bool isUserTurn;
  bool isGameOver;
  int squareState;
  List<Move> moves;

  GameModelOffline({
    required this.gameId,
    required this.side,
    required this.userId,
    required this.positonFen,
    required this.winner,
    required this.userTime,
    required this.opponentTime,
    required this.userMove,
    required this.opponentMove,
    required this.boardState,
    required this.playState,
    required this.isUserTurn,
    required this.isGameOver,
    required this.squareState,
    required this.moves,
  });

  Map<String, dynamic> toMap() {
    return {
      Constants.gameId: gameId,
      Constants.side: side,
      Constants.userId: userId,
      Constants.positonFen: positonFen,
      Constants.winnerId: winner,
      Constants.userTime: userTime,
      Constants.opponentTime: opponentTime,
      Constants.userMove: userMove,
      Constants.opponentMove: opponentMove,
      Constants.boardState: boardState,
      Constants.playState: playState,
      Constants.isUserTurn: isUserTurn,
      Constants.isGameOver: isGameOver,
      Constants.squareState: squareState,
      Constants.moves: moves,
    };
  }

  factory GameModelOffline.fromMap(Map<String, dynamic> map) {
    return GameModelOffline(
      gameId: map[Constants.gameId] ?? '',
      side: map[Constants.side] ?? '',
      userId: map[Constants.userId] ?? '',
      positonFen: map[Constants.positonFen] ?? '',
      winner: map[Constants.winner] ?? '',
      userTime: map[Constants.userTime] ?? '',
      opponentTime: map[Constants.opponentTime] ?? '',
      userMove: map[Constants.userMove] ?? '',
      opponentMove: map[Constants.opponentMove] ?? '',
      boardState: map[Constants.boardState] ?? '',
      playState: map[Constants.playState] ?? '',
      isUserTurn: map[Constants.isUserTurn] ?? false,
      isGameOver: map[Constants.isGameOver] ?? false,
      squareState: map[Constants.squareState] ?? 0,
      moves: List<Move>.from(map[Constants.moves] ?? []),
    );
  }
}
