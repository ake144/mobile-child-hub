import '../models/quiz.dart';

class QuizData {
  static List<Quiz> getQuizzesForStory(String storyId) {
    switch (storyId) {
      case 'adam_eve':
        return _adamEveQuizzes();
      case 'noahs_ark':
        return _noahsArkQuizzes();
      case 'abrahams_call':
        return _abrahamsCallQuizzes();
      case 'joseph_brothers':
        return _josephQuizzes();
      case 'moses_bush':
        return _mosesBushQuizzes();
      case 'ten_plagues':
        return _tenPlaguesQuizzes();
      case 'crossing_red_sea':
        return _redSeaQuizzes();
      case 'ten_commandments':
        return _commandmentsQuizzes();
      case 'aaron_priest':
        return _aaronQuizzes();
      case 'day_atonement':
        return _atonementQuizzes();
      case 'twelve_spies':
        return _spiesQuizzes();
      case 'bronze_serpent':
        return _serpentQuizzes();
      default:
        return [];
    }
  }

  static List<Quiz> _adamEveQuizzes() {
    return [
      Quiz(
        id: 'adam_eve_1',
        storyId: 'adam_eve',
        questionEn: 'What did God use to create Adam?',
        questionAm: 'እግዚአብሔር አዳምን ለመፍጠር ምን ተጠቀመ?',
        optionsEn: ['Water', 'Dust from the ground', 'A rock', 'Light'],
        optionsAm: ['ውሃ', 'ከመሬት አፈር', 'ድንጋይ', 'ብርሃን'],
        correctIndex: 1,
        points: 10,
        hintEn: 'Think about what covers the ground.',
        hintAm: 'መሬቱን ስለሚሸፍነው አስብ።',
      ),
      Quiz(
        id: 'adam_eve_2',
        storyId: 'adam_eve',
        questionEn: 'What was the name of the garden where Adam lived?',
        questionAm: 'አዳም የኖረበት የአትክልት ቦታ ስም ምን ነበር?',
        optionsEn: ['Paradise', 'Eden', 'Heaven', 'Canaan'],
        optionsAm: ['ገነት', 'ኤደን', 'ሰማይ', 'ከነዓን'],
        correctIndex: 1,
        points: 10,
      ),
      Quiz(
        id: 'adam_eve_3',
        storyId: 'adam_eve',
        questionEn: 'Who tricked Eve into eating the forbidden fruit?',
        questionAm: 'ሔዋንን የተከለከለውን ፍሬ እንድትበላ ያታለላት ማን ነው?',
        optionsEn: ['A lion', 'A serpent', 'An eagle', 'A wolf'],
        optionsAm: ['አንበሳ', 'እባብ', 'ንስር', 'ተኩላ'],
        correctIndex: 1,
        points: 10,
      ),
    ];
  }

  static List<Quiz> _noahsArkQuizzes() {
    return [
      Quiz(
        id: 'noah_1',
        storyId: 'noahs_ark',
        questionEn: 'Why did God save Noah?',
        questionAm: 'እግዚአብሔር ኖኅን ለምን አዳነ?',
        optionsEn: ['He was rich', 'He was a good man who loved God', 'He was strong', 'He was a king'],
        optionsAm: ['ሀብታም ስለነበረ', 'እግዚአብሔርን የሚወድ ጥሩ ሰው ስለነበረ', 'ጠንካራ ስለነበረ', 'ንጉሥ ስለነበረ'],
        correctIndex: 1,
        points: 10,
      ),
      Quiz(
        id: 'noah_2',
        storyId: 'noahs_ark',
        questionEn: 'How many days did it rain?',
        questionAm: 'ለስንት ቀናት ዝናብ ዘነበ?',
        optionsEn: ['10 days', '20 days', '40 days', '100 days'],
        optionsAm: ['10 ቀናት', '20 ቀናት', '40 ቀናት', '100 ቀናት'],
        correctIndex: 2,
        points: 10,
      ),
      Quiz(
        id: 'noah_3',
        storyId: 'noahs_ark',
        questionEn: 'What did God put in the sky as a promise?',
        questionAm: 'እግዚአብሔር እንደ ቃል ኪዳን በሰማይ ላይ ምን አደረገ?',
        optionsEn: ['A star', 'A rainbow', 'The sun', 'A cloud'],
        optionsAm: ['ኮከብ', 'ቀስተ ደመና', 'ፀሐይ', 'ደመና'],
        correctIndex: 1,
        points: 10,
      ),
    ];
  }

