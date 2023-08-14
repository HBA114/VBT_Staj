package com.hba114.my_packages;

public class Distance {
    public static double calculate(LatLong latLong, LatLong latLong2) {
        double latDist = latLong.getLatitude() - latLong2.getLatitude();
        double lonDist = latLong.getLongitude() - latLong2.getLongitude();

        double result = Math.sqrt(Math.pow(latDist, 2) + Math.pow(lonDist, 2));
        System.out.println("deg: " + rad2deg(result));

        return result;
    }

    private static double rad2deg(double rad) {
        return (rad / Math.PI * 180);
    }
}
