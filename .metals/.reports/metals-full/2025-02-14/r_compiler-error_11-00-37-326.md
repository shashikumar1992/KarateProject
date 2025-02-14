file:///C:/Users/ShashiKumarSidhhalin/Desktop/NewProject/APITest/src/test/java/helpers/DataBaseConnection.java
### java.util.NoSuchElementException: next on empty iterator

occurred in the presentation compiler.

presentation compiler configuration:


action parameters:
uri: file:///C:/Users/ShashiKumarSidhhalin/Desktop/NewProject/APITest/src/test/java/helpers/DataBaseConnection.java
text:
```scala
package helpers;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;

import net.minidev.json.JSONObject;

public class DataBaseConnection {

    private static String connectionUrl = "jdbc:sqlserver://172.16.14.21;databaseName=BimSys;user=sa;password=Password@1;encrypt=true;trustServerCertificate=true";
    static String consumerName=DataGenerator.getRandomConsumername();
    static String consumerEmailString=DataGenerator.getRandomEmail();
        public static void insertCustomerDetails(){
            try(Connection connect = DriverManager.getConnection(connectionUrl)){
                connect.createStatement().execute("INSERT INTO [dbo].[Consumer]  ([Consumer_Name] ,[Consumer_Email],[CreateDate],[ModifiedDate] ,[Consumer_Legacy_ID],[HaltEnroll] ,[HaltEnroll_Vendor] ,[Partner_ID],[IsActive],[IsActive2],[IsActive3],[IsActive4])  VALUES ('"+consumerName+"','"+consumerEmailString+"',GETDATE(),NULL,121421,0,NULL,'127',1,NULL,1,1)");
        } catch (SQLException e){
            e.printStackTrace();
        }
    }

    public static JSONObject getCustomerDetails(){
        JSONObject json = new JSONObject();

        try(Connection connect = DriverManager.getConnection(connectionUrl)){
  //          ResultSet rs = connect.createStatement().executeQuery("select top 10 * from [dbo].[Consumer] where Consumer_Name='"+consumerName+"' order by Consumer_ID desc");
            ResultSet rs = connect.createStatement().executeQuery("select top 1 * from [dbo].[Consumer] where Consumer_Name='Alberta Charleson' order by Consumer_ID desc");

            System.out.println(rs);
            rs.next();
            json.put("consumerName", rs.getString("Consumer_Name"));

        } catch (SQLException e){
            e.printStackTrace();
        }
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
	dotty.tools.pc.WithCompilationUnit.<init>(WithCompilationUnit.scala:31)
	dotty.tools.pc.SimpleCollector.<init>(PcCollector.scala:345)
	dotty.tools.pc.PcSemanticTokensProvider$Collector$.<init>(PcSemanticTokensProvider.scala:63)
	dotty.tools.pc.PcSemanticTokensProvider.Collector$lzyINIT1(PcSemanticTokensProvider.scala:63)
	dotty.tools.pc.PcSemanticTokensProvider.Collector(PcSemanticTokensProvider.scala:63)
	dotty.tools.pc.PcSemanticTokensProvider.provide(PcSemanticTokensProvider.scala:88)
	dotty.tools.pc.ScalaPresentationCompiler.semanticTokens$$anonfun$1(ScalaPresentationCompiler.scala:109)
```
#### Short summary: 

java.util.NoSuchElementException: next on empty iterator