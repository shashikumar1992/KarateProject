package Performance

import com.intuit.karate.gatling.PreDef._
import io.gatling.core.Predef._
import scala.concurrent.duration._

class PerformanceTest extends Simulation {

  val protocol = karateProtocol(
    "/workspaces/{wid}" -> Nil
  )

  protocol.nameResolver = (req, ctx) => req.getHeader("karate-name")
  protocol.runner.karateEnv("perf")

  // val createWorkSpaceScenario = scenario("Test the Create, Update, Get, and Delete workspace APIs")
  //   .exec(karateFeature("C:\\Users\\ShashiKumarSidhhalin\\Desktop\\KarateProject\\PerformanceTest\\src\\test\\java\\PostmanAPI\\Performance\\createWorkSpace.feature"))

  val connexWebSiteScenario = scenario("Test the Create, Update, Get, and Delete workspace APIs with positive scenarios.")
    .exec(karateFeature("C:/Users/ShashiKumarSidhhalin/Desktop/KarateProject/APITest/src/test/java/PostmanAPI/Performance/TestCreateUpdateDeleteWorkSpaceAPI.feature"))

  setUp(
    // createWorkSpaceScenario.inject(
    //   atOnceUsers(1),
    //   nothingFor(4.seconds),                         
    //   constantUsersPerSec(1) during (10.seconds),
    //   constantUsersPerSec(2) during (10.seconds),                        
    //   rampUsersPerSec(1) to 2 during (2.seconds),
    //   nothingFor(5.seconds),   
    //   constantUsersPerSec(2) during (5.seconds)
    // ),
    
    connexWebSiteScenario.inject(
      atOnceUsers(2),
      rampUsersPerSec(1) to 3 during (5.seconds)
    )
  ).protocols(protocol)
}
