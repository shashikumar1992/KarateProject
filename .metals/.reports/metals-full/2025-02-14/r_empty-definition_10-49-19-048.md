error id: `<none>`.
file:///C:/Users/ShashiKumarSidhhalin/Desktop/NewProject/APITest/src/test/java/PostmanAPI/Performance/PerformaceTest.scala
empty definition using pc, found symbol in pc: `<none>`.
empty definition using semanticdb
|empty definition using fallback
non-local guesses:
	 -com/intuit/karate/gatling/PreDef.rampUsersPerSec.
	 -com/intuit/karate/gatling/PreDef.rampUsersPerSec#
	 -com/intuit/karate/gatling/PreDef.rampUsersPerSec().
	 -io/gatling/core/Predef.rampUsersPerSec.
	 -io/gatling/core/Predef.rampUsersPerSec#
	 -io/gatling/core/Predef.rampUsersPerSec().
	 -scala/concurrent/duration/rampUsersPerSec.
	 -scala/concurrent/duration/rampUsersPerSec#
	 -scala/concurrent/duration/rampUsersPerSec().
	 -rampUsersPerSec.
	 -rampUsersPerSec#
	 -rampUsersPerSec().
	 -scala/Predef.rampUsersPerSec.
	 -scala/Predef.rampUsersPerSec#
	 -scala/Predef.rampUsersPerSec().

Document text:

```scala
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

  val consumerEnrollmentScenario = scenario("Consumer End to End CDW Enrollment.")
    .exec(karateFeature("classpath:/PostmanAPI/APITEST/BuydirectEndToEndTest/consumerEnrollment.feature"))

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

```

#### Short summary: 

empty definition using pc, found symbol in pc: `<none>`.