import '../models/story.dart';

class StoryData {
  static List<Story> getAllStories() {
    return [
      // Genesis Stories
      _adamAndEve(),
      _noahsArk(),
      _abrahamsCall(),
      _josephAndBrothers(),
      // Exodus Stories
      _mosesAndBush(),
      _tenPlagues(),
      _crossingRedSea(),
      _tenCommandments(),
      // Leviticus Stories
      _aaronHighPriest(),
      _dayOfAtonement(),
      // Numbers Stories
      _twelveSpies(),
      _bronzeSerpent(),
    ];
  }

  static Story _adamAndEve() {
    return Story(
      id: 'adam_eve',
      titleEn: 'Adam and Eve',
      titleAm: 'አዳምና ሔዋን',
      bookEn: 'Genesis',
      bookAm: 'ዘፍጥረት',
      character: 'Adam & Eve',
      imagePath: 'assets/images/stories/adam_eve.png',
      order: 1,
      verseReferences: ['Genesis 2:7-25', 'Genesis 3:1-24'],
      summaryEn: 'God creates the first humans in His image.',
      summaryAm: 'እግዚአብሔር የመጀመሪያዎቹን ሰዎች በአምሳሉ ፈጠረ።',
      contentEn: '''In the beginning, God created everything - the sky, the earth, the animals, and all the plants. But He wanted someone special to take care of His beautiful creation.

So God took some dust from the ground and formed a man. He breathed life into him, and the man became alive! God named him Adam.

God planted a beautiful garden called Eden for Adam to live in. It had every kind of tree with delicious fruit. God told Adam he could eat from any tree except one - the Tree of Knowledge of Good and Evil.

God saw that Adam was alone and needed a helper. So while Adam slept, God took one of his ribs and made a woman named Eve. Adam was so happy!

But one day, a sneaky serpent tricked Eve into eating the forbidden fruit. She gave some to Adam too. Suddenly, they felt ashamed and hid from God.

God found them and was sad they had disobeyed. They had to leave the beautiful garden. But God still loved them and promised to always take care of them.''',
      contentAm: '''በመጀመሪያ እግዚአብሔር ሁሉንም ነገር ፈጠረ - ሰማይን፣ ምድርን፣ እንስሳትንና ሁሉንም ተክሎች። ነገር ግን ቆንጆ ፍጥረቱን የሚንከባከብ ልዩ ሰው ፈለገ።

ስለዚህ እግዚአብሔር ከመሬት አፈር ወስዶ ሰውን አበጀ። ሕይወት እፍ አለበት፣ ሰውም ሕያው ሆነ! እግዚአብሔር አዳም ብሎ ሰየመው።

እግዚአብሔር አዳም የሚኖርበት ኤደን የሚባል ቆንጆ የአትክልት ቦታ ተከለ። ጣፋጭ ፍሬ ያላቸው ልዩ ልዩ ዛፎች ነበሩበት።

ነገር ግን አንድ ቀን ተንኮለኛ እባብ ሔዋንን የተከለከለውን ፍሬ እንድትበላ አታለላት። ለአዳምም ሰጠችው። ወዲያውኑ አፈሩና ከእግዚአብሔር ተደበቁ።

እግዚአብሔር አገኛቸውና ስላልታዘዙ አዘነ። ከቆንጆው የአትክልት ቦታ መውጣት ነበረባቸው። ነገር ግን እግዚአብሔር አሁንም ይወዳቸው ነበር።''',
    );
  }

