import 'package:belajarflutter/base_model.dart';
import 'package:belajarflutter/mqtt_service.dart';
import 'package:mqtt_client/mqtt_client.dart';

class HomeViewModel extends BaseModel {
  MqttService _mqttService = MqttService();

  var value;
  var pompa;
  var statusTanah;
  
  void initState() async {
    getDataMessage();
    setBusy(false);
  }

  void getMessage() async {
    _mqttService.subscribe('SmartWatering', getDataMessage);
  }

  void getDataMessage() async {
    _mqttService.client!.updates!.listen((List<MqttReceivedMessage<MqttMessage>> c) async {
      final MqttPublishMessage recMess = c[0].payload as MqttPublishMessage;
      final String message = MqttPublishPayload.bytesToStringAsString(recMess.payload.message);
      value = message;
      if (value < 350){
        statusTanah = 'Lembab';
        pompa = 'Off';
      } else if (value > 700){
        statusTanah = 'kering';
        pompa = 'on';
      } else if (value >= 350 && value <= 700){
        statusTanah = 'Normal';
        pompa = 'Off';
      }
      setBusy(false);
    } );
  }
}