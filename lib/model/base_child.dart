import 'package:flutter/material.dart';

abstract class BaseChildren {
  BaseChildren parent;
  List<BaseChildren> children;
  @protected
  dynamic get sortField => null;
  BaseChildren({this.parent, List<BaseChildren> children}) {
    print('BaseChild constructor $this($parent)');
    if (children != null) {
      print("Children is !null");
      children.forEach((element) {
        element.parent = this;
      });
      this.children = children;
    } else
      print("Children is null");
  }
  void addAll(BaseChildren children) {
    children.addAll(children);
  }

  void add(BaseChildren child) {
    int index = children.indexWhere((element) => element.sortField == null || element.sortField > child.sortField);
    if (child.sortField == null || index < 0)
      children.add(child);
    else
      children.insert(index, child);
  }
}
