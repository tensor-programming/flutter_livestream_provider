import 'dart:collection';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'package:state_provider_example/models/stories.dart';

enum StoryType {
  TopStories,
  NewStories,
}

class AppState with ChangeNotifier {
  List _topStoryIds = [];
  List _newStoryIds = [];

  List<Stories> _topStories = [];
  List<Stories> _newStories = [];

  int _bottomIndex = 0;

  var _cache = HashMap<int, Stories>();

  final String baseUrl = "https://hacker-news.firebaseio.com/v0/";

  bool _topIsLoading = true;
  bool _newIsLoading = true;

  StoryType _storyType = StoryType.NewStories;

  AppState._() {
    _updateStories(_storyType);
  }

  factory AppState() {
    return AppState._();
  }

  List<Stories> get stories {
    if (_storyType == StoryType.NewStories)
      return _newStories;
    else
      return _topStories;
  }

  bool get isLoading {
    if (_storyType == StoryType.NewStories)
      return _newIsLoading;
    else
      return _topIsLoading;
  }

  List<Stories> get allStories {
    List<Stories> _allStories = List<Stories>();

    _allStories.addAll(_newStories);
    _allStories.addAll(_topStories);
    return _allStories;
  }

  int get bottomIndex => _bottomIndex;

  void changeStoryType(int index) {
    if (index == 0) {
      _storyType = StoryType.NewStories;
      _bottomIndex = 0;
    } else {
      _storyType = StoryType.TopStories;
      _bottomIndex = 1;
    }
    _updateStories(_storyType);
    notifyListeners();
  }

  Future<List> initStories(StoryType type) async {
    String frontUrl = type == StoryType.NewStories ? "new" : "top";
    String url = "$baseUrl${frontUrl}stories.json";

    final res = await http.get(url);

    if (res.statusCode != 200) throw "Couldn't fetch stories";

    return jsonDecode(res.body);
  }

  Future<Stories> _getStory(var id) async {
    if (!_cache.containsKey(id)) {
      final url = "${baseUrl}item/$id.json";
      final res = await http.get(url);

      if (res.statusCode != 200)
        throw "Couldn't fetch $id story";
      else
        _cache[id] = parseStories(res.body);
    }

    return _cache[id];
  }

  Future<Null> _updateStories(StoryType type) async {
    bool fetch = false;

    if ((type == StoryType.NewStories && _newStories.isEmpty) ||
        (type == StoryType.TopStories && _topStories.isEmpty)) fetch = true;

    if (fetch) {
      var storyIds = await initStories(type);
      type == StoryType.NewStories
          ? _newStoryIds = storyIds
          : _topStoryIds = storyIds;

      for (var id in storyIds) {
        Stories newStory = await _getStory(id);
        type == StoryType.NewStories
            ? _newStories.add(newStory)
            : _topStories.add(newStory);

        if (storyIds.indexOf(id) > 2) notifyListeners();
        if (storyIds.indexOf(id) > 15) break;
      }

      type == StoryType.NewStories
          ? _newIsLoading = false
          : _topIsLoading = false;
      notifyListeners();
    }
  }
}
