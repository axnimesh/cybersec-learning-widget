import QtQuick
import Quickshell
import Quickshell.Io
import qs.Commons
import qs.Ui

BarWidget {
  id: root
  moduleName: "spider.cybersec-learning"

  property string currentTerm: "🛡️ Loading..."

  implicitWidth: button.implicitWidth
  implicitHeight: button.implicitHeight

  // Update term every 30 seconds
  Timer {
    interval: 30000
    running: true
    repeat: true
    triggeredOnStart: true
    onTriggered: {
      widgetProcess.running = true
    }
  }

  // Process to get current term from widget script
  Process {
    id: widgetProcess
    command: ["bash", "-c", "~/.config/omarchy/plugins/spider.cybersec-learning/cybersec-widget.sh"]
    running: true
    stdout: SplitParser {
      onRead: data => {
        root.currentTerm = data.trim()
      }
    }
  }

  WidgetButton {
    id: button
    anchors.fill: parent
    bar: root.bar
    text: root.currentTerm
    horizontalMargin: 8.75
    tooltipText: "Left-click: explanation | Right-click: quiz | Middle-click: stats"
    
    onPressed: function(mouseButton) {
      if (mouseButton === Qt.RightButton) {
        // Start quiz mode
        if (root.bar) root.bar.run("bash ~/.config/omarchy/plugins/spider.cybersec-learning/quiz-mode.sh")
      } else if (mouseButton === Qt.MiddleButton) {
        // Show statistics
        if (root.bar) root.bar.run("bash ~/.config/omarchy/plugins/spider.cybersec-learning/show-stats.sh")
      } else {
        // Show explanation
        if (root.bar) root.bar.run("bash ~/.config/omarchy/plugins/spider.cybersec-learning/show-explanation.sh")
      }
    }
  }
}
