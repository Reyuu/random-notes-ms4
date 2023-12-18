// Author: Rey (https://github.com/Reyuu)

import MuseScore 3.0
import QtQuick 2.9
import QtQuick.Dialogs 1.1
import QtQuick.Controls 1.1
import QtQuick.Controls.Styles 1.3
import QtQuick.Window 2.2
import QtQuick.Layouts 1.1

MuseScore { 
  menuPath: "Plugins.Insert Random Notes"
  title: "Insert random notes"
  version: "4.0.0"
  description: "Insert random notes from specified pitch."
  thumbnailName: "random_notes_logo.png"
  pluginType: "dialog"
  id: pluginDialog
  width: 400; height: 180;

  onRun:{
  }

  function isDebug(){
    // set to true when debugging :3
    return false;
  }

  function getRandomInt(min, max) {
    // get random int between min and max, both inclusive
    if (min > max) {
        // swap if min is bigger than max
        [max, min] = [min, max];
    }
    if (min == max){
        // if both the same - return any of the two
        return min;
    }
    // staggered because of the debugging
    var rnd_result = (Math.random())*(max-min);
    if (isDebug()){
        console.log("min="+min.toString()+", max="+max.toString());
        console.log("rnd_result="+rnd_result.toString());
    }
    return Math.round(rnd_result)+min;
}

  function generateNotes(){
    // generate random notes onto a score
    // the script assumes the cursor has been setup to user's preferences beforehand
    var from = fromComboBox.model.get(fromComboBox.currentIndex).noteValue;
    var to = toComboBox.model.get(toComboBox.currentIndex).noteValue;
    var quantity = quantitySpinBox.value;
    var c = curScore.newCursor();

    c.inputStateMode = Cursor.INPUT_STATE_SYNC_WITH_SCORE;
    curScore.startCmd()
    for (var i = 0; i < quantity; i++){
        var r = getRandomInt(from, to);
        c.addNote(r);
    }
    curScore.endCmd();
    return;
  }

    ColumnLayout{
        anchors.fill: parent
        spacing: 10
        Label{
            Layout.leftMargin: 10
            text: "Set your input in the score (position and value) and then click \"Apply\".\n\n"
        }
        GridLayout {
            columns: 2
            anchors.fill: parent
            anchors.margins: 10
            anchors.topMargin: 30
            Label{
                text: "From"
            }
            ComboBox{
                id: fromComboBox
                currentIndex: 67
                model: ListModel {
                    id: fromNoteList
                    // i didn't type this shit out, don't worry
                    ListElement {text: "G9"; noteValue: 127;}
                    ListElement {text: "F#9/Gb9"; noteValue: 126;}
                    ListElement {text: "F9"; noteValue: 125;}
                    ListElement {text: "E9"; noteValue: 124;}
                    ListElement {text: "D#9/Eb9"; noteValue: 123;}
                    ListElement {text: "D9"; noteValue: 122;}
                    ListElement {text: "C#9/Db9"; noteValue: 121;}
                    ListElement {text: "C9"; noteValue: 120;}
                    ListElement {text: "B8"; noteValue: 119;}
                    ListElement {text: "A#8/Bb8"; noteValue: 118;}
                    ListElement {text: "A8"; noteValue: 117;}
                    ListElement {text: "G#8/Ab8"; noteValue: 116;}
                    ListElement {text: "G8"; noteValue: 115;}
                    ListElement {text: "F#8/Gb8"; noteValue: 114;}
                    ListElement {text: "F8"; noteValue: 113;}
                    ListElement {text: "E8"; noteValue: 112;}
                    ListElement {text: "D#8/Eb8"; noteValue: 111;}
                    ListElement {text: "D8"; noteValue: 110;}
                    ListElement {text: "C#8/Db8"; noteValue: 109;}
                    ListElement {text: "C8"; noteValue: 108;}
                    ListElement {text: "B7"; noteValue: 107;}
                    ListElement {text: "A#7/Bb7"; noteValue: 106;}
                    ListElement {text: "A7"; noteValue: 105;}
                    ListElement {text: "G#7/Ab7"; noteValue: 104;}
                    ListElement {text: "G7"; noteValue: 103;}
                    ListElement {text: "F#7/Gb7"; noteValue: 102;}
                    ListElement {text: "F7"; noteValue: 101;}
                    ListElement {text: "E7"; noteValue: 100;}
                    ListElement {text: "D#7/Eb7"; noteValue: 99;}
                    ListElement {text: "D7"; noteValue: 98;}
                    ListElement {text: "C#7/Db7"; noteValue: 97;}
                    ListElement {text: "C7"; noteValue: 96;}
                    ListElement {text: "B6"; noteValue: 95;}
                    ListElement {text: "A#6/Bb6"; noteValue: 94;}
                    ListElement {text: "A6"; noteValue: 93;}
                    ListElement {text: "G#6/Ab6"; noteValue: 92;}
                    ListElement {text: "G6"; noteValue: 91;}
                    ListElement {text: "F#6/Gb6"; noteValue: 90;}
                    ListElement {text: "F6"; noteValue: 89;}
                    ListElement {text: "E6"; noteValue: 88;}
                    ListElement {text: "D#6/Eb6"; noteValue: 87;}
                    ListElement {text: "D6"; noteValue: 86;}
                    ListElement {text: "C#6/Db6"; noteValue: 85;}
                    ListElement {text: "C6"; noteValue: 84;}
                    ListElement {text: "B5"; noteValue: 83;}
                    ListElement {text: "A#5/Bb5"; noteValue: 82;}
                    ListElement {text: "A5"; noteValue: 81;}
                    ListElement {text: "G#5/Ab5"; noteValue: 80;}
                    ListElement {text: "G5"; noteValue: 79;}
                    ListElement {text: "F#5/Gb5"; noteValue: 78;}
                    ListElement {text: "F5"; noteValue: 77;}
                    ListElement {text: "E5"; noteValue: 76;}
                    ListElement {text: "D#5/Eb5"; noteValue: 75;}
                    ListElement {text: "D5"; noteValue: 74;}
                    ListElement {text: "C#5/Db5"; noteValue: 73;}
                    ListElement {text: "C5"; noteValue: 72;}
                    ListElement {text: "B4"; noteValue: 71;}
                    ListElement {text: "A#4/Bb4"; noteValue: 70;}
                    ListElement {text: "A4 concert pitch"; noteValue: 69;}
                    ListElement {text: "G#4/Ab4"; noteValue: 68;}
                    ListElement {text: "G4"; noteValue: 67;}
                    ListElement {text: "F#4/Gb4"; noteValue: 66;}
                    ListElement {text: "F4"; noteValue: 65;}
                    ListElement {text: "E4"; noteValue: 64;}
                    ListElement {text: "D#4/Eb4"; noteValue: 63;}
                    ListElement {text: "D4"; noteValue: 62;}
                    ListElement {text: "C#4/Db4"; noteValue: 61;}
                    ListElement {text: "C4 (middle C)"; noteValue: 60;}
                    ListElement {text: "B3"; noteValue: 59;}
                    ListElement {text: "A#3/Bb3"; noteValue: 58;}
                    ListElement {text: "A3"; noteValue: 57;}
                    ListElement {text: "G#3/Ab3"; noteValue: 56;}
                    ListElement {text: "G3"; noteValue: 55;}
                    ListElement {text: "F#3/Gb3"; noteValue: 54;}
                    ListElement {text: "F3"; noteValue: 53;}
                    ListElement {text: "E3"; noteValue: 52;}
                    ListElement {text: "D#3/Eb3"; noteValue: 51;}
                    ListElement {text: "D3"; noteValue: 50;}
                    ListElement {text: "C#3/Db3"; noteValue: 49;}
                    ListElement {text: "C3"; noteValue: 48;}
                    ListElement {text: "B2"; noteValue: 47;}
                    ListElement {text: "A#2/Bb2"; noteValue: 46;}
                    ListElement {text: "A2"; noteValue: 45;}
                    ListElement {text: "G#2/Ab2"; noteValue: 44;}
                    ListElement {text: "G2"; noteValue: 43;}
                    ListElement {text: "F#2/Gb2"; noteValue: 42;}
                    ListElement {text: "F2"; noteValue: 41;}
                    ListElement {text: "E2"; noteValue: 40;}
                    ListElement {text: "D#2/Eb2"; noteValue: 39;}
                    ListElement {text: "D2"; noteValue: 38;}
                    ListElement {text: "C#2/Db2"; noteValue: 37;}
                    ListElement {text: "C2"; noteValue: 36;}
                    ListElement {text: "B1"; noteValue: 35;}
                    ListElement {text: "A#1/Bb1"; noteValue: 34;}
                    ListElement {text: "A1"; noteValue: 33;}
                    ListElement {text: "G#1/Ab1"; noteValue: 32;}
                    ListElement {text: "G1"; noteValue: 31;}
                    ListElement {text: "F#1/Gb1"; noteValue: 30;}
                    ListElement {text: "F1"; noteValue: 29;}
                    ListElement {text: "E1"; noteValue: 28;}
                    ListElement {text: "D#1/Eb1"; noteValue: 27;}
                    ListElement {text: "D1"; noteValue: 26;}
                    ListElement {text: "C#1/Db1"; noteValue: 25;}
                    ListElement {text: "C1"; noteValue: 24;}
                    ListElement {text: "B0"; noteValue: 23;}
                    ListElement {text: "A#0/Bb0"; noteValue: 22;}
                    ListElement {text: "A0"; noteValue: 21;}
                    ListElement {text: "G#"; noteValue: 20;}
                    ListElement {text: "G"; noteValue: 19;}
                    ListElement {text: "F#"; noteValue: 18;}
                    ListElement {text: "F"; noteValue: 17;}
                    ListElement {text: "E"; noteValue: 16;}
                    ListElement {text: "D#"; noteValue: 15;}
                    ListElement {text: "D"; noteValue: 14;}
                    ListElement {text: "C#"; noteValue: 13;}
                    ListElement {text: "C0"; noteValue: 12;}
                    ListElement {text: "B"; noteValue: 11;}
                    ListElement {text: "A#"; noteValue: 10;}
                    ListElement {text: "A"; noteValue: 9;}
                    ListElement {text: "G#"; noteValue: 8;}
                    ListElement {text: "G"; noteValue: 7;}
                    ListElement {text: "F#"; noteValue: 6;}
                    ListElement {text: "F"; noteValue: 5;}
                    ListElement {text: "E"; noteValue: 4;}
                    ListElement {text: "D#"; noteValue: 3;}
                    ListElement {text: "D"; noteValue: 2;}
                    ListElement {text: "C#"; noteValue: 1;}
                    ListElement {text: "C-1"; noteValue: 0;}
                }
            }
            Label{
                text: "To"
            }
            ComboBox{
                id: toComboBox
                currentIndex: 67
                model: ListModel {
                    id: toNoteList
                    ListElement {text: "G9"; noteValue: 127;}
                    ListElement {text: "F#9/Gb9"; noteValue: 126;}
                    ListElement {text: "F9"; noteValue: 125;}
                    ListElement {text: "E9"; noteValue: 124;}
                    ListElement {text: "D#9/Eb9"; noteValue: 123;}
                    ListElement {text: "D9"; noteValue: 122;}
                    ListElement {text: "C#9/Db9"; noteValue: 121;}
                    ListElement {text: "C9"; noteValue: 120;}
                    ListElement {text: "B8"; noteValue: 119;}
                    ListElement {text: "A#8/Bb8"; noteValue: 118;}
                    ListElement {text: "A8"; noteValue: 117;}
                    ListElement {text: "G#8/Ab8"; noteValue: 116;}
                    ListElement {text: "G8"; noteValue: 115;}
                    ListElement {text: "F#8/Gb8"; noteValue: 114;}
                    ListElement {text: "F8"; noteValue: 113;}
                    ListElement {text: "E8"; noteValue: 112;}
                    ListElement {text: "D#8/Eb8"; noteValue: 111;}
                    ListElement {text: "D8"; noteValue: 110;}
                    ListElement {text: "C#8/Db8"; noteValue: 109;}
                    ListElement {text: "C8"; noteValue: 108;}
                    ListElement {text: "B7"; noteValue: 107;}
                    ListElement {text: "A#7/Bb7"; noteValue: 106;}
                    ListElement {text: "A7"; noteValue: 105;}
                    ListElement {text: "G#7/Ab7"; noteValue: 104;}
                    ListElement {text: "G7"; noteValue: 103;}
                    ListElement {text: "F#7/Gb7"; noteValue: 102;}
                    ListElement {text: "F7"; noteValue: 101;}
                    ListElement {text: "E7"; noteValue: 100;}
                    ListElement {text: "D#7/Eb7"; noteValue: 99;}
                    ListElement {text: "D7"; noteValue: 98;}
                    ListElement {text: "C#7/Db7"; noteValue: 97;}
                    ListElement {text: "C7"; noteValue: 96;}
                    ListElement {text: "B6"; noteValue: 95;}
                    ListElement {text: "A#6/Bb6"; noteValue: 94;}
                    ListElement {text: "A6"; noteValue: 93;}
                    ListElement {text: "G#6/Ab6"; noteValue: 92;}
                    ListElement {text: "G6"; noteValue: 91;}
                    ListElement {text: "F#6/Gb6"; noteValue: 90;}
                    ListElement {text: "F6"; noteValue: 89;}
                    ListElement {text: "E6"; noteValue: 88;}
                    ListElement {text: "D#6/Eb6"; noteValue: 87;}
                    ListElement {text: "D6"; noteValue: 86;}
                    ListElement {text: "C#6/Db6"; noteValue: 85;}
                    ListElement {text: "C6"; noteValue: 84;}
                    ListElement {text: "B5"; noteValue: 83;}
                    ListElement {text: "A#5/Bb5"; noteValue: 82;}
                    ListElement {text: "A5"; noteValue: 81;}
                    ListElement {text: "G#5/Ab5"; noteValue: 80;}
                    ListElement {text: "G5"; noteValue: 79;}
                    ListElement {text: "F#5/Gb5"; noteValue: 78;}
                    ListElement {text: "F5"; noteValue: 77;}
                    ListElement {text: "E5"; noteValue: 76;}
                    ListElement {text: "D#5/Eb5"; noteValue: 75;}
                    ListElement {text: "D5"; noteValue: 74;}
                    ListElement {text: "C#5/Db5"; noteValue: 73;}
                    ListElement {text: "C5"; noteValue: 72;}
                    ListElement {text: "B4"; noteValue: 71;}
                    ListElement {text: "A#4/Bb4"; noteValue: 70;}
                    ListElement {text: "A4 concert pitch"; noteValue: 69;}
                    ListElement {text: "G#4/Ab4"; noteValue: 68;}
                    ListElement {text: "G4"; noteValue: 67;}
                    ListElement {text: "F#4/Gb4"; noteValue: 66;}
                    ListElement {text: "F4"; noteValue: 65;}
                    ListElement {text: "E4"; noteValue: 64;}
                    ListElement {text: "D#4/Eb4"; noteValue: 63;}
                    ListElement {text: "D4"; noteValue: 62;}
                    ListElement {text: "C#4/Db4"; noteValue: 61;}
                    ListElement {text: "C4 (middle C)"; noteValue: 60;}
                    ListElement {text: "B3"; noteValue: 59;}
                    ListElement {text: "A#3/Bb3"; noteValue: 58;}
                    ListElement {text: "A3"; noteValue: 57;}
                    ListElement {text: "G#3/Ab3"; noteValue: 56;}
                    ListElement {text: "G3"; noteValue: 55;}
                    ListElement {text: "F#3/Gb3"; noteValue: 54;}
                    ListElement {text: "F3"; noteValue: 53;}
                    ListElement {text: "E3"; noteValue: 52;}
                    ListElement {text: "D#3/Eb3"; noteValue: 51;}
                    ListElement {text: "D3"; noteValue: 50;}
                    ListElement {text: "C#3/Db3"; noteValue: 49;}
                    ListElement {text: "C3"; noteValue: 48;}
                    ListElement {text: "B2"; noteValue: 47;}
                    ListElement {text: "A#2/Bb2"; noteValue: 46;}
                    ListElement {text: "A2"; noteValue: 45;}
                    ListElement {text: "G#2/Ab2"; noteValue: 44;}
                    ListElement {text: "G2"; noteValue: 43;}
                    ListElement {text: "F#2/Gb2"; noteValue: 42;}
                    ListElement {text: "F2"; noteValue: 41;}
                    ListElement {text: "E2"; noteValue: 40;}
                    ListElement {text: "D#2/Eb2"; noteValue: 39;}
                    ListElement {text: "D2"; noteValue: 38;}
                    ListElement {text: "C#2/Db2"; noteValue: 37;}
                    ListElement {text: "C2"; noteValue: 36;}
                    ListElement {text: "B1"; noteValue: 35;}
                    ListElement {text: "A#1/Bb1"; noteValue: 34;}
                    ListElement {text: "A1"; noteValue: 33;}
                    ListElement {text: "G#1/Ab1"; noteValue: 32;}
                    ListElement {text: "G1"; noteValue: 31;}
                    ListElement {text: "F#1/Gb1"; noteValue: 30;}
                    ListElement {text: "F1"; noteValue: 29;}
                    ListElement {text: "E1"; noteValue: 28;}
                    ListElement {text: "D#1/Eb1"; noteValue: 27;}
                    ListElement {text: "D1"; noteValue: 26;}
                    ListElement {text: "C#1/Db1"; noteValue: 25;}
                    ListElement {text: "C1"; noteValue: 24;}
                    ListElement {text: "B0"; noteValue: 23;}
                    ListElement {text: "A#0/Bb0"; noteValue: 22;}
                    ListElement {text: "A0"; noteValue: 21;}
                    ListElement {text: "G#"; noteValue: 20;}
                    ListElement {text: "G"; noteValue: 19;}
                    ListElement {text: "F#"; noteValue: 18;}
                    ListElement {text: "F"; noteValue: 17;}
                    ListElement {text: "E"; noteValue: 16;}
                    ListElement {text: "D#"; noteValue: 15;}
                    ListElement {text: "D"; noteValue: 14;}
                    ListElement {text: "C#"; noteValue: 13;}
                    ListElement {text: "C0"; noteValue: 12;}
                    ListElement {text: "B"; noteValue: 11;}
                    ListElement {text: "A#"; noteValue: 10;}
                    ListElement {text: "A"; noteValue: 9;}
                    ListElement {text: "G#"; noteValue: 8;}
                    ListElement {text: "G"; noteValue: 7;}
                    ListElement {text: "F#"; noteValue: 6;}
                    ListElement {text: "F"; noteValue: 5;}
                    ListElement {text: "E"; noteValue: 4;}
                    ListElement {text: "D#"; noteValue: 3;}
                    ListElement {text: "D"; noteValue: 2;}
                    ListElement {text: "C#"; noteValue: 1;}
                    ListElement {text: "C-1"; noteValue: 0;}
                }
            }
            Label{
                text: "How many notes"
            }
            SpinBox {
                id: quantitySpinBox
                minimumValue: 0
                maximumValue: 9999
                value: 16
                stepSize: 1
            }
        }
        RowLayout{
            spacing: 3
            anchors.margins: 10
            // layouts are a nightmare to get right
            // im hacking my way through,
            // it works, looks OK, im leaving it
            anchors.topMargin: -40
            Layout.topMargin: -40
            Button {
                Layout.fillWidth: true
                Layout.margins: 10
                id : buttonGenerate
                text: qsTr("Apply")
                onClicked: {
                    generateNotes();
                }
            }
            Button {
                Layout.fillWidth: true
                Layout.margins: 10
                id : buttonCancel
                text: qsTr("Cancel")
                onClicked: {
                    quit();
                }
            }
        }
    }
}