// Author: Rey (https://github.com/Reyuu)

import MuseScore 3.0
import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Layouts

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
                textRole: "name"
                valueRole: "noteValue"
                model: ListModel {
                    id: fromNoteList
                    // i didn't type this shit out, don't worry
                    ListElement {name:"G9"; noteValue: 127;}
                    ListElement {name:"F#9/Gb9"; noteValue: 126;}
                    ListElement {name:"F9"; noteValue: 125;}
                    ListElement {name:"E9"; noteValue: 124;}
                    ListElement {name:"D#9/Eb9"; noteValue: 123;}
                    ListElement {name:"D9"; noteValue: 122;}
                    ListElement {name:"C#9/Db9"; noteValue: 121;}
                    ListElement {name:"C9"; noteValue: 120;}
                    ListElement {name:"B8"; noteValue: 119;}
                    ListElement {name:"A#8/Bb8"; noteValue: 118;}
                    ListElement {name:"A8"; noteValue: 117;}
                    ListElement {name:"G#8/Ab8"; noteValue: 116;}
                    ListElement {name:"G8"; noteValue: 115;}
                    ListElement {name:"F#8/Gb8"; noteValue: 114;}
                    ListElement {name:"F8"; noteValue: 113;}
                    ListElement {name:"E8"; noteValue: 112;}
                    ListElement {name:"D#8/Eb8"; noteValue: 111;}
                    ListElement {name:"D8"; noteValue: 110;}
                    ListElement {name:"C#8/Db8"; noteValue: 109;}
                    ListElement {name:"C8"; noteValue: 108;}
                    ListElement {name:"B7"; noteValue: 107;}
                    ListElement {name:"A#7/Bb7"; noteValue: 106;}
                    ListElement {name:"A7"; noteValue: 105;}
                    ListElement {name:"G#7/Ab7"; noteValue: 104;}
                    ListElement {name:"G7"; noteValue: 103;}
                    ListElement {name:"F#7/Gb7"; noteValue: 102;}
                    ListElement {name:"F7"; noteValue: 101;}
                    ListElement {name:"E7"; noteValue: 100;}
                    ListElement {name:"D#7/Eb7"; noteValue: 99;}
                    ListElement {name:"D7"; noteValue: 98;}
                    ListElement {name:"C#7/Db7"; noteValue: 97;}
                    ListElement {name:"C7"; noteValue: 96;}
                    ListElement {name:"B6"; noteValue: 95;}
                    ListElement {name:"A#6/Bb6"; noteValue: 94;}
                    ListElement {name:"A6"; noteValue: 93;}
                    ListElement {name:"G#6/Ab6"; noteValue: 92;}
                    ListElement {name:"G6"; noteValue: 91;}
                    ListElement {name:"F#6/Gb6"; noteValue: 90;}
                    ListElement {name:"F6"; noteValue: 89;}
                    ListElement {name:"E6"; noteValue: 88;}
                    ListElement {name:"D#6/Eb6"; noteValue: 87;}
                    ListElement {name:"D6"; noteValue: 86;}
                    ListElement {name:"C#6/Db6"; noteValue: 85;}
                    ListElement {name:"C6"; noteValue: 84;}
                    ListElement {name:"B5"; noteValue: 83;}
                    ListElement {name:"A#5/Bb5"; noteValue: 82;}
                    ListElement {name:"A5"; noteValue: 81;}
                    ListElement {name:"G#5/Ab5"; noteValue: 80;}
                    ListElement {name:"G5"; noteValue: 79;}
                    ListElement {name:"F#5/Gb5"; noteValue: 78;}
                    ListElement {name:"F5"; noteValue: 77;}
                    ListElement {name:"E5"; noteValue: 76;}
                    ListElement {name:"D#5/Eb5"; noteValue: 75;}
                    ListElement {name:"D5"; noteValue: 74;}
                    ListElement {name:"C#5/Db5"; noteValue: 73;}
                    ListElement {name:"C5"; noteValue: 72;}
                    ListElement {name:"B4"; noteValue: 71;}
                    ListElement {name:"A#4/Bb4"; noteValue: 70;}
                    ListElement {name:"A4 concert pitch"; noteValue: 69;}
                    ListElement {name:"G#4/Ab4"; noteValue: 68;}
                    ListElement {name:"G4"; noteValue: 67;}
                    ListElement {name:"F#4/Gb4"; noteValue: 66;}
                    ListElement {name:"F4"; noteValue: 65;}
                    ListElement {name:"E4"; noteValue: 64;}
                    ListElement {name:"D#4/Eb4"; noteValue: 63;}
                    ListElement {name:"D4"; noteValue: 62;}
                    ListElement {name:"C#4/Db4"; noteValue: 61;}
                    ListElement {name:"C4 (middle C)"; noteValue: 60;}
                    ListElement {name:"B3"; noteValue: 59;}
                    ListElement {name:"A#3/Bb3"; noteValue: 58;}
                    ListElement {name:"A3"; noteValue: 57;}
                    ListElement {name:"G#3/Ab3"; noteValue: 56;}
                    ListElement {name:"G3"; noteValue: 55;}
                    ListElement {name:"F#3/Gb3"; noteValue: 54;}
                    ListElement {name:"F3"; noteValue: 53;}
                    ListElement {name:"E3"; noteValue: 52;}
                    ListElement {name:"D#3/Eb3"; noteValue: 51;}
                    ListElement {name:"D3"; noteValue: 50;}
                    ListElement {name:"C#3/Db3"; noteValue: 49;}
                    ListElement {name:"C3"; noteValue: 48;}
                    ListElement {name:"B2"; noteValue: 47;}
                    ListElement {name:"A#2/Bb2"; noteValue: 46;}
                    ListElement {name:"A2"; noteValue: 45;}
                    ListElement {name:"G#2/Ab2"; noteValue: 44;}
                    ListElement {name:"G2"; noteValue: 43;}
                    ListElement {name:"F#2/Gb2"; noteValue: 42;}
                    ListElement {name:"F2"; noteValue: 41;}
                    ListElement {name:"E2"; noteValue: 40;}
                    ListElement {name:"D#2/Eb2"; noteValue: 39;}
                    ListElement {name:"D2"; noteValue: 38;}
                    ListElement {name:"C#2/Db2"; noteValue: 37;}
                    ListElement {name:"C2"; noteValue: 36;}
                    ListElement {name:"B1"; noteValue: 35;}
                    ListElement {name:"A#1/Bb1"; noteValue: 34;}
                    ListElement {name:"A1"; noteValue: 33;}
                    ListElement {name:"G#1/Ab1"; noteValue: 32;}
                    ListElement {name:"G1"; noteValue: 31;}
                    ListElement {name:"F#1/Gb1"; noteValue: 30;}
                    ListElement {name:"F1"; noteValue: 29;}
                    ListElement {name:"E1"; noteValue: 28;}
                    ListElement {name:"D#1/Eb1"; noteValue: 27;}
                    ListElement {name:"D1"; noteValue: 26;}
                    ListElement {name:"C#1/Db1"; noteValue: 25;}
                    ListElement {name:"C1"; noteValue: 24;}
                    ListElement {name:"B0"; noteValue: 23;}
                    ListElement {name:"A#0/Bb0"; noteValue: 22;}
                    ListElement {name:"A0"; noteValue: 21;}
                    ListElement {name:"G#"; noteValue: 20;}
                    ListElement {name:"G"; noteValue: 19;}
                    ListElement {name:"F#"; noteValue: 18;}
                    ListElement {name:"F"; noteValue: 17;}
                    ListElement {name:"E"; noteValue: 16;}
                    ListElement {name:"D#"; noteValue: 15;}
                    ListElement {name:"D"; noteValue: 14;}
                    ListElement {name:"C#"; noteValue: 13;}
                    ListElement {name:"C0"; noteValue: 12;}
                    ListElement {name:"B"; noteValue: 11;}
                    ListElement {name:"A#"; noteValue: 10;}
                    ListElement {name:"A"; noteValue: 9;}
                    ListElement {name:"G#"; noteValue: 8;}
                    ListElement {name:"G"; noteValue: 7;}
                    ListElement {name:"F#"; noteValue: 6;}
                    ListElement {name:"F"; noteValue: 5;}
                    ListElement {name:"E"; noteValue: 4;}
                    ListElement {name:"D#"; noteValue: 3;}
                    ListElement {name:"D"; noteValue: 2;}
                    ListElement {name:"C#"; noteValue: 1;}
                    ListElement {name:"C-1"; noteValue: 0;}
                }
            }
            Label{
                text: "To"
            }
            ComboBox{
                id: toComboBox
                currentIndex: 67
                textRole: "name"
                valueRole: "noteValue"
                model: ListModel {
                    id: toNoteList
                    ListElement {name:"G9"; noteValue: 127;}
                    ListElement {name:"F#9/Gb9"; noteValue: 126;}
                    ListElement {name:"F9"; noteValue: 125;}
                    ListElement {name:"E9"; noteValue: 124;}
                    ListElement {name:"D#9/Eb9"; noteValue: 123;}
                    ListElement {name:"D9"; noteValue: 122;}
                    ListElement {name:"C#9/Db9"; noteValue: 121;}
                    ListElement {name:"C9"; noteValue: 120;}
                    ListElement {name:"B8"; noteValue: 119;}
                    ListElement {name:"A#8/Bb8"; noteValue: 118;}
                    ListElement {name:"A8"; noteValue: 117;}
                    ListElement {name:"G#8/Ab8"; noteValue: 116;}
                    ListElement {name:"G8"; noteValue: 115;}
                    ListElement {name:"F#8/Gb8"; noteValue: 114;}
                    ListElement {name:"F8"; noteValue: 113;}
                    ListElement {name:"E8"; noteValue: 112;}
                    ListElement {name:"D#8/Eb8"; noteValue: 111;}
                    ListElement {name:"D8"; noteValue: 110;}
                    ListElement {name:"C#8/Db8"; noteValue: 109;}
                    ListElement {name:"C8"; noteValue: 108;}
                    ListElement {name:"B7"; noteValue: 107;}
                    ListElement {name:"A#7/Bb7"; noteValue: 106;}
                    ListElement {name:"A7"; noteValue: 105;}
                    ListElement {name:"G#7/Ab7"; noteValue: 104;}
                    ListElement {name:"G7"; noteValue: 103;}
                    ListElement {name:"F#7/Gb7"; noteValue: 102;}
                    ListElement {name:"F7"; noteValue: 101;}
                    ListElement {name:"E7"; noteValue: 100;}
                    ListElement {name:"D#7/Eb7"; noteValue: 99;}
                    ListElement {name:"D7"; noteValue: 98;}
                    ListElement {name:"C#7/Db7"; noteValue: 97;}
                    ListElement {name:"C7"; noteValue: 96;}
                    ListElement {name:"B6"; noteValue: 95;}
                    ListElement {name:"A#6/Bb6"; noteValue: 94;}
                    ListElement {name:"A6"; noteValue: 93;}
                    ListElement {name:"G#6/Ab6"; noteValue: 92;}
                    ListElement {name:"G6"; noteValue: 91;}
                    ListElement {name:"F#6/Gb6"; noteValue: 90;}
                    ListElement {name:"F6"; noteValue: 89;}
                    ListElement {name:"E6"; noteValue: 88;}
                    ListElement {name:"D#6/Eb6"; noteValue: 87;}
                    ListElement {name:"D6"; noteValue: 86;}
                    ListElement {name:"C#6/Db6"; noteValue: 85;}
                    ListElement {name:"C6"; noteValue: 84;}
                    ListElement {name:"B5"; noteValue: 83;}
                    ListElement {name:"A#5/Bb5"; noteValue: 82;}
                    ListElement {name:"A5"; noteValue: 81;}
                    ListElement {name:"G#5/Ab5"; noteValue: 80;}
                    ListElement {name:"G5"; noteValue: 79;}
                    ListElement {name:"F#5/Gb5"; noteValue: 78;}
                    ListElement {name:"F5"; noteValue: 77;}
                    ListElement {name:"E5"; noteValue: 76;}
                    ListElement {name:"D#5/Eb5"; noteValue: 75;}
                    ListElement {name:"D5"; noteValue: 74;}
                    ListElement {name:"C#5/Db5"; noteValue: 73;}
                    ListElement {name:"C5"; noteValue: 72;}
                    ListElement {name:"B4"; noteValue: 71;}
                    ListElement {name:"A#4/Bb4"; noteValue: 70;}
                    ListElement {name:"A4 concert pitch"; noteValue: 69;}
                    ListElement {name:"G#4/Ab4"; noteValue: 68;}
                    ListElement {name:"G4"; noteValue: 67;}
                    ListElement {name:"F#4/Gb4"; noteValue: 66;}
                    ListElement {name:"F4"; noteValue: 65;}
                    ListElement {name:"E4"; noteValue: 64;}
                    ListElement {name:"D#4/Eb4"; noteValue: 63;}
                    ListElement {name:"D4"; noteValue: 62;}
                    ListElement {name:"C#4/Db4"; noteValue: 61;}
                    ListElement {name:"C4 (middle C)"; noteValue: 60;}
                    ListElement {name:"B3"; noteValue: 59;}
                    ListElement {name:"A#3/Bb3"; noteValue: 58;}
                    ListElement {name:"A3"; noteValue: 57;}
                    ListElement {name:"G#3/Ab3"; noteValue: 56;}
                    ListElement {name:"G3"; noteValue: 55;}
                    ListElement {name:"F#3/Gb3"; noteValue: 54;}
                    ListElement {name:"F3"; noteValue: 53;}
                    ListElement {name:"E3"; noteValue: 52;}
                    ListElement {name:"D#3/Eb3"; noteValue: 51;}
                    ListElement {name:"D3"; noteValue: 50;}
                    ListElement {name:"C#3/Db3"; noteValue: 49;}
                    ListElement {name:"C3"; noteValue: 48;}
                    ListElement {name:"B2"; noteValue: 47;}
                    ListElement {name:"A#2/Bb2"; noteValue: 46;}
                    ListElement {name:"A2"; noteValue: 45;}
                    ListElement {name:"G#2/Ab2"; noteValue: 44;}
                    ListElement {name:"G2"; noteValue: 43;}
                    ListElement {name:"F#2/Gb2"; noteValue: 42;}
                    ListElement {name:"F2"; noteValue: 41;}
                    ListElement {name:"E2"; noteValue: 40;}
                    ListElement {name:"D#2/Eb2"; noteValue: 39;}
                    ListElement {name:"D2"; noteValue: 38;}
                    ListElement {name:"C#2/Db2"; noteValue: 37;}
                    ListElement {name:"C2"; noteValue: 36;}
                    ListElement {name:"B1"; noteValue: 35;}
                    ListElement {name:"A#1/Bb1"; noteValue: 34;}
                    ListElement {name:"A1"; noteValue: 33;}
                    ListElement {name:"G#1/Ab1"; noteValue: 32;}
                    ListElement {name:"G1"; noteValue: 31;}
                    ListElement {name:"F#1/Gb1"; noteValue: 30;}
                    ListElement {name:"F1"; noteValue: 29;}
                    ListElement {name:"E1"; noteValue: 28;}
                    ListElement {name:"D#1/Eb1"; noteValue: 27;}
                    ListElement {name:"D1"; noteValue: 26;}
                    ListElement {name:"C#1/Db1"; noteValue: 25;}
                    ListElement {name:"C1"; noteValue: 24;}
                    ListElement {name:"B0"; noteValue: 23;}
                    ListElement {name:"A#0/Bb0"; noteValue: 22;}
                    ListElement {name:"A0"; noteValue: 21;}
                    ListElement {name:"G#"; noteValue: 20;}
                    ListElement {name:"G"; noteValue: 19;}
                    ListElement {name:"F#"; noteValue: 18;}
                    ListElement {name:"F"; noteValue: 17;}
                    ListElement {name:"E"; noteValue: 16;}
                    ListElement {name:"D#"; noteValue: 15;}
                    ListElement {name:"D"; noteValue: 14;}
                    ListElement {name:"C#"; noteValue: 13;}
                    ListElement {name:"C0"; noteValue: 12;}
                    ListElement {name:"B"; noteValue: 11;}
                    ListElement {name:"A#"; noteValue: 10;}
                    ListElement {name:"A"; noteValue: 9;}
                    ListElement {name:"G#"; noteValue: 8;}
                    ListElement {name:"G"; noteValue: 7;}
                    ListElement {name:"F#"; noteValue: 6;}
                    ListElement {name:"F"; noteValue: 5;}
                    ListElement {name:"E"; noteValue: 4;}
                    ListElement {name:"D#"; noteValue: 3;}
                    ListElement {name:"D"; noteValue: 2;}
                    ListElement {name:"C#"; noteValue: 1;}
                    ListElement {name:"C-1"; noteValue: 0;}
                }
            }
            Label{
                text: "How many notes"
            }
            SpinBox {
                id: quantitySpinBox
                from: 0
                to: 9999
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