import 'package:codigo2_alerta/models/news_model.dart';
import 'package:codigo2_alerta/services/api_service.dart';
import 'package:codigo2_alerta/ui/general/colors.dart';
import 'package:codigo2_alerta/ui/pages/news_register_page.dart';
import 'package:codigo2_alerta/ui/widgets/general_widget.dart';
import 'package:codigo2_alerta/ui/widgets/textfield_custom_widget.dart';
import 'package:flutter/material.dart';

class NewsPage extends StatelessWidget {

  ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => NewsRegisterPage()));
        },
        child: Icon(Icons.add),
        backgroundColor: kBrandPrimaryColor,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text(
                "Listado de Noticias",
                style: TextStyle(
                  color: kFontPrimaryColor.withOpacity(0.80),
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              spacing10,
              FutureBuilder(
                future: apiService.getNews(),
                builder: (BuildContext context, AsyncSnapshot snap){
                  if(snap.hasData){
                    List<NewsModel> listData = snap.data;
                    return Expanded(
                      child: ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        itemCount: listData.length,
                        separatorBuilder: (context, index) => const Divider(
                          indent: 12.0,
                          endIndent: 12.0,
                        ),
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: CircleAvatar(
                              //listData[index].imagen
                              backgroundImage: NetworkImage('http://alertahunter.herokuapp.com/media/Noticias/a095794c-e20c-46a5-b22d-d6fe1d2ff39f2334394827426882235.jpg'),
                            ),
                            title: Text(
                              listData[index].titulo,
                              style: TextStyle(
                                  color: kFontPrimaryColor.withOpacity(0.80),
                                  fontSize: 15.0
                              ),
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                spacing3,
                                Text(
                                  "Fecha: ${listData[index].fecha}",
                                  style: TextStyle(
                                      color: kFontPrimaryColor.withOpacity(0.55),
                                      fontSize: 13.0
                                  ),
                                ),
                                spacing3,
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