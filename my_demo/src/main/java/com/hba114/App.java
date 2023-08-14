package com.hba114;

import com.hba114.my_packages.Distance;
import com.hba114.my_packages.LatLong;

// mvn package
//* Building jar: **/my_demo/target/my_demo-1.0.jar
// java -cp target/my_demo-1.0.jar com.hba114.App

public class App {
    public static void main(String[] args) {
        LatLong latLong = new LatLong(0, 0);
        LatLong latLong2 = new LatLong(5, 5);

        double result = Distance.calculate(latLong, latLong2);

        System.out.println(result);
    }
}
