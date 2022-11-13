import 'package:codigo2_alerta/models/incident_model.dart';
import 'package:codigo2_alerta/models/incident_type_model.dart';
import 'package:codigo2_alerta/services/api_service.dart';
import 'package:codigo2_alerta/ui/general/colors.dart';
import 'package:codigo2_alerta/ui/pages/modals/register_incident_modal.dart';
import 'package:codigo2_alerta/ui/widgets/general_widget.dart';
import 'package:flutter/material.dart';

class IncidentPage extends StatefulWidget {
  @override
  State<IncidentPage> createState() => _IncidentPageState();
}

class _IncidentPageState extends State<IncidentPage>
    with TickerProviderStateMixin {

  List<IncidentTypeModel> incidentTypeList = [];
  ApiService apiService = ApiService();

  @override
  initState(){
    super.initState();
    getData();
  }

  Future<void> getData() async{
    incidentTypeList  = await apiService.getIncidentType();
  }


  showAddIncidentModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      transitionAnimationController: AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 350),
      ),
      builder: (BuildContext context) {
        return RegisterIncidentModal(
          incidentTypeList: incidentTypeList,
        );
      },
    ).then((value){
      setState(() {

      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showAddIncidentModal(context);
        },
        backgroundColor: kBrandPrimaryColor,
        child: Icon(Icons.add),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text(
                "Listado de Incidentes",
                style: TextStyle(
                  color: kFontPrimaryColor.withOpacity(0.80),
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              spacing20,
              FutureBuilder(
                future: apiService.getIncident(),
                builder: (BuildContext context, AsyncSnapshot snap) {
                  if (snap.hasData) {
                    List<IncidentModel> listData = snap.data;
                    return Expanded(
                      child: ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        itemCount: listData.length,
                        separatorBuilder: (context, index) => const Divider(),
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(
                              listData[index].tipoIncidente.title,
                              style: TextStyle(
                                  color: kFontPrimaryColor.withOpacity(0.80),
                                  fontSize: 15.0),
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                spacing3,
                                Text(
                                  "Ciudadano: ${listData[index].datosCiudadano.nombres}",
                                  style: TextStyle(
                                      color:
                                          kFontPrimaryColor.withOpacity(0.55),
                                      fontSize: 13.0),
                                ),
                                spacing3,
                                Text(
                                  "Teléfono: ${listData[index].datosCiudadano.telefono}",
                                  style: TextStyle(
                                      color:
                                          kFontPrimaryColor.withOpacity(0.55),
                                      fontSize: 13.0),
                                ),
                              ],
                            ),
                            trailing: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  listData[index].hora,
                                  style: TextStyle(
                                      color:
                                          kFontPrimaryColor.withOpacity(0.55),
                                      fontSize: 13.0),
                                ),
                                spacing3,
                                Text(
                                  listData[index].fecha,
                                  style: TextStyle(
                                      color:
                                          kFontPrimaryColor.withOpacity(0.55),
                                      fontSize: 13.0),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    );
                  }
                  return CircularProgressIndicator();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}