  static Story _noahsArk() {
    return Story(
      id: 'noahs_ark',
      titleEn: "Noah's Ark",
      titleAm: 'የኖኅ መርከብ',
      bookEn: 'Genesis',
      bookAm: 'ዘፍጥረት',
      character: 'Noah',
      imagePath: 'assets/images/stories/noahs_ark.png',
      order: 2,
      verseReferences: ['Genesis 6:9-22', 'Genesis 7:1-24', 'Genesis 8:1-22'],
      summaryEn: 'Noah builds an ark to save his family and the animals.',
      summaryAm: 'ኖኅ ቤተሰቡንና እንስሳትን ለማዳን መርከብ ሠራ።',
      contentEn: '''Long ago, people on earth became very wicked. They were mean and did bad things. This made God very sad.

But there was one good man named Noah. He loved God and always tried to do what was right. God was pleased with Noah.

God told Noah, "I will send a great flood to wash away all the wickedness. But I will save you and your family. Build a big boat called an ark!"

Noah obeyed God even though people laughed at him. He worked for many years building the huge ark. It was as big as a football field!

When the ark was ready, God told Noah to bring two of every animal inside - lions, elephants, birds, and more! Then Noah's family went in too.

Rain fell for 40 days and 40 nights. Water covered everything! But Noah's family and all the animals were safe inside the ark.

When the water went down, a dove brought back an olive branch. Noah knew it was safe to leave. He thanked God, and God put a beautiful rainbow in the sky as a promise to never flood the whole earth again.''',
      contentAm: '''ከረጅም ጊዜ በፊት በምድር ላይ ያሉ ሰዎች በጣም ክፉዎች ሆኑ። ጨካኞች ነበሩና መጥፎ ነገሮችን ያደርጉ ነበር። ይህ እግዚአብሔርን በጣም አሳዘነው።

ነገር ግን ኖኅ የሚባል አንድ ጥሩ ሰው ነበር። እግዚአብሔርን ይወድ ነበርና ሁልጊዜ ትክክለኛውን ለማድረግ ይሞክር ነበር።

እግዚአብሔር ለኖኅ፣ "ክፋቱን ሁሉ ለማጠብ ታላቅ ጎርፍ እልካለሁ። ነገር ግን አንተንና ቤተሰብህን አድናለሁ። መርከብ ሥራ!" አለው።

ኖኅ ሰዎች ቢስቁበትም እግዚአብሔርን ታዘዘ። ለብዙ ዓመታት ትልቁን መርከብ እየሠራ ሰራ።

መርከቡ ሲዘጋጅ እግዚአብሔር ኖኅን ከእያንዳንዱ እንስሳ ሁለት ሁለት እንዲያስገባ ነገረው - አንበሶች፣ ዝሆኖች፣ ወፎችና ሌሎችም!

ዝናብ ለ40 ቀንና ለ40 ሌሊት ዘነበ። ውሃ ሁሉንም ሸፈነ! ነገር ግን የኖኅ ቤተሰብ በመርከቡ ውስጥ ደህና ነበሩ።

ውሃው ሲወርድ ርግብ የወይራ ቅርንጫፍ ይዛ ተመለሰች። እግዚአብሔር ደግሞ ምድርን በጎርፍ እንደማያጥለቀልቅ ቃል ኪዳን ሆኖ ቆንጆ ቀስተ ደመና በሰማይ ላይ አደረገ።''',
    );
  }

  static Story _abrahamsCall() {
    return Story(
      id: 'abrahams_call',
      titleEn: "Abraham's Faith",
      titleAm: 'የአብርሃም እምነት',
      bookEn: 'Genesis',
      bookAm: 'ዘፍጥረት',
      character: 'Abraham',
      imagePath: 'assets/images/stories/abraham.png',
      order: 3,
      verseReferences: ['Genesis 12:1-9', 'Genesis 15:1-6', 'Genesis 21:1-7'],
      summaryEn: 'Abraham trusts God and becomes father of many nations.',
      summaryAm: 'አብርሃም እግዚአብሔርን አመነና የብዙ ሕዝቦች አባት ሆነ።',
      contentEn: '''Abraham lived in a place called Ur. One day, God spoke to him with an amazing promise.

"Leave your country and go to a new land I will show you," God said. "I will make you into a great nation, and through you, all people on earth will be blessed!"

Abraham trusted God completely. Even though he was old and had no children, he believed God's promise. He packed up everything and traveled to the land of Canaan with his wife Sarah.

Years passed, and Abraham and Sarah still had no children. But God reminded Abraham of His promise. "Look at the stars," God said. "Your children will be as many as the stars!"

Abraham believed God, and this made God very happy. When Abraham was 100 years old and Sarah was 90, God gave them a baby boy! They named him Isaac, which means "laughter," because Sarah laughed with joy.

Abraham's faith teaches us to trust God even when things seem impossible. God always keeps His promises!''',
      contentAm: '''አብርሃም ዑር በሚባል ቦታ ይኖር ነበር። አንድ ቀን እግዚአብሔር አስደናቂ ቃል ኪዳን ጋር ተናገረው።

"ከአገርህ ውጣና ወደምታሳይህ አዲስ ምድር ሂድ" አለ እግዚአብሔር። "ትልቅ ሕዝብ አደርግሃለሁ፣ በአንተም ምክንያት የምድር ሕዝቦች ሁሉ ይባረካሉ!"

አብርሃም እግዚአብሔርን ሙሉ በሙሉ አመነ። ሽማግሌ ቢሆንም ልጆች ባይኖሩትም የእግዚአብሔርን ቃል ኪዳን አመነ። ሁሉንም ነገር ጠቅልሎ ከሚስቱ ሳራ ጋር ወደ ከነዓን ምድር ተጓዘ።

ዓመታት አለፉ፣ አብርሃምና ሳራ አሁንም ልጆች አልነበሯቸውም። ነገር ግን እግዚአብሔር አብርሃምን ቃል ኪዳኑን አስታወሰው።

አብርሃም እግዚአብሔርን አመነ፣ ይህም እግዚአብሔርን በጣም ደስ አሰኘው። አብርሃም 100 ዓመት ሳራም 90 ዓመት ሲሆናቸው እግዚአብሔር ወንድ ልጅ ሰጣቸው! ይስሐቅ ብለው ሰየሙት፣ ትርጉሙም "ሳቅ" ማለት ነው።''',
    );
  }

