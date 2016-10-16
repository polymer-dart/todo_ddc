int _id = 0;

class TodoDTO {
  int id = _id++;
  bool status;
  String text;

  TodoDTO({this.status: false, this.text});
}

class ModelDTO {
  List<TodoDTO> todos = [];
}

ModelDTO model = new ModelDTO();

ModelDTO getModel() => model;
