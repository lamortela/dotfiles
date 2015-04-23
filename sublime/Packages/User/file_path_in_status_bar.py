# Sublime Text 3 plugin to place the full path of the currently selected
# file in the status bar
# Place this file in:
# ~/Library/Aplication Support/Sublime Text 3/Packages/User/

import sublime, sublime_plugin

class FilePathInStatusBar(sublime_plugin.EventListener):
  def on_activated(self, view):
    file_path = "" if view.file_name() is None else view.file_name()
    view.set_status('currentPath', file_path)
