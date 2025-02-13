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


    public static String getRandomWorkSpaceNamename(){
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