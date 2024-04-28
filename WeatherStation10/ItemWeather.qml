import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQml
import Weather 1.0

Rectangle {
    property string timestamp: "2024-xx-xx"
    property string metadataStations0Name: "--.-"
    property string items0Readings0Value: "--.-"
    property string metadataStations1Name: "--.-"
    property string items0Readings1Value: "--.-"
    property string metadataStations2Name: "--.-"
    property string items0Readings2Value: "--.-"
    id:recMain


    height: 400
    width: 320

    Text {
        id: txtDayOfWeek
        anchors.top: recMain.top
        font.pointSize: 18
        font.bold: true
        text: "DATE: " + timestamp
    }


    Button {
        id:butt
        anchors.top: recMain.bottom
        text: "GET data from STATION"
        font.bold: true
        font.pixelSize: 22
        onClicked: {
        appBridge.restAptRequest();
    }
    }

    Rectangle {
            id: recTempertures
            anchors.top: txtDayOfWeek.bottom

// id 0 stations
        Label {
            id: lblmetadataStations0Name
            anchors.top: recTempertures.top
            font.pointSize: 11
            text: "-----------\nlocation: latitude 1.256 longitude 103.679 \nmetadata.stations[0].name: "
        }

        Text {
            id: txtmetadataStations0Name
            anchors.top: lblmetadataStations0Name.bottom
            font.pointSize: 25
            text:  metadataStations0Name
        }

        Label {
            id: lblitems0Readings0Value
            anchors.top: txtmetadataStations0Name.bottom
            font.pointSize: 11
            text: "items[0].readings[0].value: "
        }

        Text {
            id: txtitems0Readings0Value
            anchors.top: lblitems0Readings0Value.bottom
            font.pointSize: 25
            font.bold: true
            text: items0Readings0Value + " °C"
        }

// id 1 stations
        Label {
            id: lblmetadataStations1Name
            anchors.top: txtitems0Readings0Value.bottom
            font.pointSize: 11
            text: "-----------\nlocation: latitude 1.3399 longitude 103.8878 \nmetadata.stations[1].name: "
        }

        Text {
            id: txtmetadataStations1Name
            anchors.top: lblmetadataStations1Name.bottom
            font.pointSize: 25
            text: metadataStations1Name
        }

        Label {
            id: lblitems0Readings1Value
            anchors.top: txtmetadataStations1Name.bottom
            font.pointSize: 11
            text: "items[1].readings[1].value: "
        }

        Text {
            id: txtitems0Readings1Value
            anchors.top: lblitems0Readings1Value.bottom
            font.pointSize: 25
            font.bold: true
            text:   items0Readings1Value + " °C"
        }

// id 1 stations
        Label {
            id: lblmetadataStations2Name
            anchors.top: txtitems0Readings1Value.bottom
            font.pointSize: 11
            text: "-----------\nlocation: latitude 1.44387 longitude 103.78538 \nmetadata.stations[2].name: "
        }

        Text {
            id: txtmetadataStations2Name
            anchors.top: lblmetadataStations2Name.bottom
            font.pointSize: 25
            text: metadataStations2Name
        }

        Label {
            id: lblitems0Readings2Value
            anchors.top: txtmetadataStations2Name.bottom
            font.pointSize: 11
            text: "items[0].readings[2].value: "
        }

        Text {
            id: txtitems0Readings2Value
            anchors.top: lblitems0Readings2Value.bottom
            font.pointSize: 25
            font.bold: true
            text:   items0Readings2Value  + " °C"
        }

    }


    Connections {
        target: appBridge

        function onDataChanged()
        {
            // 229	Weather	SG Weather	Realtime weather readings for Singapore
            // https://api.data.gov.sg/v1/environment/air-temperature

            weather0.timestamp   = appBridge.JsonData.items[0].timestamp;       // items[0].timestamp;

            weather0.metadataStations0Name     = appBridge.JsonData.items[0].readings[0].value;
            weather0.items0Readings0Value     = appBridge.JsonData.metadata.stations[0].name;

            weather0.items0Readings1Value     = appBridge.JsonData.items[0].readings[1].value;
            weather0.metadataStations1Name     = appBridge.JsonData.metadata.stations[1].name;

            weather0.items0Readings2Value     = appBridge.JsonData.items[0].readings[2].value;
            weather0.metadataStations2Name     = appBridge.JsonData.metadata.stations[2].name;

        // https://api.citybik.es/v2/networks

        // parsed https://mixedanalytics.com/blog/list-actually-free-open-no-auth-needed-apis/

        //https://status.digitalocean.com/api/v2/summary.json
        // weather0.dayOfWeek   = appBridge.JsonData.components[10].created_at;
        // weather0.tempMin     = appBridge.JsonData.components[71].page_id  ;
        // weather0.tempMax     = appBridge.JsonData.components[33].status;

        //https://api.coincap.io/v2/assets + https://jsonformatter.org/json-parser
        // weather0.dayOfWeek   = appBridge.JsonData.data[0].symbol;
        // weather0.tempMin     = appBridge.JsonData.data[71].marketCapUsd  ;
        // weather0.tempMax     = appBridge.JsonData.data[33].volumeUsd24Hr;

        // https://api.coinbase.com/v2/currencies + https://jsonformatter.org/json-parser
        // weather0.dayOfWeek   = appBridge.JsonData.data[0].id;
        // weather0.tempMin     = appBridge.JsonData.data[171].name  ;
        // weather0.tempMax     = appBridge.JsonData.data[33].min_size;

        // https://jsonformatter.org/json-parser
        //weather0.dayOfWeek   = appBridge.JsonData.bpi.USD.description;// data[0].id;
        //weather0.tempMin     = appBridge.JsonData.bpi.GBP.description  ;
        //weather0.tempMax     = appBridge.JsonData.bpi.EUR.rate_float;

        // https://api.coinbase.com/v2/currencies + https://jsonformatter.org/json-parser
        //weather0.dayOfWeek   = appBridge.JsonData.data[0].id;
        //weather0.tempMin     = appBridge.JsonData.data[0].name  ;
        //weather0.tempMax     = appBridge.JsonData.data[0].min_size;

        //https://api.coindesk.com/v1/bpi/currentprice.json
        //weather0.dayOfWeek   = appBridge.JsonData.time.updated;
        //weather0.tempMin     = appBridge.JsonData.time.updatedISO;
        //weather0.tempMax     = appBridge.JsonData.time.updateduk;

        // http://time.jsontest.com/
        // weather0.tempMin = appBridge.JsonData.date;// .date.value;
        // weather0.tempMax = appBridge.JsonData.milliseconds_since_epoch;

        }
    }

    ApiRest {
        id: appBridge
    }

    MouseArea {
        anchors.fill: parent
        onClicked: {
        appBridge.restAptRequest();
        }
    }
}
