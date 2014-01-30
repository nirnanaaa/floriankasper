library pages;

import 'package:angular/angular.dart';

class Item {
  String title;
  DateTime date;
  String text;
  
  Item([String this.title = '', DateTime this.date = '', String this.text = '']);
  
  clone() { 
    new Item(title,date,text);
  }
  
  clear() {
    title = '';
    date = new DateTime.now();
    text = '';
  }
}

class PagesServer {
  Http _http;

  PagesServer(Http this._http);

  init(PagesController todo) {
    _http(method: 'GET', url: '/pages.json').then((HttpResponse data) {
      data.data.forEach((d) {
        todo.items.add(new Item(d["title"], d["date"], d["text"]));
      });
    });
  }
}



@NgDirective(
  selector: '[pages-controller]',
  publishAs: 'pages'
)
class PagesController {

  List<Item> items;
  
  PagesController(PagesServer serverController) {

    items = [];
    
    serverController.init(this);
  }

  
}