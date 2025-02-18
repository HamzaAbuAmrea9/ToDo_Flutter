class Task {
  int? id;
  String? title;
  String? note;
  int? isCompleted;
  String? date;
  String? startTime;
  String? endTime;
  int? color;
  int? remind;
  String? repeat;

  Task({
    this.id,
    this.title,
    this.note,
    this.isCompleted,
    this.date,
    this.startTime,
    this.endTime,
    this.color,
    this.remind,
    this.repeat,
  });


   Map<String, dynamic> toJson() { // to json 
    return {
      'id': id,
      'title': title,
      'note': note,
      'date': date,
      'startTime': startTime,
      'endTime': endTime,
      'remind': remind,
      'repeat': repeat,
      'color': color,
      'isCompleted': isCompleted
    };
  }


  Task.fromJson(Map<String, dynamic> json) {  // from json
  id = json['id'];  
  title = json['title'];  
  note = json['note'];  
  isCompleted = json['isCompleted'];  
  date = json['date'];  
  startTime = json['startTime'];  
  endTime = json['endTime'];  
  color = json['color'];  
  remind = json['remind'];  
  repeat = json['repeat'];  
}  
}