  static List<Quiz> _abrahamsCallQuizzes() {
    return [
      Quiz(
        id: 'abraham_1',
        storyId: 'abrahams_call',
        questionEn: 'What did God promise Abraham?',
        questionAm: 'እግዚአብሔር ለአብርሃም ምን ቃል ገባ?',
        optionsEn: ['A big house', 'Many descendants like the stars', 'Gold and silver', 'A fast horse'],
        optionsAm: ['ትልቅ ቤት', 'እንደ ከዋክብት ብዙ ዘሮች', 'ወርቅና ብር', 'ፈጣን ፈረስ'],
        correctIndex: 1,
        points: 10,
      ),
      Quiz(
        id: 'abraham_2',
        storyId: 'abrahams_call',
        questionEn: 'What was the name of Abraham\'s son?',
        questionAm: 'የአብርሃም ልጅ ስም ማን ነበር?',
        optionsEn: ['Jacob', 'Moses', 'Isaac', 'David'],
        optionsAm: ['ያዕቆብ', 'ሙሴ', 'ይስሐቅ', 'ዳዊት'],
        correctIndex: 2,
        points: 10,
      ),
    ];
  }

  static List<Quiz> _josephQuizzes() {
    return [
      Quiz(
        id: 'joseph_1',
        storyId: 'joseph_brothers',
        questionEn: 'What special gift did Joseph\'s father give him?',
        questionAm: 'የዮሴፍ አባት ምን ልዩ ስጦታ ሰጠው?',
        optionsEn: ['A sword', 'A colorful coat', 'A horse', 'A crown'],
        optionsAm: ['ሰይፍ', 'ባለብዙ ቀለም ልብስ', 'ፈረስ', 'ዘውድ'],
        correctIndex: 1,
        points: 10,
      ),
      Quiz(
        id: 'joseph_2',
        storyId: 'joseph_brothers',
        questionEn: 'Where did Joseph become a powerful leader?',
        questionAm: 'ዮሴፍ የት ኃያል መሪ ሆነ?',
        optionsEn: ['Canaan', 'Egypt', 'Babylon', 'Israel'],
        optionsAm: ['ከነዓን', 'ግብፅ', 'ባቢሎን', 'እስራኤል'],
        correctIndex: 1,
        points: 10,
      ),
      Quiz(
        id: 'joseph_3',
        storyId: 'joseph_brothers',
        questionEn: 'What did Joseph do when he saw his brothers?',
        questionAm: 'ዮሴፍ ወንድሞቹን ሲያይ ምን አደረገ?',
        optionsEn: ['Punished them', 'Forgave them', 'Ran away', 'Ignored them'],
        optionsAm: ['ቀጣቸው', 'ይቅር አላቸው', 'ሸሸ', 'ችላ አላቸው'],
        correctIndex: 1,
        points: 10,
      ),
    ];
  }

  static List<Quiz> _mosesBushQuizzes() {
    return [
      Quiz(
        id: 'moses_bush_1',
        storyId: 'moses_bush',
        questionEn: 'What was special about the burning bush?',
        questionAm: 'ስለሚነድደው ቁጥቋጦ ልዩ የሆነው ምንድን ነው?',
        optionsEn: ['It was very big', 'It was not burning up', 'It was blue', 'It moved around'],
        optionsAm: ['በጣም ትልቅ ነበር', 'አልተቃጠለም', 'ሰማያዊ ነበር', 'ይንቀሳቀስ ነበር'],
        correctIndex: 1,
        points: 10,
      ),
      Quiz(
        id: 'moses_bush_2',
        storyId: 'moses_bush',
        questionEn: 'What did God tell Moses to do?',
        questionAm: 'እግዚአብሔር ሙሴን ምን እንዲያደርግ ነገረው?',
        optionsEn: ['Build a house', 'Lead the people to freedom', 'Make a garden', 'Write a book'],
        optionsAm: ['ቤት ሥራ', 'ሕዝቡን ወደ ነጻነት መራ', 'የአትክልት ቦታ ሥራ', 'መጽሐፍ ጻፍ'],
        correctIndex: 1,
        points: 10,
      ),
    ];
  }

