file:///C:/Users/ShashiKumarSidhhalin/Desktop/NewProject/APITest/src/test/java/helpers/DataGenerator.java
### java.util.NoSuchElementException: next on empty iterator

occurred in the presentation compiler.

presentation compiler configuration:


action parameters:
offset: 558
uri: file:///C:/Users/ShashiKumarSidhhalin/Desktop/NewProject/APITest/src/test/java/helpers/DataGenerator.java
text:
```scala
package helpers;

import com.github.javafaker.Faker;

import net.minidev.json.JSONObject;

public class DataGenerator {
    
    public static String getRandomEmail(){
        Faker faker = new Faker();
        String email = faker.name().firstName().toLowerCase() + faker.random().nextInt(0, 100) + "@test.com";
        return email;
    }

    public static String getRandomPhoneNumber() {
        Faker faker = new Faker();
        return faker.phoneNumber().cellPhone();  
    }


    public static String getRandomWorkSpaceNamename()@@{
        Faker faker = new Faker();
        String username = faker.name().username();
        return username;
    }

    public static String getRandomConsumername(){
        Faker faker = new Faker();
        String username = faker.name().username();
        return username;
    }

    public static JSONObject getRandomArticleValues(){
        Faker faker = new Faker();
        String name = faker.gameOfThrones().character();
        String description = faker.gameOfThrones().city();
        String visibilityStatus = faker.gameOfThrones().quote();
        JSONObject json = new JSONObject();
        json.put("name", name);
        json.put("description", description);
        json.put("visibilityStatus", visibilityStatus);
        return json;
    }

}
```



#### Error stacktrace:

```
scala.collection.Iterator$$anon$19.next(Iterator.scala:973)
	scala.collection.Iterator$$anon$19.next(Iterator.scala:971)
	scala.collection.mutable.MutationTracker$CheckedIterator.next(MutationTracker.scala:76)
	scala.collection.IterableOps.head(Iterable.scala:222)
	scala.collection.IterableOps.head$(Iterable.scala:222)
	scala.collection.AbstractIterable.head(Iterable.scala:935)
	dotty.tools.dotc.interactive.InteractiveDriver.run(InteractiveDriver.scala:164)
	dotty.tools.pc.MetalsDriver.run(MetalsDriver.scala:45)
	dotty.tools.pc.HoverProvider$.hover(HoverProvider.scala:40)
	dotty.tools.pc.ScalaPresentationCompiler.hover$$anonfun$1(ScalaPresentationCompiler.scala:376)
```
#### Short summary: 

java.util.NoSuchElementException: next on empty iterator