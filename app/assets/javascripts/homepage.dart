library homepage;

import 'package:angular/angular.dart';

class Schedule {
  String title;
  DateTime date;
  String text;
  
  Schedule([String this.title = '', DateTime this.date = '', String this.text = '']);
  
  clone() { 
    new Schedule(title,date,text);
  }
  
  clear() {
    title = '';
    date = new DateTime.now();
    text = '';
  }
}

class ServerController {
  Http _http;

  ServerController(Http this._http);

  init(HomepageController todo) {
    _http(method: 'GET', url: '/schedules.json').then((HttpResponse data) {
      data.data.forEach((d) {
        todo.schedules.add(new Schedule(d["title"], d["date"], d["text"]));
      });
    });
  }
}



@NgDirective(
  selector: '[homepage-controller]',
  publishAs: 'homepage'
)
class HomepageController {

  List<Schedule> schedules;
  
  HomepageController(ServerController serverController) {
    schedules = [];
    
    serverController.init(this);
  }

  
}