  static Story _josephAndBrothers() {
    return Story(
      id: 'joseph_brothers',
      titleEn: 'Joseph and His Brothers',
      titleAm: 'ዮሴፍና ወንድሞቹ',
      bookEn: 'Genesis',
      bookAm: 'ዘፍጥረት',
      character: 'Joseph',
      imagePath: 'assets/images/stories/joseph.png',
      order: 4,
      verseReferences: ['Genesis 37:1-36', 'Genesis 41:1-57', 'Genesis 45:1-15'],
      summaryEn: 'Joseph forgives his brothers and saves his family.',
      summaryAm: 'ዮሴፍ ወንድሞቹን ይቅር አለና ቤተሰቡን አዳነ።',
      contentEn: '''Joseph was one of twelve brothers. His father Jacob loved him very much and gave him a beautiful colorful coat. This made his brothers jealous.

Joseph had special dreams from God. In his dreams, his brothers bowed down to him. This made them even more angry!

One day, the brothers sold Joseph to traders going to Egypt. They told their father a wild animal had killed him. Poor Jacob was heartbroken.

In Egypt, Joseph worked hard and trusted God through many hard times. He even went to prison for something he didn't do! But God was with him.

God gave Joseph the ability to explain dreams. When Pharaoh had a puzzling dream, Joseph explained it meant seven years of plenty followed by seven years of famine. Pharaoh made Joseph the second most powerful person in Egypt!

During the famine, Joseph's brothers came to Egypt for food. They didn't recognize Joseph! But Joseph knew them. Instead of being angry, he forgave them and brought his whole family to live in Egypt.

Joseph said, "You meant it for evil, but God meant it for good!"''',
      contentAm: '''ዮሴፍ ከአሥራ ሁለት ወንድሞች አንዱ ነበር። አባቱ ያዕቆብ በጣም ይወደው ነበርና ቆንጆ ባለብዙ ቀለም ልብስ ሰጠው። ይህ ወንድሞቹን ቀናተኞች አደረጋቸው።

ዮሴፍ ከእግዚአብሔር ልዩ ሕልሞች ነበሩት። በሕልሞቹ ውስጥ ወንድሞቹ ለእርሱ ሰገዱ። ይህ የበለጠ አስቆጣቸው!

አንድ ቀን ወንድሞቹ ዮሴፍን ወደ ግብፅ ለሚሄዱ ነጋዴዎች ሸጡት። ለአባታቸው የዱር እንስሳ እንደገደለው ነገሩት።

በግብፅ ዮሴፍ ጠንክሮ ሠራ በብዙ ከባድ ጊዜያት እግዚአብሔርን አመነ። ባላደረገው ነገር እንኳን ወኅኒ ገባ! ነገር ግን እግዚአብሔር ከእርሱ ጋር ነበር።

እግዚአብሔር ዮሴፍን ሕልሞችን የመተርጎም ችሎታ ሰጠው። ፈርዖን ግራ የሚያጋባ ሕልም ሲኖረው ዮሴፍ ሰባት የብዛት ዓመታት ከዚያም ሰባት የረሃብ ዓመታት እንደሚመጡ ገለጸ። ፈርዖን ዮሴፍን በግብፅ ሁለተኛ ኃያል ሰው አደረገው!

በረሃብ ጊዜ የዮሴፍ ወንድሞች ምግብ ፍለጋ ወደ ግብፅ መጡ። ዮሴፍን አላወቁትም! ነገር ግን ዮሴፍ አወቃቸው። ከመቆጣት ይልቅ ይቅር አላቸውና ቤተሰቡን ሁሉ ወደ ግብፅ አመጣ።''',
    );
  }

