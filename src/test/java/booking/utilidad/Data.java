package booking.utilidad;

import com.github.javafaker.Faker;

public class Data {

    Faker faker = new Faker();

    public String generateRandomFirstName() {
        return faker.name().firstName();
    }

    public String generateRandomLastName() {
        return faker.name().lastName();
    }

    public Integer generateRandomInt() {
        return faker.random().nextInt(111,999);
    }
}