  static List<Quiz> _tenPlaguesQuizzes() {
    return [
      Quiz(
        id: 'plagues_1',
        storyId: 'ten_plagues',
        questionEn: 'How many plagues did God send?',
        questionAm: 'እግዚአብሔር ስንት መቅሠፍቶችን ላከ?',
        optionsEn: ['5', '10', '7', '12'],
        optionsAm: ['5', '10', '7', '12'],
        correctIndex: 1,
        points: 10,
      ),
      Quiz(
        id: 'plagues_2',
        storyId: 'ten_plagues',
        questionEn: 'What did the Israelites put on their doors?',
        questionAm: 'እስራኤላውያን በበራቸው ላይ ምን አደረጉ?',
        optionsEn: ['Water', 'Oil', 'Lamb\'s blood', 'Paint'],
        optionsAm: ['ውሃ', 'ዘይት', 'የበግ ደም', 'ቀለም'],
        correctIndex: 2,
        points: 10,
      ),
    ];
  }

  static List<Quiz> _redSeaQuizzes() {
    return [
      Quiz(
        id: 'red_sea_1',
        storyId: 'crossing_red_sea',
        questionEn: 'What did Moses stretch over the sea?',
        questionAm: 'ሙሴ በባሕሩ ላይ ምን ዘረጋ?',
        optionsEn: ['His hand', 'His staff', 'A rope', 'A blanket'],
        optionsAm: ['እጁን', 'በትሩን', 'ገመድ', 'ብርድ ልብስ'],
        correctIndex: 1,
        points: 10,
      ),
      Quiz(
        id: 'red_sea_2',
        storyId: 'crossing_red_sea',
        questionEn: 'What happened when the Israelites walked through?',
        questionAm: 'እስራኤላውያን ሲሻገሩ ምን ሆነ?',
        optionsEn: ['They got wet', 'The water became walls', 'Fish jumped', 'It started raining'],
        optionsAm: ['ተረጠቡ', 'ውሃው ግድግዳ ሆነ', 'ዓሣ ዘለሉ', 'ዝናብ ጀመረ'],
        correctIndex: 1,
        points: 10,
      ),
    ];
  }

  static List<Quiz> _commandmentsQuizzes() {
    return [
      Quiz(
        id: 'commands_1',
        storyId: 'ten_commandments',
        questionEn: 'Where did Moses receive the commandments?',
        questionAm: 'ሙሴ ትእዛዛቱን የት ተቀበለ?',
        optionsEn: ['In a cave', 'On Mount Sinai', 'By a river', 'In Egypt'],
        optionsAm: ['በዋሻ', 'በሲና ተራራ', 'ከወንዝ ዳር', 'በግብፅ'],
        correctIndex: 1,
        points: 10,
      ),
      Quiz(
        id: 'commands_2',
        storyId: 'ten_commandments',
        questionEn: 'How many commandments did God give?',
        questionAm: 'እግዚአብሔር ስንት ትእዛዛት ሰጠ?',
        optionsEn: ['5', '7', '10', '12'],
        optionsAm: ['5', '7', '10', '12'],
        correctIndex: 2,
        points: 10,
      ),
    ];
  }

