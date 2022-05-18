class weather {
  final String name;
  final String description;
  final String icon;
  final double temp;

  weather(
      {this.name = '', this.description = '', this.icon = '', this.temp = 0});

  factory weather.fromJson(Map<String, dynamic> json) {
    return weather(
        name: json['name'] ?? '',
        description: json['weather'][0]['description'] ?? '',
        icon: json['weather'][0]['icon'] ?? '',
        temp: json['main']['temp'] ?? 0);
  }
}

/* 
                          

{
  "weather": [
    {
      "description": "clear sky",
      "icon": "01d"
    }
  ],
  "main": {
    "temp": 282.55,
  },
  "name": "Mountain View",
  }                                                 
*/
