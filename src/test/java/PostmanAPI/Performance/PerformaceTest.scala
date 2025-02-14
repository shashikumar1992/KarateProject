package PostmanAPI.Performance

import com.intuit.karate.gatling.PreDef._
import io.gatling.core.Predef._
import scala.concurrent.duration._
import com.intuit.karate.gatling.PreDef.karateFeature

class PerformanceTest extends Simulation {

  val protocol = karateProtocol(
    "/workspaces/{wid}" -> Nil
  )

  protocol.nameResolver = (req, ctx) => req.getHeader("karate-name")
  protocol.runner.karateEnv("perf")

  val connexWebSiteScenario = scenario("Test the Create, Update, Get, and Delete workspace APIs with positive scenarios.")
    .exec(karateFeature("classpath:/PostmanAPI/APITEST/WorkSpaceFeature/TestCreateUpdateDeleteWorkSpaceAPI.feature"))

  val consumerEnrollmentScenario = scenario("Test the Consumer Enrollment API")
    .exec(karateFeature("classpath:/PostmanAPI/APITEST/BuydirectEndToEndTest/consumerEnrollment.Feature"))

  setUp(
    connexWebSiteScenario.inject(
      atOnceUsers(2),
      rampUsersPerSec(1) to 3 during (5.seconds)
    ),
    
    consumerEnrollmentScenario.inject(
      atOnceUsers(5),
      constantUsersPerSec(2) during (5.seconds)
    )
  ).protocols(protocol)
}