  static Story _mosesAndBush() {
    return Story(
      id: 'moses_bush',
      titleEn: 'Moses and the Burning Bush',
      titleAm: 'ሙሴና የሚነድደው ቁጥቋጦ',
      bookEn: 'Exodus',
      bookAm: 'ዘጸአት',
      character: 'Moses',
      imagePath: 'assets/images/stories/moses_bush.png',
      order: 5,
      verseReferences: ['Exodus 3:1-22', 'Exodus 4:1-17'],
      summaryEn: 'God calls Moses through a burning bush.',
      summaryAm: 'እግዚአብሔር ሙሴን በሚነድደው ቁጥቋጦ ጠራው።',
      contentEn: '''Moses was taking care of sheep in the desert when he saw something amazing - a bush that was on fire but wasn't burning up!

Moses went closer to look. Then God spoke from the bush: "Moses! Take off your sandals, for you are standing on holy ground."

God said, "I have seen how my people suffer in Egypt. I am sending you to lead them to freedom!"

Moses was scared. "Who am I to do this?" he asked. "What if they don't believe me?"

God gave Moses special signs - his staff turned into a snake, and his hand became white as snow! God promised to be with Moses and help him.

Moses still felt unsure about speaking. So God said his brother Aaron would help him speak to Pharaoh.

Moses obeyed God and went back to Egypt. With God's help, he would lead his people to freedom!''',
      contentAm: '''ሙሴ በበረሃ በጎች ሲጠብቅ አስደናቂ ነገር አየ - የሚነድድ ነገር ግን የማይቃጠል ቁጥቋጦ!

ሙሴ ለማየት ቀረበ። ከዚያም እግዚአብሔር ከቁጥቋጦው ተናገረ፡ "ሙሴ! ጫማህን አውልቅ፣ የቆምክበት ቦታ ቅዱስ መሬት ነውና።"

እግዚአብሔር፣ "ሕዝቤ በግብፅ እንዴት እንደሚሠቃዩ አይቻለሁ። ወደ ነጻነት እንድትመራቸው እልክሃለሁ!" አለ።

ሙሴ ፈራ። "ይህን ለማድረግ እኔ ማን ነኝ?" ሲል ጠየቀ። "ባያምኑኝስ?"

እግዚአብሔር ሙሴን ልዩ ምልክቶች ሰጠው - በትሩ ወደ እባብ ተለወጠ፣ እጁም እንደ በረዶ ነጭ ሆነ! እግዚአብሔር ከሙሴ ጋር እንደሚሆንና እንደሚረዳው ቃል ገባ።

ሙሴ አሁንም ስለመናገር እርግጠኛ አልነበረም። ስለዚህ እግዚአብሔር ወንድሙ አሮን ለፈርዖን እንዲናገር እንደሚረዳው አለ።

ሙሴ እግዚአብሔርን ታዘዘና ወደ ግብፅ ተመለሰ።''',
    );
  }

  static Story _tenPlagues() {
    return Story(
      id: 'ten_plagues',
      titleEn: 'The Ten Plagues',
      titleAm: 'አሥሩ መቅሠፍቶች',
      bookEn: 'Exodus',
      bookAm: 'ዘጸአት',
      character: 'Moses',
      imagePath: 'assets/images/stories/ten_plagues.png',
      order: 6,
      verseReferences: ['Exodus 7:14-12:30'],
      summaryEn: 'God sends plagues to free His people from Egypt.',
      summaryAm: 'እግዚአብሔር ሕዝቡን ከግብፅ ነጻ ለማውጣት መቅሠፍቶችን ላከ።',
      contentEn: '''Moses went to Pharaoh and said, "God says: Let my people go!" But Pharaoh said no. So God sent ten plagues.

First, the river turned to blood. Then frogs covered Egypt! Next came gnats, then flies. The animals got sick. People got painful sores. Hail destroyed the crops. Locusts ate everything green. Darkness covered the land for three days.

Each time, Pharaoh said he would let the people go, but then he changed his mind.

The last plague was the saddest. God told the Israelites to put lamb's blood on their doors. That night, the angel passed over houses with blood, but took the firstborn from Egyptian homes.

Finally, Pharaoh let the people go! The Israelites left Egypt after 430 years of slavery. They were free at last!

This is why Jewish people celebrate Passover - remembering when God's angel passed over their homes and set them free.''',
      contentAm: '''ሙሴ ወደ ፈርዖን ሄዶ "እግዚአብሔር ሕዝቤን ልቀቅ ይላል!" አለ። ነገር ግን ፈርዖን አልቻልም አለ። ስለዚህ እግዚአብሔር አሥር መቅሠፍቶችን ላከ።

መጀመሪያ ወንዙ ወደ ደም ተለወጠ። ከዚያም እንቁራሪቶች ግብፅን ሸፈኑ! ቀጥሎ ትንኞች መጡ፣ ከዚያም ዝንቦች። እንስሳት ታመሙ። ሰዎች ላይ ቁስሎች ወጡ። በረዶ ሰብሉን አወደመ። አንበጣዎች አረንጓዴውን ሁሉ በሉ። ለሦስት ቀናት ጨለማ ምድሩን ሸፈነ።

በእያንዳንዱ ጊዜ ፈርዖን ሕዝቡን እንደሚለቅ ይናገር ነበር፣ ግን ሃሳቡን ይቀይር ነበር።

የመጨረሻው መቅሠፍት በጣም አሳዛኝ ነበር። እግዚአብሔር እስራኤላውያን በበራቸው ላይ የበግ ደም እንዲቀቡ ነገራቸው።

በመጨረሻ ፈርዖን ሕዝቡን ለቀቃቸው! እስራኤላውያን ከ430 ዓመታት ባርነት በኋላ ግብፅን ለቀቁ። በመጨረሻ ነጻ ወጡ!''',
    );
  }