  static List<Quiz> _aaronQuizzes() {
    return [
      Quiz(
        id: 'aaron_1',
        storyId: 'aaron_priest',
        questionEn: 'Who was Aaron?',
        questionAm: 'አሮን ማን ነበር?',
        optionsEn: ['Moses\' son', 'Moses\' brother', 'Moses\' friend', 'A king'],
        optionsAm: ['የሙሴ ልጅ', 'የሙሴ ወንድም', 'የሙሴ ጓደኛ', 'ንጉሥ'],
        correctIndex: 1,
        points: 10,
      ),
      Quiz(
        id: 'aaron_2',
        storyId: 'aaron_priest',
        questionEn: 'What special job did God give Aaron?',
        questionAm: 'እግዚአብሔር አሮንን ምን ልዩ ሥራ ሰጠው?',
        optionsEn: ['Builder', 'Soldier', 'High Priest', 'Farmer'],
        optionsAm: ['ገንቢ', 'ወታደር', 'ሊቀ ካህን', 'ገበሬ'],
        correctIndex: 2,
        points: 10,
      ),
    ];
  }

  static List<Quiz> _atonementQuizzes() {
    return [
      Quiz(
        id: 'atonement_1',
        storyId: 'day_atonement',
        questionEn: 'What was the Day of Atonement for?',
        questionAm: 'የስርየት ቀን ለምን ነበር?',
        optionsEn: ['Celebration', 'Forgiving sins', 'Harvest', 'War'],
        optionsAm: ['ድግስ', 'ኃጢአት ለመሰረይ', 'መኸር', 'ጦርነት'],
        correctIndex: 1,
        points: 10,
      ),
      Quiz(
        id: 'atonement_2',
        storyId: 'day_atonement',
        questionEn: 'What happened to the scapegoat?',
        questionAm: 'ለፍየሉ ምን ሆነ?',
        optionsEn: ['It was kept as a pet', 'Sent into the wilderness', 'Given as food', 'Painted'],
        optionsAm: ['እንደ የቤት እንስሳ ተያዘ', 'ወደ ምድረ በዳ ተላከ', 'እንደ ምግብ ተሰጠ', 'ተቀባ'],
        correctIndex: 1,
        points: 10,
      ),
    ];
  }

  static List<Quiz> _spiesQuizzes() {
    return [
      Quiz(
        id: 'spies_1',
        storyId: 'twelve_spies',
        questionEn: 'How many spies trusted God?',
        questionAm: 'ስንት ሰላዮች እግዚአብሔርን አመኑ?',
        optionsEn: ['All 12', 'Only 2', 'None', '6'],
        optionsAm: ['ሁሉም 12', '2 ብቻ', 'ምንም', '6'],
        correctIndex: 1,
        points: 10,
      ),
      Quiz(
        id: 'spies_2',
        storyId: 'twelve_spies',
        questionEn: 'Who were the two faithful spies?',
        questionAm: 'ሁለቱ ታማኝ ሰላዮች እነማን ነበሩ?',
        optionsEn: ['Moses and Aaron', 'Joshua and Caleb', 'David and Goliath', 'Adam and Eve'],
        optionsAm: ['ሙሴና አሮን', 'ኢያሱና ካሌብ', 'ዳዊትና ጎልያድ', 'አዳምና ሔዋን'],
        correctIndex: 1,
        points: 10,
      ),
    ];
  }

  static List<Quiz> _serpentQuizzes() {
    return [
      Quiz(
        id: 'serpent_1',
        storyId: 'bronze_serpent',
        questionEn: 'Why did God send snakes?',
        questionAm: 'እግዚአብሔር እባቦችን ለምን ላከ?',
        optionsEn: ['As pets', 'Because people complained', 'To guard the camp', 'For food'],
        optionsAm: ['እንደ የቤት እንስሳ', 'ሰዎች ስላጉረመረሙ', 'ሰፈሩን ለመጠበቅ', 'ለምግብ'],
        correctIndex: 1,
        points: 10,
      ),
      Quiz(
        id: 'serpent_2',
        storyId: 'bronze_serpent',
        questionEn: 'What material was the serpent made of?',
        questionAm: 'እባቡ ከምን ተሠራ?',
        optionsEn: ['Gold', 'Silver', 'Bronze', 'Wood'],
        optionsAm: ['ወርቅ', 'ብር', 'ነሐስ', 'እንጨት'],
        correctIndex: 2,
        points: 10,
      ),
    ];
  }
}
