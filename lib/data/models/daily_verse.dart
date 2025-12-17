class DailyVerse {
   final String verse;
   DailyVerse({
     required this.verse,
   });


   factory DailyVerse.fromJson(Map<String, dynamic> json) {
     return DailyVerse(
       verse:json['response']['verse']['text'] as String,
      
     );
   }

}