  static Story _crossingRedSea() {
    return Story(
      id: 'crossing_red_sea',
      titleEn: 'Crossing the Red Sea',
      titleAm: 'ቀይ ባሕርን መሻገር',
      bookEn: 'Exodus',
      bookAm: 'ዘጸአት',
      character: 'Moses',
      imagePath: 'assets/images/stories/red_sea.png',
      order: 7,
      verseReferences: ['Exodus 14:1-31'],
      summaryEn: 'God parts the Red Sea to save His people.',
      summaryAm: 'እግዚአብሔር ሕዝቡን ለማዳን ቀይ ባሕርን ከፈለ።',
      contentEn: '''The Israelites left Egypt, but Pharaoh changed his mind again! He sent his army with horses and chariots to catch them.

The people were trapped! The Red Sea was in front of them, and Pharaoh's army was behind them. Everyone was terrified!

But Moses said, "Don't be afraid! Stand firm and watch God save you today!"

God told Moses to stretch his staff over the sea. Moses obeyed, and something incredible happened - the waters parted! A path of dry land appeared right through the middle of the sea, with walls of water on each side.

All the Israelites walked through safely. When Pharaoh's army tried to follow, Moses stretched out his hand again, and the waters came crashing down on the soldiers.

The people were finally safe! They sang and danced, praising God for the amazing miracle. Miriam led the women in celebration with tambourines.

God had shown His mighty power to save His people!''',
      contentAm: '''እስራኤላውያን ግብፅን ለቀቁ፣ ነገር ግን ፈርዖን እንደገና ሃሳቡን ቀየረ! ሠራዊቱን በፈረሶችና ሰረገሎች ሊይዛቸው ላከ።

ሕዝቡ ተያዙ! ቀይ ባሕር ከፊታቸው ነበር፣ የፈርዖን ሠራዊት ደግሞ ከኋላቸው። ሁሉም በጣም ፈሩ!

ነገር ግን ሙሴ "አትፍሩ! ጸንታችሁ ቁሙ እግዚአብሔር ዛሬ ሲያድናችሁ ተመልከቱ!" አለ።

እግዚአብሔር ሙሴን በትሩን በባሕሩ ላይ እንዲዘረጋ ነገረው። ሙሴ ታዘዘና አስደናቂ ነገር ሆነ - ውሃው ተከፈለ! በባሕሩ መካከል ደረቅ መንገድ ታየ፣ በእያንዳንዱ ጎን የውሃ ግድግዳዎች አሉ።

ሁሉም እስራኤላውያን በሰላም ተሻገሩ። የፈርዖን ሠራዊት ለመከተል ሲሞክሩ ሙሴ እጁን እንደገና ዘረጋ፣ ውሃውም በወታደሮቹ ላይ ወረደ።

ሕዝቡ በመጨረሻ ደህና ሆኑ! ዘመሩና ዘፈኑ፣ እግዚአብሔርን ላስደናቂው ተአምር አመሰገኑ።''',
    );
  }

  static Story _tenCommandments() {
    return Story(
      id: 'ten_commandments',
      titleEn: 'The Ten Commandments',
      titleAm: 'አሥርቱ ትእዛዛት',
      bookEn: 'Exodus',
      bookAm: 'ዘጸአት',
      character: 'Moses',
      imagePath: 'assets/images/stories/ten_commandments.png',
      order: 8,
      verseReferences: ['Exodus 19:1-25', 'Exodus 20:1-17'],
      summaryEn: 'God gives Moses the Ten Commandments.',
      summaryAm: 'እግዚአብሔር ለሙሴ አሥርቱን ትእዛዛት ሰጠው።',
      contentEn: '''The Israelites camped at Mount Sinai. The mountain was covered with smoke and fire, and the ground shook! God was there!

Moses climbed up the mountain to meet with God. He stayed there for 40 days and 40 nights, without eating or drinking.

God wrote His commandments on two stone tablets and gave them to Moses. These ten rules would help the people live good lives and love God and each other.

The commandments taught:
Love God above everything. Don't worship idols. Respect God's name. Rest on the Sabbath. Honor your parents. Don't hurt others. Be faithful in marriage. Don't steal. Don't lie. Don't be jealous.

When Moses came down, his face was glowing brightly from being close to God!

The Ten Commandments showed people how to love God and treat others with kindness. These rules still help us today know how to live in a way that pleases God.''',
      contentAm: '''እስራኤላውያን በሲና ተራራ ሠፈሩ። ተራራው በጭስና በእሳት ተሸፈነ፣ መሬቱም ተናወጠ! እግዚአብሔር እዚያ ነበር!

ሙሴ ከእግዚአብሔር ጋር ለመገናኘት ተራራውን ወጣ። ሳይበላና ሳይጠጣ ለ40 ቀንና ለ40 ሌሊት እዚያ ቆየ።

እግዚአብሔር ትእዛዛቱን በሁለት የድንጋይ ጽላቶች ላይ ጻፈና ለሙሴ ሰጠው። እነዚህ አሥር ሕግጋት ሕዝቡ ጥሩ ሕይወት እንዲኖሩና እግዚአብሔርንና እርስ በርሳቸውን እንዲወዱ ይረዷቸዋል።

ትእዛዛቱ ያስተማሩ:
እግዚአብሔርን ከሁሉ በላይ ውደድ። ጣዖታትን አታምልክ። የእግዚአብሔርን ስም አክብር። በሰንበት ዕረፍ። ወላጆችህን አክብር። ሌሎችን አትጉዳ። በጋብቻ ታማኝ ሁን። አትስረቅ። አትዋሽ። አትቅና።

ሙሴ ሲወርድ ከእግዚአብሔር ቅርበት የተነሳ ፊቱ በብርሃን ያበራ ነበር!''',
    );
  }

  static Story _aaronHighPriest() {
    return Story(
      id: 'aaron_priest',
      titleEn: 'Aaron the High Priest',
      titleAm: 'አሮን ሊቀ ካህኑ',
      bookEn: 'Leviticus',
      bookAm: 'ዘሌዋውያን',
      character: 'Aaron',
      imagePath: 'assets/images/stories/aaron.png',
      order: 9,
      verseReferences: ['Leviticus 8:1-36', 'Leviticus 9:1-24'],
      summaryEn: 'Aaron becomes the first high priest.',
      summaryAm: 'አሮን የመጀመሪያው ሊቀ ካህን ሆነ።',
      contentEn: '''Aaron was Moses's older brother. God chose him for a very special job - to be the first High Priest of Israel!

Being a priest meant Aaron would help the people come close to God. He would offer sacrifices and pray for the nation.

God gave Aaron beautiful special clothes to wear. A blue robe with golden bells that jingled when he walked. A breastplate with twelve colorful stones representing the twelve tribes of Israel.

Moses prepared Aaron and his sons for their important work. He washed them, dressed them in holy garments, and anointed them with special oil.

For seven days, Aaron stayed at the tabernacle, learning his duties. Then on the eighth day, he offered his first sacrifice.

Something amazing happened! Fire came from God and consumed the sacrifice! When the people saw this, they fell on their faces and worshiped God.

Aaron's job was to help people understand God's forgiveness and love. He showed them that God wanted to be close to His people.''',
      contentAm: '''አሮን የሙሴ ታላቅ ወንድም ነበር። እግዚአብሔር ለልዩ ሥራ መረጠው - የእስራኤል የመጀመሪያ ሊቀ ካህን ለመሆን!

ካህን መሆን ማለት አሮን ሕዝቡ ወደ እግዚአብሔር እንዲቀርቡ ይረዳል ማለት ነበር። መሥዋዕት ያቀርብና ለሕዝቡ ይጸልይ ነበር።

እግዚአብሔር አሮንን የሚያምሩ ልዩ ልብሶች እንዲለብስ ሰጠው። ሲራመድ የሚጮሁ የወርቅ ደወሎች ያሉበት ሰማያዊ ካባ። የእስራኤልን አሥራ ሁለት ነገዶች የሚወክሉ አሥራ ሁለት ባለቀለም ድንጋዮች ያሉበት ደረትማ።

ሙሴ አሮንንና ልጆቹን ለአስፈላጊ ሥራቸው አዘጋጃቸው። አጠባቸው፣ ቅዱስ ልብሶችን አለበሳቸው፣ በልዩ ዘይትም ቀባቸው።

አሮን ለሰባት ቀናት በድንኳኑ ቆየ ሥራውን እየተማረ። በስምንተኛው ቀን የመጀመሪያ መሥዋዕቱን አቀረበ።

አስደናቂ ነገር ሆነ! እሳት ከእግዚአብሔር ዘንድ መጣና መሥዋዕቱን በላ! ሕዝቡ ይህን ሲያዩ በግንባራቸው ወድቀው እግዚአብሔርን አመሰገኑ።''',
    );
  }

  static Story _dayOfAtonement() {
    return Story(
      id: 'day_atonement',
      titleEn: 'The Day of Atonement',
      titleAm: 'የስርየት ቀን',
      bookEn: 'Leviticus',
      bookAm: 'ዘሌዋውያን',
      character: 'Aaron',
      imagePath: 'assets/images/stories/atonement.png',
      order: 10,
      verseReferences: ['Leviticus 16:1-34'],
      summaryEn: 'A special day when sins are forgiven.',
      summaryAm: 'ኃጢአቶች የሚሰረዩበት ልዩ ቀን።',
      contentEn: '''Once a year, there was the most important day for Israel - the Day of Atonement. On this day, the High Priest would ask God to forgive all the people's sins.

Aaron had to prepare carefully. He bathed himself and put on simple white clothes instead of his fancy robes. This showed humility before God.

First, Aaron offered a sacrifice for his own sins. Then he took two goats. One was sacrificed to God. The other was the "scapegoat."

Aaron placed his hands on the scapegoat's head and confessed all the sins of the people. Then the goat was sent far away into the wilderness, carrying the sins away!

Only on this day could the High Priest enter the Most Holy Place where God's presence dwelt. He sprinkled blood on the mercy seat to cover the people's sins.

This special day taught Israel that sin is serious, but God provides a way to be forgiven. It pointed forward to Jesus, who would one day take away the sins of the whole world!''',
      contentAm: '''በዓመት አንድ ጊዜ ለእስራኤል በጣም አስፈላጊ ቀን ነበር - የስርየት ቀን። በዚህ ቀን ሊቀ ካህኑ እግዚአብሔር የሕዝቡን ኃጢአት ሁሉ እንዲምር ይጠይቅ ነበር።

አሮን በጥንቃቄ መዘጋጀት ነበረበት። ታጠበና ከእንግዳ ካባዎቹ ይልቅ ቀላል ነጭ ልብስ ለበሰ። ይህ በእግዚአብሔር ፊት ትሕትና አሳየ።

መጀመሪያ አሮን ለራሱ ኃጢአት መሥዋዕት አቀረበ። ከዚያም ሁለት ፍየሎችን ወሰደ። አንዱ ለእግዚአብሔር ተሠዋ። ሌላኛው "የአጋንንት ፍየል" ነበር።

አሮን እጆቹን በፍየሉ ራስ ላይ አድርጎ የሕዝቡን ኃጢአት ሁሉ ተናዘዘ። ከዚያም ፍየሉ ኃጢአቱን ይዞ ወደ ምድረ በዳ ሩቅ ተላከ!

ይህ ልዩ ቀን እስራኤልን ኃጢአት ከባድ መሆኑን፣ ነገር ግን እግዚአብሔር ይቅርታ የሚደረግበትን መንገድ እንደሚሰጥ አስተማረ።''',
    );
  }

  static Story _twelveSpies() {
    return Story(
      id: 'twelve_spies',
      titleEn: 'The Twelve Spies',
      titleAm: 'አሥራ ሁለቱ ሰላዮች',
      bookEn: 'Numbers',
      bookAm: 'ዘኍልቍ',
      character: 'Joshua & Caleb',
      imagePath: 'assets/images/stories/twelve_spies.png',
      order: 11,
      verseReferences: ['Numbers 13:1-33', 'Numbers 14:1-38'],
      summaryEn: 'Twelve spies explore the Promised Land.',
      summaryAm: 'አሥራ ሁለት ሰላዮች የተስፋይቱን ምድር አሰሱ።',
      contentEn: '''The Israelites were near the Promised Land! Moses sent twelve spies to explore it - one from each tribe.

For forty days, the spies explored. They found grapes so big it took two men to carry them! The land was beautiful and full of good things.

But when they returned, ten spies gave a scary report. "The people are giants! We looked like grasshoppers next to them. We can't conquer this land!"

Only two spies - Joshua and Caleb - trusted God. "Don't be afraid!" Caleb said. "God is with us! We can definitely take the land!"

Sadly, the people believed the ten scared spies. They cried and wanted to go back to Egypt. This made God very sad.

Because they didn't trust God, the people had to wander in the wilderness for forty years. But faithful Joshua and Caleb would someday enter the Promised Land.

This story teaches us to trust God's promises, even when things look scary. With God, nothing is impossible!''',
      contentAm: '''እስራኤላውያን ከተስፋይቱ ምድር አጠገብ ነበሩ! ሙሴ አሥራ ሁለት ሰላዮችን እንዲያሰሱ ላካቸው - ከእያንዳንዱ ነገድ አንድ።

ለአርባ ቀናት ሰላዮቹ አሰሱ። ሁለት ሰዎች ይሸከሙለት ዘንድ የሚያስፈልግ ትልቅ ወይን አገኙ! ምድሩ ቆንጆ ነበርና በጥሩ ነገሮች ተሞልታ ነበር።

ነገር ግን ሲመለሱ አሥር ሰላዮች አስፈሪ ዘገባ ሰጡ። "ሰዎቹ ግዙፎች ናቸው! ከእነርሱ ጎን እንደ አንበጣ ታየን። ይህችን ምድር ማሸነፍ አንችልም!"

ሁለት ሰላዮች ብቻ - ኢያሱና ካሌብ - እግዚአብሔርን አመኑ። "አትፍሩ!" ካሌብ አለ። "እግዚአብሔር ከእኛ ጋር ነው! ምድሩን በእርግጥ ልንወስደው እንችላለን!"

በሚያሳዝን ሁኔታ ሕዝቡ አሥሩን የፈሩ ሰላዮች አመኑ። አለቀሱና ወደ ግብፅ መመለስ ፈለጉ።

እግዚአብሔርን ስላላመኑ ሕዝቡ ለአርባ ዓመታት በምድረ በዳ መዘዋወር ነበረባቸው። ነገር ግን ታማኞቹ ኢያሱና ካሌብ አንድ ቀን ወደ ተስፋይቱ ምድር ይገባሉ።''',
    );
  }

  static Story _bronzeSerpent() {
    return Story(
      id: 'bronze_serpent',
      titleEn: 'The Bronze Serpent',
      titleAm: 'የነሐስ እባብ',
      bookEn: 'Numbers',
      bookAm: 'ዘኍልቍ',
      character: 'Moses',
      imagePath: 'assets/images/stories/bronze_serpent.png',
      order: 12,
      verseReferences: ['Numbers 21:4-9'],
      summaryEn: 'Looking at the bronze serpent brings healing.',
      summaryAm: 'የነሐስ እባብን መመልከት ፈውስ አመጣ።',
      contentEn: '''The Israelites were traveling through the wilderness, and they started complaining again. "Why did you bring us out of Egypt? There's no food or water here! We hate this boring bread!"

They were talking about manna, the special bread God sent from heaven every day. How ungrateful!

Because of their grumbling, God sent poisonous snakes among the people. Many were bitten and became very sick. Some even died.

The people realized their mistake. "We have sinned! Please pray to God to take away the snakes!"

Moses prayed for the people. God told him to make a bronze snake and put it on a tall pole. "Anyone who is bitten can look at it and live," God said.

Moses obeyed. He made a bronze serpent and lifted it up. When the sick people looked at the snake on the pole, they were healed!

Many years later, Jesus said He would be lifted up like that snake. Anyone who looks to Him with faith will be saved and have eternal life!''',
      contentAm: '''እስራኤላውያን በምድረ በዳ ሲጓዙ እንደገና ማጉረምረም ጀመሩ። "ለምን ከግብፅ አወጣኸን? እዚህ ምግብም ውሃም የለም! ይህን አሰልቺ እንጀራ ንቃለን!"

ስለ ማና ይናገሩ ነበር፣ እግዚአብሔር ከሰማይ በየቀኑ ስለሚልካት ልዩ እንጀራ። እንዴት ያልታመሰገኑ!

በማጉረምረማቸው ምክንያት እግዚአብሔር መርዛማ እባቦችን በሕዝቡ መካከል ላከ። ብዙዎች ተነከሱና በጣም ታመሙ። አንዳንዶቹ ሞቱ።

ሕዝቡ ስህተታቸውን ተገነዘቡ። "ኃጢአት ሰርተናል! እባቦቹን እንዲያስወግድ እባክህ ለእግዚአብሔር ጸልይ!"

ሙሴ ለሕዝቡ ጸለየ። እግዚአብሔር የነሐስ እባብ ሠርቶ በረጅም ምሰሶ ላይ እንዲያስቀምጥ ነገረው። "የተነከሰ ሁሉ ሊመለከተውና ሊኖር ይችላል" አለ እግዚአብሔር።

ሙሴ ታዘዘ። የነሐስ እባብ ሠርቶ ከፍ አደረገ። የታመሙ ሰዎች በምሰሶው ላይ ያለውን እባብ ሲመለከቱ ተፈውሰዋል!

ከብዙ ዓመታት በኋላ ኢየሱስ እንደዚያ እባብ ከፍ እንደሚደረግ ተናገረ። በእምነት ወደ እርሱ የሚመለከት ሁሉ ይድናልና የዘላለም ሕይወት ይኖረዋል!''',
    );
  }
}
